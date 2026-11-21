CREATE DATABASE  IF NOT EXISTS `hospital_final` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `hospital_final`;
-- MySQL dump 10.13  Distrib 8.0.46, for Win64 (x86_64)
--
-- Host: localhost    Database: hospital_final
-- ------------------------------------------------------
-- Server version	8.0.46

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `admission_treatments`
--

DROP TABLE IF EXISTS `admission_treatments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admission_treatments` (
  `admission_treatment_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `admission_id` bigint unsigned NOT NULL,
  `treatment_id` int unsigned NOT NULL,
  `performed_by_staff_id` int unsigned NOT NULL,
  `performed_at` datetime NOT NULL,
  `outcome` enum('Improved','No change','Deteriorated','Not assessed') NOT NULL,
  `notes` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`admission_treatment_id`),
  UNIQUE KEY `uq_admission_treatment_time` (`admission_id`,`treatment_id`,`performed_at`),
  KEY `performed_by_staff_id` (`performed_by_staff_id`),
  KEY `idx_treatment_outcome` (`treatment_id`,`outcome`),
  CONSTRAINT `admission_treatments_ibfk_1` FOREIGN KEY (`admission_id`) REFERENCES `admissions` (`admission_id`) ON DELETE CASCADE,
  CONSTRAINT `admission_treatments_ibfk_2` FOREIGN KEY (`treatment_id`) REFERENCES `treatments` (`treatment_id`),
  CONSTRAINT `admission_treatments_ibfk_3` FOREIGN KEY (`performed_by_staff_id`) REFERENCES `staff` (`staff_id`)
) ENGINE=InnoDB AUTO_INCREMENT=181 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admission_treatments`
--

LOCK TABLES `admission_treatments` WRITE;
/*!40000 ALTER TABLE `admission_treatments` DISABLE KEYS */;
INSERT INTO `admission_treatments` VALUES (1,31,6,2,'2025-07-19 14:00:00','Improved',NULL),(2,83,6,1,'2025-07-02 14:00:00','Improved',NULL),(3,16,8,2,'2025-03-25 14:00:00','No change',NULL),(4,77,1,1,'2025-03-20 14:00:00','Improved',NULL),(5,17,10,4,'2026-08-07 14:00:00','No change',NULL),(6,71,4,10,'2025-10-09 14:00:00','No change',NULL),(7,30,6,3,'2026-04-27 14:00:00','Improved',NULL),(8,19,3,9,'2025-11-06 14:00:00','No change',NULL),(9,15,1,3,'2025-03-04 14:00:00','Improved',NULL),(10,101,4,10,'2026-10-11 14:00:00','Improved',NULL),(11,34,1,3,'2025-09-21 14:00:00','Improved',NULL),(12,96,2,8,'2026-02-28 14:00:00','No change',NULL),(13,66,10,2,'2026-04-07 14:00:00','Improved',NULL),(14,79,1,9,'2025-08-21 14:00:00','Improved',NULL),(15,4,1,8,'2026-01-21 14:00:00','Improved',NULL),(16,14,8,8,'2026-07-24 14:00:00','Deteriorated',NULL),(17,42,10,3,'2025-06-01 14:00:00','Improved',NULL),(18,80,10,9,'2026-08-08 14:00:00','Improved',NULL),(19,77,9,5,'2025-03-21 14:00:00','Improved',NULL),(20,56,2,2,'2026-01-14 14:00:00','Improved',NULL),(21,114,4,7,'2025-05-27 14:00:00','No change',NULL),(22,52,7,2,'2026-04-20 14:00:00','Improved',NULL),(23,86,5,6,'2025-02-08 14:00:00','No change',NULL),(24,61,2,2,'2025-06-30 14:00:00','Improved',NULL),(25,13,6,3,'2026-01-24 14:00:00','Improved',NULL),(26,72,9,6,'2026-08-11 14:00:00','Improved',NULL),(27,112,7,1,'2025-11-01 14:00:00','No change',NULL),(28,46,2,10,'2025-08-30 14:00:00','Improved',NULL),(29,62,4,2,'2026-09-01 14:00:00','Deteriorated',NULL),(30,48,2,5,'2026-03-08 14:00:00','No change',NULL),(31,109,9,10,'2026-02-10 14:00:00','No change',NULL),(32,85,5,1,'2025-06-15 14:00:00','Improved',NULL),(33,98,5,6,'2025-04-15 14:00:00','Improved',NULL),(34,112,3,10,'2025-11-02 14:00:00','Improved',NULL),(35,95,1,2,'2026-01-23 14:00:00','Improved',NULL),(36,59,6,3,'2025-02-14 14:00:00','Improved',NULL),(38,20,3,10,'2026-06-03 14:00:00','No change',NULL),(39,35,8,7,'2025-12-08 14:00:00','No change',NULL),(40,54,5,4,'2025-12-25 14:00:00','Improved',NULL),(41,15,5,10,'2025-03-07 14:00:00','Improved',NULL),(42,40,1,4,'2025-09-01 14:00:00','Not assessed',NULL),(43,8,1,4,'2025-04-09 14:00:00','Not assessed',NULL),(44,99,3,5,'2025-03-20 14:00:00','Improved',NULL),(45,1,8,7,'2025-11-12 14:00:00','Improved',NULL),(46,69,4,9,'2025-07-11 14:00:00','Improved',NULL),(47,111,1,7,'2025-05-21 14:00:00','Improved',NULL),(48,10,6,10,'2026-04-08 14:00:00','Improved',NULL),(49,91,7,5,'2026-05-26 14:00:00','Improved',NULL),(50,42,3,10,'2025-06-04 14:00:00','Deteriorated',NULL),(51,118,6,2,'2025-05-02 14:00:00','Deteriorated',NULL),(52,32,7,10,'2026-07-07 14:00:00','Improved',NULL),(53,51,5,6,'2025-05-12 14:00:00','Improved',NULL),(54,22,2,9,'2025-05-18 14:00:00','Improved',NULL),(55,25,6,6,'2026-03-15 14:00:00','Improved',NULL),(56,19,5,4,'2025-11-05 14:00:00','No change',NULL),(57,98,2,3,'2025-04-16 14:00:00','Improved',NULL),(58,73,10,8,'2026-05-07 14:00:00','Deteriorated',NULL),(59,81,6,3,'2026-07-10 14:00:00','Improved',NULL),(60,57,5,5,'2026-08-16 14:00:00','Improved',NULL),(61,10,5,8,'2026-04-08 14:00:00','Improved',NULL),(62,48,5,2,'2026-03-07 14:00:00','No change',NULL),(63,65,7,8,'2025-03-29 14:00:00','Improved',NULL),(64,104,10,4,'2025-07-06 14:00:00','No change',NULL),(65,65,3,1,'2025-04-01 14:00:00','Improved',NULL),(66,116,6,2,'2025-04-22 14:00:00','Improved',NULL),(67,91,8,8,'2026-05-27 14:00:00','Improved',NULL),(68,118,5,7,'2025-05-02 14:00:00','No change',NULL),(69,87,10,1,'2026-06-13 14:00:00','Improved',NULL),(70,13,9,7,'2026-01-26 14:00:00','Improved',NULL),(71,110,10,3,'2025-10-23 14:00:00','Improved',NULL),(72,85,3,6,'2025-06-16 14:00:00','Not assessed',NULL),(73,90,7,3,'2026-07-20 14:00:00','Improved',NULL),(74,49,6,3,'2025-11-02 14:00:00','No change',NULL),(75,55,9,6,'2026-09-29 14:00:00','Improved',NULL),(76,24,4,6,'2025-10-14 14:00:00','Improved',NULL),(77,18,3,2,'2026-06-22 14:00:00','Deteriorated',NULL),(78,13,9,9,'2026-01-24 14:00:00','No change',NULL),(79,113,10,3,'2025-10-10 14:00:00','Improved',NULL),(80,24,10,3,'2025-10-14 14:00:00','Improved',NULL),(81,47,4,8,'2025-06-08 14:00:00','No change',NULL),(82,101,8,4,'2026-10-10 14:00:00','Improved',NULL),(83,104,8,4,'2025-07-06 14:00:00','No change',NULL),(84,74,8,8,'2026-08-02 14:00:00','No change',NULL),(85,65,9,7,'2025-03-30 14:00:00','No change',NULL),(86,103,10,3,'2025-10-30 14:00:00','Improved',NULL),(87,62,6,9,'2026-08-30 14:00:00','No change',NULL),(88,67,2,5,'2026-01-13 14:00:00','No change',NULL),(89,35,8,9,'2025-12-06 14:00:00','Deteriorated',NULL),(90,12,4,8,'2025-09-02 14:00:00','Not assessed',NULL),(91,54,1,7,'2025-12-27 14:00:00','Improved',NULL),(92,11,6,4,'2026-03-30 14:00:00','Improved',NULL),(93,13,6,3,'2026-01-25 14:00:00','Improved',NULL),(94,118,8,3,'2025-05-02 14:00:00','Improved',NULL),(95,1,2,1,'2025-11-13 14:00:00','Improved',NULL),(96,20,9,10,'2026-06-06 14:00:00','Improved',NULL),(97,37,4,5,'2025-06-28 14:00:00','Improved',NULL),(98,54,10,8,'2025-12-25 14:00:00','Improved',NULL),(99,116,8,10,'2025-04-21 14:00:00','No change',NULL),(100,74,4,3,'2026-08-02 14:00:00','Improved',NULL),(101,79,6,4,'2025-08-22 14:00:00','Improved',NULL),(102,86,2,9,'2025-02-09 14:00:00','Improved',NULL),(103,68,9,9,'2025-10-05 14:00:00','Improved',NULL),(104,61,1,7,'2025-07-02 14:00:00','Improved',NULL),(105,3,6,2,'2026-09-16 14:00:00','Improved',NULL),(106,85,2,10,'2025-06-16 14:00:00','Improved',NULL),(107,46,9,6,'2025-08-30 14:00:00','Deteriorated',NULL),(108,88,8,8,'2026-05-27 14:00:00','No change',NULL),(109,9,8,1,'2025-04-13 14:00:00','Improved',NULL),(110,102,4,1,'2025-04-15 14:00:00','Not assessed',NULL),(111,66,7,9,'2026-04-07 14:00:00','Improved',NULL),(112,97,4,5,'2025-06-07 14:00:00','Deteriorated',NULL),(113,7,6,5,'2026-07-07 14:00:00','No change',NULL),(114,56,7,8,'2026-01-16 14:00:00','Improved',NULL),(115,24,8,8,'2025-10-13 14:00:00','Not assessed',NULL),(116,67,5,2,'2026-01-16 14:00:00','Improved',NULL),(117,78,3,9,'2025-10-19 14:00:00','Improved',NULL),(118,11,6,5,'2026-04-01 14:00:00','Improved',NULL),(119,92,7,3,'2026-04-16 14:00:00','Improved',NULL),(120,6,6,10,'2025-08-26 14:00:00','Improved',NULL),(121,102,1,2,'2025-04-16 14:00:00','Improved',NULL),(122,103,3,1,'2025-10-29 14:00:00','Deteriorated',NULL),(123,87,8,1,'2026-06-12 14:00:00','Improved',NULL),(124,100,6,6,'2026-07-04 14:00:00','Not assessed',NULL),(125,5,10,3,'2026-08-29 14:00:00','Not assessed',NULL),(126,48,8,2,'2026-03-08 14:00:00','Improved',NULL),(127,51,6,5,'2025-05-12 14:00:00','Not assessed',NULL),(128,4,3,8,'2026-01-21 14:00:00','Not assessed',NULL),(129,16,5,5,'2025-03-27 14:00:00','Improved',NULL),(130,79,5,8,'2025-08-20 14:00:00','Improved',NULL),(131,110,2,8,'2025-10-22 14:00:00','Deteriorated',NULL),(132,57,2,6,'2026-08-18 14:00:00','No change',NULL),(133,71,9,5,'2025-10-10 14:00:00','Deteriorated',NULL),(134,92,3,6,'2026-04-14 14:00:00','Improved',NULL),(135,26,3,4,'2026-07-23 14:00:00','Improved',NULL),(136,71,10,6,'2025-10-11 14:00:00','No change',NULL),(137,71,3,10,'2025-10-08 14:00:00','Improved',NULL),(138,51,8,9,'2025-05-14 14:00:00','No change',NULL),(139,106,10,2,'2026-04-23 14:00:00','Not assessed',NULL),(140,83,2,8,'2025-07-02 14:00:00','No change',NULL),(141,45,3,9,'2025-10-12 14:00:00','No change',NULL),(142,17,7,9,'2026-08-07 14:00:00','Deteriorated',NULL),(143,67,3,5,'2026-01-14 14:00:00','Improved',NULL),(144,120,4,6,'2026-05-19 14:00:00','Deteriorated',NULL),(145,33,4,9,'2026-03-23 14:00:00','Improved',NULL),(146,39,10,9,'2025-06-23 14:00:00','Improved',NULL),(147,22,10,10,'2025-05-19 14:00:00','Improved',NULL),(148,80,10,6,'2026-08-06 14:00:00','No change',NULL),(149,4,2,1,'2026-01-20 14:00:00','No change',NULL),(150,99,10,7,'2025-03-18 14:00:00','Improved',NULL),(151,81,9,5,'2026-07-09 14:00:00','Improved',NULL),(152,104,7,5,'2025-07-07 14:00:00','Improved',NULL),(153,8,3,8,'2025-04-10 14:00:00','Improved',NULL),(154,27,6,10,'2025-02-11 14:00:00','Improved',NULL),(155,92,6,6,'2026-04-16 14:00:00','Improved',NULL),(156,48,9,9,'2026-03-07 14:00:00','Improved',NULL),(157,60,2,5,'2025-01-16 14:00:00','Improved',NULL),(158,13,1,5,'2026-01-27 14:00:00','Deteriorated',NULL),(159,54,4,3,'2025-12-27 14:00:00','Not assessed',NULL),(160,93,6,4,'2026-03-02 14:00:00','Improved',NULL),(161,66,8,8,'2026-04-06 14:00:00','Improved',NULL),(162,12,7,9,'2025-09-03 14:00:00','Not assessed',NULL),(163,28,10,6,'2026-02-21 14:00:00','Improved',NULL),(164,64,10,8,'2026-01-01 14:00:00','Improved',NULL),(165,109,2,7,'2026-02-11 14:00:00','Deteriorated',NULL),(166,94,6,7,'2026-05-19 14:00:00','Improved',NULL),(167,7,10,9,'2026-07-08 14:00:00','Improved',NULL),(168,37,2,7,'2025-07-01 14:00:00','No change',NULL),(169,36,10,10,'2026-02-17 14:00:00','Improved',NULL),(170,13,7,6,'2026-01-26 14:00:00','Improved',NULL),(171,47,3,4,'2025-06-09 14:00:00','Improved',NULL),(172,6,1,3,'2025-08-25 14:00:00','No change',NULL),(173,67,8,3,'2026-01-14 14:00:00','Improved',NULL),(175,95,5,10,'2026-01-24 14:00:00','Improved',NULL),(176,66,9,8,'2026-04-06 14:00:00','Improved',NULL),(177,3,6,6,'2026-09-14 14:00:00','Not assessed',NULL),(178,75,5,1,'2026-04-10 14:00:00','Improved',NULL),(179,84,10,10,'2026-10-14 14:00:00','No change',NULL),(180,75,8,3,'2026-04-10 14:00:00','Improved',NULL);
/*!40000 ALTER TABLE `admission_treatments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admissions`
--

DROP TABLE IF EXISTS `admissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admissions` (
  `admission_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `patient_id` int unsigned NOT NULL,
  `attending_staff_id` int unsigned NOT NULL,
  `diagnosis_group_id` smallint unsigned NOT NULL,
  `admitted_at` datetime NOT NULL,
  `discharged_at` datetime DEFAULT NULL,
  `admission_type` enum('Emergency','Elective','Transfer') NOT NULL,
  `discharge_status` enum('Home','Transfer','Deceased','Ongoing') NOT NULL DEFAULT 'Ongoing',
  `total_cost` decimal(10,2) NOT NULL DEFAULT '0.00',
  `clinical_notes` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`admission_id`),
  KEY `attending_staff_id` (`attending_staff_id`),
  KEY `idx_admission_patient_dates` (`patient_id`,`admitted_at`,`discharged_at`),
  KEY `idx_admission_diagnosis_date` (`diagnosis_group_id`,`admitted_at`),
  CONSTRAINT `admissions_ibfk_2` FOREIGN KEY (`attending_staff_id`) REFERENCES `staff` (`staff_id`),
  CONSTRAINT `admissions_ibfk_3` FOREIGN KEY (`diagnosis_group_id`) REFERENCES `diagnosis_groups` (`diagnosis_group_id`),
  CONSTRAINT `fk_admissions_patient` FOREIGN KEY (`patient_id`) REFERENCES `patient_identities` (`patient_id`) ON DELETE CASCADE,
  CONSTRAINT `admissions_chk_1` CHECK (((`discharged_at` is null) or (`discharged_at` >= `admitted_at`))),
  CONSTRAINT `admissions_chk_2` CHECK ((`total_cost` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admissions`
--

LOCK TABLES `admissions` WRITE;
/*!40000 ALTER TABLE `admissions` DISABLE KEYS */;
INSERT INTO `admissions` VALUES (1,57,2,5,'2025-11-11 10:15:00','2025-11-12 11:00:00','Emergency','Home',7127.38,'Synthetic record for database testing'),(2,53,2,6,'2025-03-12 21:10:00','2025-03-15 11:00:00','Transfer','Home',2995.75,'Synthetic record for database testing'),(3,56,8,6,'2026-09-14 17:45:00','2026-09-18 11:00:00','Emergency','Home',4181.08,'Synthetic record for database testing'),(4,43,6,1,'2026-01-18 17:45:00','2026-01-27 11:00:00','Emergency','Home',1216.63,'Synthetic record for database testing'),(5,2,8,2,'2026-08-26 21:10:00','2026-08-30 11:00:00','Emergency','Home',6914.39,'Synthetic record for database testing'),(6,4,3,1,'2025-08-23 07:30:00','2025-08-24 11:00:00','Emergency','Home',6570.45,'Synthetic record for database testing'),(7,14,8,4,'2026-07-07 10:15:00','2026-07-17 11:00:00','Emergency','Transfer',7796.35,'Synthetic record for database testing'),(8,13,3,4,'2025-04-07 07:30:00','2025-04-14 11:00:00','Transfer','Transfer',8294.96,'Synthetic record for database testing'),(9,4,10,3,'2025-04-11 07:30:00','2025-04-18 11:00:00','Emergency','Home',2345.57,'Synthetic record for database testing'),(10,35,2,3,'2026-04-05 10:15:00','2026-04-12 11:00:00','Transfer','Home',8389.20,'Synthetic record for database testing'),(11,5,1,6,'2026-03-30 21:10:00','2026-04-01 11:00:00','Emergency','Home',8848.35,'Synthetic record for database testing'),(12,55,6,4,'2025-08-31 10:15:00','2025-09-07 11:00:00','Emergency','Transfer',8636.62,'Synthetic record for database testing'),(13,11,3,4,'2026-01-24 07:30:00','2026-01-31 11:00:00','Elective','Transfer',6814.83,'Synthetic record for database testing'),(14,47,2,3,'2026-07-24 17:45:00','2026-07-27 11:00:00','Emergency','Home',5775.75,'Synthetic record for database testing'),(15,35,1,5,'2025-03-04 13:00:00','2025-03-05 11:00:00','Transfer','Home',1153.38,'Synthetic record for database testing'),(16,33,8,1,'2025-03-24 10:15:00','2025-03-26 11:00:00','Emergency','Transfer',1711.00,'Synthetic record for database testing'),(17,57,8,1,'2026-08-07 10:15:00','2026-08-17 11:00:00','Emergency','Transfer',6467.75,'Synthetic record for database testing'),(18,37,2,6,'2026-06-20 13:00:00','2026-06-25 11:00:00','Elective','Home',3000.69,'Synthetic record for database testing'),(19,9,1,1,'2025-11-04 17:45:00','2025-11-10 11:00:00','Transfer','Home',1298.36,'Synthetic record for database testing'),(20,14,3,1,'2026-06-03 13:00:00','2026-06-06 11:00:00','Emergency','Home',3172.14,'Synthetic record for database testing'),(21,29,10,5,'2026-07-11 13:00:00','2026-07-21 11:00:00','Emergency','Home',8896.04,'Synthetic record for database testing'),(22,7,1,6,'2025-05-18 13:00:00','2025-05-20 11:00:00','Emergency','Home',3143.54,'Synthetic record for database testing'),(23,14,8,4,'2025-12-18 10:15:00','2025-12-23 11:00:00','Elective','Home',1466.84,'Synthetic record for database testing'),(24,28,3,2,'2025-10-11 07:30:00','2025-10-12 11:00:00','Elective','Home',7209.89,'Synthetic record for database testing'),(25,36,1,1,'2026-03-14 21:10:00','2026-03-15 11:00:00','Emergency','Home',8036.17,'Synthetic record for database testing'),(26,38,2,1,'2026-07-20 10:15:00','2026-07-27 11:00:00','Elective','Home',8605.99,'Synthetic record for database testing'),(27,51,10,2,'2025-02-10 13:00:00','2025-02-14 11:00:00','Emergency','Home',7554.03,'Synthetic record for database testing'),(28,57,2,2,'2026-02-21 21:10:00','2026-02-24 11:00:00','Emergency','Transfer',869.36,'Synthetic record for database testing'),(29,48,3,2,'2025-12-07 17:45:00','2025-12-11 11:00:00','Emergency','Transfer',8368.68,'Synthetic record for database testing'),(30,55,6,3,'2026-04-27 10:15:00','2026-05-01 11:00:00','Elective','Home',2622.87,'Synthetic record for database testing'),(31,43,3,1,'2025-07-17 17:45:00','2025-07-23 11:00:00','Elective','Home',6327.11,'Synthetic record for database testing'),(32,26,1,3,'2026-07-04 13:00:00','2026-07-05 11:00:00','Emergency','Home',988.58,'Synthetic record for database testing'),(33,39,6,5,'2026-03-21 13:00:00','2026-03-27 11:00:00','Emergency','Transfer',8610.62,'Synthetic record for database testing'),(34,13,1,5,'2025-09-18 07:30:00','2025-09-25 11:00:00','Emergency','Home',4466.98,'Synthetic record for database testing'),(35,43,10,1,'2025-12-05 21:10:00','2025-12-11 11:00:00','Elective','Home',6552.00,'Synthetic record for database testing'),(36,21,2,2,'2026-02-17 13:00:00','2026-02-26 11:00:00','Transfer','Transfer',6644.26,'Synthetic record for database testing'),(37,58,3,4,'2025-06-28 21:10:00','2025-07-08 11:00:00','Emergency','Home',3189.19,'Synthetic record for database testing'),(38,28,6,4,'2026-08-17 21:10:00','2026-08-23 11:00:00','Transfer','Home',5173.89,'Synthetic record for database testing'),(39,51,8,6,'2025-06-23 07:30:00','2025-06-28 11:00:00','Elective','Home',7893.05,'Synthetic record for database testing'),(40,49,2,2,'2025-08-29 13:00:00','2025-09-02 11:00:00','Emergency','Home',2816.86,'Synthetic record for database testing'),(41,31,6,6,'2026-09-18 07:30:00','2026-09-26 11:00:00','Emergency','Transfer',5025.24,'Synthetic record for database testing'),(42,16,6,2,'2025-06-01 07:30:00','2025-06-03 11:00:00','Emergency','Transfer',1094.43,'Synthetic record for database testing'),(43,16,6,6,'2025-05-05 17:45:00','2025-05-08 11:00:00','Elective','Transfer',6071.97,'Synthetic record for database testing'),(44,47,6,2,'2026-06-01 17:45:00','2026-06-10 11:00:00','Transfer','Transfer',2943.85,'Synthetic record for database testing'),(45,16,10,2,'2025-10-11 21:10:00','2025-10-19 11:00:00','Elective','Transfer',1335.73,'Synthetic record for database testing'),(46,19,3,5,'2025-08-29 13:00:00','2025-09-04 11:00:00','Emergency','Home',1984.85,'Synthetic record for database testing'),(47,25,6,4,'2025-06-06 10:15:00','2025-06-08 11:00:00','Elective','Transfer',4329.60,'Synthetic record for database testing'),(48,14,10,1,'2026-03-07 17:45:00','2026-03-17 11:00:00','Transfer','Transfer',702.18,'Synthetic record for database testing'),(49,23,8,6,'2025-11-02 17:45:00','2025-11-09 11:00:00','Emergency','Transfer',2591.88,'Synthetic record for database testing'),(50,28,3,6,'2026-05-13 07:30:00','2026-05-20 11:00:00','Transfer','Home',8088.48,'Synthetic record for database testing'),(51,59,1,4,'2025-05-11 21:10:00','2025-05-20 11:00:00','Emergency','Home',6338.33,'Synthetic record for database testing'),(52,9,3,4,'2026-04-18 10:15:00','2026-04-19 11:00:00','Elective','Home',4674.09,'Synthetic record for database testing'),(53,22,3,1,'2026-01-24 13:00:00','2026-01-31 11:00:00','Transfer','Home',7278.86,'Synthetic record for database testing'),(54,4,10,1,'2025-12-25 10:15:00','2025-12-27 11:00:00','Emergency','Home',2414.34,'Synthetic record for database testing'),(55,2,2,4,'2026-09-29 10:15:00','2026-10-03 11:00:00','Emergency','Home',4765.55,'Synthetic record for database testing'),(56,17,8,6,'2026-01-13 10:15:00','2026-01-23 11:00:00','Emergency','Home',9187.78,'Synthetic record for database testing'),(57,7,8,6,'2026-08-16 07:30:00','2026-08-21 11:00:00','Transfer','Transfer',8982.01,'Synthetic record for database testing'),(58,13,1,6,'2025-03-19 21:10:00','2025-03-23 11:00:00','Elective','Home',7696.61,'Synthetic record for database testing'),(59,37,6,6,'2025-02-12 13:00:00','2025-02-21 11:00:00','Elective','Home',5127.75,'Synthetic record for database testing'),(60,22,1,4,'2025-01-13 17:45:00','2025-01-21 11:00:00','Elective','Transfer',6909.68,'Synthetic record for database testing'),(61,28,8,5,'2025-06-30 21:10:00','2025-07-05 11:00:00','Transfer','Transfer',4504.83,'Synthetic record for database testing'),(62,47,2,1,'2026-08-30 13:00:00','2026-09-05 11:00:00','Elective','Transfer',2808.19,'Synthetic record for database testing'),(63,30,3,1,'2026-08-07 21:10:00','2026-08-14 11:00:00','Transfer','Home',2259.28,'Synthetic record for database testing'),(64,5,3,5,'2025-12-30 13:00:00','2026-01-05 11:00:00','Elective','Home',5222.15,'Synthetic record for database testing'),(65,13,6,5,'2025-03-29 10:15:00','2025-04-05 11:00:00','Emergency','Transfer',6366.24,'Synthetic record for database testing'),(66,32,3,2,'2026-04-04 07:30:00','2026-04-06 11:00:00','Transfer','Home',3359.92,'Synthetic record for database testing'),(67,38,8,3,'2026-01-13 17:45:00','2026-01-22 11:00:00','Transfer','Home',3763.52,'Synthetic record for database testing'),(68,9,2,1,'2025-10-05 13:00:00','2025-10-10 11:00:00','Emergency','Home',1708.06,'Synthetic record for database testing'),(69,35,10,4,'2025-07-09 10:15:00','2025-07-13 11:00:00','Elective','Home',9327.52,'Synthetic record for database testing'),(70,54,3,2,'2025-07-18 13:00:00','2025-07-22 11:00:00','Elective','Home',6915.96,'Synthetic record for database testing'),(71,9,8,3,'2025-10-08 07:30:00','2025-10-09 11:00:00','Emergency','Transfer',1557.90,'Synthetic record for database testing'),(72,1,6,4,'2026-08-11 13:00:00','2026-08-19 11:00:00','Elective','Home',9194.65,'Synthetic record for database testing'),(73,17,6,4,'2026-05-05 07:30:00','2026-05-07 11:00:00','Emergency','Home',1992.78,'Synthetic record for database testing'),(74,52,2,1,'2026-07-31 13:00:00','2026-08-02 11:00:00','Transfer','Home',7514.89,'Synthetic record for database testing'),(75,25,8,4,'2026-04-07 17:45:00','2026-04-12 11:00:00','Elective','Home',6045.23,'Synthetic record for database testing'),(76,5,3,6,'2025-04-12 10:15:00','2025-04-16 11:00:00','Emergency','Home',2772.81,'Synthetic record for database testing'),(77,36,6,4,'2025-03-18 10:15:00','2025-03-19 11:00:00','Transfer','Home',938.86,'Synthetic record for database testing'),(78,19,10,2,'2025-10-17 17:45:00','2025-10-19 11:00:00','Elective','Home',4412.48,'Synthetic record for database testing'),(79,35,2,1,'2025-08-19 10:15:00','2025-08-24 11:00:00','Emergency','Home',7664.76,'Synthetic record for database testing'),(80,9,1,4,'2026-08-06 13:00:00','2026-08-14 11:00:00','Elective','Transfer',8992.68,'Synthetic record for database testing'),(81,33,1,5,'2026-07-07 17:45:00','2026-07-15 11:00:00','Emergency','Transfer',7150.63,'Synthetic record for database testing'),(82,39,2,6,'2025-09-14 07:30:00','2025-09-16 11:00:00','Emergency','Home',5749.79,'Synthetic record for database testing'),(83,49,10,4,'2025-06-29 17:45:00','2025-07-08 11:00:00','Elective','Home',9472.97,'Synthetic record for database testing'),(84,1,6,3,'2026-10-13 17:45:00','2026-10-15 11:00:00','Transfer','Home',3491.37,'Synthetic record for database testing'),(85,7,10,4,'2025-06-14 13:00:00','2025-06-21 11:00:00','Elective','Transfer',7850.06,'Synthetic record for database testing'),(86,36,3,3,'2025-02-07 17:45:00','2025-02-09 11:00:00','Elective','Home',9236.13,'Synthetic record for database testing'),(87,26,6,4,'2026-06-11 07:30:00','2026-06-20 11:00:00','Emergency','Home',5238.19,'Synthetic record for database testing'),(88,5,2,3,'2026-05-26 17:45:00','2026-05-27 11:00:00','Emergency','Home',4527.33,'Synthetic record for database testing'),(89,45,10,5,'2026-05-12 07:30:00','2026-05-13 11:00:00','Emergency','Home',3400.14,'Synthetic record for database testing'),(90,1,2,1,'2026-07-20 17:45:00','2026-07-22 11:00:00','Transfer','Home',6382.23,'Synthetic record for database testing'),(91,10,10,3,'2026-05-26 13:00:00','2026-06-04 11:00:00','Transfer','Transfer',9325.16,'Synthetic record for database testing'),(92,9,6,2,'2026-04-13 21:10:00','2026-04-16 11:00:00','Emergency','Home',3094.79,'Synthetic record for database testing'),(93,51,3,1,'2026-03-01 13:00:00','2026-03-10 11:00:00','Elective','Home',8061.66,'Synthetic record for database testing'),(94,38,8,4,'2026-05-17 10:15:00','2026-05-25 11:00:00','Elective','Home',5534.47,'Synthetic record for database testing'),(95,35,2,6,'2026-01-22 17:45:00','2026-01-28 11:00:00','Emergency','Transfer',2717.03,'Synthetic record for database testing'),(96,1,10,4,'2026-02-25 07:30:00','2026-03-03 11:00:00','Transfer','Transfer',9397.46,'Synthetic record for database testing'),(97,51,2,5,'2025-06-05 17:45:00','2025-06-06 11:00:00','Elective','Home',8386.58,'Synthetic record for database testing'),(98,29,1,6,'2025-04-13 21:10:00','2025-04-21 11:00:00','Emergency','Transfer',8357.76,'Synthetic record for database testing'),(99,10,3,5,'2025-03-18 17:45:00','2025-03-23 11:00:00','Transfer','Home',8188.12,'Synthetic record for database testing'),(100,5,10,6,'2026-07-01 17:45:00','2026-07-07 11:00:00','Transfer','Home',6114.52,'Synthetic record for database testing'),(101,16,10,1,'2026-10-09 13:00:00','2026-10-13 11:00:00','Transfer','Home',7379.27,'Synthetic record for database testing'),(102,46,10,3,'2025-04-13 17:45:00','2025-04-16 11:00:00','Emergency','Home',3520.72,'Synthetic record for database testing'),(103,4,6,2,'2025-10-28 13:00:00','2025-11-03 11:00:00','Emergency','Transfer',5658.46,'Synthetic record for database testing'),(104,9,1,5,'2025-07-04 10:15:00','2025-07-07 11:00:00','Transfer','Home',5054.36,'Synthetic record for database testing'),(105,38,10,3,'2025-05-27 10:15:00','2025-06-04 11:00:00','Transfer','Home',6551.54,'Synthetic record for database testing'),(106,58,2,1,'2026-04-22 13:00:00','2026-05-01 11:00:00','Transfer','Home',9390.72,'Synthetic record for database testing'),(107,20,3,2,'2026-03-11 13:00:00','2026-03-19 11:00:00','Transfer','Transfer',1593.88,'Synthetic record for database testing'),(108,1,3,6,'2026-08-09 13:00:00','2026-08-19 11:00:00','Elective','Home',9304.81,'Synthetic record for database testing'),(109,43,8,6,'2026-02-10 13:00:00','2026-02-11 11:00:00','Emergency','Transfer',8020.62,'Synthetic record for database testing'),(110,58,3,2,'2025-10-21 10:15:00','2025-10-31 11:00:00','Emergency','Home',6648.22,'Synthetic record for database testing'),(111,47,3,4,'2025-05-21 07:30:00','2025-05-22 11:00:00','Emergency','Home',7131.38,'Synthetic record for database testing'),(112,5,2,2,'2025-10-30 13:00:00','2025-11-06 11:00:00','Emergency','Home',5348.04,'Synthetic record for database testing'),(113,59,6,3,'2025-10-07 10:15:00','2025-10-12 11:00:00','Elective','Home',4794.73,'Synthetic record for database testing'),(114,5,8,3,'2025-05-25 10:15:00','2025-06-01 11:00:00','Emergency','Transfer',773.18,'Synthetic record for database testing'),(115,35,10,6,'2025-05-07 17:45:00','2025-05-13 11:00:00','Elective','Transfer',7928.39,'Synthetic record for database testing'),(116,9,1,5,'2025-04-21 10:15:00','2025-04-29 11:00:00','Elective','Home',6381.72,'Synthetic record for database testing'),(117,41,1,2,'2026-04-21 13:00:00','2026-04-28 11:00:00','Emergency','Home',3343.63,'Synthetic record for database testing'),(118,32,8,2,'2025-04-29 07:30:00','2025-05-03 11:00:00','Transfer','Transfer',3933.45,'Synthetic record for database testing'),(119,48,10,6,'2026-07-08 17:45:00','2026-07-18 11:00:00','Emergency','Transfer',6446.06,'Synthetic record for database testing'),(120,1,3,1,'2026-05-17 21:10:00','2026-05-24 11:00:00','Elective','Home',4573.94,'Synthetic record for database testing');
/*!40000 ALTER TABLE `admissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `appointments`
--

DROP TABLE IF EXISTS `appointments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `appointments` (
  `appointment_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `patient_id` int unsigned NOT NULL,
  `staff_id` int unsigned NOT NULL,
  `scheduled_start` datetime NOT NULL,
  `scheduled_end` datetime NOT NULL,
  `appointment_type` enum('Consultation','Follow-up','Diagnostics','Physiotherapy','Medication review') NOT NULL,
  `status` enum('Scheduled','Completed','Cancelled','Did not attend') NOT NULL DEFAULT 'Scheduled',
  `outcome_summary` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`appointment_id`),
  KEY `fk_appointments_staff` (`staff_id`),
  KEY `idx_appointment_schedule` (`scheduled_start`,`status`),
  KEY `idx_appointment_patient` (`patient_id`,`scheduled_start`),
  CONSTRAINT `fk_appointments_patient` FOREIGN KEY (`patient_id`) REFERENCES `patient_identities` (`patient_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_appointments_staff` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`staff_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `appointments_chk_1` CHECK ((`scheduled_end` > `scheduled_start`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointments`
--

LOCK TABLES `appointments` WRITE;
/*!40000 ALTER TABLE `appointments` DISABLE KEYS */;
/*!40000 ALTER TABLE `appointments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `diagnosis_groups`
--

DROP TABLE IF EXISTS `diagnosis_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `diagnosis_groups` (
  `diagnosis_group_id` smallint unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(12) NOT NULL,
  `group_name` varchar(100) NOT NULL,
  `description` varchar(255) NOT NULL,
  PRIMARY KEY (`diagnosis_group_id`),
  UNIQUE KEY `code` (`code`),
  UNIQUE KEY `group_name` (`group_name`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `diagnosis_groups`
--

LOCK TABLES `diagnosis_groups` WRITE;
/*!40000 ALTER TABLE `diagnosis_groups` DISABLE KEYS */;
INSERT INTO `diagnosis_groups` VALUES (1,'CARD','Cardiovascular','Heart and circulatory conditions'),(2,'RESP','Respiratory','Respiratory and pulmonary conditions'),(3,'DIAB','Diabetes','Diabetes and related metabolic conditions'),(4,'MSK','Musculoskeletal','Muscle, bone and joint conditions'),(5,'INF','Infection','Acute infectious conditions'),(6,'NEUR','Neurology','Neurological conditions');
/*!40000 ALTER TABLE `diagnosis_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medications`
--

DROP TABLE IF EXISTS `medications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medications` (
  `medication_id` int unsigned NOT NULL AUTO_INCREMENT,
  `medication_code` varchar(20) NOT NULL,
  `medication_name` varchar(120) NOT NULL,
  `formulation` varchar(50) NOT NULL,
  `strength` varchar(40) NOT NULL,
  `controlled_medicine` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`medication_id`),
  UNIQUE KEY `medication_code` (`medication_code`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medications`
--

LOCK TABLES `medications` WRITE;
/*!40000 ALTER TABLE `medications` DISABLE KEYS */;
INSERT INTO `medications` VALUES (1,'MED001','Amoxicillin','Capsule','500 mg',0),(2,'MED002','Metformin','Tablet','500 mg',0),(3,'MED003','Salbutamol','Inhaler','100 micrograms/actuation',0),(4,'MED004','Atorvastatin','Tablet','20 mg',0),(5,'MED005','Paracetamol','Tablet','500 mg',0),(6,'MED006','Ramipril','Tablet','2.5 mg',0),(7,'MED007','Insulin glargine','Injection','100 units/mL',0),(8,'MED008','Levetiracetam','Tablet','500 mg',0);
/*!40000 ALTER TABLE `medications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient_identities`
--

DROP TABLE IF EXISTS `patient_identities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patient_identities` (
  `patient_id` int unsigned NOT NULL AUTO_INCREMENT,
  `hospital_number` varchar(20) NOT NULL,
  PRIMARY KEY (`patient_id`),
  UNIQUE KEY `hospital_number` (`hospital_number`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient_identities`
--

LOCK TABLES `patient_identities` WRITE;
/*!40000 ALTER TABLE `patient_identities` DISABLE KEYS */;
INSERT INTO `patient_identities` VALUES (1,'HN00001'),(2,'HN00002'),(3,'HN00003'),(4,'HN00004'),(5,'HN00005'),(6,'HN00006'),(7,'HN00007'),(8,'HN00008'),(9,'HN00009'),(10,'HN00010'),(11,'HN00011'),(12,'HN00012'),(13,'HN00013'),(14,'HN00014'),(15,'HN00015'),(16,'HN00016'),(17,'HN00017'),(18,'HN00018'),(19,'HN00019'),(20,'HN00020'),(21,'HN00021'),(22,'HN00022'),(23,'HN00023'),(24,'HN00024'),(25,'HN00025'),(26,'HN00026'),(27,'HN00027'),(28,'HN00028'),(29,'HN00029'),(30,'HN00030'),(31,'HN00031'),(32,'HN00032'),(33,'HN00033'),(34,'HN00034'),(35,'HN00035'),(36,'HN00036'),(37,'HN00037'),(38,'HN00038'),(39,'HN00039'),(40,'HN00040'),(41,'HN00041'),(42,'HN00042'),(43,'HN00043'),(44,'HN00044'),(45,'HN00045'),(46,'HN00046'),(47,'HN00047'),(48,'HN00048'),(49,'HN00049'),(50,'HN00050'),(51,'HN00051'),(52,'HN00052'),(53,'HN00053'),(54,'HN00054'),(55,'HN00055'),(56,'HN00056'),(57,'HN00057'),(58,'HN00058'),(59,'HN00059'),(60,'HN00060');
/*!40000 ALTER TABLE `patient_identities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient_locations`
--

DROP TABLE IF EXISTS `patient_locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patient_locations` (
  `location_id` int unsigned NOT NULL AUTO_INCREMENT,
  `patient_id` int unsigned NOT NULL,
  `postcode_area` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`location_id`),
  UNIQUE KEY `uq_patient_location` (`patient_id`),
  CONSTRAINT `patient_locations_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `patient_identities` (`patient_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient_locations`
--

LOCK TABLES `patient_locations` WRITE;
/*!40000 ALTER TABLE `patient_locations` DISABLE KEYS */;
INSERT INTO `patient_locations` VALUES (1,1,'AB1'),(2,2,'LS8'),(3,3,'B12'),(4,4,'B12'),(5,5,'AB1'),(6,6,'LS8'),(7,7,'YO1'),(8,8,'LS8'),(9,9,'SE5'),(10,10,'YO1'),(11,11,'E3'),(12,12,'N1'),(13,13,'LS8'),(14,14,'B12'),(15,15,'B12'),(16,16,'YO1'),(17,17,'SW2'),(18,18,'SE5'),(19,19,'M4'),(20,20,'N1'),(21,21,'B12'),(22,22,'M4'),(23,23,'B12'),(24,24,'SW2'),(25,25,'E3'),(26,26,'LS8'),(27,27,'B12'),(28,28,'W1'),(29,29,'E3'),(30,30,'M4'),(31,31,'LS8'),(32,32,'AB1'),(33,33,'N1'),(34,34,'B12'),(35,35,'N1'),(36,36,'SE5'),(37,37,'E3'),(38,38,'LS8'),(39,39,'W1'),(40,40,'SE5'),(41,41,'N1'),(42,42,'W1'),(43,43,'AB1'),(44,44,'E3'),(45,45,'YO1'),(46,46,'SE5'),(47,47,'W1'),(48,48,'AB1'),(49,49,'W1'),(50,50,'N1'),(51,51,'SE5'),(52,52,'AB1'),(53,53,'W1'),(54,54,'W1'),(55,55,'W1'),(56,56,'E3'),(57,57,'W1'),(58,58,'AB1'),(59,59,'SW2'),(60,60,'N1');
/*!40000 ALTER TABLE `patient_locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient_metadata`
--

DROP TABLE IF EXISTS `patient_metadata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patient_metadata` (
  `metadata_id` int unsigned NOT NULL AUTO_INCREMENT,
  `patient_id` int unsigned NOT NULL,
  `registered_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`metadata_id`),
  UNIQUE KEY `uq_patient_metadata` (`patient_id`),
  CONSTRAINT `patient_metadata_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `patient_identities` (`patient_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient_metadata`
--

LOCK TABLES `patient_metadata` WRITE;
/*!40000 ALTER TABLE `patient_metadata` DISABLE KEYS */;
INSERT INTO `patient_metadata` VALUES (1,1,'2026-11-12 18:51:04'),(2,2,'2026-11-12 18:51:04'),(3,3,'2026-11-12 18:51:04'),(4,4,'2026-11-12 18:51:04'),(5,5,'2026-11-12 18:51:04'),(6,6,'2026-11-12 18:56:38'),(7,7,'2026-11-12 18:56:38'),(8,8,'2026-11-12 18:56:38'),(9,9,'2026-11-12 18:56:38'),(10,10,'2026-11-12 18:56:38'),(11,11,'2026-11-12 18:56:38'),(12,12,'2026-11-12 18:56:38'),(13,13,'2026-11-12 18:56:38'),(14,14,'2026-11-12 18:56:38'),(15,15,'2026-11-12 18:56:38'),(16,16,'2026-11-12 18:56:38'),(17,17,'2026-11-12 18:56:38'),(18,18,'2026-11-12 18:56:38'),(19,19,'2026-11-12 18:56:38'),(20,20,'2026-11-12 18:56:38'),(21,21,'2026-11-12 18:56:38'),(22,22,'2026-11-12 18:56:38'),(23,23,'2026-11-12 18:56:38'),(24,24,'2026-11-12 18:56:38'),(25,25,'2026-11-12 18:56:38'),(26,26,'2026-11-12 18:56:38'),(27,27,'2026-11-12 18:56:38'),(28,28,'2026-11-12 18:56:38'),(29,29,'2026-11-12 18:56:38'),(30,30,'2026-11-12 18:56:38'),(31,31,'2026-11-12 18:56:38'),(32,32,'2026-11-12 18:56:38'),(33,33,'2026-11-12 18:56:38'),(34,34,'2026-11-12 18:56:38'),(35,35,'2026-11-12 18:56:38'),(36,36,'2026-11-12 18:56:38'),(37,37,'2026-11-12 18:56:38'),(38,38,'2026-11-12 18:56:38'),(39,39,'2026-11-12 18:56:38'),(40,40,'2026-11-12 18:56:38'),(41,41,'2026-11-12 18:56:38'),(42,42,'2026-11-12 18:56:38'),(43,43,'2026-11-12 18:56:38'),(44,44,'2026-11-12 18:56:38'),(45,45,'2026-11-12 18:56:38'),(46,46,'2026-11-12 18:56:38'),(47,47,'2026-11-12 18:56:38'),(48,48,'2026-11-12 18:56:38'),(49,49,'2026-11-12 18:56:38'),(50,50,'2026-11-12 18:56:38'),(51,51,'2026-11-12 18:56:38'),(52,52,'2026-11-12 18:56:38'),(53,53,'2026-11-12 18:56:38'),(54,54,'2026-11-12 18:56:38'),(55,55,'2026-11-12 18:56:38'),(56,56,'2026-11-12 18:56:38'),(57,57,'2026-11-12 18:56:38'),(58,58,'2026-11-12 18:56:38'),(59,59,'2026-11-12 18:56:38'),(60,60,'2026-11-12 18:56:38');
/*!40000 ALTER TABLE `patient_metadata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient_profiles`
--

DROP TABLE IF EXISTS `patient_profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patient_profiles` (
  `profile_id` int unsigned NOT NULL AUTO_INCREMENT,
  `patient_id` int unsigned NOT NULL,
  `given_name` varchar(60) NOT NULL,
  `family_name` varchar(60) NOT NULL,
  `date_of_birth` date NOT NULL,
  `sex` enum('Female','Male','Intersex','Unknown') NOT NULL DEFAULT 'Unknown',
  PRIMARY KEY (`profile_id`),
  UNIQUE KEY `uq_patient_profile` (`patient_id`),
  CONSTRAINT `patient_profiles_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `patient_identities` (`patient_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient_profiles`
--

LOCK TABLES `patient_profiles` WRITE;
/*!40000 ALTER TABLE `patient_profiles` DISABLE KEYS */;
INSERT INTO `patient_profiles` VALUES (1,1,'Alex','Davies','2002-05-14','Female'),(2,2,'Amira','Green','2011-07-13','Female'),(3,3,'Ben','Johnson','1965-01-10','Male'),(4,4,'Chloe','Morgan','2005-09-17','Unknown'),(5,5,'Dara','Parker','1997-12-23','Male'),(6,6,'Elliot','Singh','1947-09-04','Female'),(7,7,'Farah','Walker','1965-11-15','Unknown'),(8,8,'George','Zhang','1947-05-20','Unknown'),(9,9,'Hana','Chen','2009-03-28','Unknown'),(10,10,'Isaac','Foster','1964-10-11','Male'),(11,11,'Jade','Ibrahim','1969-12-16','Female'),(12,12,'Kai','Lewis','2007-08-20','Male'),(13,13,'Leah','Osei','1969-12-06','Male'),(14,14,'Musa','Roberts','2013-07-01','Female'),(15,15,'Nadia','Umar','1953-04-28','Male'),(16,16,'Owen','Young','1977-03-17','Female'),(17,17,'Priya','Baker','1968-09-24','Female'),(18,18,'Quinn','Edwards','1993-02-09','Female'),(19,19,'Ravi','Hall','1952-01-27','Unknown'),(20,20,'Sara','Khan','2001-05-26','Unknown'),(21,21,'Theo','Nwosu','1996-10-18','Male'),(22,22,'Uma','Quinn','1949-02-10','Male'),(23,23,'Victor','Taylor','1952-02-28','Male'),(24,24,'Wendy','Xu','1979-02-07','Female'),(25,25,'Yusuf','Ahmed','2002-01-12','Female'),(26,26,'Zara','Davies','1978-03-19','Female'),(27,27,'Abigail','Green','2005-02-15','Female'),(28,28,'Caleb','Johnson','1999-08-26','Male'),(29,29,'Diana','Morgan','2010-06-01','Male'),(30,30,'Emeka','Parker','1986-06-22','Male'),(31,31,'Alex','Singh','2002-06-02','Unknown'),(32,32,'Amira','Walker','2006-06-03','Female'),(33,33,'Ben','Zhang','1965-07-20','Female'),(34,34,'Chloe','Chen','1980-12-28','Female'),(35,35,'Dara','Foster','1963-12-06','Unknown'),(36,36,'Elliot','Ibrahim','1964-01-29','Male'),(37,37,'Farah','Lewis','2002-09-03','Male'),(38,38,'George','Osei','1968-10-06','Male'),(39,39,'Hana','Roberts','2011-11-02','Unknown'),(40,40,'Isaac','Umar','1968-07-28','Unknown'),(41,41,'Jade','Young','1997-05-09','Male'),(42,42,'Kai','Baker','1964-09-04','Male'),(43,43,'Leah','Edwards','1989-04-11','Female'),(44,44,'Musa','Hall','1954-11-02','Male'),(45,45,'Nadia','Khan','2016-01-23','Male'),(46,46,'Owen','Nwosu','1950-09-13','Male'),(47,47,'Priya','Quinn','1998-06-18','Male'),(48,48,'Quinn','Taylor','1967-07-23','Unknown'),(49,49,'Ravi','Xu','2006-01-12','Female'),(50,50,'Sara','Ahmed','2012-05-13','Female'),(51,51,'Theo','Davies','1955-01-04','Female'),(52,52,'Uma','Green','1959-03-11','Male'),(53,53,'Victor','Johnson','2009-10-13','Female'),(54,54,'Wendy','Morgan','2013-05-11','Male'),(55,55,'Yusuf','Parker','1954-07-19','Female'),(56,56,'Zara','Singh','1999-08-20','Male'),(57,57,'Abigail','Walker','1978-07-19','Male'),(58,58,'Caleb','Zhang','2014-11-09','Unknown'),(59,59,'Diana','Chen','1998-09-26','Female'),(60,60,'Emeka','Foster','1946-10-01','Female');
/*!40000 ALTER TABLE `patient_profiles` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `check_dob_before_insert` BEFORE INSERT ON `patient_profiles` FOR EACH ROW BEGIN
    IF NEW.date_of_birth > CURRENT_DATE THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Invalid date_of_birth: Date of birth cannot be in the future.';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `check_dob_before_update` BEFORE UPDATE ON `patient_profiles` FOR EACH ROW BEGIN
    IF NEW.date_of_birth > CURRENT_DATE THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Invalid date_of_birth: Date of birth cannot be in the future.';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `prescriptions`
--

DROP TABLE IF EXISTS `prescriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prescriptions` (
  `prescription_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `admission_id` bigint unsigned NOT NULL,
  `medication_id` int unsigned NOT NULL,
  `prescribed_by_staff_id` int unsigned NOT NULL,
  `prescribed_at` datetime NOT NULL,
  `dose` varchar(60) NOT NULL,
  `route` enum('Oral','Intravenous','Topical','Inhaled','Other') NOT NULL,
  `frequency` varchar(60) NOT NULL,
  `duration_days` smallint unsigned NOT NULL,
  `status` enum('Active','Completed','Discontinued') NOT NULL DEFAULT 'Active',
  PRIMARY KEY (`prescription_id`),
  KEY `prescribed_by_staff_id` (`prescribed_by_staff_id`),
  KEY `idx_rx_admission` (`admission_id`),
  KEY `idx_rx_medication` (`medication_id`),
  CONSTRAINT `prescriptions_ibfk_1` FOREIGN KEY (`admission_id`) REFERENCES `admissions` (`admission_id`) ON DELETE CASCADE,
  CONSTRAINT `prescriptions_ibfk_2` FOREIGN KEY (`medication_id`) REFERENCES `medications` (`medication_id`),
  CONSTRAINT `prescriptions_ibfk_3` FOREIGN KEY (`prescribed_by_staff_id`) REFERENCES `staff` (`staff_id`)
) ENGINE=InnoDB AUTO_INCREMENT=151 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prescriptions`
--

LOCK TABLES `prescriptions` WRITE;
/*!40000 ALTER TABLE `prescriptions` DISABLE KEYS */;
INSERT INTO `prescriptions` VALUES (1,88,4,2,'2026-05-26 12:00:00','1 tablet','Intravenous','Once daily',17,'Completed'),(2,54,3,6,'2025-12-25 12:00:00','2 tablets','Inhaled','As required',27,'Discontinued'),(3,112,1,3,'2025-10-30 12:00:00','2 tablets','Topical','As required',18,'Discontinued'),(4,41,3,6,'2026-09-18 12:00:00','1 inhalation','Topical','As required',27,'Completed'),(5,79,8,3,'2025-08-19 12:00:00','2 tablets','Topical','As required',12,'Completed'),(6,39,5,3,'2025-06-23 12:00:00','10 units','Topical','Twice daily',14,'Completed'),(7,37,2,10,'2025-06-28 12:00:00','10 units','Inhaled','Twice daily',27,'Completed'),(8,38,1,5,'2026-08-17 12:00:00','1 tablet','Topical','Twice daily',23,'Completed'),(9,96,8,3,'2026-02-25 12:00:00','2 tablets','Topical','As required',25,'Completed'),(10,18,2,10,'2026-06-20 12:00:00','2 tablets','Intravenous','Once daily',24,'Completed'),(11,82,4,2,'2025-09-14 12:00:00','1 tablet','Inhaled','Twice daily',25,'Discontinued'),(12,13,3,2,'2026-01-24 12:00:00','2 tablets','Inhaled','As required',18,'Discontinued'),(13,84,4,5,'2026-10-13 12:00:00','1 inhalation','Topical','As required',4,'Active'),(14,84,4,10,'2026-10-13 12:00:00','1 tablet','Intravenous','Twice daily',29,'Completed'),(15,120,1,6,'2026-05-17 12:00:00','10 units','Intravenous','As required',30,'Completed'),(16,113,1,2,'2025-10-07 12:00:00','1 inhalation','Oral','Twice daily',12,'Discontinued'),(17,83,8,3,'2025-06-29 12:00:00','10 units','Topical','Once daily',28,'Active'),(18,43,3,6,'2025-05-05 12:00:00','1 inhalation','Intravenous','Once daily',26,'Completed'),(19,102,5,10,'2025-04-13 12:00:00','2 tablets','Intravenous','As required',30,'Discontinued'),(20,106,7,10,'2026-04-22 12:00:00','1 inhalation','Oral','Twice daily',24,'Active'),(21,24,3,6,'2025-10-11 12:00:00','1 inhalation','Intravenous','Once daily',11,'Discontinued'),(22,31,8,5,'2025-07-17 12:00:00','1 inhalation','Topical','As required',26,'Active'),(23,34,6,3,'2025-09-18 12:00:00','1 tablet','Oral','Twice daily',12,'Completed'),(24,52,5,2,'2026-04-18 12:00:00','1 inhalation','Topical','As required',10,'Completed'),(25,18,8,3,'2026-06-20 12:00:00','10 units','Topical','Twice daily',25,'Discontinued'),(26,97,4,3,'2025-06-05 12:00:00','1 tablet','Inhaled','As required',25,'Completed'),(27,10,2,2,'2026-04-05 12:00:00','2 tablets','Intravenous','Once daily',13,'Discontinued'),(28,15,4,10,'2025-03-04 12:00:00','10 units','Oral','As required',17,'Active'),(29,59,3,10,'2025-02-12 12:00:00','10 units','Inhaled','As required',4,'Discontinued'),(30,87,5,2,'2026-06-11 12:00:00','10 units','Topical','Once daily',26,'Completed'),(31,75,2,2,'2026-04-07 12:00:00','10 units','Topical','As required',5,'Active'),(32,120,2,6,'2026-05-17 12:00:00','1 tablet','Topical','Twice daily',8,'Completed'),(33,99,7,5,'2025-03-18 12:00:00','10 units','Inhaled','Twice daily',15,'Active'),(34,88,3,5,'2026-05-26 12:00:00','1 tablet','Intravenous','As required',15,'Completed'),(35,94,4,2,'2026-05-17 12:00:00','1 tablet','Topical','Twice daily',24,'Discontinued'),(36,69,7,3,'2025-07-09 12:00:00','2 tablets','Inhaled','Twice daily',7,'Completed'),(37,25,2,2,'2026-03-14 12:00:00','10 units','Oral','Once daily',9,'Active'),(38,13,1,6,'2026-01-24 12:00:00','1 tablet','Intravenous','As required',4,'Discontinued'),(39,57,4,10,'2026-08-16 12:00:00','2 tablets','Oral','Once daily',19,'Completed'),(40,30,6,10,'2026-04-27 12:00:00','1 inhalation','Intravenous','Twice daily',7,'Completed'),(41,53,5,5,'2026-01-24 12:00:00','1 tablet','Intravenous','As required',24,'Discontinued'),(42,72,8,2,'2026-08-11 12:00:00','1 inhalation','Inhaled','As required',13,'Discontinued'),(43,53,3,5,'2026-01-24 12:00:00','10 units','Intravenous','As required',18,'Completed'),(44,109,4,5,'2026-02-10 12:00:00','2 tablets','Inhaled','Once daily',20,'Discontinued'),(45,54,3,6,'2025-12-25 12:00:00','2 tablets','Topical','Once daily',13,'Active'),(46,119,8,5,'2026-07-08 12:00:00','1 tablet','Intravenous','Once daily',11,'Discontinued'),(47,87,1,2,'2026-06-11 12:00:00','2 tablets','Intravenous','Twice daily',9,'Completed'),(48,39,1,3,'2025-06-23 12:00:00','2 tablets','Oral','As required',27,'Discontinued'),(49,118,4,10,'2025-04-29 12:00:00','2 tablets','Inhaled','Once daily',20,'Completed'),(50,100,5,6,'2026-07-01 12:00:00','10 units','Topical','Twice daily',11,'Completed'),(51,66,8,6,'2026-04-04 12:00:00','1 tablet','Inhaled','Twice daily',9,'Completed'),(52,41,7,2,'2026-09-18 12:00:00','2 tablets','Intravenous','Once daily',11,'Discontinued'),(53,38,3,3,'2026-08-17 12:00:00','1 inhalation','Intravenous','Twice daily',21,'Completed'),(54,64,6,5,'2025-12-30 12:00:00','10 units','Inhaled','Twice daily',8,'Completed'),(55,22,3,10,'2025-05-18 12:00:00','10 units','Intravenous','As required',23,'Active'),(56,68,1,2,'2025-10-05 12:00:00','1 tablet','Oral','Twice daily',7,'Completed'),(57,9,3,2,'2025-04-11 12:00:00','2 tablets','Inhaled','Twice daily',4,'Discontinued'),(58,85,8,2,'2025-06-14 12:00:00','1 tablet','Inhaled','Once daily',3,'Completed'),(59,69,5,2,'2025-07-09 12:00:00','10 units','Intravenous','Once daily',6,'Completed'),(60,31,4,10,'2025-07-17 12:00:00','1 inhalation','Topical','Twice daily',28,'Discontinued'),(61,11,6,6,'2026-03-30 12:00:00','10 units','Intravenous','As required',10,'Completed'),(62,88,2,2,'2026-05-26 12:00:00','1 tablet','Inhaled','Twice daily',15,'Discontinued'),(63,8,1,3,'2025-04-07 12:00:00','1 tablet','Inhaled','Twice daily',23,'Completed'),(64,73,2,10,'2026-05-05 12:00:00','1 tablet','Intravenous','Once daily',30,'Discontinued'),(65,35,1,2,'2025-12-05 12:00:00','1 inhalation','Oral','Once daily',30,'Completed'),(66,3,4,10,'2026-09-14 12:00:00','2 tablets','Inhaled','Once daily',12,'Completed'),(67,73,4,10,'2026-05-05 12:00:00','10 units','Topical','Twice daily',27,'Completed'),(68,102,2,10,'2025-04-13 12:00:00','1 inhalation','Oral','Once daily',16,'Completed'),(69,108,2,5,'2026-08-09 12:00:00','10 units','Topical','Once daily',23,'Completed'),(70,101,8,6,'2026-10-09 12:00:00','2 tablets','Topical','As required',15,'Discontinued'),(71,24,7,2,'2025-10-11 12:00:00','1 inhalation','Intravenous','As required',5,'Active'),(72,35,3,6,'2025-12-05 12:00:00','2 tablets','Inhaled','Twice daily',14,'Active'),(73,12,1,5,'2025-08-31 12:00:00','10 units','Topical','Twice daily',6,'Completed'),(74,12,3,6,'2025-08-31 12:00:00','10 units','Inhaled','Once daily',3,'Active'),(75,46,2,10,'2025-08-29 12:00:00','1 inhalation','Inhaled','Once daily',12,'Discontinued'),(76,50,2,10,'2026-05-13 12:00:00','2 tablets','Intravenous','As required',15,'Completed'),(77,18,5,5,'2026-06-20 12:00:00','1 inhalation','Inhaled','Once daily',5,'Completed'),(78,56,5,6,'2026-01-13 12:00:00','1 inhalation','Inhaled','Once daily',14,'Completed'),(79,32,8,10,'2026-07-04 12:00:00','2 tablets','Inhaled','Once daily',7,'Completed'),(80,1,7,5,'2025-11-11 12:00:00','10 units','Topical','Twice daily',13,'Discontinued'),(81,105,3,5,'2025-05-27 12:00:00','1 inhalation','Intravenous','Twice daily',13,'Completed'),(82,51,6,5,'2025-05-11 12:00:00','10 units','Intravenous','Twice daily',15,'Completed'),(83,105,7,5,'2025-05-27 12:00:00','1 tablet','Intravenous','As required',20,'Completed'),(84,88,1,6,'2026-05-26 12:00:00','2 tablets','Inhaled','Twice daily',29,'Active'),(85,105,7,6,'2025-05-27 12:00:00','2 tablets','Topical','Once daily',11,'Completed'),(86,92,7,6,'2026-04-13 12:00:00','1 tablet','Inhaled','As required',18,'Discontinued'),(87,69,7,10,'2025-07-09 12:00:00','1 tablet','Topical','As required',28,'Active'),(88,14,4,5,'2026-07-24 12:00:00','2 tablets','Oral','As required',23,'Discontinued'),(89,97,6,6,'2025-06-05 12:00:00','1 tablet','Oral','Once daily',11,'Completed'),(90,66,4,6,'2026-04-04 12:00:00','1 inhalation','Inhaled','Twice daily',27,'Completed'),(91,45,1,6,'2025-10-11 12:00:00','1 tablet','Topical','Twice daily',5,'Active'),(92,107,3,5,'2026-03-11 12:00:00','1 inhalation','Topical','Twice daily',28,'Completed'),(93,67,8,5,'2026-01-13 12:00:00','10 units','Oral','Twice daily',26,'Discontinued'),(94,41,2,5,'2026-09-18 12:00:00','1 tablet','Oral','Once daily',30,'Completed'),(95,83,2,3,'2025-06-29 12:00:00','2 tablets','Intravenous','As required',8,'Completed'),(96,72,7,6,'2026-08-11 12:00:00','2 tablets','Inhaled','As required',8,'Completed'),(97,82,7,6,'2025-09-14 12:00:00','1 tablet','Intravenous','Twice daily',21,'Discontinued'),(98,50,1,3,'2026-05-13 12:00:00','2 tablets','Topical','As required',28,'Active'),(99,74,2,10,'2026-07-31 12:00:00','2 tablets','Topical','Twice daily',9,'Discontinued'),(100,15,5,6,'2025-03-04 12:00:00','1 inhalation','Inhaled','As required',15,'Active'),(101,45,6,6,'2025-10-11 12:00:00','2 tablets','Topical','As required',21,'Active'),(102,87,3,5,'2026-06-11 12:00:00','1 tablet','Intravenous','Twice daily',6,'Completed'),(103,48,3,10,'2026-03-07 12:00:00','10 units','Inhaled','As required',7,'Discontinued'),(104,55,3,6,'2026-09-29 12:00:00','2 tablets','Intravenous','Twice daily',12,'Completed'),(105,24,6,6,'2025-10-11 12:00:00','1 tablet','Topical','Once daily',18,'Completed'),(106,25,7,10,'2026-03-14 12:00:00','10 units','Inhaled','As required',18,'Discontinued'),(107,91,8,6,'2026-05-26 12:00:00','2 tablets','Oral','As required',3,'Completed'),(108,38,1,5,'2026-08-17 12:00:00','2 tablets','Topical','Once daily',27,'Discontinued'),(109,73,8,10,'2026-05-05 12:00:00','1 tablet','Oral','Twice daily',27,'Completed'),(110,70,1,6,'2025-07-18 12:00:00','2 tablets','Inhaled','Once daily',26,'Completed'),(111,39,1,6,'2025-06-23 12:00:00','1 inhalation','Topical','Once daily',17,'Active'),(112,100,4,3,'2026-07-01 12:00:00','1 inhalation','Inhaled','Once daily',22,'Completed'),(113,101,4,3,'2026-10-09 12:00:00','1 tablet','Topical','As required',11,'Completed'),(114,42,5,5,'2025-06-01 12:00:00','1 inhalation','Oral','Once daily',27,'Discontinued'),(115,118,1,5,'2025-04-29 12:00:00','2 tablets','Intravenous','Once daily',7,'Completed'),(116,107,4,6,'2026-03-11 12:00:00','10 units','Intravenous','As required',23,'Completed'),(117,81,7,6,'2026-07-07 12:00:00','10 units','Oral','As required',28,'Active'),(118,52,5,5,'2026-04-18 12:00:00','10 units','Inhaled','Twice daily',21,'Active'),(119,112,2,6,'2025-10-30 12:00:00','1 inhalation','Oral','As required',15,'Completed'),(120,55,4,6,'2026-09-29 12:00:00','1 inhalation','Topical','Twice daily',13,'Completed'),(121,73,8,5,'2026-05-05 12:00:00','1 tablet','Oral','Once daily',23,'Discontinued'),(122,3,2,3,'2026-09-14 12:00:00','10 units','Inhaled','Once daily',16,'Completed'),(123,89,3,5,'2026-05-12 12:00:00','2 tablets','Topical','Once daily',23,'Completed'),(124,33,2,5,'2026-03-21 12:00:00','2 tablets','Oral','Twice daily',23,'Completed'),(125,93,4,6,'2026-03-01 12:00:00','1 tablet','Oral','Once daily',9,'Discontinued'),(126,10,3,10,'2026-04-05 12:00:00','2 tablets','Inhaled','Once daily',3,'Completed'),(127,105,2,6,'2025-05-27 12:00:00','2 tablets','Inhaled','Once daily',10,'Discontinued'),(128,12,2,2,'2025-08-31 12:00:00','1 inhalation','Topical','Twice daily',7,'Discontinued'),(129,100,3,3,'2026-07-01 12:00:00','1 tablet','Oral','As required',23,'Completed'),(130,57,6,3,'2026-08-16 12:00:00','2 tablets','Inhaled','As required',24,'Discontinued'),(131,111,4,2,'2025-05-21 12:00:00','1 tablet','Intravenous','Once daily',21,'Discontinued'),(132,45,7,5,'2025-10-11 12:00:00','2 tablets','Intravenous','Twice daily',23,'Active'),(133,32,5,2,'2026-07-04 12:00:00','1 inhalation','Intravenous','As required',22,'Completed'),(134,96,7,5,'2026-02-25 12:00:00','1 tablet','Intravenous','Twice daily',15,'Active'),(135,31,8,10,'2025-07-17 12:00:00','1 tablet','Oral','Twice daily',13,'Completed'),(136,50,7,5,'2026-05-13 12:00:00','2 tablets','Inhaled','Once daily',3,'Active'),(137,2,5,3,'2025-03-12 12:00:00','1 tablet','Oral','Twice daily',19,'Completed'),(138,81,7,6,'2026-07-07 12:00:00','10 units','Oral','As required',20,'Completed'),(139,36,2,5,'2026-02-17 12:00:00','1 tablet','Intravenous','Once daily',20,'Completed'),(140,51,2,5,'2025-05-11 12:00:00','10 units','Intravenous','Once daily',10,'Active'),(141,119,7,2,'2026-07-08 12:00:00','10 units','Oral','Twice daily',24,'Completed'),(142,16,1,3,'2025-03-24 12:00:00','1 tablet','Intravenous','Twice daily',14,'Completed'),(143,22,6,3,'2025-05-18 12:00:00','1 inhalation','Oral','Once daily',13,'Discontinued'),(144,35,2,5,'2025-12-05 12:00:00','1 tablet','Inhaled','Twice daily',19,'Completed'),(145,8,8,10,'2025-04-07 12:00:00','2 tablets','Topical','Once daily',11,'Active'),(146,115,2,3,'2025-05-07 12:00:00','1 tablet','Oral','Once daily',10,'Active'),(147,61,6,6,'2025-06-30 12:00:00','2 tablets','Intravenous','Once daily',20,'Discontinued'),(148,29,6,3,'2025-12-07 12:00:00','10 units','Topical','Twice daily',29,'Active'),(149,74,6,2,'2026-07-31 12:00:00','1 tablet','Intravenous','Once daily',28,'Active'),(150,52,2,6,'2026-04-18 12:00:00','1 inhalation','Topical','Twice daily',5,'Discontinued');
/*!40000 ALTER TABLE `prescriptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `staff` (
  `staff_id` int unsigned NOT NULL AUTO_INCREMENT,
  `staff_number` varchar(20) NOT NULL,
  `given_name` varchar(60) NOT NULL,
  `family_name` varchar(60) NOT NULL,
  `role` enum('Consultant','Doctor','Nurse','Pharmacist','Physiotherapist') NOT NULL,
  `specialty` varchar(80) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`staff_id`),
  UNIQUE KEY `staff_number` (`staff_number`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff`
--

LOCK TABLES `staff` WRITE;
/*!40000 ALTER TABLE `staff` DISABLE KEYS */;
INSERT INTO `staff` VALUES (1,'ST001','Amina','Patel','Consultant','Cardiology',1),(2,'ST002','James','Okafor','Doctor','General Medicine',1),(3,'ST003','Sofia','Williams','Doctor','Respiratory Medicine',1),(4,'ST004','Daniel','Reed','Nurse','Acute Care',1),(5,'ST005','Priya','Shah','Pharmacist','Clinical Pharmacy',1),(6,'ST006','Michael','Brown','Doctor','Endocrinology',1),(7,'ST007','Grace','Mensah','Physiotherapist','Rehabilitation',1),(8,'ST008','Oliver','Jones','Consultant','Neurology',1),(9,'ST009','Fatima','Ali','Nurse','Ward Nursing',1),(10,'ST010','Ethan','Campbell','Doctor','Orthopaedics',1);
/*!40000 ALTER TABLE `staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `treatments`
--

DROP TABLE IF EXISTS `treatments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `treatments` (
  `treatment_id` int unsigned NOT NULL AUTO_INCREMENT,
  `treatment_code` varchar(20) NOT NULL,
  `treatment_name` varchar(120) NOT NULL,
  `treatment_category` varchar(80) NOT NULL,
  `standard_cost` decimal(10,2) NOT NULL,
  PRIMARY KEY (`treatment_id`),
  UNIQUE KEY `treatment_code` (`treatment_code`),
  UNIQUE KEY `treatment_name` (`treatment_name`),
  CONSTRAINT `treatments_chk_1` CHECK ((`standard_cost` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `treatments`
--

LOCK TABLES `treatments` WRITE;
/*!40000 ALTER TABLE `treatments` DISABLE KEYS */;
INSERT INTO `treatments` VALUES (1,'TR001','Medication management','Clinical management',85.00),(2,'TR002','Diagnostic blood panel','Diagnostics',120.00),(3,'TR003','Cardiac monitoring','Diagnostics',420.00),(4,'TR004','Respiratory therapy','Therapy',260.00),(5,'TR005','Physiotherapy session','Rehabilitation',95.00),(6,'TR006','Wound care','Nursing care',75.00),(7,'TR007','Diabetes education','Patient education',110.00),(8,'TR008','Neurological assessment','Assessment',180.00),(9,'TR009','Imaging investigation','Diagnostics',350.00),(10,'TR010','Intravenous treatment','Clinical management',210.00);
/*!40000 ALTER TABLE `treatments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vw_appointment_attendance`
--

DROP TABLE IF EXISTS `vw_appointment_attendance`;
/*!50001 DROP VIEW IF EXISTS `vw_appointment_attendance`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_appointment_attendance` AS SELECT 
 1 AS `appointment_type`,
 1 AS `booked`,
 1 AS `completed`,
 1 AS `did_not_attend`,
 1 AS `dna_pct`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_clinic_schedule`
--

DROP TABLE IF EXISTS `vw_clinic_schedule`;
/*!50001 DROP VIEW IF EXISTS `vw_clinic_schedule`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_clinic_schedule` AS SELECT 
 1 AS `appointment_id`,
 1 AS `scheduled_start`,
 1 AS `scheduled_end`,
 1 AS `patient_name`,
 1 AS `hospital_number`,
 1 AS `clinician`,
 1 AS `appointment_type`,
 1 AS `status`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_cost_by_diagnosis`
--

DROP TABLE IF EXISTS `vw_cost_by_diagnosis`;
/*!50001 DROP VIEW IF EXISTS `vw_cost_by_diagnosis`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_cost_by_diagnosis` AS SELECT 
 1 AS `group_name`,
 1 AS `admission_count`,
 1 AS `total_cost`,
 1 AS `mean_cost`,
 1 AS `median_cost`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_frequent_admissions`
--

DROP TABLE IF EXISTS `vw_frequent_admissions`;
/*!50001 DROP VIEW IF EXISTS `vw_frequent_admissions`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_frequent_admissions` AS SELECT 
 1 AS `hospital_number`,
 1 AS `given_name`,
 1 AS `family_name`,
 1 AS `admissions`,
 1 AS `first_admission`,
 1 AS `latest_admission`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_medication_utilisation`
--

DROP TABLE IF EXISTS `vw_medication_utilisation`;
/*!50001 DROP VIEW IF EXISTS `vw_medication_utilisation`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_medication_utilisation` AS SELECT 
 1 AS `medication_name`,
 1 AS `strength`,
 1 AS `status`,
 1 AS `prescription_count`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_treatment_outcomes`
--

DROP TABLE IF EXISTS `vw_treatment_outcomes`;
/*!50001 DROP VIEW IF EXISTS `vw_treatment_outcomes`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_treatment_outcomes` AS SELECT 
 1 AS `treatment_name`,
 1 AS `treatments_recorded`,
 1 AS `improved_count`,
 1 AS `improved_pct`,
 1 AS `deteriorated_count`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'hospital_final'
--

--
-- Dumping routines for database 'hospital_final'
--

--
-- Final view structure for view `vw_appointment_attendance`
--

/*!50001 DROP VIEW IF EXISTS `vw_appointment_attendance`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb3 */;
/*!50001 SET character_set_results     = utf8mb3 */;
/*!50001 SET collation_connection      = utf8mb3_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_appointment_attendance` AS select `appointments`.`appointment_type` AS `appointment_type`,count(0) AS `booked`,sum((`appointments`.`status` = 'Completed')) AS `completed`,sum((`appointments`.`status` = 'Did not attend')) AS `did_not_attend`,round(((100.0 * sum((`appointments`.`status` = 'Did not attend'))) / count(0)),2) AS `dna_pct` from `appointments` group by `appointments`.`appointment_type` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_clinic_schedule`
--

/*!50001 DROP VIEW IF EXISTS `vw_clinic_schedule`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb3 */;
/*!50001 SET character_set_results     = utf8mb3 */;
/*!50001 SET collation_connection      = utf8mb3_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_clinic_schedule` AS select `ap`.`appointment_id` AS `appointment_id`,`ap`.`scheduled_start` AS `scheduled_start`,`ap`.`scheduled_end` AS `scheduled_end`,concat(`pp`.`given_name`,' ',`pp`.`family_name`) AS `patient_name`,`pi`.`hospital_number` AS `hospital_number`,concat(`s`.`given_name`,' ',`s`.`family_name`) AS `clinician`,`ap`.`appointment_type` AS `appointment_type`,`ap`.`status` AS `status` from (((`appointments` `ap` join `patient_identities` `pi` on((`ap`.`patient_id` = `pi`.`patient_id`))) join `patient_profiles` `pp` on((`pi`.`patient_id` = `pp`.`patient_id`))) join `staff` `s` on((`ap`.`staff_id` = `s`.`staff_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_cost_by_diagnosis`
--

/*!50001 DROP VIEW IF EXISTS `vw_cost_by_diagnosis`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb3 */;
/*!50001 SET character_set_results     = utf8mb3 */;
/*!50001 SET collation_connection      = utf8mb3_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_cost_by_diagnosis` AS with `ranked` as (select `dg`.`group_name` AS `group_name`,`a`.`total_cost` AS `total_cost`,row_number() OVER (PARTITION BY `dg`.`diagnosis_group_id` ORDER BY `a`.`total_cost` )  AS `rn`,count(0) OVER (PARTITION BY `dg`.`diagnosis_group_id` )  AS `n` from (`admissions` `a` join `diagnosis_groups` `dg` on((`a`.`diagnosis_group_id` = `dg`.`diagnosis_group_id`)))) select `ranked`.`group_name` AS `group_name`,count(0) AS `admission_count`,round(sum(`ranked`.`total_cost`),2) AS `total_cost`,round(avg(`ranked`.`total_cost`),2) AS `mean_cost`,round(avg((case when (`ranked`.`rn` in (floor(((`ranked`.`n` + 1) / 2)),floor(((`ranked`.`n` + 2) / 2)))) then `ranked`.`total_cost` end)),2) AS `median_cost` from `ranked` group by `ranked`.`group_name` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_frequent_admissions`
--

/*!50001 DROP VIEW IF EXISTS `vw_frequent_admissions`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb3 */;
/*!50001 SET character_set_results     = utf8mb3 */;
/*!50001 SET collation_connection      = utf8mb3_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_frequent_admissions` AS select `pi`.`hospital_number` AS `hospital_number`,`pp`.`given_name` AS `given_name`,`pp`.`family_name` AS `family_name`,count(`a`.`admission_id`) AS `admissions`,min(`a`.`admitted_at`) AS `first_admission`,max(`a`.`admitted_at`) AS `latest_admission` from ((`patient_identities` `pi` join `patient_profiles` `pp` on((`pi`.`patient_id` = `pp`.`patient_id`))) join `admissions` `a` on((`pi`.`patient_id` = `a`.`patient_id`))) group by `pi`.`patient_id`,`pi`.`hospital_number`,`pp`.`given_name`,`pp`.`family_name` having (count(`a`.`admission_id`) > 1) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_medication_utilisation`
--

/*!50001 DROP VIEW IF EXISTS `vw_medication_utilisation`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb3 */;
/*!50001 SET character_set_results     = utf8mb3 */;
/*!50001 SET collation_connection      = utf8mb3_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_medication_utilisation` AS select `m`.`medication_name` AS `medication_name`,`m`.`strength` AS `strength`,`rx`.`status` AS `status`,count(0) AS `prescription_count` from (`prescriptions` `rx` join `medications` `m` on((`rx`.`medication_id` = `m`.`medication_id`))) group by `m`.`medication_id`,`m`.`medication_name`,`m`.`strength`,`rx`.`status` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_treatment_outcomes`
--

/*!50001 DROP VIEW IF EXISTS `vw_treatment_outcomes`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb3 */;
/*!50001 SET character_set_results     = utf8mb3 */;
/*!50001 SET collation_connection      = utf8mb3_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_treatment_outcomes` AS select `t`.`treatment_name` AS `treatment_name`,count(0) AS `treatments_recorded`,sum((`at`.`outcome` = 'Improved')) AS `improved_count`,round(((100.0 * sum((`at`.`outcome` = 'Improved'))) / count(0)),2) AS `improved_pct`,sum((`at`.`outcome` = 'Deteriorated')) AS `deteriorated_count` from (`admission_treatments` `at` join `treatments` `t` on((`at`.`treatment_id` = `t`.`treatment_id`))) group by `t`.`treatment_id`,`t`.`treatment_name` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-11-13 16:27:35
