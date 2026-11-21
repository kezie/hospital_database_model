-- 1. View: vw_appointment_attendance
CREATE VIEW `vw_appointment_attendance` AS
SELECT
    `appointments`.`appointment_type` AS `appointment_type`,
    count(0) AS `booked`,
    sum((`appointments`.`status` = 'Completed')) AS `completed`,
    sum((`appointments`.`status` = 'Did not attend')) AS `did_not_attend`,
    round(((100.0 * sum((`appointments`.`status` = 'Did not attend'))) / count(0)),2) AS `dna_pct`
FROM `appointments`
GROUP BY `appointments`.`appointment_type`;

-- 2. View: vw_clinic_schedule
CREATE VIEW `vw_clinic_schedule` AS
SELECT
    `ap`.`appointment_id` AS `appointment_id`,
    `ap`.`scheduled_start` AS `scheduled_start`,
    `ap`.`scheduled_end` AS `scheduled_end`,
    concat(`pp`.`given_name`,' ',`pp`.`family_name`) AS `patient_name`,
    `pi`.`hospital_number` AS `hospital_number`,
    concat(`s`.`given_name`,' ',`s`.`family_name`) AS `clinician`,
    `ap`.`appointment_type` AS `appointment_type`,
    `ap`.`status` AS `status`
FROM (((`appointments` `ap`
JOIN `patient_identities` `pi` ON((`ap`.`patient_id` = `pi`.`patient_id`)))
JOIN `patient_profiles` `pp` ON((`pi`.`patient_id` = `pp`.`patient_id`)))
JOIN `staff` `s` ON((`ap`.`staff_id` = `s`.`staff_id`)));

-- 3. View: vw_cost_by_diagnosis
CREATE VIEW `vw_cost_by_diagnosis` AS
WITH `ranked` AS (
    SELECT
        `dg`.`group_name` AS `group_name`,
        `a`.`total_cost` AS `total_cost`,
        row_number() OVER (PARTITION BY `dg`.`diagnosis_group_id` ORDER BY `a`.`total_cost`) AS `rn`,
        count(0) OVER (PARTITION BY `dg`.`diagnosis_group_id`) AS `n`
    FROM (`admissions` `a`
    JOIN `diagnosis_groups` `dg` ON((`a`.`diagnosis_group_id` = `dg`.`diagnosis_group_id`)))
)
SELECT
    `ranked`.`group_name` AS `group_name`,
    count(0) AS `admission_count`,
    round(sum(`ranked`.`total_cost`),2) AS `total_cost`,
    round(avg(`ranked`.`total_cost`),2) AS `mean_cost`,
    round(avg((CASE WHEN (`ranked`.`rn` IN (floor(((`ranked`.`n` + 1) / 2)),floor(((`ranked`.`n` + 2) / 2)))) THEN `ranked`.`total_cost` END)),2) AS `median_cost`
FROM `ranked`
GROUP BY `ranked`.`group_name`;

-- 4. View: vw_frequent_admissions
CREATE VIEW `vw_frequent_admissions` AS
SELECT
    `pi`.`hospital_number` AS `hospital_number`,
    `pp`.`given_name` AS `given_name`,
    `pp`.`family_name` AS `family_name`,
    count(`a`.`admission_id`) AS `admissions`,
    min(`a`.`admitted_at`) AS `first_admission`,
    max(`a`.`admitted_at`) AS `latest_admission`
FROM ((`patient_identities` `pi`
JOIN `patient_profiles` `pp` ON((`pi`.`patient_id` = `pp`.`patient_id`)))
JOIN `admissions` `a` ON((`pi`.`patient_id` = `a`.`patient_id`)))
GROUP BY `pi`.`patient_id`,`pi`.`hospital_number`,`pp`.`given_name`,`pp`.`family_name`
HAVING (count(`a`.`admission_id`) > 1);

-- 5. View: vw_medication_utilisation
CREATE VIEW `vw_medication_utilisation` AS
SELECT
    `m`.`medication_name` AS `medication_name`,
    `m`.`strength` AS `strength`,
    `rx`.`status` AS `status`,
    count(0) AS `prescription_count`
FROM (`prescriptions` `rx`
JOIN `medications` `m` ON((`rx`.`medication_id` = `m`.`medication_id`)))
GROUP BY `m`.`medication_id`,`m`.`medication_name`,`m`.`strength`,`rx`.`status`;

-- 6. View: vw_treatment_outcomes
CREATE VIEW `vw_treatment_outcomes` AS
SELECT
    `t`.`treatment_name` AS `treatment_name`,
    count(0) AS `treatments_recorded`,
    sum((`at`.`outcome` = 'Improved')) AS `improved_count`,
    round(((100.0 * sum((`at`.`outcome` = 'Improved'))) / count(0)),2) AS `improved_pct`,
    sum((`at`.`outcome` = 'Deteriorated')) AS `deteriorated_count`
FROM (`admission_treatments` `at`
JOIN `treatments` `t` ON((`at`.`treatment_id` = `t`.`treatment_id`)))
GROUP BY `t`.`treatment_id`,`t`.`treatment_name`;