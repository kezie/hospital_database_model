import os
import random
from datetime import datetime, timedelta

import pymysql
from faker import Faker

fake = Faker("en_GB")

SEX_CHOICES = ["Female", "Male", "Intersex", "Unknown"]
SEX_WEIGHTS = [0.49, 0.49, 0.01, 0.01]


def generate_patient_data():
    # Generates a single record matching the patients table structure."""
    dob = fake.date_of_birth(minimum_age=0, maximum_age=100)

    # Registration must be within the last 5 years AND not before birth
    five_years_ago = datetime.now() - timedelta(days=5 * 365)
    earliest = max(datetime.combine(dob, datetime.min.time()), five_years_ago)
    registered_at = fake.date_time_between(start_date=earliest, end_date="now")

    return (
        f"HOSP-{fake.unique.numerify('########')}",
        fake.first_name(),
        fake.last_name(),
        dob.strftime("%Y-%m-%d"),
        random.choices(SEX_CHOICES, weights=SEX_WEIGHTS, k=1)[0],
        fake.postcode().split()[0],  # outcode only, e.g. 'SW1A'
        registered_at.strftime("%Y-%m-%d %H:%M:%S"),
    )


def populate_patients(db_config: dict, count: int = 100):
    # Generates synthetic patient records and bulk upserts them using PyMySQL
    insert_query = """
        INSERT INTO patients (
            hospital_number, given_name, family_name,
            date_of_birth, sex, postcode_area, registered_at
        )
        VALUES (%s, %s, %s, %s, %s, %s, %s)
        ON DUPLICATE KEY UPDATE
            given_name = VALUES(given_name),
            family_name = VALUES(family_name),
            date_of_birth = VALUES(date_of_birth),
            sex = VALUES(sex),
            postcode_area = VALUES(postcode_area);
    """

    data = [generate_patient_data() for _ in range(count)]

    connection = None
    try:
        connection = pymysql.connect(**db_config)
        with connection.cursor() as cursor:
            affected_rows = cursor.executemany(insert_query, data)
        connection.commit()
        print(f"Successfully upserted {affected_rows} row(s) into 'patients'.")
    except pymysql.MySQLError as err:
        if connection:
            connection.rollback()
        print(f"Database error: {err}")
    finally:
        if connection and connection.open:
            connection.close()


if __name__ == "__main__":
    db_credentials = {
        "host": "localhost",
        "user": "root",
        "password": os.getenv("DB_PASSWORD", "***********"),
        "database": "hospital_db",
        "charset": "utf8mb4",
    }

    populate_patients(db_credentials, count=50)