-- MySQL dump 10.13  Distrib 8.0.28, for macos10.15 (x86_64)
--
-- Host: localhost    Database: school_development
-- ------------------------------------------------------
-- Server version	8.0.28

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `active_storage_attachments`
--

DROP TABLE IF EXISTS `active_storage_attachments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `active_storage_attachments` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `record_type` varchar(255) NOT NULL,
  `record_id` bigint NOT NULL,
  `blob_id` bigint NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_active_storage_attachments_uniqueness` (`record_type`,`record_id`,`name`,`blob_id`),
  KEY `index_active_storage_attachments_on_blob_id` (`blob_id`),
  CONSTRAINT `fk_rails_c3b3935057` FOREIGN KEY (`blob_id`) REFERENCES `active_storage_blobs` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `active_storage_attachments`
--

LOCK TABLES `active_storage_attachments` WRITE;
/*!40000 ALTER TABLE `active_storage_attachments` DISABLE KEYS */;
INSERT INTO `active_storage_attachments` VALUES (1,'avafile','MiscUpload',2,1,'2022-09-09 22:22:22');
/*!40000 ALTER TABLE `active_storage_attachments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `active_storage_blobs`
--

DROP TABLE IF EXISTS `active_storage_blobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `active_storage_blobs` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `key` varchar(255) NOT NULL,
  `filename` varchar(255) NOT NULL,
  `content_type` varchar(255) DEFAULT NULL,
  `metadata` text,
  `byte_size` bigint NOT NULL,
  `checksum` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_active_storage_blobs_on_key` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `active_storage_blobs`
--

LOCK TABLES `active_storage_blobs` WRITE;
/*!40000 ALTER TABLE `active_storage_blobs` DISABLE KEYS */;
INSERT INTO `active_storage_blobs` VALUES (1,'gWsDhaaBzQXqWjRHfoUt5nNt','index.php','text/x-php','{\"identified\":true,\"analyzed\":true}',405,'km3Q+V33I/ntk06wWIgsyA==','2022-09-09 22:22:22');
/*!40000 ALTER TABLE `active_storage_blobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ar_internal_metadata`
--

DROP TABLE IF EXISTS `ar_internal_metadata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ar_internal_metadata` (
  `key` varchar(255) NOT NULL,
  `value` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ar_internal_metadata`
--

LOCK TABLES `ar_internal_metadata` WRITE;
/*!40000 ALTER TABLE `ar_internal_metadata` DISABLE KEYS */;
INSERT INTO `ar_internal_metadata` VALUES ('environment','development','2022-06-28 19:08:11','2022-06-28 19:08:11');
/*!40000 ALTER TABLE `ar_internal_metadata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assessment_masters`
--

DROP TABLE IF EXISTS `assessment_masters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assessment_masters` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assessment_masters`
--

LOCK TABLES `assessment_masters` WRITE;
/*!40000 ALTER TABLE `assessment_masters` DISABLE KEYS */;
/*!40000 ALTER TABLE `assessment_masters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assessments`
--

DROP TABLE IF EXISTS `assessments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assessments` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `assessment_master_id` int DEFAULT NULL,
  `marks` int DEFAULT NULL,
  `student_id` int DEFAULT NULL,
  `teacher_id` int DEFAULT NULL,
  `subject_id` int DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `subject_master_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `conduct` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assessments`
--

LOCK TABLES `assessments` WRITE;
/*!40000 ALTER TABLE `assessments` DISABLE KEYS */;
/*!40000 ALTER TABLE `assessments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `class_fields`
--

DROP TABLE IF EXISTS `class_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `class_fields` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `class_fields`
--

LOCK TABLES `class_fields` WRITE;
/*!40000 ALTER TABLE `class_fields` DISABLE KEYS */;
INSERT INTO `class_fields` VALUES (1,'Grade 1','2022-09-18 18:01:54','2022-09-18 18:01:54'),(2,'Grade 2','2022-09-18 18:03:40','2022-09-18 18:03:40'),(3,'Grade 3','2022-09-18 18:04:03','2022-09-18 18:04:03'),(4,'Grade 4','2022-09-18 18:04:20','2022-09-18 18:04:20');
/*!40000 ALTER TABLE `class_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `classes_subjects`
--

DROP TABLE IF EXISTS `classes_subjects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `classes_subjects` (
  `class_id` bigint NOT NULL,
  `subject_id` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classes_subjects`
--

LOCK TABLES `classes_subjects` WRITE;
/*!40000 ALTER TABLE `classes_subjects` DISABLE KEYS */;
/*!40000 ALTER TABLE `classes_subjects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `collect_fees`
--

DROP TABLE IF EXISTS `collect_fees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `collect_fees` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `amount_received` int DEFAULT NULL,
  `student_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `fees_type` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `collect_fees`
--

LOCK TABLES `collect_fees` WRITE;
/*!40000 ALTER TABLE `collect_fees` DISABLE KEYS */;
/*!40000 ALTER TABLE `collect_fees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grades`
--

DROP TABLE IF EXISTS `grades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `grades` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `class_results` int DEFAULT NULL,
  `exam_results` int DEFAULT NULL,
  `student_id` int DEFAULT NULL,
  `total_resullts` int DEFAULT NULL,
  `subject_id` int DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `subject_master_id` int DEFAULT NULL,
  `grading` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grades`
--

LOCK TABLES `grades` WRITE;
/*!40000 ALTER TABLE `grades` DISABLE KEYS */;
INSERT INTO `grades` VALUES (1,44,80,1,84,NULL,'2022-07-19 21:32:51','2022-07-19 21:32:51',1,NULL,NULL),(4,51,80,1,91,NULL,'2022-07-20 11:32:58','2022-07-20 11:32:58',2,NULL,NULL),(8,46,50,1,96,NULL,'2022-07-20 12:02:05','2022-07-20 12:02:05',3,NULL,NULL),(9,27,40,1,67,NULL,'2022-07-21 14:45:52','2022-07-21 14:45:52',1,NULL,NULL),(10,60,50,3,110,NULL,'2022-07-21 14:47:37','2022-07-21 14:47:37',1,NULL,NULL),(11,0,0,4,0,NULL,'2022-07-22 11:33:01','2022-07-22 11:33:01',1,NULL,NULL),(13,20,0,2,20,NULL,'2022-07-22 11:34:53','2022-07-22 11:34:53',1,NULL,NULL),(14,27,40,1,67,NULL,'2022-07-22 11:41:11','2022-07-22 11:41:11',1,NULL,NULL),(15,50,50,12,100,NULL,'2022-07-22 11:53:54','2022-07-22 11:53:54',2,NULL,NULL),(16,50,50,12,100,NULL,'2022-07-22 11:55:13','2022-07-22 11:55:13',2,NULL,NULL),(17,45,42,3,87,NULL,'2022-07-23 17:57:20','2022-07-23 17:57:20',2,NULL,NULL),(18,20,0,2,20,NULL,'2022-07-26 22:06:56','2022-07-26 22:06:56',1,NULL,NULL),(19,10,0,2,10,NULL,'2022-07-27 01:28:52','2022-07-27 01:28:52',2,'9','Fail'),(20,20,0,2,20,NULL,'2022-07-27 01:31:59','2022-07-27 01:31:59',2,'9','Fail'),(21,40,50,2,90,NULL,'2022-07-27 01:33:06','2022-07-27 01:33:06',2,'1','Excellent'),(22,40,50,2,90,NULL,'2022-07-27 03:13:32','2022-07-27 03:13:32',2,'1','Excellent'),(23,27,40,1,67,NULL,'2022-07-27 03:54:36','2022-07-27 03:54:36',1,'50','Above Average'),(24,50,50,114,100,NULL,'2022-08-14 13:35:21','2022-08-14 13:35:21',1,'1','Excellent'),(25,40,45,120,85,NULL,'2022-08-18 13:26:56','2022-08-18 13:26:56',1,'2','Very Good'),(26,40,45,120,85,NULL,'2022-08-18 13:27:05','2022-08-18 13:27:05',1,'2','Very Good'),(27,20,0,2,20,NULL,'2022-09-06 15:30:44','2022-09-06 15:30:44',1,'9','Fail'),(28,20,0,2,20,NULL,'2022-09-08 18:05:31','2022-09-08 18:05:31',1,'9','Fail');
/*!40000 ALTER TABLE `grades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lessons`
--

DROP TABLE IF EXISTS `lessons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lessons` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `objectives` text,
  `class_id` int DEFAULT NULL,
  `duration` varchar(255) DEFAULT NULL,
  `procedures` text,
  `user_id` int DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `duration_after_teaching` varchar(255) DEFAULT NULL,
  `time_lesson_ended` datetime DEFAULT NULL,
  `activities` text,
  `review` text,
  `skills` text,
  `assesments` text,
  `remarks` text,
  `weekday` text,
  `lesson_date` datetime DEFAULT NULL,
  `attendance_status` tinyint(1) DEFAULT NULL,
  `subject_id` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lessons`
--

LOCK TABLES `lessons` WRITE;
/*!40000 ALTER TABLE `lessons` DISABLE KEYS */;
INSERT INTO `lessons` VALUES (1,'Forces','Objectibe',NULL,'20 mins','Content',19,NULL,'2022-09-18 18:29:02','2022-09-18 18:29:02',NULL,NULL,'none','None','noen','none','none','Week 1',NULL,NULL,1),(2,'Soil','Noen',2,'none','nonen',11,NULL,'2022-09-18 18:30:15','2022-09-18 18:30:15',NULL,NULL,'none','nnone','none','none','noen','Week 1',NULL,NULL,1),(3,'Microorganism','none',NULL,'40 mins','none',20,NULL,'2022-09-18 18:52:05','2022-09-18 18:52:05',NULL,NULL,'none','none','none','none','none','1 week',NULL,NULL,1);
/*!40000 ALTER TABLE `lessons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `misc_uploads`
--

DROP TABLE IF EXISTS `misc_uploads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `misc_uploads` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `file` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `misc_uploads`
--

LOCK TABLES `misc_uploads` WRITE;
/*!40000 ALTER TABLE `misc_uploads` DISABLE KEYS */;
INSERT INTO `misc_uploads` VALUES (1,11,NULL,'2022-09-08 17:24:09','2022-09-08 17:24:09'),(2,11,NULL,'2022-09-09 22:22:22','2022-09-09 22:22:22');
/*!40000 ALTER TABLE `misc_uploads` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `remarks`
--

DROP TABLE IF EXISTS `remarks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `remarks` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `teacher_remark` varchar(255) DEFAULT NULL,
  `student_id` int DEFAULT NULL,
  `teacher_id` int DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `teacher_conduct` varchar(255) DEFAULT NULL,
  `stud_id` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `remarks`
--

LOCK TABLES `remarks` WRITE;
/*!40000 ALTER TABLE `remarks` DISABLE KEYS */;
INSERT INTO `remarks` VALUES (1,'dd',NULL,11,'2022-07-26 23:35:58','2022-07-26 23:35:58','ewwe',2);
/*!40000 ALTER TABLE `remarks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `report_forms`
--

DROP TABLE IF EXISTS `report_forms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `report_forms` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `resident_cost_per_day` int DEFAULT NULL,
  `resident_no_of_days` int DEFAULT NULL,
  `resident_books` int DEFAULT NULL,
  `nr_cost_per_day` int DEFAULT NULL,
  `nr_no_of_day` int DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `reopening` datetime DEFAULT NULL,
  `fist_visit` datetime DEFAULT NULL,
  `mid_exams` datetime DEFAULT NULL,
  `mid_break` datetime DEFAULT NULL,
  `second_visit` datetime DEFAULT NULL,
  `end_exams` datetime DEFAULT NULL,
  `vacation` datetime DEFAULT NULL,
  `food_water` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `report_forms`
--

LOCK TABLES `report_forms` WRITE;
/*!40000 ALTER TABLE `report_forms` DISABLE KEYS */;
/*!40000 ALTER TABLE `report_forms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'Admin','2022-07-13 09:46:56','2022-07-13 09:46:56'),(2,'Teacher','2022-07-13 09:47:09','2022-07-13 09:47:09');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) NOT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schema_migrations`
--

LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;
INSERT INTO `schema_migrations` VALUES ('20220628185445'),('20220628185654'),('20220628185756'),('20220628185837'),('20220628190105'),('20220628190214'),('20220628190446'),('20220628190629'),('20220629121840'),('20220710073038'),('20220713084559'),('20220713094908'),('20220713095918'),('20220713105025'),('20220713111411'),('20220713112437'),('20220713151451'),('20220713151524'),('20220713163021'),('20220717025421'),('20220717031004'),('20220717031048'),('20220717031129'),('20220719093156'),('20220719093241'),('20220719131826'),('20220725135237'),('20220725161239'),('20220725180814'),('20220726090717'),('20220726090749'),('20220726090817'),('20220726090835'),('20220726090909'),('20220726090929'),('20220726090951'),('20220726102531'),('20220726104909'),('20220726104939'),('20220726132853'),('20220726141531'),('20220726141746'),('20220727012109'),('20220727012130'),('20220729151315'),('20220729151356'),('20220810144449'),('20220810150707'),('20220810171023'),('20220810171135'),('20220905103839'),('20220905104049'),('20220905105120'),('20220907030458'),('20220908170414'),('20220908171223'),('20220917233339');
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `setup_fees`
--

DROP TABLE IF EXISTS `setup_fees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `setup_fees` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `class_id` int DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `amount` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `setup_fees`
--

LOCK TABLES `setup_fees` WRITE;
/*!40000 ALTER TABLE `setup_fees` DISABLE KEYS */;
/*!40000 ALTER TABLE `setup_fees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_attendances`
--

DROP TABLE IF EXISTS `student_attendances`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student_attendances` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `student_id` int DEFAULT NULL,
  `class_id` int DEFAULT NULL,
  `present_status` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_attendances`
--

LOCK TABLES `student_attendances` WRITE;
/*!40000 ALTER TABLE `student_attendances` DISABLE KEYS */;
/*!40000 ALTER TABLE `student_attendances` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `students` (
  `id` int NOT NULL AUTO_INCREMENT,
  `admission_no` varchar(255) DEFAULT NULL,
  `admission_date` date DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `middle_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `class_id` int DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `blood_group` varchar(255) DEFAULT NULL,
  `birth_place` varchar(255) DEFAULT NULL,
  `nationality_id` int DEFAULT NULL,
  `language` varchar(255) DEFAULT NULL,
  `religion` varchar(255) DEFAULT NULL,
  `student_category_id` int DEFAULT NULL,
  `address_line1` varchar(255) DEFAULT NULL,
  `address_line2` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `country_id` int DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `remark_id` int DEFAULT NULL,
  `parent_name` varchar(255) DEFAULT NULL,
  `phone_number` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_students_on_admission_no` (`admission_no`(10)),
  KEY `index_students_on_first_name_and_middle_name_and_last_name` (`first_name`(10),`middle_name`(10),`last_name`(10)),
  KEY `index_students_on_batch_id` (`class_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `students`
--

LOCK TABLES `students` WRITE;
/*!40000 ALTER TABLE `students` DISABLE KEYS */;
/*!40000 ALTER TABLE `students` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subject_masters`
--

DROP TABLE IF EXISTS `subject_masters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subject_masters` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subject_masters`
--

LOCK TABLES `subject_masters` WRITE;
/*!40000 ALTER TABLE `subject_masters` DISABLE KEYS */;
INSERT INTO `subject_masters` VALUES (1,'Science','2022-09-18 17:45:31','2022-09-18 17:45:31'),(2,'Religious & Moral Education','2022-09-18 17:46:28','2022-09-18 17:46:28'),(3,'English Language','2022-09-18 17:54:49','2022-09-18 17:54:49');
/*!40000 ALTER TABLE `subject_masters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subjects`
--

DROP TABLE IF EXISTS `subjects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subjects` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `class_id` int DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `subject_master_id` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subjects`
--

LOCK TABLES `subjects` WRITE;
/*!40000 ALTER TABLE `subjects` DISABLE KEYS */;
/*!40000 ALTER TABLE `subjects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teachers`
--

DROP TABLE IF EXISTS `teachers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teachers` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `class_id` int DEFAULT NULL,
  `subject_id` int DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `subject_master_id` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teachers`
--

LOCK TABLES `teachers` WRITE;
/*!40000 ALTER TABLE `teachers` DISABLE KEYS */;
/*!40000 ALTER TABLE `teachers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_classes`
--

DROP TABLE IF EXISTS `user_classes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_classes` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `class_id` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_classes`
--

LOCK TABLES `user_classes` WRITE;
/*!40000 ALTER TABLE `user_classes` DISABLE KEYS */;
INSERT INTO `user_classes` VALUES (1,11,1),(2,11,2),(3,11,3),(4,11,4),(5,19,1),(6,19,2),(7,19,3),(8,19,1),(9,20,1),(10,11,2),(11,21,1),(12,22,2),(13,23,3),(14,24,4);
/*!40000 ALTER TABLE `user_classes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL DEFAULT '',
  `encrypted_password` varchar(255) NOT NULL DEFAULT '',
  `reset_password_token` varchar(255) DEFAULT NULL,
  `reset_password_sent_at` datetime DEFAULT NULL,
  `remember_created_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  `full_name` varchar(255) DEFAULT NULL,
  `role_id` int DEFAULT NULL,
  `class_id` int DEFAULT NULL,
  `subject_master_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_users_on_email` (`email`),
  UNIQUE KEY `index_users_on_reset_password_token` (`reset_password_token`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (11,'saha1@gmail.com','$2a$12$ZLX9j0eFM3atx89YFaAsjelmgndEoxzmBZgWsJuTmlHeskl5ZFGka',NULL,NULL,NULL,'2022-07-22 11:47:16','2022-09-18 18:50:10','teacher2','saha',2,2,2),(14,'admin@gmail.com','$2a$12$VogqBrt0XDBRx6NBSGKh/OUgjx6Fuk4nUZqcxCh7hXyC2tKA0RPji',NULL,NULL,NULL,'2022-07-26 23:38:07','2022-07-26 23:38:07','admin','admin',1,NULL,1),(20,'an@email.com','$2a$12$QAJ7usTFVx3dI4qF2va/0eRavlp66ChoKNpgOS4UVNFRghgnkjlOS',NULL,NULL,NULL,'2022-09-18 18:36:53','2022-09-18 18:36:53','teacher1','Albert',2,NULL,1),(21,'wendy@wendy.com','$2a$12$KMfqR9mn7Bol96ykvCmTH.5x/ayGpDkqmIxcWdzfDTy4VKOnskgF6',NULL,NULL,NULL,'2022-09-18 19:18:49','2022-09-18 19:18:49','wendy','Wendy Boateng',2,NULL,1),(22,'oph@oph.com','$2a$12$hCmGsAqC0cdPsjoZX2Tt8OW2Iimpt9P4jDAANDpEf7xwmKiZAqWxC',NULL,NULL,NULL,'2022-09-18 19:19:29','2022-09-18 19:19:29','ophelia','Ophelia Adjei',2,NULL,1),(23,'bea@ea.com','$2a$12$TZf947lARfDp1x2ENIz7J.8ZYjBPTNX/Ib.UBLn61BnIdGPkhQM3a',NULL,NULL,NULL,'2022-09-18 19:20:08','2022-09-18 19:20:08','beatrice','Beatrice Akosua Ludu',2,NULL,1),(24,'Jacqueline@Jacqueline','$2a$12$iiHqcK2Eqh5o0dwgXWaXb.qeFkgCqv88b3wAkuV/LXK2cON8j3iem',NULL,NULL,NULL,'2022-09-18 19:20:59','2022-09-18 19:20:59','jacqueline','Jacqueline Lemmdi-Prekutse',2,NULL,1);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-09-18 19:22:46
