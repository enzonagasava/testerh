-- MySQL dump 10.13  Distrib 8.0.43, for Linux (x86_64)
--
-- Host: localhost    Database: testerh
-- ------------------------------------------------------
-- Server version	8.0.43

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
-- Table structure for table `announcements`
--

DROP TABLE IF EXISTS `announcements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `announcements` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `summary` text COLLATE utf8mb4_unicode_ci,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `company_id` bigint unsigned DEFAULT NULL,
  `department_id` bigint unsigned DEFAULT NULL,
  `added_by` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_notify` tinyint DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `announcements_company_id_foreign` (`company_id`),
  KEY `announcements_department_id_foreign` (`department_id`),
  CONSTRAINT `announcements_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `announcements_department_id_foreign` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `announcements`
--

LOCK TABLES `announcements` WRITE;
/*!40000 ALTER TABLE `announcements` DISABLE KEYS */;
/*!40000 ALTER TABLE `announcements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `appraisals`
--

DROP TABLE IF EXISTS `appraisals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `appraisals` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `company_id` bigint unsigned NOT NULL,
  `employee_id` bigint unsigned NOT NULL,
  `department_id` bigint unsigned NOT NULL,
  `designation_id` bigint unsigned NOT NULL,
  `customer_experience` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `marketing` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `administration` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `professionalism` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `integrity` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attendance` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remarks` text COLLATE utf8mb4_unicode_ci,
  `date` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `appraisals_company_id_foreign` (`company_id`),
  KEY `appraisals_employee_id_foreign` (`employee_id`),
  KEY `appraisals_department_id_foreign` (`department_id`),
  KEY `appraisals_designation_id_foreign` (`designation_id`),
  CONSTRAINT `appraisals_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `appraisals_department_id_foreign` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`) ON DELETE CASCADE,
  CONSTRAINT `appraisals_designation_id_foreign` FOREIGN KEY (`designation_id`) REFERENCES `designations` (`id`) ON DELETE CASCADE,
  CONSTRAINT `appraisals_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appraisals`
--

LOCK TABLES `appraisals` WRITE;
/*!40000 ALTER TABLE `appraisals` DISABLE KEYS */;
/*!40000 ALTER TABLE `appraisals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `asset_categories`
--

DROP TABLE IF EXISTS `asset_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `asset_categories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `company_id` bigint unsigned DEFAULT NULL,
  `category_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `asset_categories_company_id_foreign` (`company_id`),
  CONSTRAINT `asset_categories_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asset_categories`
--

LOCK TABLES `asset_categories` WRITE;
/*!40000 ALTER TABLE `asset_categories` DISABLE KEYS */;
INSERT INTO `asset_categories` VALUES (1,NULL,'laptop','2020-07-29 06:15:07','2020-07-29 06:15:07');
/*!40000 ALTER TABLE `asset_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assets`
--

DROP TABLE IF EXISTS `assets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assets` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `asset_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_id` bigint unsigned NOT NULL,
  `employee_id` bigint unsigned DEFAULT NULL,
  `asset_code` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `assets_category_id` bigint unsigned NOT NULL,
  `Asset_note` mediumtext COLLATE utf8mb4_unicode_ci,
  `manufacturer` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `serial_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `invoice_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `asset_image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `purchase_date` date NOT NULL,
  `warranty_date` date NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `assets_company_id_foreign` (`company_id`),
  KEY `assets_employee_id_foreign` (`employee_id`),
  KEY `assets_assets_category_id_foreign` (`assets_category_id`),
  CONSTRAINT `assets_assets_category_id_foreign` FOREIGN KEY (`assets_category_id`) REFERENCES `asset_categories` (`id`) ON DELETE CASCADE,
  CONSTRAINT `assets_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `assets_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assets`
--

LOCK TABLES `assets` WRITE;
/*!40000 ALTER TABLE `assets` DISABLE KEYS */;
INSERT INTO `assets` VALUES (1,'Laptop',1,NULL,'lap-01',1,NULL,'Asus','637256','Inv-090',NULL,'2020-10-25','2021-05-30','yes','2020-07-29 06:16:05','2020-07-29 06:16:05');
/*!40000 ALTER TABLE `assets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attendances`
--

DROP TABLE IF EXISTS `attendances`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attendances` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `employee_id` bigint unsigned NOT NULL,
  `attendance_date` date NOT NULL,
  `clock_in` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `clock_in_ip` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `clock_out` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `clock_out_ip` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `clock_in_out` tinyint NOT NULL,
  `time_late` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '00:00',
  `early_leaving` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '00:00',
  `overtime` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '00:00',
  `total_work` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '00:00',
  `total_rest` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '00:00',
  `attendance_status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'present',
  PRIMARY KEY (`id`),
  KEY `attendances_employee_id_foreign` (`employee_id`),
  CONSTRAINT `attendances_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attendances`
--

LOCK TABLES `attendances` WRITE;
/*!40000 ALTER TABLE `attendances` DISABLE KEYS */;
/*!40000 ALTER TABLE `attendances` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `award_types`
--

DROP TABLE IF EXISTS `award_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `award_types` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `award_name` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `award_types`
--

LOCK TABLES `award_types` WRITE;
/*!40000 ALTER TABLE `award_types` DISABLE KEYS */;
INSERT INTO `award_types` VALUES (1,'Destaque do MÊS','2020-07-26 20:19:34','2024-12-30 09:45:39'),(6,'Prêmio Inovador do Ano','2024-12-31 09:54:16','2024-12-31 09:54:16'),(7,'Líder do Ano','2024-12-31 09:54:27','2024-12-31 09:54:27'),(8,'Prêmio de Produtividade','2024-12-31 09:54:39','2024-12-31 09:54:39'),(9,'Prêmio de Atendimento Excepcional','2024-12-31 09:54:46','2024-12-31 09:54:46');
/*!40000 ALTER TABLE `award_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `awards`
--

DROP TABLE IF EXISTS `awards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `awards` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `award_information` mediumtext COLLATE utf8mb4_unicode_ci,
  `award_date` date NOT NULL,
  `gift` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cash` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_id` bigint unsigned DEFAULT NULL,
  `department_id` bigint unsigned DEFAULT NULL,
  `employee_id` bigint unsigned NOT NULL,
  `award_type_id` bigint unsigned DEFAULT NULL,
  `award_photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `awards_company_id_foreign` (`company_id`),
  KEY `awards_department_id_foreign` (`department_id`),
  KEY `awards_employee_id_foreign` (`employee_id`),
  KEY `awards_award_type_id_foreign` (`award_type_id`),
  CONSTRAINT `awards_award_type_id_foreign` FOREIGN KEY (`award_type_id`) REFERENCES `award_types` (`id`) ON DELETE SET NULL,
  CONSTRAINT `awards_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE SET NULL,
  CONSTRAINT `awards_department_id_foreign` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`) ON DELETE SET NULL,
  CONSTRAINT `awards_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `awards`
--

LOCK TABLES `awards` WRITE;
/*!40000 ALTER TABLE `awards` DISABLE KEYS */;
/*!40000 ALTER TABLE `awards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_m_s`
--

DROP TABLE IF EXISTS `c_m_s`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `c_m_s` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `home` longtext COLLATE utf8mb4_unicode_ci,
  `about` longtext COLLATE utf8mb4_unicode_ci,
  `contact` longtext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_m_s`
--

LOCK TABLES `c_m_s` WRITE;
/*!40000 ALTER TABLE `c_m_s` DISABLE KEYS */;
INSERT INTO `c_m_s` VALUES (1,'&lt;div class=&quot;container&quot;&gt;\r\n&lt;p&gt;Home Page, You can add your page design here&lt;/p&gt;\r\n&lt;/div&gt;','&lt;p&gt;About Page, You can add your page design here&lt;/p&gt;','&lt;div class=&quot;details&quot;&gt;\r\n&lt;h3&gt;Address&lt;/h3&gt;\r\nBhandar Market (7th Floor), &lt;br /&gt;309, Sheikh Mujib Road &lt;br /&gt;(Opposite Chowmohoni Fire Service) &lt;br /&gt;Chittagong&lt;/div&gt;\r\n&lt;div class=&quot;details mar-top-30&quot;&gt;\r\n&lt;h3&gt;&amp;nbsp;&lt;/h3&gt;\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n&lt;h3&gt;Email&lt;/h3&gt;\r\nsupport@lion-coders.com&lt;/div&gt;','2020-07-27 09:19:39','2024-07-28 03:26:19');
/*!40000 ALTER TABLE `c_m_s` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `calendarables`
--

DROP TABLE IF EXISTS `calendarables`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `calendarables` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calendarables`
--

LOCK TABLES `calendarables` WRITE;
/*!40000 ALTER TABLE `calendarables` DISABLE KEYS */;
/*!40000 ALTER TABLE `calendarables` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `candidate_interview`
--

DROP TABLE IF EXISTS `candidate_interview`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `candidate_interview` (
  `interview_id` bigint unsigned NOT NULL,
  `candidate_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`interview_id`,`candidate_id`),
  KEY `candidate_interview_candidate_id_foreign` (`candidate_id`),
  CONSTRAINT `candidate_interview_candidate_id_foreign` FOREIGN KEY (`candidate_id`) REFERENCES `job_candidates` (`id`),
  CONSTRAINT `candidate_interview_interview_id_foreign` FOREIGN KEY (`interview_id`) REFERENCES `job_interviews` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `candidate_interview`
--

LOCK TABLES `candidate_interview` WRITE;
/*!40000 ALTER TABLE `candidate_interview` DISABLE KEYS */;
INSERT INTO `candidate_interview` VALUES (2,3),(3,3),(14,3),(15,3),(16,3),(17,3),(13,6);
/*!40000 ALTER TABLE `candidate_interview` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clients`
--

DROP TABLE IF EXISTS `clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clients` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_no` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `profile` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `website` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address1` mediumtext COLLATE utf8mb4_unicode_ci,
  `address2` mediumtext COLLATE utf8mb4_unicode_ci,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` tinyint DEFAULT NULL,
  `is_active` tinyint DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `clients_id_foreign` FOREIGN KEY (`id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=117 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clients`
--

LOCK TABLES `clients` WRITE;
/*!40000 ALTER TABLE `clients` DISABLE KEYS */;
/*!40000 ALTER TABLE `clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `companies`
--

DROP TABLE IF EXISTS `companies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `companies` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `company_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_type_id` bigint unsigned NOT NULL DEFAULT '1',
  `trading_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `registration_no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `website` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax_no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location_id` bigint unsigned DEFAULT NULL,
  `company_logo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `companies_location_id_foreign` (`location_id`),
  KEY `companies_company_type_id_foreign` (`company_type_id`),
  CONSTRAINT `companies_company_type_id_foreign` FOREIGN KEY (`company_type_id`) REFERENCES `company_types` (`id`),
  CONSTRAINT `companies_location_id_foreign` FOREIGN KEY (`location_id`) REFERENCES `locations` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `companies`
--

LOCK TABLES `companies` WRITE;
/*!40000 ALTER TABLE `companies` DISABLE KEYS */;
INSERT INTO `companies` VALUES (1,'Suats Servicos Especializados LTDA',1,'Suats Servicos Especializados','02.197.190/0001-04','+556832220915','suatservicosac@gmail.com','https://suats.com.br/','02197190000104',1,'2019008832_1595789616.png',NULL,'2020-07-26 18:53:37','2024-12-30 10:12:46'),(10,'Jwc Multiservicos Ltda',1,'Jwc Multiservicos','04.090.759/0001-63','+556899878907','jwcmultiservicosrh@gmail.com','https://jwcmult.com.br/','04090759000163',2,NULL,NULL,'2024-12-30 10:07:50','2024-12-30 10:07:50'),(11,'Isao Solucoes Em Rh Ltda',1,'ISAO GESTAO DE PESSOAS','50.977.405/0001-52','+5568992267607','rhisaogp@gmail.com','https://isaogp.com.br/','50.977.405/0001-52',4,NULL,NULL,'2024-12-30 10:19:23','2024-12-30 10:19:23'),(12,'Isao Contabilidade Ltda',1,'ISAO CONTABILIDADE','','68999229298','isaocontabilidade@gmail.com','','34.332.534/0001-37',2,NULL,NULL,'2025-04-21 18:05:56','2025-04-21 18:31:41');
/*!40000 ALTER TABLE `companies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `company_types`
--

DROP TABLE IF EXISTS `company_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `company_types` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `type_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company_types`
--

LOCK TABLES `company_types` WRITE;
/*!40000 ALTER TABLE `company_types` DISABLE KEYS */;
INSERT INTO `company_types` VALUES (1,'Sociedade Limitada (LTDA)','2024-07-22 09:55:31','2024-12-29 20:35:54',NULL),(3,'Test','2024-07-22 10:19:53','2024-07-22 10:21:29','2024-07-22 10:21:29'),(4,'Test 2','2024-07-22 10:20:15','2024-07-22 10:21:34','2024-07-22 10:21:34'),(5,'Individual de Responsabilidade Limitada (EIRELI)','2024-07-22 10:22:32','2024-12-29 20:36:22',NULL),(6,'Startups','2024-07-22 10:22:57','2024-12-29 20:36:48',NULL),(7,'Associação','2024-07-22 10:23:08','2024-12-29 20:37:06',NULL),(8,'GrupoNP+','2024-07-22 10:23:18','2024-12-29 20:37:20',NULL),(9,'Limited Liability Company','2024-07-22 10:23:31','2024-12-29 20:37:25','2024-12-29 20:37:25');
/*!40000 ALTER TABLE `company_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `company_user`
--

DROP TABLE IF EXISTS `company_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `company_user` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `company_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `company_user_user_id_foreign` (`user_id`),
  KEY `company_user_company_id_foreign` (`company_id`),
  CONSTRAINT `company_user_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `company_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6966 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company_user`
--

LOCK TABLES `company_user` WRITE;
/*!40000 ALTER TABLE `company_user` DISABLE KEYS */;
INSERT INTO `company_user` VALUES (3,1,11),(4,1,12),(5,1,1),(6,1,10);
/*!40000 ALTER TABLE `company_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `complaints`
--

DROP TABLE IF EXISTS `complaints`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `complaints` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `complaint_title` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` mediumtext COLLATE utf8mb4_unicode_ci,
  `company_id` bigint unsigned NOT NULL,
  `complaint_from` bigint unsigned NOT NULL,
  `complaint_against` bigint unsigned NOT NULL,
  `complaint_date` date NOT NULL,
  `status` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `complaints_company_id_foreign` (`company_id`),
  KEY `complaints_complaint_from_foreign` (`complaint_from`),
  KEY `complaints_complaint_against_foreign` (`complaint_against`),
  CONSTRAINT `complaints_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `complaints_complaint_against_foreign` FOREIGN KEY (`complaint_against`) REFERENCES `employees` (`id`) ON DELETE CASCADE,
  CONSTRAINT `complaints_complaint_from_foreign` FOREIGN KEY (`complaint_from`) REFERENCES `employees` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `complaints`
--

LOCK TABLES `complaints` WRITE;
/*!40000 ALTER TABLE `complaints` DISABLE KEYS */;
/*!40000 ALTER TABLE `complaints` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `countries`
--

DROP TABLE IF EXISTS `countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `countries` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=240 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `countries`
--

LOCK TABLES `countries` WRITE;
/*!40000 ALTER TABLE `countries` DISABLE KEYS */;
INSERT INTO `countries` VALUES (1,'US','United States'),(2,'CA','Canada'),(3,'AF','Afghanistan'),(4,'AL','Albania'),(5,'DZ','Algeria'),(6,'DS','American Samoa'),(7,'AD','Andorra'),(8,'AO','Angola'),(9,'AI','Anguilla'),(10,'AQ','Antarctica'),(11,'AG','Antigua and/or Barbuda'),(12,'AR','Argentina'),(13,'AM','Armenia'),(14,'AW','Aruba'),(15,'AU','Australia'),(16,'AT','Austria'),(17,'AZ','Azerbaijan'),(18,'BS','Bahamas'),(19,'BH','Bahrain'),(20,'BD','Bangladesh'),(21,'BB','Barbados'),(22,'BY','Belarus'),(23,'BE','Belgium'),(24,'BZ','Belize'),(25,'BJ','Benin'),(26,'BM','Bermuda'),(27,'BT','Bhutan'),(28,'BO','Bolivia'),(29,'BA','Bosnia and Herzegovina'),(30,'BW','Botswana'),(31,'BV','Bouvet Island'),(32,'BR','Brazil'),(33,'IO','British lndian Ocean Territory'),(34,'BN','Brunei Darussalam'),(35,'BG','Bulgaria'),(36,'BF','Burkina Faso'),(37,'BI','Burundi'),(38,'KH','Cambodia'),(39,'CM','Cameroon'),(40,'CV','Cape Verde'),(41,'KY','Cayman Islands'),(42,'CF','Central African Republic'),(43,'TD','Chad'),(44,'CL','Chile'),(45,'CN','China'),(46,'CX','Christmas Island'),(47,'CC','Cocos (Keeling) Islands'),(48,'CO','Colombia'),(49,'KM','Comoros'),(50,'CG','Congo'),(51,'CK','Cook Islands'),(52,'CR','Costa Rica'),(53,'HR','Croatia (Hrvatska)'),(54,'CU','Cuba'),(55,'CY','Cyprus'),(56,'CZ','Czech Republic'),(57,'DK','Denmark'),(58,'DJ','Djibouti'),(59,'DM','Dominica'),(60,'DO','Dominican Republic'),(61,'TP','East Timor'),(62,'EC','Ecudaor'),(63,'EG','Egypt'),(64,'SV','El Salvador'),(65,'GQ','Equatorial Guinea'),(66,'ER','Eritrea'),(67,'EE','Estonia'),(68,'ET','Ethiopia'),(69,'FK','Falkland Islands (Malvinas)'),(70,'FO','Faroe Islands'),(71,'FJ','Fiji'),(72,'FI','Finland'),(73,'FR','France'),(74,'FX','France, Metropolitan'),(75,'GF','French Guiana'),(76,'PF','French Polynesia'),(77,'TF','French Southern Territories'),(78,'GA','Gabon'),(79,'GM','Gambia'),(80,'GE','Georgia'),(81,'DE','Germany'),(82,'GH','Ghana'),(83,'GI','Gibraltar'),(84,'GR','Greece'),(85,'GL','Greenland'),(86,'GD','Grenada'),(87,'GP','Guadeloupe'),(88,'GU','Guam'),(89,'GT','Guatemala'),(90,'GN','Guinea'),(91,'GW','Guinea-Bissau'),(92,'GY','Guyana'),(93,'HT','Haiti'),(94,'HM','Heard and Mc Donald Islands'),(95,'HN','Honduras'),(96,'HK','Hong Kong'),(97,'HU','Hungary'),(98,'IS','Iceland'),(99,'IN','India'),(100,'ID','Indonesia'),(101,'IR','Iran (Islamic Republic of)'),(102,'IQ','Iraq'),(103,'IE','Ireland'),(104,'IL','Israel'),(105,'IT','Italy'),(106,'CI','Ivory Coast'),(107,'JM','Jamaica'),(108,'JP','Japan'),(109,'JO','Jordan'),(110,'KZ','Kazakhstan'),(111,'KE','Kenya'),(112,'KI','Kiribati'),(113,'KP','Korea, Democratic People\'s Republic of'),(114,'KR','Korea, Republic of'),(115,'KW','Kuwait'),(116,'KG','Kyrgyzstan'),(117,'LA','Lao People\'s Democratic Republic'),(118,'LV','Latvia'),(119,'LB','Lebanon'),(120,'LS','Lesotho'),(121,'LR','Liberia'),(122,'LY','Libyan Arab Jamahiriya'),(123,'LI','Liechtenstein'),(124,'LT','Lithuania'),(125,'LU','Luxembourg'),(126,'MO','Macau'),(127,'MK','Macedonia'),(128,'MG','Madagascar'),(129,'MW','Malawi'),(130,'MY','Malaysia'),(131,'MV','Maldives'),(132,'ML','Mali'),(133,'MT','Malta'),(134,'MH','Marshall Islands'),(135,'MQ','Martinique'),(136,'MR','Mauritania'),(137,'MU','Mauritius'),(138,'TY','Mayotte'),(139,'MX','Mexico'),(140,'FM','Micronesia, Federated States of'),(141,'MD','Moldova, Republic of'),(142,'MC','Monaco'),(143,'MN','Mongolia'),(144,'MS','Montserrat'),(145,'MA','Morocco'),(146,'MZ','Mozambique'),(147,'MM','Myanmar'),(148,'NA','Namibia'),(149,'NR','Nauru'),(150,'NP','Nepal'),(151,'NL','Netherlands'),(152,'AN','Netherlands Antilles'),(153,'NC','New Caledonia'),(154,'NZ','New Zealand'),(155,'NI','Nicaragua'),(156,'NE','Niger'),(157,'NG','Nigeria'),(158,'NU','Niue'),(159,'NF','Norfork Island'),(160,'MP','Northern Mariana Islands'),(161,'NO','Norway'),(162,'OM','Oman'),(163,'PK','Pakistan'),(164,'PW','Palau'),(165,'PA','Panama'),(166,'PG','Papua New Guinea'),(167,'PY','Paraguay'),(168,'PE','Peru'),(169,'PH','Philippines'),(170,'PN','Pitcairn'),(171,'PL','Poland'),(172,'PT','Portugal'),(173,'PR','Puerto Rico'),(174,'QA','Qatar'),(175,'RE','Reunion'),(176,'RO','Romania'),(177,'RU','Russian Federation'),(178,'RW','Rwanda'),(179,'KN','Saint Kitts and Nevis'),(180,'LC','Saint Lucia'),(181,'VC','Saint Vincent and the Grenadines'),(182,'WS','Samoa'),(183,'SM','San Marino'),(184,'ST','Sao Tome and Principe'),(185,'SA','Saudi Arabia'),(186,'SN','Senegal'),(187,'SC','Seychelles'),(188,'SL','Sierra Leone'),(189,'SG','Singapore'),(190,'SK','Slovakia'),(191,'SI','Slovenia'),(192,'SB','Solomon Islands'),(193,'SO','Somalia'),(194,'ZA','South Africa'),(195,'GS','South Georgia South Sandwich Islands'),(196,'ES','Spain'),(197,'LK','Sri Lanka'),(198,'SH','St. Helena'),(199,'PM','St. Pierre and Miquelon'),(200,'SD','Sudan'),(201,'SR','Suriname'),(202,'SJ','Svalbarn and Jan Mayen Islands'),(203,'SZ','Swaziland'),(204,'SE','Sweden'),(205,'CH','Switzerland'),(206,'SY','Syrian Arab Republic'),(207,'TW','Taiwan'),(208,'TJ','Tajikistan'),(209,'TZ','Tanzania, United Republic of'),(210,'TH','Thailand'),(211,'TG','Togo'),(212,'TK','Tokelau'),(213,'TO','Tonga'),(214,'TT','Trinidad and Tobago'),(215,'TN','Tunisia'),(216,'TR','Turkey'),(217,'TM','Turkmenistan'),(218,'TC','Turks and Caicos Islands'),(219,'TV','Tuvalu'),(220,'UG','Uganda'),(221,'UA','Ukraine'),(222,'AE','United Arab Emirates'),(223,'GB','United Kingdom'),(224,'UM','United States minor outlying islands'),(225,'UY','Uruguay'),(226,'UZ','Uzbekistan'),(227,'VU','Vanuatu'),(228,'VA','Vatican City State'),(229,'VE','Venezuela'),(230,'VN','Vietnam'),(231,'VG','Virigan Islands (British)'),(232,'VI','Virgin Islands (U.S.)'),(233,'WF','Wallis and Futuna Islands'),(234,'EH','Western Sahara'),(235,'YE','Yemen'),(236,'YU','Yugoslavia'),(237,'ZR','Zaire'),(238,'ZM','Zambia'),(239,'ZW','Zimbabwe');
/*!40000 ALTER TABLE `countries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deduction_types`
--

DROP TABLE IF EXISTS `deduction_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `deduction_types` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `type_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deduction_types`
--

LOCK TABLES `deduction_types` WRITE;
/*!40000 ALTER TABLE `deduction_types` DISABLE KEYS */;
INSERT INTO `deduction_types` VALUES (1,'Social Security System','2024-07-23 06:32:09','2024-12-31 09:46:07','2024-12-31 09:46:07'),(3,'Health Insurance Corporation','2024-07-23 07:11:34','2024-12-31 09:46:11','2024-12-31 09:46:11'),(4,'Home Development Mutual Fund','2024-07-23 07:11:45','2024-12-31 09:46:20','2024-12-31 09:46:20'),(5,'Withholding Tax On Wages','2024-07-23 07:11:57','2024-12-31 09:47:17','2024-12-31 09:47:17'),(6,'Other Statutory Deduction','2024-07-23 07:12:11','2024-12-31 09:47:23','2024-12-31 09:47:23'),(7,'Test','2024-07-23 07:39:14','2024-07-23 07:39:41','2024-07-23 07:39:41'),(8,'Imposto de Renda','2024-12-31 09:45:28','2024-12-31 09:45:28',NULL),(9,'Contribuição Previdenciária (INSS)','2024-12-31 09:45:35','2024-12-31 09:45:35',NULL),(10,'Contribuição ao FGTS','2024-12-31 09:45:47','2024-12-31 09:45:47',NULL),(11,'Vale-Alimentação / Vale-Refeição','2024-12-31 09:46:02','2024-12-31 09:46:02',NULL);
/*!40000 ALTER TABLE `deduction_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departments`
--

DROP TABLE IF EXISTS `departments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `departments` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `department_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_id` bigint unsigned DEFAULT NULL,
  `department_head` bigint unsigned DEFAULT NULL,
  `is_active` tinyint DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `departments_company_id_foreign` (`company_id`),
  KEY `departments_department_head_foreign` (`department_head`),
  CONSTRAINT `departments_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE SET NULL,
  CONSTRAINT `departments_department_head_foreign` FOREIGN KEY (`department_head`) REFERENCES `employees` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=133 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departments`
--

LOCK TABLES `departments` WRITE;
/*!40000 ALTER TABLE `departments` DISABLE KEYS */;
INSERT INTO `departments` VALUES (1,'CSE',1,NULL,NULL,'2020-07-27 04:44:20','2023-01-22 13:47:21'),(6,'Executivo',10,NULL,NULL,'2024-12-30 10:20:36','2024-12-30 10:20:36'),(7,'Recursos Humanos',10,NULL,NULL,'2024-12-30 10:22:18','2024-12-30 10:22:18'),(8,'Departamento Pessoal',10,NULL,NULL,'2024-12-30 10:22:43','2024-12-30 10:22:43'),(9,'TI',10,NULL,NULL,'2024-12-30 10:23:04','2024-12-30 10:23:04'),(10,'Delic',10,NULL,NULL,'2024-12-30 10:23:18','2024-12-30 10:23:18'),(11,'Registro',10,NULL,NULL,'2024-12-30 10:23:37','2024-12-30 10:23:37'),(12,'Patrimônio',10,NULL,NULL,'2024-12-30 10:23:52','2024-12-30 10:24:34'),(13,'Atendimento',10,NULL,NULL,'2024-12-30 10:24:52','2024-12-30 10:24:52'),(14,'Qualidade',10,NULL,NULL,'2024-12-30 10:25:12','2024-12-30 10:25:12'),(15,'Operacional',10,NULL,NULL,'2024-12-30 10:26:26','2024-12-30 10:26:26'),(16,'Conjus',10,NULL,NULL,'2024-12-30 10:26:47','2024-12-30 10:26:47'),(17,'Financeiro',10,NULL,NULL,'2024-12-30 10:27:11','2024-12-30 10:27:11'),(18,'Sejusp',10,NULL,NULL,'2024-12-30 10:30:21','2024-12-30 10:30:21'),(19,'Sesacre',10,NULL,NULL,'2024-12-30 14:22:19','2024-12-30 14:22:19'),(20,'RH',10,NULL,NULL,'2025-03-27 00:29:37','2025-03-27 00:29:37'),(21,'SEAGRO',1,NULL,NULL,'2025-04-02 17:34:37','2025-04-02 17:34:37'),(22,'IDAF',1,NULL,NULL,'2025-04-02 17:34:49','2025-04-02 17:34:49'),(23,'IMAC',1,NULL,NULL,'2025-04-02 17:34:56','2025-04-02 17:34:56'),(24,'COHAB',1,NULL,NULL,'2025-04-02 17:35:05','2025-04-02 17:35:05'),(25,'SEE 183',1,NULL,NULL,'2025-04-02 17:35:40','2025-04-02 17:35:40'),(26,'SEE 234',1,NULL,NULL,'2025-04-02 17:36:06','2025-04-02 17:36:06'),(27,'RECURSOS HUMANOS',1,NULL,NULL,'2025-04-02 17:36:43','2025-04-29 00:04:07'),(28,'FINANCEIRO',1,NULL,NULL,'2025-04-02 17:36:58','2025-04-02 17:36:58'),(29,'DP',1,NULL,NULL,'2025-04-02 17:37:05','2025-04-02 17:37:05'),(30,'REGISTRO',1,NULL,NULL,'2025-04-02 17:37:16','2025-04-02 17:37:16'),(31,'RECEPÇÃO',1,NULL,NULL,'2025-04-02 17:37:32','2025-04-02 17:37:32'),(32,'GERENCIA',1,NULL,NULL,'2025-04-02 17:37:46','2025-04-02 17:37:46'),(33,'FERISTA',10,NULL,NULL,'2025-04-10 18:49:10','2025-04-10 18:49:10'),(34,'CAGEACRE',10,NULL,NULL,'2025-04-14 19:34:53','2025-04-14 19:34:53'),(35,'SEME 001',10,NULL,NULL,'2025-04-15 00:38:30','2025-04-15 00:38:30'),(36,'SESACRE 402',10,NULL,NULL,'2025-04-15 01:04:36','2025-04-15 01:04:36'),(37,'FUNTAC',10,NULL,NULL,'2025-04-15 01:14:40','2025-04-15 01:14:40'),(38,'SEE 179',10,NULL,NULL,'2025-04-15 01:54:43','2025-04-15 01:54:43'),(39,'SAERB',10,NULL,NULL,'2025-04-16 16:25:03','2025-04-16 16:25:03'),(40,'DERACRE',10,NULL,NULL,'2025-04-17 02:05:11','2025-04-17 02:05:11'),(41,'RH',12,NULL,NULL,'2025-04-21 18:07:13','2025-04-21 18:07:13'),(42,'Financeiro',12,NULL,NULL,'2025-04-21 18:07:21','2025-04-21 18:07:21'),(43,'Gerência',12,NULL,NULL,'2025-04-21 18:07:28','2025-04-21 18:07:28'),(44,'Contábil',12,NULL,NULL,'2025-04-21 18:07:35','2025-04-21 18:07:35'),(45,'Fiscal',12,NULL,NULL,'2025-04-21 18:07:41','2025-04-21 18:07:41'),(46,'Registro/Processos',12,NULL,NULL,'2025-04-21 18:07:49','2025-04-21 18:07:49'),(47,'CASA CIVIL',10,NULL,NULL,'2025-04-22 17:38:11','2025-04-22 17:38:11'),(48,'SEE 075',10,NULL,NULL,'2025-04-22 17:41:53','2025-04-22 17:41:53'),(49,'SERVIÇOS GERAIS',1,NULL,NULL,'2025-04-25 18:24:53','2025-04-25 18:24:53'),(50,'MONITORAMENTO',1,NULL,NULL,'2025-04-25 19:10:37','2025-04-25 19:10:37'),(51,'SMGA',10,NULL,NULL,'2025-04-25 20:35:51','2025-04-25 20:35:51'),(52,'SMCCI',10,NULL,NULL,'2025-05-19 19:13:10','2025-05-19 19:13:10'),(53,'SAFRA',10,NULL,NULL,'2025-05-20 16:07:46','2025-05-20 16:07:46'),(54,'IEPTEC',10,NULL,NULL,'2025-05-20 16:17:50','2025-05-20 16:17:50'),(55,'Sefaz',10,NULL,NULL,'2025-05-20 16:18:40','2025-05-20 16:18:40'),(56,'DPE',10,NULL,NULL,'2025-05-20 16:19:07','2025-05-20 16:19:07'),(57,'SEOP',10,NULL,NULL,'2025-05-20 16:19:28','2025-05-20 16:19:28'),(58,'SEMEIA',10,NULL,NULL,'2025-05-20 16:19:50','2025-05-20 16:19:50'),(59,'Câmara',10,NULL,NULL,'2025-05-20 16:20:37','2025-05-20 16:20:37'),(60,'Escritorio',10,NULL,NULL,'2025-05-20 16:21:15','2025-05-20 16:21:15'),(61,'Camara01',10,NULL,NULL,'2025-05-20 16:26:20','2025-05-20 16:26:20'),(62,'SEE',10,NULL,NULL,'2025-05-20 16:38:06','2025-05-20 16:38:06'),(63,'Sesacre 307',10,NULL,NULL,'2025-05-20 16:46:25','2025-05-20 16:46:25'),(112,'SECRETARIA MUNICIPAL DE EDUCAÇÃO',10,NULL,NULL,'2025-07-27 11:49:05','2025-07-27 11:49:05'),(113,'JWC MULTISERVICOS LTDA',10,NULL,NULL,'2025-07-27 11:49:05','2025-07-27 11:49:05'),(114,'PREFEITURA MUNICIPAL DE BUJARI',10,NULL,NULL,'2025-07-27 11:49:05','2025-07-27 11:49:05'),(115,'FUNDAÇÃO DE TECNOLOGIA DO ESTADO DO ACRE',10,NULL,NULL,'2025-07-27 11:49:06','2025-07-27 11:49:06'),(116,'DEFENSORIA PÚBLICA',10,NULL,NULL,'2025-07-27 11:49:08','2025-07-27 11:49:08'),(117,'ITERACRE',10,NULL,NULL,'2025-07-27 11:49:10','2025-07-27 11:49:10'),(118,'SEAD',10,NULL,NULL,'2025-07-27 11:49:11','2025-07-27 11:49:11'),(119,'PGE',10,NULL,NULL,'2025-07-27 11:49:12','2025-07-27 11:49:12'),(120,'SECRETARIA DE ESTADO DA CASA CIVIL',10,NULL,NULL,'2025-07-27 11:49:13','2025-07-27 11:49:13'),(121,'SECRETARIA DA FAZENDA E GESTÃO PUBLICA',10,NULL,NULL,'2025-07-27 11:49:14','2025-07-27 11:49:14'),(122,'INSTITUTO DE ADMINISTRAÇÃO PENITENCIÁRIA',10,NULL,NULL,'2025-07-27 11:49:17','2025-07-27 11:49:17'),(123,'SEICT',10,NULL,NULL,'2025-07-27 11:49:19','2025-07-27 11:49:19'),(124,'SEHURB',10,NULL,NULL,'2025-07-27 11:49:39','2025-07-27 11:49:39'),(125,'FUNDHACRE',10,NULL,NULL,'2025-07-27 11:49:47','2025-07-27 11:49:47'),(126,'ANAC',10,NULL,NULL,'2025-07-27 11:49:50','2025-07-27 11:49:50'),(127,'ACREPREVIDÊNCIA',10,NULL,NULL,'2025-07-27 11:52:32','2025-07-27 11:52:32'),(128,'PGM',10,NULL,NULL,'2025-07-27 11:54:13','2025-07-27 11:54:13'),(129,'SECRETARIA DE ESTADO DE EDUCAÇÃO',1,NULL,NULL,'2025-08-08 15:07:13','2025-08-08 15:07:13'),(130,'SUATS SOLUCOES EM SEGURANCA LTDA',1,NULL,NULL,'2025-08-08 15:07:16','2025-08-08 15:07:16'),(131,'MINISTÉRIO PÚBLICO DO ESTADO DO ACRE',10,NULL,NULL,'2025-08-08 16:37:36','2025-08-08 16:37:36'),(132,'SESC ACRE',10,NULL,NULL,'2025-08-08 16:37:39','2025-08-08 16:37:39');
/*!40000 ALTER TABLE `departments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deposit_categories`
--

DROP TABLE IF EXISTS `deposit_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `deposit_categories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deposit_categories`
--

LOCK TABLES `deposit_categories` WRITE;
/*!40000 ALTER TABLE `deposit_categories` DISABLE KEYS */;
INSERT INTO `deposit_categories` VALUES (1,'Bônus de Desempenho','2024-07-23 15:32:56','2024-12-31 09:50:27'),(6,'Participação nos Lucros ou Resultados (PLR)','2024-07-23 15:34:53','2024-12-31 09:50:39'),(8,'Adiantamento Salarial','2024-07-23 15:35:12','2024-12-31 09:50:50'),(10,'Salário Base','2024-12-31 09:48:03','2024-12-31 09:48:03'),(11,'Comissões','2024-12-31 09:48:32','2024-12-31 09:48:32'),(12,'Horas Extras','2024-12-31 09:50:05','2024-12-31 09:50:05'),(13,'Contribuição para Previdência Complementar','2024-12-31 09:51:00','2024-12-31 09:51:00'),(14,'Auxílio Alimentação','2024-12-31 09:51:06','2024-12-31 09:51:06'),(15,'Auxílio Transporte','2024-12-31 09:51:13','2024-12-31 09:51:13'),(16,'Reembolso de Despesas','2024-12-31 09:51:23','2024-12-31 09:51:23');
/*!40000 ALTER TABLE `deposit_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `designations`
--

DROP TABLE IF EXISTS `designations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `designations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `designation_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_id` bigint unsigned DEFAULT NULL,
  `department_id` bigint unsigned DEFAULT NULL,
  `is_active` tinyint DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `designations_company_id_foreign` (`company_id`),
  KEY `designations_department_id_foreign` (`department_id`),
  CONSTRAINT `designations_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE SET NULL,
  CONSTRAINT `designations_department_id_foreign` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=250 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `designations`
--

LOCK TABLES `designations` WRITE;
/*!40000 ALTER TABLE `designations` DISABLE KEYS */;
INSERT INTO `designations` VALUES (2,'Android Developer',1,1,NULL,'2020-07-27 09:28:30','2020-07-27 09:28:52'),(4,'Marketing Analyst',1,NULL,NULL,'2020-07-27 09:30:02','2020-07-27 09:30:02'),(8,'Supervisor',10,18,NULL,'2024-12-30 10:30:54','2024-12-30 10:30:54'),(9,'Encarregada',10,7,NULL,'2024-12-30 14:52:01','2024-12-30 14:52:01'),(10,'Auxiliar Administrativo',10,7,NULL,'2024-12-30 14:52:43','2024-12-30 14:52:43'),(11,'Apoio administrativo',10,9,NULL,'2024-12-30 15:02:04','2024-12-30 15:02:04'),(12,'Supervisor',10,15,NULL,'2025-03-26 21:39:50','2025-03-26 21:39:50'),(13,'Apoio administrativo',10,20,NULL,'2025-03-27 00:30:52','2025-03-27 00:30:52'),(14,'Auxiliar Administrativo',10,8,NULL,'2025-04-01 01:16:57','2025-04-01 01:16:57'),(15,'ENCARREGADO ADMINISTRATIVO',1,27,NULL,'2025-04-02 17:38:54','2025-04-02 17:38:54'),(16,'AGENTE DE PORTARIA',1,25,NULL,'2025-04-02 17:39:58','2025-04-02 17:39:58'),(17,'AGENTE DE PORTARIA',1,26,NULL,'2025-04-02 17:42:54','2025-04-02 17:42:54'),(18,'AGENTE DE PORTARIA',1,21,NULL,'2025-04-02 17:43:16','2025-04-02 17:43:16'),(19,'AGENTE DE PORTARIA',1,24,NULL,'2025-04-02 17:43:38','2025-04-02 17:43:38'),(20,'AGENTE DE PORTARIA',1,22,NULL,'2025-04-02 17:44:01','2025-04-02 17:44:01'),(21,'AGENTE DE PORTARIA',1,23,NULL,'2025-04-02 17:44:24','2025-04-02 17:44:24'),(22,'ENCARREGADO ADMINISTRATIVO',1,29,NULL,'2025-04-02 17:46:25','2025-04-02 17:46:25'),(23,'AUXILIAR ADMINISTRATIVO',1,31,NULL,'2025-04-02 17:49:19','2025-04-02 17:49:19'),(24,'AUXILIAR ADMINISTRATIVO',1,30,NULL,'2025-04-02 17:50:20','2025-04-02 17:50:20'),(26,'ADMINISTRADOR',1,28,NULL,'2025-04-02 17:58:23','2025-04-02 17:58:23'),(27,'ADMINISTRADOR',1,32,NULL,'2025-04-02 17:59:34','2025-04-02 17:59:34'),(28,'AUXILIAR ADMINISTRATIVO',1,27,NULL,'2025-04-03 17:13:01','2025-04-03 17:13:01'),(29,'AUXILIAR ADMINISTRATIVO',1,29,NULL,'2025-04-03 17:16:46','2025-04-03 17:16:46'),(30,'AUXILIAR ADMINISTRATIVO',1,28,NULL,'2025-04-03 17:24:55','2025-04-03 17:24:55'),(31,'SERVENTE EM GERAL',10,33,NULL,'2025-04-10 18:49:42','2025-04-10 18:49:42'),(32,'ARTIFICE',10,34,NULL,'2025-04-14 19:35:23','2025-04-14 19:35:23'),(33,'SERVENTE EM GERAL',10,35,NULL,'2025-04-15 00:38:57','2025-04-15 00:38:57'),(34,'AUX. ADMINISTRATIVO',10,36,NULL,'2025-04-15 01:05:08','2025-04-15 01:05:08'),(35,'ENCARREGADO',10,37,NULL,'2025-04-15 01:15:08','2025-04-15 01:15:08'),(36,'COZINHEIRA',10,38,NULL,'2025-04-15 01:55:16','2025-04-15 01:55:16'),(37,'AUX. DE SERVIÇOS DIVERSOS',10,39,NULL,'2025-04-16 16:25:32','2025-04-16 16:25:32'),(38,'TEC. EM INFORMATICA',10,36,NULL,'2025-04-16 16:30:22','2025-04-16 16:30:22'),(39,'AUX. DE SERVIÇOS DIVERSOS',10,33,NULL,'2025-04-16 16:37:08','2025-04-16 16:37:08'),(40,'AUX. DE SERVIÇOS DIVERSOS',10,40,NULL,'2025-04-17 02:06:01','2025-04-17 02:06:01'),(41,'TEC.ADMINISTRATIVO NIVEL MEDIO',10,40,NULL,'2025-04-17 02:11:11','2025-04-17 02:11:11'),(42,'ARTIFICE',10,37,NULL,'2025-04-17 02:18:27','2025-04-17 02:18:27'),(43,'Analista de Folha de Pagamento',12,41,NULL,'2025-04-21 18:08:53','2025-04-21 18:08:53'),(44,'Assistente Financeiro',12,42,NULL,'2025-04-21 18:09:18','2025-04-21 18:09:18'),(45,'Analista Contábil',12,44,NULL,'2025-04-21 18:09:39','2025-04-21 18:09:39'),(46,'Auxiliar Contábil/Fiscal',12,45,NULL,'2025-04-21 18:10:12','2025-04-21 18:10:12'),(47,'Chefe de Setor',12,45,NULL,'2025-04-21 18:11:16','2025-04-21 18:11:16'),(48,'Auxiliar de Escritório',12,46,NULL,'2025-04-21 18:11:57','2025-04-21 18:11:57'),(49,'Gerência',12,43,NULL,'2025-04-21 18:13:08','2025-04-21 18:13:08'),(50,'Auxiliar Contábil/Fiscal',12,44,NULL,'2025-04-21 19:10:51','2025-04-21 19:10:51'),(51,'Auxiliar Departamento Pessoal',12,41,NULL,'2025-04-21 19:37:01','2025-04-21 19:37:01'),(52,'ENCARREGADO',10,39,NULL,'2025-04-22 17:20:38','2025-04-22 17:20:38'),(53,'TEC. ADMINISTRATIVO NS III',10,39,NULL,'2025-04-22 17:33:16','2025-04-22 17:33:16'),(54,'ARTIFICE',10,47,NULL,'2025-04-22 17:38:27','2025-04-22 17:38:27'),(55,'ARTIFICE',10,48,NULL,'2025-04-22 17:42:10','2025-04-22 17:42:10'),(56,'AUX. DE SERVIÇOS DIVERSOS',10,48,NULL,'2025-04-22 17:57:32','2025-04-22 17:57:32'),(57,'AUXILIAR DE SERVIÇO DIVERSOS',1,49,NULL,'2025-04-25 18:47:08','2025-04-25 18:47:08'),(58,'ASSISTENTE DE COORDENAÇÃO',1,50,NULL,'2025-04-25 19:11:16','2025-04-25 19:11:16'),(59,'INSTALADOR DE ALARME',1,50,NULL,'2025-04-25 19:40:02','2025-04-25 19:40:02'),(60,'AUX. DE SERVIÇOS DIVERSOS',10,51,NULL,'2025-04-25 20:36:13','2025-04-25 20:36:13'),(61,'MOTORISTA CAT B',10,47,NULL,'2025-04-25 20:40:48','2025-04-25 20:40:48'),(62,'TEC. ADMINISTRATIVO NM',10,37,NULL,'2025-04-25 20:58:33','2025-04-25 20:58:33'),(63,'Recepcionista',10,33,NULL,'2025-05-12 18:07:30','2025-05-12 18:07:30'),(64,'ARTIFICE',10,52,NULL,'2025-05-19 19:16:35','2025-05-19 19:16:35'),(65,'Agente de Portaria',10,35,NULL,'2025-05-19 19:36:20','2025-05-19 19:36:20'),(66,'Supervisor',10,19,NULL,'2025-05-19 19:43:03','2025-05-19 19:43:03'),(67,'ARTIFICE',10,40,NULL,'2025-05-19 19:49:03','2025-05-19 19:49:03'),(68,'Servente',10,53,NULL,'2025-05-20 16:08:48','2025-05-20 16:08:48'),(69,'AUX. DE SERVIÇOS DIVERSOS',10,35,NULL,'2025-05-20 16:15:18','2025-05-20 16:15:18'),(70,'Aux de Limpeza',10,35,NULL,'2025-05-20 16:15:57','2025-05-20 16:15:57'),(71,'Servente em Geral',10,60,NULL,'2025-05-20 16:23:15','2025-05-20 16:23:15'),(72,'Encarregado',10,60,NULL,'2025-05-20 16:23:33','2025-05-20 16:23:33'),(73,'Servente',10,61,NULL,'2025-05-20 16:27:30','2025-05-20 16:27:30'),(74,'Servente',10,52,NULL,'2025-05-20 16:27:52','2025-05-20 16:27:52'),(75,'Agente de Portaria',10,52,NULL,'2025-05-20 16:28:15','2025-05-20 16:28:15'),(76,'AUX. DE SERVIÇOS DIVERSOS',10,58,NULL,'2025-05-20 16:29:04','2025-05-20 16:29:04'),(77,'Servente',10,35,NULL,'2025-05-20 16:29:28','2025-05-20 16:29:28'),(78,'Zelador',10,35,NULL,'2025-05-20 16:30:59','2025-05-20 16:30:59'),(79,'Aux ADM',10,35,NULL,'2025-05-20 16:32:05','2025-05-20 16:32:05'),(80,'Merendeiro(a)',10,35,NULL,'2025-05-20 16:33:02','2025-05-20 16:33:02'),(81,'Operador de Convés',10,40,NULL,'2025-05-20 16:33:43','2025-05-20 16:33:43'),(82,'Tec Manutenção',10,40,NULL,'2025-05-20 16:34:08','2025-05-20 16:34:08'),(83,'Tec ADM NM',10,40,NULL,'2025-05-20 16:34:40','2025-05-20 16:34:40'),(84,'TEC ADM NS',10,40,NULL,'2025-05-20 16:37:06','2025-05-20 16:37:06'),(85,'Cozinheiro(a)',10,62,NULL,'2025-05-20 16:38:38','2025-05-20 16:38:38'),(86,'Merendeiro(a)',10,62,NULL,'2025-05-20 16:39:25','2025-05-20 16:39:25'),(87,'Cozinheiro(a)',10,38,NULL,'2025-05-20 16:39:49','2025-05-20 16:39:49'),(88,'Merendeiro(a)',10,38,NULL,'2025-05-20 16:40:01','2025-05-20 16:40:01'),(89,'Merendeiro(a)',10,33,NULL,'2025-05-20 16:40:51','2025-05-20 16:40:51'),(90,'AUX. DE SERVIÇOS DIVERSOS1',10,33,NULL,'2025-05-20 16:41:12','2025-05-20 16:41:12'),(91,'Servente',10,33,NULL,'2025-05-20 16:41:40','2025-05-20 16:41:40'),(92,'ARTIFICE1',10,37,NULL,'2025-05-20 16:42:38','2025-05-20 16:42:38'),(93,'TEC ADM NSI',10,54,NULL,'2025-05-20 16:43:11','2025-05-20 16:43:11'),(94,'Digitador',10,19,NULL,'2025-05-20 16:44:48','2025-05-20 16:44:48'),(95,'Atendente',10,36,NULL,'2025-05-20 16:45:18','2025-05-20 16:45:18'),(96,'Aux ADM',10,36,NULL,'2025-05-20 16:45:57','2025-05-20 16:45:57'),(97,'ARTIFICE',10,63,NULL,'2025-05-20 16:47:24','2025-05-20 16:47:24'),(98,'Atendente',10,18,NULL,'2025-05-20 16:48:38','2025-05-20 16:48:38'),(99,'TEC ADM NS 1',10,55,NULL,'2025-05-20 16:49:10','2025-05-20 16:49:10'),(100,'AUX. DE SERVIÇOS DIVERSOS',10,57,NULL,'2025-05-20 16:50:53','2025-05-20 16:50:53'),(101,'AUX. DE SERVIÇOS DIVERSOS',10,56,NULL,'2025-05-20 16:53:13','2025-05-20 16:53:13'),(102,'TEC ADM NS 2',10,62,NULL,'2025-05-21 17:01:40','2025-05-21 17:01:40'),(103,'gestor operacional',10,6,NULL,'2025-05-21 23:33:53','2025-05-21 23:33:53'),(104,'APOIO ADMINISTRATIVO 1D',10,60,NULL,'2025-06-11 02:38:14','2025-06-11 02:38:14'),(105,'Supervisor',10,33,NULL,'2025-06-24 23:52:58','2025-06-24 23:52:58'),(106,'Encarregado',10,33,NULL,'2025-06-24 23:54:13','2025-06-24 23:54:13'),(107,'Atendente',10,33,NULL,'2025-06-24 23:54:51','2025-06-24 23:54:51'),(108,'Auxiliar Administrativo',10,33,NULL,'2025-06-24 23:55:23','2025-06-24 23:55:23'),(109,'Agente de Portaria',10,33,NULL,'2025-06-24 23:55:45','2025-06-24 23:55:45'),(110,'Técnico Administrativo',10,33,NULL,'2025-06-24 23:56:11','2025-06-24 23:56:11'),(111,'Artifice',10,33,NULL,'2025-06-24 23:56:31','2025-06-24 23:56:31'),(112,'ARTIFICE - ELETRICISTA',10,33,NULL,'2025-06-25 05:49:49','2025-06-25 05:49:49'),(113,'COZINHEIRO (A)',10,33,NULL,'2025-06-25 06:26:52','2025-06-25 06:26:52'),(114,'TECNICO ADMINISTRATIVO NS I',10,33,NULL,'2025-06-25 06:39:26','2025-06-25 06:39:26'),(115,'Digitador',10,33,NULL,'2025-06-25 23:37:59','2025-06-25 23:37:59'),(116,'TÉCNICO ADMINISTRATIVO NM',10,33,NULL,'2025-07-01 07:08:11','2025-07-01 07:08:11'),(117,'Operador de Trator',10,33,NULL,'2025-07-01 22:56:08','2025-07-01 22:56:08'),(118,'ARTIFICE - CARPINTEIRO',10,33,NULL,'2025-07-02 05:30:01','2025-07-02 05:30:01'),(119,'tecnico de informatica',10,33,NULL,'2025-07-02 05:53:50','2025-07-02 05:53:50'),(120,'motorista categoria D',10,33,NULL,'2025-07-02 06:03:17','2025-07-02 06:03:17'),(121,'SECRETARIA DO ESTADO DE SAUDE',10,19,NULL,'2025-07-27 11:17:39','2025-07-27 11:17:39'),(210,'DEP. DE ESTRADAS E ROD.',10,40,NULL,'2025-07-27 11:49:03','2025-07-27 11:49:03'),(211,'SEC.MUNC. DE CUIDADOS COM A CIDADE',10,52,NULL,'2025-07-27 11:49:03','2025-07-27 11:49:03'),(212,'INST. DE DEFESA AGRO. E FLORESTAL',10,22,NULL,'2025-07-27 11:49:04','2025-07-27 11:49:04'),(213,'SEC. DE ESTADO DE OBRAS PUBLICAS',10,57,NULL,'2025-07-27 11:49:04','2025-07-27 11:49:04'),(214,'SECRETARIA DE ESTADO DE EDUCAÇÃO',10,62,NULL,'2025-07-27 11:49:04','2025-07-27 11:49:04'),(215,'DOM MOACYR',10,54,NULL,'2025-07-27 11:49:04','2025-07-27 11:49:04'),(216,'SEME',10,112,NULL,'2025-07-27 11:49:05','2025-07-27 11:49:05'),(217,'Designação não informada',10,113,NULL,'2025-07-27 11:49:05','2025-07-27 11:49:05'),(218,'Designação não informada',10,114,NULL,'2025-07-27 11:49:05','2025-07-27 11:49:05'),(219,'Designação não informada',10,115,NULL,'2025-07-27 11:49:06','2025-07-27 11:49:06'),(220,'SER. DE ÁGUA E ESGOTO RIO BRANCO',10,39,NULL,'2025-07-27 11:49:06','2025-07-27 11:49:06'),(221,'Designação não informada',10,116,NULL,'2025-07-27 11:49:08','2025-07-27 11:49:08'),(222,'Designação não informada',10,117,NULL,'2025-07-27 11:49:10','2025-07-27 11:49:10'),(223,'SECRETARIA DE ESTADO DE ADMINISTR',10,118,NULL,'2025-07-27 11:49:11','2025-07-27 11:49:11'),(224,'PROCURADORIA GERAL DO ESTADO DO AC',10,119,NULL,'2025-07-27 11:49:12','2025-07-27 11:49:12'),(225,'Designação não informada',10,120,NULL,'2025-07-27 11:49:13','2025-07-27 11:49:13'),(226,'Designação não informada',10,121,NULL,'2025-07-27 11:49:14','2025-07-27 11:49:14'),(227,'Designação não informada',10,34,NULL,'2025-07-27 11:49:15','2025-07-27 11:49:15'),(228,'Designação não informada',10,122,NULL,'2025-07-27 11:49:17','2025-07-27 11:49:17'),(229,'SEC. EST. JUSTIÇA E SEGU.PÚBLICA',10,18,NULL,'2025-07-27 11:49:19','2025-07-27 11:49:19'),(230,'SEC. DE EST. DE IN. CIEN E TECN',10,123,NULL,'2025-07-27 11:49:19','2025-07-27 11:49:19'),(231,'SECRETARIA MUNICIPAL DE GESTAO ADMI',10,51,NULL,'2025-07-27 11:49:23','2025-07-27 11:49:23'),(232,'SEC. EST. HABITACAO E URBANISMO',10,124,NULL,'2025-07-27 11:49:39','2025-07-27 11:49:39'),(233,'FUND. HOSPITAL ESTADUAL ACRE',10,125,NULL,'2025-07-27 11:49:47','2025-07-27 11:49:47'),(234,'AGENCIA DE NEGOCIOS DO ACRE',10,126,NULL,'2025-07-27 11:49:50','2025-07-27 11:49:50'),(235,'Designação não informada',10,127,NULL,'2025-07-27 11:52:32','2025-07-27 11:52:32'),(236,'PROCURADORIA GERAL DO MUNICIPIO',10,128,NULL,'2025-07-27 11:54:13','2025-07-27 11:54:13'),(237,'Designação não informada',1,129,NULL,'2025-08-08 15:07:13','2025-08-08 15:07:13'),(238,'INSTITUTO DE DEFESA AGROPECUARIA',1,22,NULL,'2025-08-08 15:07:14','2025-08-08 15:07:14'),(239,'Designação não informada',1,130,NULL,'2025-08-08 15:07:16','2025-08-08 15:07:16'),(240,'SECRETARIA DE ESTADO DE JUSTICA',1,18,NULL,'2025-08-08 15:07:18','2025-08-08 15:07:18'),(241,'SECRETARIA MUNICIPAL DE AGROPECUA',1,21,NULL,'2025-08-08 15:07:19','2025-08-08 15:07:19'),(242,'COMPANHIA DE HABITAÇÃO DO ACRE',1,24,NULL,'2025-08-08 15:07:20','2025-08-08 15:07:20'),(243,'INSTITUTO DE MEIO AMBIENTE DO ACR',1,23,NULL,'2025-08-08 15:08:48','2025-08-08 15:08:48'),(244,'Designação não informada',10,131,NULL,'2025-08-08 16:37:36','2025-08-08 16:37:36'),(245,'Designação não informada',10,132,NULL,'2025-08-08 16:37:39','2025-08-08 16:37:39'),(246,'TECNICO ADMINISTRATIVO NS II',10,33,NULL,'2025-08-12 20:52:31','2025-08-12 20:52:31'),(247,'MOTORISTA CATEGORIA B',10,33,NULL,'2025-08-18 19:30:29','2025-08-18 19:30:29'),(248,'Executivo 01',10,6,NULL,'2025-08-19 13:06:55','2025-08-19 13:06:55'),(249,'ARTIFICE',10,131,NULL,'2025-08-26 19:58:25','2025-08-26 19:58:25');
/*!40000 ALTER TABLE `designations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `districts`
--

DROP TABLE IF EXISTS `districts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `districts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `regional_id` bigint unsigned DEFAULT NULL,
  `regional_order_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `districts_regional_id_foreign` (`regional_id`),
  CONSTRAINT `districts_regional_id_foreign` FOREIGN KEY (`regional_id`) REFERENCES `regionals` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=961 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `districts`
--

LOCK TABLES `districts` WRITE;
/*!40000 ALTER TABLE `districts` DISABLE KEYS */;
INSERT INTO `districts` VALUES (1,1,'01','Loteamento Fahat','2025-02-27 20:18:46','2025-02-27 20:18:46','Rio Branco'),(2,1,'02','Santa Helena','2025-02-27 20:18:46','2025-02-27 20:18:46','Rio Branco'),(3,1,'03','Major Mendonca','2025-02-27 20:18:46','2025-02-27 20:18:46','Rio Branco'),(4,1,'04','Vila da Amizade (Loteado Acaua)','2025-02-27 20:18:46','2025-02-27 20:18:46','Rio Branco'),(5,1,'05','Vila Acre','2025-02-27 20:18:46','2025-02-27 20:18:46','Rio Branco'),(6,1,'06','Ramal Bom Jesus','2025-02-27 20:18:46','2025-02-27 20:18:46','Rio Branco'),(7,1,'07','Ramal Vila Billar','2025-02-27 20:18:46','2025-02-27 20:18:46','Rio Branco'),(8,1,'08','Ramal Luiz Angelo','2025-02-27 20:18:46','2025-02-27 20:18:46','Rio Branco'),(9,1,'09','Ramal do Mineiro','2025-02-27 20:18:46','2025-02-27 20:18:46','Rio Branco'),(10,1,'10','Ramal Vila do Marcelo','2025-02-27 20:18:46','2025-02-27 20:18:46','Rio Branco'),(11,1,'11','Ramal Bom Futuro','2025-02-27 20:18:46','2025-02-27 20:18:46','Rio Branco'),(12,1,'12','Vila Benfica','2025-02-27 20:18:46','2025-02-27 20:18:46','Rio Branco'),(13,1,'13','Vila Jerusalem','2025-02-27 20:18:46','2025-02-27 20:18:46','Rio Branco'),(14,1,'14','Santa Maria','2025-02-27 20:18:46','2025-02-27 20:18:46','Rio Branco'),(15,1,'15','Itucuma','2025-02-27 20:18:46','2025-02-27 20:18:46','Rio Branco'),(16,1,'16','Loteamento Mora Bem','2025-02-27 20:18:46','2025-02-27 20:18:46','Rio Branco'),(17,1,'17','Loteamento Sol Nascente','2025-02-27 20:18:46','2025-02-27 20:18:46','Rio Branco'),(18,1,'18','Beco Buritizal','2025-02-27 20:18:46','2025-02-27 20:18:46','Rio Branco'),(19,2,'01','Recanto dos Buritis','2025-02-27 20:18:46','2025-02-27 20:18:46','Rio Branco'),(20,2,'02','Santa Ines','2025-02-27 20:18:46','2025-02-27 20:18:46','Rio Branco'),(21,2,'03','Recanto da Judia',NULL,NULL,'Rio Branco'),(42,NULL,NULL,'Centro','2025-03-15 05:44:46','2025-03-15 05:44:46','Cruzeiro do Sul'),(43,NULL,NULL,'Aeroporto Velho','2025-03-15 05:44:46','2025-03-15 05:44:46','Cruzeiro do Sul'),(44,NULL,NULL,'Miritizal','2025-03-15 05:44:46','2025-03-15 05:44:46','Cruzeiro do Sul'),(45,NULL,NULL,'Boca da Alemanha','2025-03-15 05:44:46','2025-03-15 05:44:46','Cruzeiro do Sul'),(46,NULL,NULL,'Telégrafo','2025-03-15 05:44:46','2025-03-15 05:44:46','Cruzeiro do Sul'),(47,NULL,NULL,'Saboeiro','2025-03-15 05:44:46','2025-03-15 05:44:46','Cruzeiro do Sul'),(48,NULL,NULL,'São José','2025-03-15 05:44:46','2025-03-15 05:44:46','Cruzeiro do Sul'),(49,NULL,NULL,'Olivença','2025-03-15 05:44:46','2025-03-15 05:44:46','Cruzeiro do Sul'),(50,NULL,NULL,'Centro','2025-03-15 05:44:46','2025-03-15 05:44:46','Sena Madureira'),(51,NULL,NULL,'Bom Sucesso','2025-03-15 05:44:46','2025-03-15 05:44:46','Sena Madureira'),(52,NULL,NULL,'Cristo Libertador','2025-03-15 05:44:46','2025-03-15 05:44:46','Sena Madureira'),(53,NULL,NULL,'São Francisco','2025-03-15 05:44:46','2025-03-15 05:44:46','Sena Madureira'),(54,NULL,NULL,'Pista','2025-03-15 05:44:46','2025-03-15 05:44:46','Sena Madureira'),(55,NULL,NULL,'Centro','2025-03-15 05:44:46','2025-03-15 05:44:46','Tarauacá'),(56,NULL,NULL,'Triângulo','2025-03-15 05:44:46','2025-03-15 05:44:46','Tarauacá'),(57,NULL,NULL,'Copacabana','2025-03-15 05:44:46','2025-03-15 05:44:46','Tarauacá'),(58,NULL,NULL,'Senador Pompeu','2025-03-15 05:44:46','2025-03-15 05:44:46','Tarauacá'),(59,NULL,NULL,'Aeroporto','2025-03-15 05:44:46','2025-03-15 05:44:46','Tarauacá'),(60,NULL,NULL,'Centro','2025-03-15 05:44:46','2025-03-15 05:44:46','Feijó'),(61,NULL,NULL,'Esperança','2025-03-15 05:44:46','2025-03-15 05:44:46','Feijó'),(62,NULL,NULL,'Geraldo Mesquita','2025-03-15 05:44:46','2025-03-15 05:44:46','Feijó'),(63,NULL,NULL,'Terminal','2025-03-15 05:44:46','2025-03-15 05:44:46','Feijó'),(64,NULL,NULL,'Centro','2025-03-15 05:44:46','2025-03-15 05:44:46','Brasiléia'),(65,NULL,NULL,'Eldorado','2025-03-15 05:44:46','2025-03-15 05:44:46','Brasiléia'),(66,NULL,NULL,'José Rabelo','2025-03-15 05:44:46','2025-03-15 05:44:46','Brasiléia'),(67,NULL,NULL,'Satélite','2025-03-15 05:44:46','2025-03-15 05:44:46','Brasiléia'),(68,NULL,NULL,'Centro','2025-03-15 05:44:46','2025-03-15 05:44:46','Epitaciolândia'),(69,NULL,NULL,'Beira Rio','2025-03-15 05:44:46','2025-03-15 05:44:46','Epitaciolândia'),(70,NULL,NULL,'Aeroporto','2025-03-15 05:44:46','2025-03-15 05:44:46','Epitaciolândia'),(71,NULL,NULL,'José Hassem','2025-03-15 05:44:46','2025-03-15 05:44:46','Epitaciolândia'),(72,NULL,NULL,'Centro','2025-03-15 05:44:46','2025-03-15 05:44:46','Xapuri'),(73,NULL,NULL,'Laranjal','2025-03-15 05:44:46','2025-03-15 05:44:46','Xapuri'),(74,NULL,NULL,'Bairro Braga Sobrinho','2025-03-15 05:44:46','2025-03-15 05:44:46','Xapuri'),(75,NULL,NULL,'Constantino','2025-03-15 05:44:46','2025-03-15 05:44:46','Xapuri'),(76,NULL,NULL,'Centro','2025-03-15 05:44:46','2025-03-15 05:44:46','Plácido de Castro'),(77,NULL,NULL,'Cidade Nova','2025-03-15 05:44:46','2025-03-15 05:44:46','Plácido de Castro'),(78,NULL,NULL,'Taquari','2025-03-15 05:44:46','2025-03-15 05:44:46','Plácido de Castro'),(79,NULL,NULL,'Centro','2025-03-15 05:44:46','2025-03-15 05:44:46','Senador Guiomard'),(80,NULL,NULL,'São Francisco','2025-03-15 05:44:46','2025-03-15 05:44:46','Senador Guiomard'),(81,NULL,NULL,'Quinari','2025-03-15 05:44:46','2025-03-15 05:44:46','Senador Guiomard'),(82,NULL,NULL,'Centro','2025-03-15 05:44:46','2025-03-15 05:44:46','Acrelândia'),(83,NULL,NULL,'Porto Acre','2025-03-15 05:44:46','2025-03-15 05:44:46','Acrelândia'),(84,NULL,NULL,'Planalto','2025-03-15 05:44:46','2025-03-15 05:44:46','Acrelândia'),(85,NULL,NULL,'Centro','2025-03-15 05:44:46','2025-03-15 05:44:46','Porto Acre'),(86,NULL,NULL,'Vila do Incra','2025-03-15 05:44:46','2025-03-15 05:44:46','Porto Acre'),(87,NULL,NULL,'Boca do Acre','2025-03-15 05:44:46','2025-03-15 05:44:46','Porto Acre'),(88,29,'1','Loteamento Fahat','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(89,29,'2','Santa Helena','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(90,29,'3','Major Mendonça','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(91,29,'4','Vila da Amizade (Loteamento Acauã)','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(92,29,'5','Vila Acre','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(93,29,'6','Ramal Bom Jesus (Vila Billar, Luiz Ângelo, Vila Boa Vontade, Ramal do Mineiro e Vila do Marcelo)','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(94,29,'7','Ramal Bom Futuro','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(95,29,'8','Vila Benfica','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(96,29,'9','Vila Jerusalém','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(97,29,'10','Santa Maria','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(98,29,'11','Itucumã','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(99,29,'12','Loteamento Mora Bem','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(100,29,'13','Loteamento Sol Nascente','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(101,29,'14','Beco Buritizal','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(102,30,'1','Recanto dos Buritis','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(103,30,'2','Santa Inês','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(104,30,'3','Recanto da Judia','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(105,30,'4','Jacarandá','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(106,30,'5','Conjunto Rosalina I','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(107,30,'6','Conjunto Rosalinda II','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(108,30,'7','Conjunto Rosalinda III','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(109,30,'8','Belo Jardim I','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(110,30,'9','Belo Jardim II','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(111,30,'10','Belo Buritis','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(112,30,'11','Loteamento Herculano','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(113,30,'12','Vila Belo Jardim','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(114,30,'13','Vila Santa Cecília','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(115,30,'14','Vila Albert Sampaio','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(116,30,'15','Vila Liberdade','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(117,30,'16','Santo Afonso','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(118,30,'17','Recanto da Judia','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(119,31,'1','06 de Agosto','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(120,31,'2','Amapá','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(121,31,'3','Cidade Nova','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(122,31,'4','Comara','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(123,31,'5','Loteamento Alzira Cruz','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(124,31,'7','Bairro do Quinze','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(125,31,'8','Taquari','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(126,31,'9','Triângulo Novo','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(127,31,'10','Triângulo Velho','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(128,31,'11','Areal','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(129,31,'12','Conjunto Canaã','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(130,31,'13','Ramal Menino Jesus (Pólo)','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(131,31,'14','Loteamento Girassol','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(132,32,'1','Bairro 10 de Junho','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(133,32,'2','Adalberto Aragão','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(134,32,'3','Aviário','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(135,32,'4','Baixa da Colina','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(136,32,'5','Baixa da Habitasa','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(137,32,'7','Cohab do Bosque','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(138,32,'8','Baixa da Cadeia Velha','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(139,32,'9','Capoeira','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(140,32,'10','Cerâmica','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(141,32,'11','Conjunto Jardim São Francisco','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(142,32,'12','Dom Giocondo','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(143,32,'13','Alegria','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(144,32,'14','Jardim Tropical','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(145,32,'15','Morada do Sol','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(146,32,'16','Cadeia Velha (Do Varejão ao Senai)','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(147,32,'17','Loteamento São José','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(148,32,'18','Procon','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(149,32,'19','Solar','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(150,32,'20','Vila Ivonete','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(151,32,'21','Bosque','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(152,32,'22','José Augusto','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(153,32,'23','Ipase','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(154,32,'24','Guiomard Santos','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(155,32,'25','Habitasa','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(156,33,'1','Oscar Passos','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(157,33,'2','Vitória','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(158,33,'3','Novo Residencial Eldorado','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(159,33,'4','Chico Mendes','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(160,33,'5','Conjunto Mutambo','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(161,33,'7','Novo Eldorado','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(162,33,'8','Conjunto Angico','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(163,33,'9','Placas','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(164,33,'10','Loteamento Guanabara','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(165,33,'11','Apolônio Sales','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(166,33,'12','Loteamento Altamira','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(167,33,'13','Loteamento São Francisco','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(168,33,'14','Residencial Vale do Açai','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(169,33,'15','Conjunto Ouricuri','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(170,33,'16','Residencial Iaco','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(171,33,'17','Conjunto Edson Cadaxo','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(172,33,'18','Loteamento Jaguar','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(173,33,'19','Residencial Andirá','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(174,33,'20','Residencial São Jorge','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(175,5,'1','Residencial Santa Cruz','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(176,5,'2','Parque dos Sábias','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(177,5,'3','Tancredo Neves','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(178,5,'4','Jorge Lavocat','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(179,5,'5','Defesa Civil','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(180,5,'7','Montanhês','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(181,5,'8','Conjunto Jarbas Passarinho','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(182,5,'9','Adalberto Sena','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(183,5,'10','Alto Alegre','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(184,5,'11','Juarez Távora','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(185,5,'12','Novo Horizonte','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(186,5,'13','Raimundo Melo','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(187,5,'14','Vila Nova','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(188,5,'15','Xavier Maia','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(189,5,'16','Loteamento Santo','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(190,5,'17','Wanderley Dantas','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(191,5,'18','Conjunto Mulateiro','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(192,5,'19','Loteamento Dal Pascualy','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(193,5,'20','Conjunto Genipapo','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(194,5,'21','Caladinho','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(195,5,'22','Loteamento Copacabana','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(196,5,'23','Loteamento Céu Azul','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(197,5,'24','Loteamento Santa Monica','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(198,5,'25','Conjunto Copaiba','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(199,5,'26','Conjunto Andiroba','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(200,5,'27','Conjunto Macauã','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(201,5,'28','Conjunto Andira','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(202,34,'1','Tangara','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(203,34,'2','Conjunto Universitario','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(204,34,'3','Conquista','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(205,34,'4','Custodio Freire','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(206,34,'5','Estação Experimental','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(207,34,'7','Jardim América','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(208,34,'8','Isaura Parente ','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(209,34,'9','Mocinha Magalhães ','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(210,34,'10','Bairro da Paz ','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(211,34,'11','Parque das Palmeiras ','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(212,34,'12','Residencial Joafra ','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(213,34,'13','Santa Quitéria ','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(214,34,'14','Nova Estação','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(215,34,'15','Conjunto Mariana ','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(216,34,'16','Barro Vermelho','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(217,34,'17','Conjunto Paulo Cesar','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(218,34,'18','Conjunto Rui Lino','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(219,34,'19','Distrito Industrial','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(220,34,'20','Hélio Melo','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(221,34,'21','Loteamento Isaura Parente','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(222,34,'22','Conjunto Manoel Julião','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(223,34,'23','Monte Alto','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(224,34,'24','Residencial Vila Mariana','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(225,34,'25','Residencial Iolanda','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(226,34,'26','Residencial Petrópolis','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(227,34,'27','Tucumã ','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(228,34,'28','Santa Terezinha','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(229,34,'29','Boa Esperança','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(230,34,'30','Vila Aquiles Peret','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(231,34,'31','Jardim Primavera','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(232,34,'32','Loteamento dos Engenheiros  ','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(233,34,'33','Loteamento Flora','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(234,34,'34','Loteamento Jardim Brasil','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(235,7,'1','Abrahão Alab','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(236,7,'2','Castelo Branco','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(237,7,'3','Conjunto Esperança I','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(238,7,'4','Conjunto Esperança II','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(239,7,'5','Conjunto Bela Vista','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(240,7,'7','Novo Horizonte','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(241,7,'8','Residencial Maria Iris','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(242,7,'9','Conjunto Nova Esperança','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(243,7,'10','Conjunto Habitar Brasil','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(244,7,'11','Floresta Sul','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(245,7,'12','Floresta Norte','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(246,7,'13','Mascarenhas de Moraes','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(247,7,'14','Jardim Alah ','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(248,7,'15','Jardim Europa','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(249,7,'16','Conjunto Esperança III','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(250,7,'17','Betel II','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(251,7,'18','Doca Furtado','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(252,7,'19','Betel I (Osvaldo Amorim)','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(253,7,'20','LBA','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(254,7,'21','Loteamento Ana Rosa','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(255,7,'22','Loteamento Antonio Macedo ','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(256,35,'1','Conjunto Aroeira','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(257,35,'2','Conjunto Israel Lira','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(258,35,'3','Loteamento João Carlos','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(259,35,'4','São Miguel','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(260,35,'5','Ilson Ribeiro','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(261,35,'7','Laélia Alcântara','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(262,35,'8','Novo Conjunto Ilson Ribeiro','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(263,35,'9','Conjunto Village Tiradentes','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(264,35,'10','Waldemar Maciel ','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(265,35,'11','Conjunto Itatiaia','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(266,35,'12','Nova Morada','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(267,35,'13','Conjunto Jequitibá','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(268,35,'14','Loteamento Raimundo Maia','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(269,35,'15','Novo Calafate','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(270,35,'16','Pedro Roseno','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(271,9,'1','Aeroporto Velho','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(272,9,'2','Ayrton Sena','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(273,9,'3','Bahia Nova ','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(274,9,'4','Bahia Velha','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(275,9,'5','Boa União','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(276,9,'7','Glória','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(277,9,'8','João Eduardo I','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(278,9,'9','João Eduardo II','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(279,9,'10','João Paulo I','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(280,9,'11','Loteamento Santo Afonso I','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(281,9,'12','Loteamento São Sebastião','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(282,9,'13','Palheiral','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(283,9,'14','Pista','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(284,9,'15','Preventório','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(285,9,'16','Plácido de Castro','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(286,9,'17','Sobral','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(287,9,'18','Conjunto de Castro','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(288,9,'19','Conjunto Cabreúva','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(289,36,'1','POLO WILSON PINHEIRO','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(290,36,'2','POLO GERALDO MESQUITA','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(291,36,'3','VILA MANOEL MARQUES','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(292,36,'4','PA MORENO MAIA','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(293,36,'5','COMUNIDADE ÁGUA PRETA','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(294,36,'7','ESTRADA TRANSACREANA, KM 05 – RAMAL UNIÃO','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(295,36,'8','COMUNIDADE UNIÃO FLORESTA','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(296,37,'1','PA ITAMARATY RAMAL JARINAL','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(297,37,'2','ESCONDIDO II RAMAL SABÓIA','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(298,37,'3','RAMAL CENTRINHO','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(299,37,'4','VILA VERDE','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(300,37,'5','RAMAL DO BEIJA FLOR','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(301,37,'7','RAMAL CASTANHEIRA','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(302,37,'8','PA CARÃO , KM 52','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(303,37,'9','PA CARÃO,KM 42','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(304,37,'10','PA CARÃO,KM 40 ','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(305,37,'11','PA CARÃO – RAMAL PRIMAVERA','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(306,37,'12','PA CARÃO – RAMAL DA PELADEIRA KM 06','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(307,37,'13','ESTRADA TRANSACREANA KM 91 – RAMAL DO ANTIMARY KM  ','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(308,37,'14','RAMAL CENTRINHO','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(309,37,'15',' RAMAL MAÇARANDUBA KM 06  ','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(310,37,'16','RAMAL RIO BRANCO DA CAPELA KM 20','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(311,37,'17','RAMAL DO ESPALHA KM 12','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(312,37,'18','RAMAL DO VAI SE VER KM 18','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(313,37,'19','PA ORIENTE KM 140','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(314,37,'20','RAMAL OLHO D´ÁGUA KM 06','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(315,37,'21','COMUNIDADE ITAMARATY II','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(316,37,'22','ESTRADA TRANSACREANA KM 80','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(317,12,'1','REGIONAIS TRANSACREANA I E II','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(318,38,'1','ESTRADA DO QUIXADÁ','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(319,38,'2','ESTRADA DO QUIXADÁ – RAMAL BOA ÁGUA','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(320,38,'3','BR 364, KM 08 AO LADO DO AEROPORTO','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(321,38,'4','ESTRADA JARBAS PASSARINHO','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(322,38,'5','ESTRADA DO QUIXADÁ RAMAL DO LIMOEIRO','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(323,38,'7','ESTRADA JARBAS PASSARINHO ,KM 06 RAMAL SÃO RAIMUNDO','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(324,38,'8','AC, KM 20 – RAMAL SÃO PEDRO ','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(325,38,'9','BR 364, KM 17 – CUSTÓDIO FREIRE RAMAL CASTANHETA ','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(326,38,'10','ESTRADA AC 10, KM 19 – POLO GERALDO MESQUITA','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(327,38,'11','BR 364, KM 08 – RAMAL DO ROMÃO KM 03','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(328,38,'12','ESTRADA DO BARRO VERMELHO KM 09','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(329,38,'13','ESTRADA DO QUIXADÁ KM 12 – RAMAL EXTREMA KM 03','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(330,38,'14','BR 364,KM 06 – ESTRADA DO AEROPORTO ','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(331,38,'15','ESTRADA DE PORTO ACRE,KM 14 – RAMAL SANTOS KM 10','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(332,38,'16','ESTRADA DO PIRANJI','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(333,38,'17','ESTRADA DE PORTO ACRE  - RAMAL MEDEIROS','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(334,38,'18','ESTRADA DO LIMOEIRO – RAMAL ORIENTE','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(335,38,'19','PA ORIENTE KM 140','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(336,39,'1','BELO JARDIM I II III','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(337,39,'2','RAMAL DO CLODOALDO','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(338,39,'3','BENFICA – RAMAL PALHEIRA','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(339,39,'4','ESTRADA DE BOCA DO ACRE','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(340,39,'5','RAMAL DA ZEZÉ','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(341,39,'7','RAMAL DO MOREIRA','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(342,39,'8','RAMAL BENFICA','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(343,39,'9','RAMAL GALILÉIA','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(344,39,'10','ESTRADA DO AMAPÁ – RAMAL SANTA HELENA','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(345,39,'11','RAMAL DO CACAU','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(346,39,'12','RAMAL BELO JARDIM','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(347,39,'13','ESTRADA DEBOCADO ACRE KM 25','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(348,39,'14','ESTRADA DE BOCA DO ACRE KM 28','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(349,39,'15','RAMAL ASTRO REIS','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(350,39,'16','RAMAL BEIRA RIO','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(351,39,'17','RAMAL SÃO JOSÉ','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(352,39,'18','RAMAL DO BRÁZ','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(353,39,'19','RAMAL DO PALHEIRA','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(354,39,'20','RAMAL DA GARAPEIRA','2025-03-18 07:29:08','2025-03-18 07:29:08',NULL),(355,29,'1','Loteamento Fahat','2025-04-15 20:13:53','2025-04-15 20:13:53',NULL),(356,29,'2','Santa Helena','2025-04-15 20:13:53','2025-04-15 20:13:53',NULL),(357,29,'3','Major Mendonça','2025-04-15 20:13:53','2025-04-15 20:13:53',NULL),(358,29,'4','Vila da Amizade (Loteamento Acauã)','2025-04-15 20:13:53','2025-04-15 20:13:53',NULL),(359,29,'5','Vila Acre','2025-04-15 20:13:53','2025-04-15 20:13:53',NULL),(360,29,'7','Ramal Bom Futuro','2025-04-15 20:13:53','2025-04-15 20:13:53',NULL),(361,29,'8','Vila Benfica','2025-04-15 20:13:53','2025-04-15 20:13:53',NULL),(362,29,'9','Vila Jerusalém','2025-04-15 20:13:53','2025-04-15 20:13:53',NULL),(363,29,'10','Santa Maria','2025-04-15 20:13:53','2025-04-15 20:13:53',NULL),(364,29,'11','Itucumã','2025-04-15 20:13:53','2025-04-15 20:13:53',NULL),(365,29,'12','Loteamento Mora Bem','2025-04-15 20:13:53','2025-04-15 20:13:53',NULL),(366,29,'13','Loteamento Sol Nascente','2025-04-15 20:13:53','2025-04-15 20:13:53',NULL),(367,29,'14','Beco Buritizal','2025-04-15 20:13:53','2025-04-15 20:13:53',NULL),(368,30,'1','Recanto dos Buritis','2025-04-15 20:13:53','2025-04-15 20:13:53',NULL),(369,30,'2','Santa Inês','2025-04-15 20:13:53','2025-04-15 20:13:53',NULL),(370,30,'3','Recanto da Judia','2025-04-15 20:13:53','2025-04-15 20:13:53',NULL),(371,30,'4','Jacarandá','2025-04-15 20:13:53','2025-04-15 20:13:53',NULL),(372,30,'5','Conjunto Rosalina I','2025-04-15 20:13:53','2025-04-15 20:13:53',NULL),(373,30,'7','Conjunto Rosalinda III','2025-04-15 20:13:53','2025-04-15 20:13:53',NULL),(374,30,'8','Belo Jardim I','2025-04-15 20:13:53','2025-04-15 20:13:53',NULL),(375,30,'9','Belo Jardim II','2025-04-15 20:13:53','2025-04-15 20:13:53',NULL),(376,30,'10','Belo Buritis','2025-04-15 20:13:53','2025-04-15 20:13:53',NULL),(377,30,'11','Loteamento Herculano','2025-04-15 20:13:53','2025-04-15 20:13:53',NULL),(378,30,'12','Vila Belo Jardim','2025-04-15 20:13:53','2025-04-15 20:13:53',NULL),(379,30,'13','Vila Santa Cecília','2025-04-15 20:13:53','2025-04-15 20:13:53',NULL),(380,30,'14','Vila Albert Sampaio','2025-04-15 20:13:53','2025-04-15 20:13:53',NULL),(381,30,'15','Vila Liberdade','2025-04-15 20:13:53','2025-04-15 20:13:53',NULL),(382,30,'16','Santo Afonso','2025-04-15 20:13:53','2025-04-15 20:13:53',NULL),(383,30,'17','Recanto da Judia','2025-04-15 20:13:53','2025-04-15 20:13:53',NULL),(384,31,'1','06 de Agosto','2025-04-15 20:13:53','2025-04-15 20:13:53',NULL),(385,31,'2','Amapá','2025-04-15 20:13:53','2025-04-15 20:13:53',NULL),(386,31,'3','Cidade Nova','2025-04-15 20:13:53','2025-04-15 20:13:53',NULL),(387,31,'4','Comara','2025-04-15 20:13:53','2025-04-15 20:13:53',NULL),(388,31,'5','Loteamento Alzira Cruz','2025-04-15 20:13:53','2025-04-15 20:13:53',NULL),(389,31,'7','Bairro do Quinze','2025-04-15 20:13:53','2025-04-15 20:13:53',NULL),(390,31,'8','Taquari','2025-04-15 20:13:53','2025-04-15 20:13:53',NULL),(391,31,'9','Triângulo Novo','2025-04-15 20:13:53','2025-04-15 20:13:53',NULL),(392,31,'10','Triângulo Velho','2025-04-15 20:13:53','2025-04-15 20:13:53',NULL),(393,31,'11','Areal','2025-04-15 20:13:53','2025-04-15 20:13:53',NULL),(394,31,'12','Conjunto Canaã','2025-04-15 20:13:53','2025-04-15 20:13:53',NULL),(395,31,'13','Ramal Menino Jesus (Pólo)','2025-04-15 20:13:53','2025-04-15 20:13:53',NULL),(396,31,'14','Loteamento Girassol','2025-04-15 20:13:53','2025-04-15 20:13:53',NULL),(397,32,'1','Bairro 10 de Junho','2025-04-15 20:13:53','2025-04-15 20:13:53',NULL),(398,32,'2','Adalberto Aragão','2025-04-15 20:13:53','2025-04-15 20:13:53',NULL),(399,32,'3','Aviário','2025-04-15 20:13:53','2025-04-15 20:13:53',NULL),(400,32,'4','Baixa da Colina','2025-04-15 20:13:53','2025-04-15 20:13:53',NULL),(401,32,'5','Baixa da Habitasa','2025-04-15 20:13:53','2025-04-15 20:13:53',NULL),(402,32,'7','Cohab do Bosque','2025-04-15 20:13:53','2025-04-15 20:13:53',NULL),(403,32,'8','Baixa da Cadeia Velha','2025-04-15 20:13:53','2025-04-15 20:13:53',NULL),(404,32,'9','Capoeira','2025-04-15 20:13:53','2025-04-15 20:13:53',NULL),(405,32,'10','Cerâmica','2025-04-15 20:13:53','2025-04-15 20:13:53',NULL),(406,32,'11','Conjunto Jardim São Francisco','2025-04-15 20:13:53','2025-04-15 20:13:53',NULL),(407,32,'12','Dom Giocondo','2025-04-15 20:13:53','2025-04-15 20:13:53',NULL),(408,32,'13','Alegria','2025-04-15 20:13:53','2025-04-15 20:13:53',NULL),(409,32,'14','Jardim Tropical','2025-04-15 20:13:53','2025-04-15 20:13:53',NULL),(410,32,'15','Morada do Sol','2025-04-15 20:13:53','2025-04-15 20:13:53',NULL),(411,32,'16','Cadeia Velha (Do Varejão ao Senai)','2025-04-15 20:13:53','2025-04-15 20:13:53',NULL),(412,32,'17','Loteamento São José','2025-04-15 20:13:53','2025-04-15 20:13:53',NULL),(413,32,'18','Procon','2025-04-15 20:13:53','2025-04-15 20:13:53',NULL),(414,32,'19','Solar','2025-04-15 20:13:53','2025-04-15 20:13:53',NULL),(415,32,'20','Vila Ivonete','2025-04-15 20:13:53','2025-04-15 20:13:53',NULL),(416,32,'21','Bosque','2025-04-15 20:13:53','2025-04-15 20:13:53',NULL),(417,32,'22','José Augusto','2025-04-15 20:13:53','2025-04-15 20:13:53',NULL),(418,32,'23','Ipase','2025-04-15 20:13:53','2025-04-15 20:13:53',NULL),(419,32,'24','Guiomard Santos','2025-04-15 20:13:53','2025-04-15 20:13:53',NULL),(420,32,'25','Habitasa','2025-04-15 20:13:56','2025-04-15 20:13:56',NULL),(421,33,'1','Oscar Passos','2025-04-15 20:13:56','2025-04-15 20:13:56',NULL),(422,33,'2','Vitória','2025-04-15 20:13:56','2025-04-15 20:13:56',NULL),(423,33,'3','Novo Residencial Eldorado','2025-04-15 20:13:56','2025-04-15 20:13:56',NULL),(424,33,'4','Chico Mendes','2025-04-15 20:13:56','2025-04-15 20:13:56',NULL),(425,33,'5','Conjunto Mutambo','2025-04-15 20:13:56','2025-04-15 20:13:56',NULL),(426,33,'7','Novo Eldorado','2025-04-15 20:13:56','2025-04-15 20:13:56',NULL),(427,33,'8','Conjunto Angico','2025-04-15 20:13:56','2025-04-15 20:13:56',NULL),(428,33,'9','Placas','2025-04-15 20:13:56','2025-04-15 20:13:56',NULL),(429,33,'10','Loteamento Guanabara','2025-04-15 20:13:56','2025-04-15 20:13:56',NULL),(430,33,'11','Apolônio Sales','2025-04-15 20:13:56','2025-04-15 20:13:56',NULL),(431,33,'12','Loteamento Altamira','2025-04-15 20:13:56','2025-04-15 20:13:56',NULL),(432,33,'13','Loteamento São Francisco','2025-04-15 20:13:56','2025-04-15 20:13:56',NULL),(433,33,'14','Residencial Vale do Açai','2025-04-15 20:13:56','2025-04-15 20:13:56',NULL),(434,33,'15','Conjunto Ouricuri','2025-04-15 20:13:56','2025-04-15 20:13:56',NULL),(435,33,'16','Residencial Iaco','2025-04-15 20:13:56','2025-04-15 20:13:56',NULL),(436,33,'17','Conjunto Edson Cadaxo','2025-04-15 20:13:56','2025-04-15 20:13:56',NULL),(437,33,'18','Loteamento Jaguar','2025-04-15 20:13:56','2025-04-15 20:13:56',NULL),(438,33,'19','Residencial Andirá','2025-04-15 20:13:56','2025-04-15 20:13:56',NULL),(439,33,'20','Residencial São Jorge','2025-04-15 20:13:56','2025-04-15 20:13:56',NULL),(440,5,'1','Residencial Santa Cruz','2025-04-15 20:13:56','2025-04-15 20:13:56',NULL),(441,5,'2','Parque dos Sábias','2025-04-15 20:13:56','2025-04-15 20:13:56',NULL),(442,5,'3','Tancredo Neves','2025-04-15 20:13:56','2025-04-15 20:13:56',NULL),(443,5,'4','Jorge Lavocat','2025-04-15 20:13:56','2025-04-15 20:13:56',NULL),(444,5,'5','Defesa Civil','2025-04-15 20:13:56','2025-04-15 20:13:56',NULL),(445,5,'7','Montanhês','2025-04-15 20:13:56','2025-04-15 20:13:56',NULL),(446,5,'8','Conjunto Jarbas Passarinho','2025-04-15 20:13:56','2025-04-15 20:13:56',NULL),(447,5,'9','Adalberto Sena','2025-04-15 20:13:56','2025-04-15 20:13:56',NULL),(448,5,'10','Alto Alegre','2025-04-15 20:13:56','2025-04-15 20:13:56',NULL),(449,5,'11','Juarez Távora','2025-04-15 20:13:56','2025-04-15 20:13:56',NULL),(450,5,'12','Novo Horizonte','2025-04-15 20:13:56','2025-04-15 20:13:56',NULL),(451,5,'13','Raimundo Melo','2025-04-15 20:13:56','2025-04-15 20:13:56',NULL),(452,5,'14','Vila Nova','2025-04-15 20:13:56','2025-04-15 20:13:56',NULL),(453,5,'15','Xavier Maia','2025-04-15 20:13:56','2025-04-15 20:13:56',NULL),(454,5,'16','Loteamento Santo','2025-04-15 20:13:56','2025-04-15 20:13:56',NULL),(455,5,'17','Wanderley Dantas','2025-04-15 20:13:56','2025-04-15 20:13:56',NULL),(456,5,'18','Conjunto Mulateiro','2025-04-15 20:13:56','2025-04-15 20:13:56',NULL),(457,5,'19','Loteamento Dal Pascualy','2025-04-15 20:13:56','2025-04-15 20:13:56',NULL),(458,5,'20','Conjunto Genipapo','2025-04-15 20:13:56','2025-04-15 20:13:56',NULL),(459,5,'21','Caladinho','2025-04-15 20:13:56','2025-04-15 20:13:56',NULL),(460,5,'22','Loteamento Copacabana','2025-04-15 20:13:56','2025-04-15 20:13:56',NULL),(461,5,'23','Loteamento Céu Azul','2025-04-15 20:13:56','2025-04-15 20:13:56',NULL),(462,5,'24','Loteamento Santa Monica','2025-04-15 20:13:56','2025-04-15 20:13:56',NULL),(463,5,'25','Conjunto Copaiba','2025-04-15 20:13:56','2025-04-15 20:13:56',NULL),(464,5,'26','Conjunto Andiroba','2025-04-15 20:13:56','2025-04-15 20:13:56',NULL),(465,5,'27','Conjunto Macauã','2025-04-15 20:13:56','2025-04-15 20:13:56',NULL),(466,5,'28','Conjunto Andira','2025-04-15 20:13:56','2025-04-15 20:13:56',NULL),(467,34,'1','Tangara','2025-04-15 20:13:56','2025-04-15 20:13:56',NULL),(468,34,'2','Conjunto Universitario','2025-04-15 20:13:56','2025-04-15 20:13:56',NULL),(469,34,'3','Conquista','2025-04-15 20:13:56','2025-04-15 20:13:56',NULL),(470,34,'4','Custodio Freire','2025-04-15 20:13:56','2025-04-15 20:13:56',NULL),(471,34,'5','Estação Experimental','2025-04-15 20:13:56','2025-04-15 20:13:56',NULL),(472,34,'7','Jardim América','2025-04-15 20:13:56','2025-04-15 20:13:56',NULL),(473,34,'8','Isaura Parente ','2025-04-15 20:13:56','2025-04-15 20:13:56',NULL),(474,34,'9','Mocinha Magalhães ','2025-04-15 20:13:56','2025-04-15 20:13:56',NULL),(475,34,'10','Bairro da Paz ','2025-04-15 20:13:56','2025-04-15 20:13:56',NULL),(476,34,'11','Parque das Palmeiras ','2025-04-15 20:13:56','2025-04-15 20:13:56',NULL),(477,34,'12','Residencial Joafra ','2025-04-15 20:13:56','2025-04-15 20:13:56',NULL),(478,34,'13','Santa Quitéria ','2025-04-15 20:13:56','2025-04-15 20:13:56',NULL),(479,34,'14','Nova Estação','2025-04-15 20:13:56','2025-04-15 20:13:56',NULL),(480,34,'15','Conjunto Mariana ','2025-04-15 20:13:56','2025-04-15 20:13:56',NULL),(481,34,'16','Barro Vermelho','2025-04-15 20:13:56','2025-04-15 20:13:56',NULL),(482,34,'17','Conjunto Paulo Cesar','2025-04-15 20:13:56','2025-04-15 20:13:56',NULL),(483,34,'18','Conjunto Rui Lino','2025-04-15 20:13:56','2025-04-15 20:13:56',NULL),(484,34,'19','Distrito Industrial','2025-04-15 20:13:56','2025-04-15 20:13:56',NULL),(485,34,'20','Hélio Melo','2025-04-15 20:13:56','2025-04-15 20:13:56',NULL),(486,34,'21','Loteamento Isaura Parente','2025-04-15 20:13:56','2025-04-15 20:13:56',NULL),(487,34,'22','Conjunto Manoel Julião','2025-04-15 20:13:56','2025-04-15 20:13:56',NULL),(488,34,'23','Monte Alto','2025-04-15 20:13:56','2025-04-15 20:13:56',NULL),(489,34,'24','Residencial Vila Mariana','2025-04-15 20:13:56','2025-04-15 20:13:56',NULL),(490,34,'25','Residencial Iolanda','2025-04-15 20:13:56','2025-04-15 20:13:56',NULL),(491,34,'26','Residencial Petrópolis','2025-04-15 20:13:56','2025-04-15 20:13:56',NULL),(492,34,'27','Tucumã ','2025-04-15 20:13:56','2025-04-15 20:13:56',NULL),(493,34,'28','Santa Terezinha','2025-04-15 20:13:56','2025-04-15 20:13:56',NULL),(494,34,'29','Boa Esperança','2025-04-15 20:13:56','2025-04-15 20:13:56',NULL),(495,34,'30','Vila Aquiles Peret','2025-04-15 20:13:56','2025-04-15 20:13:56',NULL),(496,34,'31','Jardim Primavera','2025-04-15 20:13:56','2025-04-15 20:13:56',NULL),(497,34,'32','Loteamento dos Engenheiros  ','2025-04-15 20:13:56','2025-04-15 20:13:56',NULL),(498,34,'33','Loteamento Flora','2025-04-15 20:13:56','2025-04-15 20:13:56',NULL),(499,34,'34','Loteamento Jardim Brasil','2025-04-15 20:13:56','2025-04-15 20:13:56',NULL),(500,7,'1','Abrahão Alab','2025-04-15 20:13:56','2025-04-15 20:13:56',NULL),(501,7,'2','Castelo Branco','2025-04-15 20:13:56','2025-04-15 20:13:56',NULL),(502,7,'3','Conjunto Esperança I','2025-04-15 20:13:56','2025-04-15 20:13:56',NULL),(503,7,'4','Conjunto Esperança II','2025-04-15 20:13:56','2025-04-15 20:13:56',NULL),(504,7,'5','Conjunto Bela Vista','2025-04-15 20:13:56','2025-04-15 20:13:56',NULL),(505,7,'7','Novo Horizonte','2025-04-15 20:13:56','2025-04-15 20:13:56',NULL),(506,7,'8','Residencial Maria Iris','2025-04-15 20:13:56','2025-04-15 20:13:56',NULL),(507,7,'9','Conjunto Nova Esperança','2025-04-15 20:13:56','2025-04-15 20:13:56',NULL),(508,7,'10','Conjunto Habitar Brasil','2025-04-15 20:13:56','2025-04-15 20:13:56',NULL),(509,7,'11','Floresta Sul','2025-04-15 20:13:56','2025-04-15 20:13:56',NULL),(510,7,'12','Floresta Norte','2025-04-15 20:13:56','2025-04-15 20:13:56',NULL),(511,7,'13','Mascarenhas de Moraes','2025-04-15 20:13:56','2025-04-15 20:13:56',NULL),(512,7,'14','Jardim Alah ','2025-04-15 20:13:56','2025-04-15 20:13:56',NULL),(513,7,'15','Jardim Europa','2025-04-15 20:13:56','2025-04-15 20:13:56',NULL),(514,7,'16','Conjunto Esperança III','2025-04-15 20:13:56','2025-04-15 20:13:56',NULL),(515,7,'17','Betel II','2025-04-15 20:13:56','2025-04-15 20:13:56',NULL),(516,7,'18','Doca Furtado','2025-04-15 20:13:56','2025-04-15 20:13:56',NULL),(517,7,'19','Betel I (Osvaldo Amorim)','2025-04-15 20:13:56','2025-04-15 20:13:56',NULL),(518,7,'20','LBA','2025-04-15 20:13:56','2025-04-15 20:13:56',NULL),(519,7,'21','Loteamento Ana Rosa','2025-04-15 20:13:56','2025-04-15 20:13:56',NULL),(520,7,'22','Loteamento Antonio Macedo ','2025-04-15 20:13:57','2025-04-15 20:13:57',NULL),(521,35,'1','Conjunto Aroeira','2025-04-15 20:13:57','2025-04-15 20:13:57',NULL),(522,35,'2','Conjunto Israel Lira','2025-04-15 20:13:57','2025-04-15 20:13:57',NULL),(523,35,'3','Loteamento João Carlos','2025-04-15 20:13:57','2025-04-15 20:13:57',NULL),(524,35,'4','São Miguel','2025-04-15 20:13:57','2025-04-15 20:13:57',NULL),(525,35,'5','Ilson Ribeiro','2025-04-15 20:13:57','2025-04-15 20:13:57',NULL),(526,35,'7','Laélia Alcântara','2025-04-15 20:13:57','2025-04-15 20:13:57',NULL),(527,35,'8','Novo Conjunto Ilson Ribeiro','2025-04-15 20:13:57','2025-04-15 20:13:57',NULL),(528,35,'9','Conjunto Village Tiradentes','2025-04-15 20:13:57','2025-04-15 20:13:57',NULL),(529,35,'10','Waldemar Maciel ','2025-04-15 20:13:57','2025-04-15 20:13:57',NULL),(530,35,'11','Conjunto Itatiaia','2025-04-15 20:13:57','2025-04-15 20:13:57',NULL),(531,35,'12','Nova Morada','2025-04-15 20:13:57','2025-04-15 20:13:57',NULL),(532,35,'13','Conjunto Jequitibá','2025-04-15 20:13:57','2025-04-15 20:13:57',NULL),(533,35,'14','Loteamento Raimundo Maia','2025-04-15 20:13:57','2025-04-15 20:13:57',NULL),(534,35,'15','Novo Calafate','2025-04-15 20:13:57','2025-04-15 20:13:57',NULL),(535,35,'16','Pedro Roseno','2025-04-15 20:13:57','2025-04-15 20:13:57',NULL),(536,9,'1','Aeroporto Velho','2025-04-15 20:13:57','2025-04-15 20:13:57',NULL),(537,9,'2','Ayrton Sena','2025-04-15 20:13:57','2025-04-15 20:13:57',NULL),(538,9,'3','Bahia Nova ','2025-04-15 20:13:57','2025-04-15 20:13:57',NULL),(539,9,'4','Bahia Velha','2025-04-15 20:13:57','2025-04-15 20:13:57',NULL),(540,9,'5','Boa União','2025-04-15 20:13:57','2025-04-15 20:13:57',NULL),(541,9,'7','Glória','2025-04-15 20:13:57','2025-04-15 20:13:57',NULL),(542,9,'8','João Eduardo I','2025-04-15 20:13:57','2025-04-15 20:13:57',NULL),(543,9,'9','João Eduardo II','2025-04-15 20:13:57','2025-04-15 20:13:57',NULL),(544,9,'10','João Paulo I','2025-04-15 20:13:57','2025-04-15 20:13:57',NULL),(545,9,'11','Loteamento Santo Afonso I','2025-04-15 20:13:57','2025-04-15 20:13:57',NULL),(546,9,'12','Loteamento São Sebastião','2025-04-15 20:13:57','2025-04-15 20:13:57',NULL),(547,9,'13','Palheiral','2025-04-15 20:13:57','2025-04-15 20:13:57',NULL),(548,9,'14','Pista','2025-04-15 20:13:57','2025-04-15 20:13:57',NULL),(549,9,'15','Preventório','2025-04-15 20:13:57','2025-04-15 20:13:57',NULL),(550,9,'16','Plácido de Castro','2025-04-15 20:13:57','2025-04-15 20:13:57',NULL),(551,9,'17','Sobral','2025-04-15 20:13:57','2025-04-15 20:13:57',NULL),(552,9,'18','Conjunto de Castro','2025-04-15 20:13:57','2025-04-15 20:13:57',NULL),(553,9,'19','Conjunto Cabreúva','2025-04-15 20:13:57','2025-04-15 20:13:57',NULL),(554,36,'1','POLO WILSON PINHEIRO','2025-04-15 20:13:57','2025-04-15 20:13:57',NULL),(555,36,'2','POLO GERALDO MESQUITA','2025-04-15 20:13:57','2025-04-15 20:13:57',NULL),(556,36,'3','VILA MANOEL MARQUES','2025-04-15 20:13:57','2025-04-15 20:13:57',NULL),(557,36,'4','PA MORENO MAIA','2025-04-15 20:13:57','2025-04-15 20:13:57',NULL),(558,36,'5','COMUNIDADE ÁGUA PRETA','2025-04-15 20:13:57','2025-04-15 20:13:57',NULL),(559,36,'7','ESTRADA TRANSACREANA, KM 05 – RAMAL UNIÃO','2025-04-15 20:13:57','2025-04-15 20:13:57',NULL),(560,36,'8','COMUNIDADE UNIÃO FLORESTA','2025-04-15 20:13:57','2025-04-15 20:13:57',NULL),(561,37,'1','PA ITAMARATY RAMAL JARINAL','2025-04-15 20:13:57','2025-04-15 20:13:57',NULL),(562,37,'2','ESCONDIDO II RAMAL SABÓIA','2025-04-15 20:13:57','2025-04-15 20:13:57',NULL),(563,37,'3','RAMAL CENTRINHO','2025-04-15 20:13:57','2025-04-15 20:13:57',NULL),(564,37,'4','VILA VERDE','2025-04-15 20:13:57','2025-04-15 20:13:57',NULL),(565,37,'5','RAMAL DO BEIJA FLOR','2025-04-15 20:13:57','2025-04-15 20:13:57',NULL),(566,37,'7','RAMAL CASTANHEIRA','2025-04-15 20:13:57','2025-04-15 20:13:57',NULL),(567,37,'8','PA CARÃO , KM 52','2025-04-15 20:13:57','2025-04-15 20:13:57',NULL),(568,37,'9','PA CARÃO,KM 42','2025-04-15 20:13:57','2025-04-15 20:13:57',NULL),(569,37,'10','PA CARÃO,KM 40 ','2025-04-15 20:13:57','2025-04-15 20:13:57',NULL),(570,37,'11','PA CARÃO – RAMAL PRIMAVERA','2025-04-15 20:13:57','2025-04-15 20:13:57',NULL),(571,37,'12','PA CARÃO – RAMAL DA PELADEIRA KM 06','2025-04-15 20:13:57','2025-04-15 20:13:57',NULL),(572,37,'13','ESTRADA TRANSACREANA KM 91 – RAMAL DO ANTIMARY KM  ','2025-04-15 20:13:57','2025-04-15 20:13:57',NULL),(573,37,'14','RAMAL CENTRINHO','2025-04-15 20:13:57','2025-04-15 20:13:57',NULL),(574,37,'15',' RAMAL MAÇARANDUBA KM 06  ','2025-04-15 20:13:57','2025-04-15 20:13:57',NULL),(575,37,'16','RAMAL RIO BRANCO DA CAPELA KM 20','2025-04-15 20:13:57','2025-04-15 20:13:57',NULL),(576,37,'17','RAMAL DO ESPALHA KM 12','2025-04-15 20:13:57','2025-04-15 20:13:57',NULL),(577,37,'18','RAMAL DO VAI SE VER KM 18','2025-04-15 20:13:57','2025-04-15 20:13:57',NULL),(578,37,'19','PA ORIENTE KM 140','2025-04-15 20:13:57','2025-04-15 20:13:57',NULL),(579,37,'20','RAMAL OLHO D´ÁGUA KM 06','2025-04-15 20:13:57','2025-04-15 20:13:57',NULL),(580,37,'21','COMUNIDADE ITAMARATY II','2025-04-15 20:13:57','2025-04-15 20:13:57',NULL),(581,37,'22','ESTRADA TRANSACREANA KM 80','2025-04-15 20:13:57','2025-04-15 20:13:57',NULL),(582,12,'1','REGIONAIS TRANSACREANA I E II','2025-04-15 20:13:57','2025-04-15 20:13:57',NULL),(583,38,'1','ESTRADA DO QUIXADÁ','2025-04-15 20:13:57','2025-04-15 20:13:57',NULL),(584,38,'2','ESTRADA DO QUIXADÁ – RAMAL BOA ÁGUA','2025-04-15 20:13:57','2025-04-15 20:13:57',NULL),(585,38,'3','BR 364, KM 08 AO LADO DO AEROPORTO','2025-04-15 20:13:57','2025-04-15 20:13:57',NULL),(586,38,'4','ESTRADA JARBAS PASSARINHO','2025-04-15 20:13:57','2025-04-15 20:13:57',NULL),(587,38,'5','ESTRADA DO QUIXADÁ RAMAL DO LIMOEIRO','2025-04-15 20:13:57','2025-04-15 20:13:57',NULL),(588,38,'7','ESTRADA JARBAS PASSARINHO ,KM 06 RAMAL SÃO RAIMUNDO','2025-04-15 20:13:57','2025-04-15 20:13:57',NULL),(589,38,'8','AC, KM 20 – RAMAL SÃO PEDRO ','2025-04-15 20:13:57','2025-04-15 20:13:57',NULL),(590,38,'9','BR 364, KM 17 – CUSTÓDIO FREIRE RAMAL CASTANHETA ','2025-04-15 20:13:57','2025-04-15 20:13:57',NULL),(591,38,'10','ESTRADA AC 10, KM 19 – POLO GERALDO MESQUITA','2025-04-15 20:13:57','2025-04-15 20:13:57',NULL),(592,38,'11','BR 364, KM 08 – RAMAL DO ROMÃO KM 03','2025-04-15 20:13:57','2025-04-15 20:13:57',NULL),(593,38,'12','ESTRADA DO BARRO VERMELHO KM 09','2025-04-15 20:13:57','2025-04-15 20:13:57',NULL),(594,38,'13','ESTRADA DO QUIXADÁ KM 12 – RAMAL EXTREMA KM 03','2025-04-15 20:13:57','2025-04-15 20:13:57',NULL),(595,38,'14','BR 364,KM 06 – ESTRADA DO AEROPORTO ','2025-04-15 20:13:57','2025-04-15 20:13:57',NULL),(596,38,'15','ESTRADA DE PORTO ACRE,KM 14 – RAMAL SANTOS KM 10','2025-04-15 20:13:57','2025-04-15 20:13:57',NULL),(597,38,'16','ESTRADA DO PIRANJI','2025-04-15 20:13:57','2025-04-15 20:13:57',NULL),(598,38,'17','ESTRADA DE PORTO ACRE  - RAMAL MEDEIROS','2025-04-15 20:13:57','2025-04-15 20:13:57',NULL),(599,38,'18','ESTRADA DO LIMOEIRO – RAMAL ORIENTE','2025-04-15 20:13:57','2025-04-15 20:13:57',NULL),(600,38,'19','PA ORIENTE KM 140','2025-04-15 20:13:57','2025-04-15 20:13:57',NULL),(601,39,'1','BELO JARDIM I II III','2025-04-15 20:13:57','2025-04-15 20:13:57',NULL),(602,39,'2','RAMAL DO CLODOALDO','2025-04-15 20:13:57','2025-04-15 20:13:57',NULL),(603,39,'3','BENFICA – RAMAL PALHEIRA','2025-04-15 20:13:57','2025-04-15 20:13:57',NULL),(604,39,'4','ESTRADA DE BOCA DO ACRE','2025-04-15 20:13:57','2025-04-15 20:13:57',NULL),(605,39,'5','RAMAL DA ZEZÉ','2025-04-15 20:13:57','2025-04-15 20:13:57',NULL),(606,39,'7','RAMAL DO MOREIRA','2025-04-15 20:13:57','2025-04-15 20:13:57',NULL),(607,39,'8','RAMAL BENFICA','2025-04-15 20:13:57','2025-04-15 20:13:57',NULL),(608,39,'9','RAMAL GALILÉIA','2025-04-15 20:13:57','2025-04-15 20:13:57',NULL),(609,39,'10','ESTRADA DO AMAPÁ – RAMAL SANTA HELENA','2025-04-15 20:13:57','2025-04-15 20:13:57',NULL),(610,39,'11','RAMAL DO CACAU','2025-04-15 20:13:57','2025-04-15 20:13:57',NULL),(611,39,'12','RAMAL BELO JARDIM','2025-04-15 20:13:57','2025-04-15 20:13:57',NULL),(612,39,'13','ESTRADA DEBOCADO ACRE KM 25','2025-04-15 20:13:57','2025-04-15 20:13:57',NULL),(613,39,'14','ESTRADA DE BOCA DO ACRE KM 28','2025-04-15 20:13:57','2025-04-15 20:13:57',NULL),(614,39,'15','RAMAL ASTRO REIS','2025-04-15 20:13:57','2025-04-15 20:13:57',NULL),(615,39,'16','RAMAL BEIRA RIO','2025-04-15 20:13:57','2025-04-15 20:13:57',NULL),(616,39,'17','RAMAL SÃO JOSÉ','2025-04-15 20:13:57','2025-04-15 20:13:57',NULL),(617,39,'18','RAMAL DO BRÁZ','2025-04-15 20:13:57','2025-04-15 20:13:57',NULL),(618,39,'19','RAMAL DO PALHEIRA','2025-04-15 20:13:57','2025-04-15 20:13:57',NULL),(619,39,'20','RAMAL DA GARAPEIRA','2025-04-15 20:13:57','2025-04-15 20:13:57',NULL),(620,NULL,NULL,'Centro','2025-04-15 20:13:57','2025-04-15 20:13:57','Cruzeiro do Sul'),(621,NULL,NULL,'Aeroporto Velho','2025-04-15 20:13:57','2025-04-15 20:13:57','Cruzeiro do Sul'),(622,NULL,NULL,'Miritizal','2025-04-15 20:13:57','2025-04-15 20:13:57','Cruzeiro do Sul'),(623,NULL,NULL,'Boca da Alemanha','2025-04-15 20:13:57','2025-04-15 20:13:57','Cruzeiro do Sul'),(624,NULL,NULL,'Telégrafo','2025-04-15 20:13:57','2025-04-15 20:13:57','Cruzeiro do Sul'),(625,NULL,NULL,'Saboeiro','2025-04-15 20:13:57','2025-04-15 20:13:57','Cruzeiro do Sul'),(626,NULL,NULL,'São José','2025-04-15 20:13:57','2025-04-15 20:13:57','Cruzeiro do Sul'),(627,NULL,NULL,'Olivença','2025-04-15 20:13:57','2025-04-15 20:13:57','Cruzeiro do Sul'),(628,NULL,NULL,'Loteamento Fahat','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(629,NULL,NULL,'Santa Helena','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(630,NULL,NULL,'Major Mendonça','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(631,NULL,NULL,'Vila da Amizade (Loteamento Acauã)','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(632,NULL,NULL,'Vila Acre','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(633,NULL,NULL,'Ramal Bom Jesus (Vila Billar, Luiz Ângelo, Vila Boa Vontade, Ramal do Mineiro e Vila do Marcelo)','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(634,NULL,NULL,'Ramal Bom Futuro','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(635,NULL,NULL,'Vila Benfica','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(636,NULL,NULL,'Vila Jerusalém','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(637,NULL,NULL,'Santa Maria','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(638,NULL,NULL,'Itucumã','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(639,NULL,NULL,'Loteamento Mora Bem','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(640,NULL,NULL,'Loteamento Sol Nascente','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(641,NULL,NULL,'Beco Buritizal','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(642,NULL,NULL,'Recanto dos Buritis','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(643,NULL,NULL,'Santa Inês','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(644,NULL,NULL,'Recanto da Judia','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(645,NULL,NULL,'Jacarandá','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(646,NULL,NULL,'Conjunto Rosalina I','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(647,NULL,NULL,'Conjunto Rosalinda II','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(648,NULL,NULL,'Conjunto Rosalinda III','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(649,NULL,NULL,'Belo Jardim I','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(650,NULL,NULL,'Belo Jardim II','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(651,NULL,NULL,'Belo Buritis','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(652,NULL,NULL,'Loteamento Herculano','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(653,NULL,NULL,'Vila Belo Jardim','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(654,NULL,NULL,'Vila Santa Cecília','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(655,NULL,NULL,'Vila Albert Sampaio','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(656,NULL,NULL,'Vila Liberdade','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(657,NULL,NULL,'Santo Afonso','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(658,NULL,NULL,'Recanto da Judia','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(659,NULL,NULL,'06 de Agosto','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(660,NULL,NULL,'Amapá','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(661,NULL,NULL,'Cidade Nova','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(662,NULL,NULL,'Comara','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(663,NULL,NULL,'Loteamento Alzira Cruz','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(664,NULL,NULL,'Loteamento Praia do Amapá','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(665,NULL,NULL,'Bairro do Quinze','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(666,NULL,NULL,'Taquari','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(667,NULL,NULL,'Triângulo Novo','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(668,NULL,NULL,'Triângulo Velho','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(669,NULL,NULL,'Areal','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(670,NULL,NULL,'Conjunto Canaã','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(671,NULL,NULL,'Ramal Menino Jesus (Pólo)','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(672,NULL,NULL,'Loteamento Girassol','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(673,NULL,NULL,'Bairro 10 de Junho','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(674,NULL,NULL,'Adalberto Aragão','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(675,NULL,NULL,'Aviário','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(676,NULL,NULL,'Baixa da Colina','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(677,NULL,NULL,'Baixa da Habitasa','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(678,NULL,NULL,'Base','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(679,NULL,NULL,'Cohab do Bosque','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(680,NULL,NULL,'Baixa da Cadeia Velha','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(681,NULL,NULL,'Capoeira','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(682,NULL,NULL,'Cerâmica','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(683,NULL,NULL,'Conjunto Jardim São Francisco','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(684,NULL,NULL,'Dom Giocondo','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(685,NULL,NULL,'Alegria','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(686,NULL,NULL,'Jardim Tropical','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(687,NULL,NULL,'Morada do Sol','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(688,NULL,NULL,'Cadeia Velha (Do Varejão ao Senai)','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(689,NULL,NULL,'Loteamento São José','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(690,NULL,NULL,'Procon','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(691,NULL,NULL,'Solar','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(692,NULL,NULL,'Vila Ivonete','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(693,NULL,NULL,'Bosque','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(694,NULL,NULL,'José Augusto','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(695,NULL,NULL,'Ipase','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(696,NULL,NULL,'Guiomard Santos','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(697,NULL,NULL,'Habitasa','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(698,NULL,NULL,'Oscar Passos','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(699,NULL,NULL,'Vitória','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(700,NULL,NULL,'Novo Residencial Eldorado','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(701,NULL,NULL,'Chico Mendes','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(702,NULL,NULL,'Conjunto Mutambo','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(703,NULL,NULL,'Eldorado II','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(704,NULL,NULL,'Novo Eldorado','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(705,NULL,NULL,'Conjunto Angico','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(706,NULL,NULL,'Placas','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(707,NULL,NULL,'Loteamento Guanabara','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(708,NULL,NULL,'Apolônio Sales','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(709,NULL,NULL,'Loteamento Altamira','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(710,NULL,NULL,'Loteamento São Francisco','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(711,NULL,NULL,'Residencial Vale do Açai','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(712,NULL,NULL,'Conjunto Ouricuri','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(713,NULL,NULL,'Residencial Iaco','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(714,NULL,NULL,'Conjunto Edson Cadaxo','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(715,NULL,NULL,'Loteamento Jaguar','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(716,NULL,NULL,'Residencial Andirá','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(717,NULL,NULL,'Residencial São Jorge','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(718,NULL,NULL,'Residencial Santa Cruz','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(719,NULL,NULL,'Parque dos Sábias','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(720,NULL,NULL,'Tancredo Neves','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(721,NULL,NULL,'Jorge Lavocat','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(722,NULL,NULL,'Defesa Civil','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(723,NULL,NULL,'Irineu serra','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(724,NULL,NULL,'Montanhês','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(725,NULL,NULL,'Conjunto Jarbas Passarinho','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(726,NULL,NULL,'Adalberto Sena','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(727,NULL,NULL,'Alto Alegre','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(728,NULL,NULL,'Juarez Távora','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(729,NULL,NULL,'Novo Horizonte','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(730,NULL,NULL,'Raimundo Melo','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(731,NULL,NULL,'Vila Nova','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(732,NULL,NULL,'Xavier Maia','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(733,NULL,NULL,'Loteamento Santo','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(734,NULL,NULL,'Wanderley Dantas','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(735,NULL,NULL,'Conjunto Mulateiro','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(736,NULL,NULL,'Loteamento Dal Pascualy','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(737,NULL,NULL,'Conjunto Genipapo','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(738,NULL,NULL,'Caladinho','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(739,NULL,NULL,'Loteamento Copacabana','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(740,NULL,NULL,'Loteamento Céu Azul','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(741,NULL,NULL,'Loteamento Santa Monica','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(742,NULL,NULL,'Conjunto Copaiba','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(743,NULL,NULL,'Conjunto Andiroba','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(744,NULL,NULL,'Conjunto Macauã','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(745,NULL,NULL,'Conjunto Andira','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(746,NULL,NULL,'Tangara','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(747,NULL,NULL,'Conjunto Universitario','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(748,NULL,NULL,'Conquista','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(749,NULL,NULL,'Custodio Freire','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(750,NULL,NULL,'Estação Experimental','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(751,NULL,NULL,'Geraldo Fleming ','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(752,NULL,NULL,'Jardim América','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(753,NULL,NULL,'Isaura Parente ','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(754,NULL,NULL,'Mocinha Magalhães ','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(755,NULL,NULL,'Bairro da Paz ','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(756,NULL,NULL,'Parque das Palmeiras ','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(757,NULL,NULL,'Residencial Joafra ','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(758,NULL,NULL,'Santa Quitéria ','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(759,NULL,NULL,'Nova Estação','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(760,NULL,NULL,'Conjunto Mariana ','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(761,NULL,NULL,'Barro Vermelho','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(762,NULL,NULL,'Conjunto Paulo Cesar','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(763,NULL,NULL,'Conjunto Rui Lino','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(764,NULL,NULL,'Distrito Industrial','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(765,NULL,NULL,'Hélio Melo','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(766,NULL,NULL,'Loteamento Isaura Parente','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(767,NULL,NULL,'Conjunto Manoel Julião','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(768,NULL,NULL,'Monte Alto','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(769,NULL,NULL,'Residencial Vila Mariana','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(770,NULL,NULL,'Residencial Iolanda','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(771,NULL,NULL,'Residencial Petrópolis','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(772,NULL,NULL,'Tucumã ','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(773,NULL,NULL,'Santa Terezinha','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(774,NULL,NULL,'Boa Esperança','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(775,NULL,NULL,'Vila Aquiles Peret','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(776,NULL,NULL,'Jardim Primavera','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(777,NULL,NULL,'Loteamento dos Engenheiros  ','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(778,NULL,NULL,'Loteamento Flora','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(779,NULL,NULL,'Loteamento Jardim Brasil','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(780,NULL,NULL,'Abrahão Alab','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(781,NULL,NULL,'Castelo Branco','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(782,NULL,NULL,'Conjunto Esperança I','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(783,NULL,NULL,'Conjunto Esperança II','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(784,NULL,NULL,'Conjunto Bela Vista','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(785,NULL,NULL,'Ivete Vargas','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(786,NULL,NULL,'Novo Horizonte','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(787,NULL,NULL,'Residencial Maria Iris','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(788,NULL,NULL,'Conjunto Nova Esperança','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(789,NULL,NULL,'Conjunto Habitar Brasil','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(790,NULL,NULL,'Floresta Sul','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(791,NULL,NULL,'Floresta Norte','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(792,NULL,NULL,'Mascarenhas de Moraes','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(793,NULL,NULL,'Jardim Alah ','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(794,NULL,NULL,'Jardim Europa','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(795,NULL,NULL,'Conjunto Esperança III','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(796,NULL,NULL,'Betel II','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(797,NULL,NULL,'Doca Furtado','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(798,NULL,NULL,'Betel I (Osvaldo Amorim)','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(799,NULL,NULL,'LBA','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(800,NULL,NULL,'Loteamento Ana Rosa','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(801,NULL,NULL,'Loteamento Antonio Macedo ','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(802,NULL,NULL,'Conjunto Aroeira','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(803,NULL,NULL,'Conjunto Israel Lira','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(804,NULL,NULL,'Loteamento João Carlos','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(805,NULL,NULL,'São Miguel','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(806,NULL,NULL,'Ilson Ribeiro','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(807,NULL,NULL,'Portal da Amazônia I, II e III ','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(808,NULL,NULL,'Laélia Alcântara','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(809,NULL,NULL,'Novo Conjunto Ilson Ribeiro','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(810,NULL,NULL,'Conjunto Village Tiradentes','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(811,NULL,NULL,'Waldemar Maciel ','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(812,NULL,NULL,'Conjunto Itatiaia','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(813,NULL,NULL,'Nova Morada','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(814,NULL,NULL,'Conjunto Jequitibá','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(815,NULL,NULL,'Loteamento Raimundo Maia','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(816,NULL,NULL,'Novo Calafate','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(817,NULL,NULL,'Pedro Roseno','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(818,NULL,NULL,'Aeroporto Velho','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(819,NULL,NULL,'Ayrton Sena','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(820,NULL,NULL,'Bahia Nova ','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(821,NULL,NULL,'Bahia Velha','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(822,NULL,NULL,'Boa União','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(823,NULL,NULL,'Boa Vista','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(824,NULL,NULL,'Glória','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(825,NULL,NULL,'João Eduardo I','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(826,NULL,NULL,'João Eduardo II','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(827,NULL,NULL,'João Paulo I','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(828,NULL,NULL,'Loteamento Santo Afonso I','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(829,NULL,NULL,'Loteamento São Sebastião','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(830,NULL,NULL,'Palheiral','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(831,NULL,NULL,'Pista','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(832,NULL,NULL,'Preventório','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(833,NULL,NULL,'Plácido de Castro','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(834,NULL,NULL,'Sobral','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(835,NULL,NULL,'Conjunto de Castro','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(836,NULL,NULL,'Conjunto Cabreúva','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(837,NULL,NULL,'POLO WILSON PINHEIRO','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(838,NULL,NULL,'POLO GERALDO MESQUITA','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(839,NULL,NULL,'VILA MANOEL MARQUES','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(840,NULL,NULL,'PA MORENO MAIA','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(841,NULL,NULL,'COMUNIDADE ÁGUA PRETA','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(842,NULL,NULL,'BARRO ALTO','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(843,NULL,NULL,'ESTRADA TRANSACREANA, KM 05 – RAMAL UNIÃO','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(844,NULL,NULL,'COMUNIDADE UNIÃO FLORESTA','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(845,NULL,NULL,'PA ITAMARATY RAMAL JARINAL','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(846,NULL,NULL,'ESCONDIDO II RAMAL SABÓIA','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(847,NULL,NULL,'RAMAL CENTRINHO','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(848,NULL,NULL,'VILA VERDE','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(849,NULL,NULL,'RAMAL DO BEIJA FLOR','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(850,NULL,NULL,'RAMAL DO LIBERDADE KM 05','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(851,NULL,NULL,'RAMAL CASTANHEIRA','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(852,NULL,NULL,'PA CARÃO , KM 52','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(853,NULL,NULL,'PA CARÃO,KM 42','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(854,NULL,NULL,'PA CARÃO,KM 40 ','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(855,NULL,NULL,'PA CARÃO – RAMAL PRIMAVERA','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(856,NULL,NULL,'PA CARÃO – RAMAL DA PELADEIRA KM 06','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(857,NULL,NULL,'ESTRADA TRANSACREANA KM 91 – RAMAL DO ANTIMARY KM  ','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(858,NULL,NULL,'RAMAL CENTRINHO','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(859,NULL,NULL,' RAMAL MAÇARANDUBA KM 06  ','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(860,NULL,NULL,'RAMAL RIO BRANCO DA CAPELA KM 20','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(861,NULL,NULL,'RAMAL DO ESPALHA KM 12','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(862,NULL,NULL,'RAMAL DO VAI SE VER KM 18','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(863,NULL,NULL,'PA ORIENTE KM 140','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(864,NULL,NULL,'RAMAL OLHO D´ÁGUA KM 06','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(865,NULL,NULL,'COMUNIDADE ITAMARATY II','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(866,NULL,NULL,'ESTRADA TRANSACREANA KM 80','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(867,NULL,NULL,'REGIONAIS TRANSACREANA I E II','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(868,NULL,NULL,'ESTRADA DO QUIXADÁ','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(869,NULL,NULL,'ESTRADA DO QUIXADÁ – RAMAL BOA ÁGUA','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(870,NULL,NULL,'BR 364, KM 08 AO LADO DO AEROPORTO','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(871,NULL,NULL,'ESTRADA JARBAS PASSARINHO','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(872,NULL,NULL,'ESTRADA DO QUIXADÁ RAMAL DO LIMOEIRO','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(873,NULL,NULL,'ESTRADA DO SÃO FRANCISCO RAMAL PANORAMA KM 06 ','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(874,NULL,NULL,'ESTRADA JARBAS PASSARINHO ,KM 06 RAMAL SÃO RAIMUNDO','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(875,NULL,NULL,'AC, KM 20 – RAMAL SÃO PEDRO ','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(876,NULL,NULL,'BR 364, KM 17 – CUSTÓDIO FREIRE RAMAL CASTANHETA ','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(877,NULL,NULL,'ESTRADA AC 10, KM 19 – POLO GERALDO MESQUITA','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(878,NULL,NULL,'BR 364, KM 08 – RAMAL DO ROMÃO KM 03','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(879,NULL,NULL,'ESTRADA DO BARRO VERMELHO KM 09','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(880,NULL,NULL,'ESTRADA DO QUIXADÁ KM 12 – RAMAL EXTREMA KM 03','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(881,NULL,NULL,'BR 364,KM 06 – ESTRADA DO AEROPORTO ','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(882,NULL,NULL,'ESTRADA DE PORTO ACRE,KM 14 – RAMAL SANTOS KM 10','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(883,NULL,NULL,'ESTRADA DO PIRANJI','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(884,NULL,NULL,'ESTRADA DE PORTO ACRE  - RAMAL MEDEIROS','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(885,NULL,NULL,'ESTRADA DO LIMOEIRO – RAMAL ORIENTE','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(886,NULL,NULL,'PA ORIENTE KM 140','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(887,NULL,NULL,'BELO JARDIM I II III','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(888,NULL,NULL,'RAMAL DO CLODOALDO','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(889,NULL,NULL,'BENFICA – RAMAL PALHEIRA','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(890,NULL,NULL,'ESTRADA DE BOCA DO ACRE','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(891,NULL,NULL,'RAMAL DA ZEZÉ','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(892,NULL,NULL,'RODOVIA AC 40 RAMAL ITUCUMÃ','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(893,NULL,NULL,'RAMAL DO MOREIRA','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(894,NULL,NULL,'RAMAL BENFICA','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(895,NULL,NULL,'RAMAL GALILÉIA','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(896,NULL,NULL,'ESTRADA DO AMAPÁ – RAMAL SANTA HELENA','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(897,NULL,NULL,'RAMAL DO CACAU','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(898,NULL,NULL,'RAMAL BELO JARDIM','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(899,NULL,NULL,'ESTRADA DEBOCADO ACRE KM 25','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(900,NULL,NULL,'ESTRADA DE BOCA DO ACRE KM 28','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(901,NULL,NULL,'RAMAL ASTRO REIS','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(902,NULL,NULL,'RAMAL BEIRA RIO','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(903,NULL,NULL,'RAMAL SÃO JOSÉ','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(904,NULL,NULL,'RAMAL DO BRÁZ','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(905,NULL,NULL,'RAMAL DO PALHEIRA','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(906,NULL,NULL,'RAMAL DA GARAPEIRA','2025-04-15 20:13:57','2025-04-15 20:13:57','Rio Branco'),(907,NULL,NULL,'Centro','2025-04-15 20:13:57','2025-04-15 20:13:57','Sena Madureira'),(908,NULL,NULL,'Bom Sucesso','2025-04-15 20:13:57','2025-04-15 20:13:57','Sena Madureira'),(909,NULL,NULL,'Cristo Libertador','2025-04-15 20:13:57','2025-04-15 20:13:57','Sena Madureira'),(910,NULL,NULL,'São Francisco','2025-04-15 20:13:57','2025-04-15 20:13:57','Sena Madureira'),(911,NULL,NULL,'Pista','2025-04-15 20:13:57','2025-04-15 20:13:57','Sena Madureira'),(912,NULL,NULL,'Centro','2025-04-15 20:13:57','2025-04-15 20:13:57','Tarauacá'),(913,NULL,NULL,'Triângulo','2025-04-15 20:13:57','2025-04-15 20:13:57','Tarauacá'),(914,NULL,NULL,'Copacabana','2025-04-15 20:13:57','2025-04-15 20:13:57','Tarauacá'),(915,NULL,NULL,'Senador Pompeu','2025-04-15 20:13:57','2025-04-15 20:13:57','Tarauacá'),(916,NULL,NULL,'Aeroporto','2025-04-15 20:13:57','2025-04-15 20:13:57','Tarauacá'),(917,NULL,NULL,'Centro','2025-04-15 20:13:57','2025-04-15 20:13:57','Feijó'),(918,NULL,NULL,'Esperança','2025-04-15 20:13:57','2025-04-15 20:13:57','Feijó'),(919,NULL,NULL,'Geraldo Mesquita','2025-04-15 20:13:57','2025-04-15 20:13:57','Feijó'),(920,NULL,NULL,'Terminal','2025-04-15 20:13:57','2025-04-15 20:13:57','Feijó'),(921,NULL,NULL,'Centro','2025-04-15 20:13:57','2025-04-15 20:13:57','Brasiléia'),(922,NULL,NULL,'Eldorado','2025-04-15 20:13:57','2025-04-15 20:13:57','Brasiléia'),(923,NULL,NULL,'José Rabelo','2025-04-15 20:13:57','2025-04-15 20:13:57','Brasiléia'),(924,NULL,NULL,'Satélite','2025-04-15 20:13:57','2025-04-15 20:13:57','Brasiléia'),(925,NULL,NULL,'Centro','2025-04-15 20:13:57','2025-04-15 20:13:57','Epitaciolândia'),(926,NULL,NULL,'Beira Rio','2025-04-15 20:13:57','2025-04-15 20:13:57','Epitaciolândia'),(927,NULL,NULL,'Aeroporto','2025-04-15 20:13:57','2025-04-15 20:13:57','Epitaciolândia'),(928,NULL,NULL,'José Hassem','2025-04-15 20:13:57','2025-04-15 20:13:57','Epitaciolândia'),(929,NULL,NULL,'Centro','2025-04-15 20:13:57','2025-04-15 20:13:57','Xapuri'),(930,NULL,NULL,'Laranjal','2025-04-15 20:13:57','2025-04-15 20:13:57','Xapuri'),(931,NULL,NULL,'Bairro Braga Sobrinho','2025-04-15 20:13:57','2025-04-15 20:13:57','Xapuri'),(932,NULL,NULL,'Constantino','2025-04-15 20:13:57','2025-04-15 20:13:57','Xapuri'),(933,NULL,NULL,'Centro','2025-04-15 20:13:57','2025-04-15 20:13:57','Plácido de Castro'),(934,NULL,NULL,'Cidade Nova','2025-04-15 20:13:57','2025-04-15 20:13:57','Plácido de Castro'),(935,NULL,NULL,'Taquari','2025-04-15 20:13:57','2025-04-15 20:13:57','Plácido de Castro'),(936,NULL,NULL,'Centro','2025-04-15 20:13:57','2025-04-15 20:13:57','Senador Guiomard'),(937,NULL,NULL,'São Francisco','2025-04-15 20:13:57','2025-04-15 20:13:57','Senador Guiomard'),(938,NULL,NULL,'Quinari','2025-04-15 20:13:57','2025-04-15 20:13:57','Senador Guiomard'),(939,NULL,NULL,'Centro','2025-04-15 20:13:57','2025-04-15 20:13:57','Acrelândia'),(940,NULL,NULL,'Porto Acre','2025-04-15 20:13:57','2025-04-15 20:13:57','Acrelândia'),(941,NULL,NULL,'Planalto','2025-04-15 20:13:57','2025-04-15 20:13:57','Acrelândia'),(942,NULL,NULL,'Centro','2025-04-15 20:13:57','2025-04-15 20:13:57','Porto Acre'),(943,NULL,NULL,'Vila do Incra','2025-04-15 20:13:57','2025-04-15 20:13:57','Porto Acre'),(944,NULL,NULL,'Boca do Acre','2025-04-15 20:13:57','2025-04-15 20:13:57','Porto Acre'),(945,NULL,NULL,'Vila do V','2025-03-15 05:44:46','2025-03-15 05:44:46','Porto Acre'),(946,NULL,NULL,'Bairro Colmeia','2025-03-15 05:44:46','2025-03-15 05:44:46','Cruzeiro do Sul'),(947,NULL,NULL,'Nair Araújo','2025-03-15 05:44:46','2025-03-15 05:44:46','Feijó'),(948,1,'05','Cidade do Povo','2025-02-27 20:18:46','2025-02-27 20:18:46','Rio Branco'),(949,1,'05','GERALDO MESQUITA','2025-02-27 20:18:46','2025-02-27 20:18:46','Rio Branco'),(950,1,'05','Área RURAL ESTRADA DO AMAPA KM 04, 4000, AREA RURAL DE RIO\r\nBRANCO PRAIA DO AMAPA','2025-02-27 20:18:46','2025-02-27 20:18:46','Rio Branco'),(951,1,'05','VILA SANTA LUZIA ','2025-02-27 20:18:46','2025-02-27 20:18:46','Rio Branco'),(952,1,'05','VILA SANTA LUZIA','2025-02-27 20:18:46','2025-02-27 20:18:46','CRUZEIRO DO\r\nSUL'),(953,1,'05','VILA SANTA LUZIA','2025-02-27 20:18:46','2025-02-27 20:18:46','Cruzeiro do Sul'),(954,1,'05','ROSA LINDA','2025-02-27 20:18:46','2025-02-27 20:18:46','Rio Branco'),(955,1,'05','JOAO ALVES','2025-02-27 20:18:46','2025-02-27 20:18:46','Cruzeiro do Sul'),(956,1,'05','Cruzeiro do Sul','2025-02-27 20:18:46','2025-02-27 20:18:46','Cruzeiro do Sul'),(957,1,'05','RES JARBAS PASSARINHO','2025-02-27 20:18:46','2025-02-27 20:18:46','Rio Branco'),(958,NULL,NULL,'Centro',NULL,NULL,'Mancio Lima'),(959,NULL,NULL,'São Vidal',NULL,NULL,'Mancio Lima'),(960,NULL,NULL,'Zona Rural',NULL,NULL,'Mancio Lima');
/*!40000 ALTER TABLE `districts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `document_types`
--

DROP TABLE IF EXISTS `document_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `document_types` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `document_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `document_types`
--

LOCK TABLES `document_types` WRITE;
/*!40000 ALTER TABLE `document_types` DISABLE KEYS */;
INSERT INTO `document_types` VALUES (10,'Pessoal Obrigatório','2024-12-30 15:10:38','2024-12-30 15:10:38'),(11,'Documentos Obrigatório JWC','2024-12-30 15:11:01','2024-12-30 15:11:01'),(12,'RG','2025-02-17 22:39:02','2025-02-17 22:39:02'),(13,'CPF','2025-04-01 00:04:08','2025-04-01 00:04:08'),(14,'Admissão (Entrada do colaborador)','2025-04-03 00:14:03','2025-04-03 00:14:03'),(15,'Desligamento (Saída do colaborador)','2025-04-03 00:16:11','2025-04-03 00:16:11'),(16,'Rescisão Contratual (Fechamento oficial do vínculo)','2025-04-03 00:17:54','2025-04-03 00:17:54'),(17,'Resultado de Pericia','2025-06-11 04:48:39','2025-06-11 04:48:39'),(18,'Relatório de desempenho','2025-08-19 19:15:58','2025-08-19 19:15:58');
/*!40000 ALTER TABLE `document_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee_bank_accounts`
--

DROP TABLE IF EXISTS `employee_bank_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee_bank_accounts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `employee_id` bigint unsigned NOT NULL,
  `account_title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `account_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bank_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bank_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bank_branch` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `employee_bank_accounts_employee_id_foreign` (`employee_id`),
  CONSTRAINT `employee_bank_accounts_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_bank_accounts`
--

LOCK TABLES `employee_bank_accounts` WRITE;
/*!40000 ALTER TABLE `employee_bank_accounts` DISABLE KEYS */;
/*!40000 ALTER TABLE `employee_bank_accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee_contacts`
--

DROP TABLE IF EXISTS `employee_contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee_contacts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `employee_id` bigint unsigned NOT NULL,
  `relation_type_id` bigint unsigned NOT NULL DEFAULT '1',
  `is_primary` tinyint DEFAULT '0',
  `is_dependent` tinyint DEFAULT '0',
  `contact_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `work_phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `work_phone_ext` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `personal_phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `home_phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `work_email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `personal_email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address1` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `employee_contacts_employee_id_foreign` (`employee_id`),
  KEY `employee_contacts_relation_type_id_foreign` (`relation_type_id`),
  CONSTRAINT `employee_contacts_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE,
  CONSTRAINT `employee_contacts_relation_type_id_foreign` FOREIGN KEY (`relation_type_id`) REFERENCES `relation_types` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_contacts`
--

LOCK TABLES `employee_contacts` WRITE;
/*!40000 ALTER TABLE `employee_contacts` DISABLE KEYS */;
/*!40000 ALTER TABLE `employee_contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee_documents`
--

DROP TABLE IF EXISTS `employee_documents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee_documents` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `employee_id` bigint unsigned NOT NULL,
  `document_type_id` bigint unsigned DEFAULT NULL,
  `document_title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` mediumtext COLLATE utf8mb4_unicode_ci,
  `document_file` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `expiry_date` date NOT NULL,
  `is_notify` tinyint DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `employee_documents_employee_id_foreign` (`employee_id`),
  KEY `employee_documents_document_type_id_foreign` (`document_type_id`),
  CONSTRAINT `employee_documents_document_type_id_foreign` FOREIGN KEY (`document_type_id`) REFERENCES `document_types` (`id`) ON DELETE SET NULL,
  CONSTRAINT `employee_documents_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_documents`
--

LOCK TABLES `employee_documents` WRITE;
/*!40000 ALTER TABLE `employee_documents` DISABLE KEYS */;
/*!40000 ALTER TABLE `employee_documents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee_immigrations`
--

DROP TABLE IF EXISTS `employee_immigrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee_immigrations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `employee_id` bigint unsigned NOT NULL,
  `document_type_id` bigint unsigned DEFAULT NULL,
  `document_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `document_file` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `issue_date` date NOT NULL,
  `expiry_date` date DEFAULT NULL,
  `eligible_review_date` date DEFAULT NULL,
  `country_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `employee_immigrations_employee_id_foreign` (`employee_id`),
  KEY `employee_immigrations_document_type_id_foreign` (`document_type_id`),
  CONSTRAINT `employee_immigrations_document_type_id_foreign` FOREIGN KEY (`document_type_id`) REFERENCES `document_types` (`id`) ON DELETE SET NULL,
  CONSTRAINT `employee_immigrations_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_immigrations`
--

LOCK TABLES `employee_immigrations` WRITE;
/*!40000 ALTER TABLE `employee_immigrations` DISABLE KEYS */;
/*!40000 ALTER TABLE `employee_immigrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee_interview`
--

DROP TABLE IF EXISTS `employee_interview`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee_interview` (
  `interview_id` bigint unsigned NOT NULL,
  `employee_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`interview_id`,`employee_id`),
  KEY `employee_interview_employee_id_foreign` (`employee_id`),
  CONSTRAINT `employee_interview_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`),
  CONSTRAINT `employee_interview_interview_id_foreign` FOREIGN KEY (`interview_id`) REFERENCES `job_interviews` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_interview`
--

LOCK TABLES `employee_interview` WRITE;
/*!40000 ALTER TABLE `employee_interview` DISABLE KEYS */;
/*!40000 ALTER TABLE `employee_interview` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee_leave_type_details`
--

DROP TABLE IF EXISTS `employee_leave_type_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee_leave_type_details` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `employee_id` bigint unsigned NOT NULL,
  `leave_type_detail` longtext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `employee_leave_type_details_employee_id_foreign` (`employee_id`),
  CONSTRAINT `employee_leave_type_details_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=322 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_leave_type_details`
--

LOCK TABLES `employee_leave_type_details` WRITE;
/*!40000 ALTER TABLE `employee_leave_type_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `employee_leave_type_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee_meeting`
--

DROP TABLE IF EXISTS `employee_meeting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee_meeting` (
  `employee_id` bigint unsigned NOT NULL,
  `meeting_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`employee_id`,`meeting_id`),
  KEY `employee_meeting_meeting_id_foreign` (`meeting_id`),
  CONSTRAINT `employee_meeting_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE,
  CONSTRAINT `employee_meeting_meeting_id_foreign` FOREIGN KEY (`meeting_id`) REFERENCES `meetings` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_meeting`
--

LOCK TABLES `employee_meeting` WRITE;
/*!40000 ALTER TABLE `employee_meeting` DISABLE KEYS */;
/*!40000 ALTER TABLE `employee_meeting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee_project`
--

DROP TABLE IF EXISTS `employee_project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee_project` (
  `employee_id` bigint unsigned NOT NULL,
  `project_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`employee_id`,`project_id`),
  KEY `employee_project_project_id_foreign` (`project_id`),
  CONSTRAINT `employee_project_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE,
  CONSTRAINT `employee_project_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_project`
--

LOCK TABLES `employee_project` WRITE;
/*!40000 ALTER TABLE `employee_project` DISABLE KEYS */;
/*!40000 ALTER TABLE `employee_project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee_qualificaitons`
--

DROP TABLE IF EXISTS `employee_qualificaitons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee_qualificaitons` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `employee_id` bigint unsigned NOT NULL,
  `education_level_id` bigint unsigned DEFAULT NULL,
  `institution_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `from_year` date DEFAULT NULL,
  `to_year` date DEFAULT NULL,
  `language_skill_id` bigint unsigned DEFAULT NULL,
  `general_skill_id` bigint unsigned DEFAULT NULL,
  `description` mediumtext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `employee_qualificaitons_employee_id_foreign` (`employee_id`),
  KEY `employee_qualificaitons_education_level_id_foreign` (`education_level_id`),
  KEY `employee_qualificaitons_language_skill_id_foreign` (`language_skill_id`),
  KEY `employee_qualificaitons_general_skill_id_foreign` (`general_skill_id`),
  CONSTRAINT `employee_qualificaitons_education_level_id_foreign` FOREIGN KEY (`education_level_id`) REFERENCES `qualification_education_levels` (`id`) ON DELETE SET NULL,
  CONSTRAINT `employee_qualificaitons_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE,
  CONSTRAINT `employee_qualificaitons_general_skill_id_foreign` FOREIGN KEY (`general_skill_id`) REFERENCES `qualification_skills` (`id`) ON DELETE SET NULL,
  CONSTRAINT `employee_qualificaitons_language_skill_id_foreign` FOREIGN KEY (`language_skill_id`) REFERENCES `qualification_languages` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_qualificaitons`
--

LOCK TABLES `employee_qualificaitons` WRITE;
/*!40000 ALTER TABLE `employee_qualificaitons` DISABLE KEYS */;
/*!40000 ALTER TABLE `employee_qualificaitons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee_support_ticket`
--

DROP TABLE IF EXISTS `employee_support_ticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee_support_ticket` (
  `employee_id` bigint unsigned NOT NULL,
  `support_ticket_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`employee_id`,`support_ticket_id`),
  KEY `employee_support_ticket_support_ticket_id_foreign` (`support_ticket_id`),
  CONSTRAINT `employee_support_ticket_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE,
  CONSTRAINT `employee_support_ticket_support_ticket_id_foreign` FOREIGN KEY (`support_ticket_id`) REFERENCES `support_tickets` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_support_ticket`
--

LOCK TABLES `employee_support_ticket` WRITE;
/*!40000 ALTER TABLE `employee_support_ticket` DISABLE KEYS */;
/*!40000 ALTER TABLE `employee_support_ticket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee_task`
--

DROP TABLE IF EXISTS `employee_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee_task` (
  `employee_id` bigint unsigned NOT NULL,
  `task_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`employee_id`,`task_id`),
  KEY `employee_task_task_id_foreign` (`task_id`),
  CONSTRAINT `employee_task_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE,
  CONSTRAINT `employee_task_task_id_foreign` FOREIGN KEY (`task_id`) REFERENCES `tasks` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_task`
--

LOCK TABLES `employee_task` WRITE;
/*!40000 ALTER TABLE `employee_task` DISABLE KEYS */;
/*!40000 ALTER TABLE `employee_task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee_training_list`
--

DROP TABLE IF EXISTS `employee_training_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee_training_list` (
  `employee_id` bigint unsigned NOT NULL,
  `training_list_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`employee_id`,`training_list_id`),
  KEY `employee_training_list_training_list_id_foreign` (`training_list_id`),
  CONSTRAINT `employee_training_list_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE,
  CONSTRAINT `employee_training_list_training_list_id_foreign` FOREIGN KEY (`training_list_id`) REFERENCES `training_lists` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_training_list`
--

LOCK TABLES `employee_training_list` WRITE;
/*!40000 ALTER TABLE `employee_training_list` DISABLE KEYS */;
/*!40000 ALTER TABLE `employee_training_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee_work_experience`
--

DROP TABLE IF EXISTS `employee_work_experience`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee_work_experience` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `employee_id` bigint unsigned NOT NULL,
  `company_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `from_year` date DEFAULT NULL,
  `to_year` date DEFAULT NULL,
  `post` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` mediumtext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `employee_work_experience_employee_id_foreign` (`employee_id`),
  CONSTRAINT `employee_work_experience_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_work_experience`
--

LOCK TABLES `employee_work_experience` WRITE;
/*!40000 ALTER TABLE `employee_work_experience` DISABLE KEYS */;
/*!40000 ALTER TABLE `employee_work_experience` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employees` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `staff_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_no` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `gender` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `office_shift_id` bigint unsigned DEFAULT NULL,
  `company_id` bigint unsigned DEFAULT NULL,
  `department_id` bigint unsigned DEFAULT NULL,
  `designation_id` bigint unsigned DEFAULT NULL,
  `location_id` bigint unsigned DEFAULT NULL,
  `role_users_id` bigint unsigned DEFAULT NULL,
  `status_id` bigint unsigned DEFAULT NULL,
  `joining_date` date DEFAULT NULL,
  `exit_date` date DEFAULT NULL,
  `marital_status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci,
  `city` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip_code` varchar(24) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cv` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `skype_id` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fb_id` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `twitter_id` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `linkedIn_id` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `whatsapp_id` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `basic_salary` double DEFAULT '0',
  `payslip_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attendance_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pension_type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pension_amount` double(8,2) DEFAULT '0.00',
  `is_active` tinyint DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `area` enum('rural','urbana') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `latitude` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `longitude` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `district_id` bigint unsigned DEFAULT NULL,
  `is_physically_disabled` tinyint(1) DEFAULT NULL,
  `is_street_vendor` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `employees_office_shift_id_foreign` (`office_shift_id`),
  KEY `employees_company_id_foreign` (`company_id`),
  KEY `employees_department_id_foreign` (`department_id`),
  KEY `employees_designation_id_foreign` (`designation_id`),
  KEY `employees_location_id_foreign` (`location_id`),
  KEY `employees_role_users_id_foreign` (`role_users_id`),
  KEY `employees_status_id_foreign` (`status_id`),
  KEY `employees_district_id_foreign` (`district_id`),
  CONSTRAINT `employees_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `employees_department_id_foreign` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`) ON DELETE CASCADE,
  CONSTRAINT `employees_designation_id_foreign` FOREIGN KEY (`designation_id`) REFERENCES `designations` (`id`) ON DELETE CASCADE,
  CONSTRAINT `employees_district_id_foreign` FOREIGN KEY (`district_id`) REFERENCES `districts` (`id`),
  CONSTRAINT `employees_id_foreign` FOREIGN KEY (`id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `employees_location_id_foreign` FOREIGN KEY (`location_id`) REFERENCES `locations` (`id`) ON DELETE SET NULL,
  CONSTRAINT `employees_office_shift_id_foreign` FOREIGN KEY (`office_shift_id`) REFERENCES `office_shifts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `employees_role_users_id_foreign` FOREIGN KEY (`role_users_id`) REFERENCES `roles` (`id`) ON DELETE SET NULL,
  CONSTRAINT `employees_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=7452 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `events`
--

DROP TABLE IF EXISTS `events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `events` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `company_id` bigint unsigned NOT NULL,
  `department_id` bigint unsigned NOT NULL,
  `event_title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `event_note` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `event_date` date NOT NULL,
  `event_time` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_notify` tinyint DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `events_company_id_foreign` (`company_id`),
  KEY `events_department_id_foreign` (`department_id`),
  CONSTRAINT `events_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `events_department_id_foreign` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `events`
--

LOCK TABLES `events` WRITE;
/*!40000 ALTER TABLE `events` DISABLE KEYS */;
INSERT INTO `events` VALUES (3,1,1,'HNY','Test','2023-01-01','09:00PM','approved',NULL,'2023-01-01 07:05:27','2023-01-01 07:06:12'),(4,1,1,'Event Test','Test','2023-02-21','01:00AM','approved',NULL,'2023-02-09 05:06:43','2023-02-09 05:06:43');
/*!40000 ALTER TABLE `events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `expense_types`
--

DROP TABLE IF EXISTS `expense_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `expense_types` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `company_id` bigint unsigned DEFAULT NULL,
  `type` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `expense_types_company_id_foreign` (`company_id`),
  CONSTRAINT `expense_types_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `expense_types`
--

LOCK TABLES `expense_types` WRITE;
/*!40000 ALTER TABLE `expense_types` DISABLE KEYS */;
INSERT INTO `expense_types` VALUES (1,1,'utility','2020-07-26 20:22:56','2020-07-26 20:22:56'),(2,1,'supplies','2020-07-26 20:23:10','2020-07-26 20:23:10');
/*!40000 ALTER TABLE `expense_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `file_manager_settings`
--

DROP TABLE IF EXISTS `file_manager_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `file_manager_settings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `allowed_extensions` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `max_file_size` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `file_manager_settings`
--

LOCK TABLES `file_manager_settings` WRITE;
/*!40000 ALTER TABLE `file_manager_settings` DISABLE KEYS */;
INSERT INTO `file_manager_settings` VALUES (1,'jpg,png,doc,docx,pdf,csv,xls,jpeg',20,'2020-07-29 05:59:20','2020-07-29 05:59:20');
/*!40000 ALTER TABLE `file_manager_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `file_managers`
--

DROP TABLE IF EXISTS `file_managers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `file_managers` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `department_id` bigint unsigned DEFAULT NULL,
  `added_by` bigint unsigned DEFAULT NULL,
  `file_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_size` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_extension` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `external_link` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `file_managers_department_id_foreign` (`department_id`),
  KEY `file_managers_added_by_foreign` (`added_by`),
  CONSTRAINT `file_managers_added_by_foreign` FOREIGN KEY (`added_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `file_managers_department_id_foreign` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `file_managers`
--

LOCK TABLES `file_managers` WRITE;
/*!40000 ALTER TABLE `file_managers` DISABLE KEYS */;
INSERT INTO `file_managers` VALUES (1,1,1,'New','185.04 KB','pdf',NULL,'2020-07-29 06:01:33','2020-07-29 06:01:33');
/*!40000 ALTER TABLE `file_managers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `finance_bank_cashes`
--

DROP TABLE IF EXISTS `finance_bank_cashes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `finance_bank_cashes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `account_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `account_balance` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `initial_balance` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `account_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `branch_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bank_branch` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `finance_bank_cashes`
--

LOCK TABLES `finance_bank_cashes` WRITE;
/*!40000 ALTER TABLE `finance_bank_cashes` DISABLE KEYS */;
INSERT INTO `finance_bank_cashes` VALUES (1,'Central Bank','18117','50000','5635636','676','Ethopia','2020-07-28 17:17:21','2024-07-23 17:33:59'),(2,'New Horizon','144845','35000','5534677','453','Orchestra','2020-07-28 17:18:15','2024-07-23 17:15:46');
/*!40000 ALTER TABLE `finance_bank_cashes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `finance_deposits`
--

DROP TABLE IF EXISTS `finance_deposits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `finance_deposits` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `company_id` bigint unsigned DEFAULT NULL,
  `account_id` bigint unsigned DEFAULT NULL,
  `amount` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deposit_category_id` bigint unsigned NOT NULL DEFAULT '1',
  `description` mediumtext COLLATE utf8mb4_unicode_ci,
  `payment_method_id` bigint unsigned DEFAULT NULL,
  `payer_id` bigint unsigned DEFAULT NULL,
  `deposit_reference` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deposit_file` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deposit_date` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `finance_deposits_company_id_foreign` (`company_id`),
  KEY `finance_deposits_account_id_foreign` (`account_id`),
  KEY `finance_deposits_payment_method_id_foreign` (`payment_method_id`),
  KEY `finance_deposits_payer_id_foreign` (`payer_id`),
  KEY `finance_deposits_deposit_category_id_foreign` (`deposit_category_id`),
  CONSTRAINT `finance_deposits_account_id_foreign` FOREIGN KEY (`account_id`) REFERENCES `finance_bank_cashes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `finance_deposits_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `finance_deposits_deposit_category_id_foreign` FOREIGN KEY (`deposit_category_id`) REFERENCES `deposit_categories` (`id`),
  CONSTRAINT `finance_deposits_payer_id_foreign` FOREIGN KEY (`payer_id`) REFERENCES `finance_payers` (`id`) ON DELETE CASCADE,
  CONSTRAINT `finance_deposits_payment_method_id_foreign` FOREIGN KEY (`payment_method_id`) REFERENCES `payment_methods` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=120 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `finance_deposits`
--

LOCK TABLES `finance_deposits` WRITE;
/*!40000 ALTER TABLE `finance_deposits` DISABLE KEYS */;
INSERT INTO `finance_deposits` VALUES (1,NULL,1,'110500',1,'gfddds',3,1,'564534',NULL,'2021-03-28','2020-07-28 17:24:20','2020-07-28 17:26:37'),(5,NULL,2,'110500',1,NULL,1,2,'37763',NULL,'2021-03-27','2020-07-28 18:12:31','2020-07-29 05:28:25'),(111,NULL,1,'78',1,'khkhhk',1,1,'7878',NULL,'2024-02-13','2024-02-13 04:20:41','2024-02-13 04:20:41'),(118,NULL,2,'345',6,'Veniam in et volupt',2,1,'35435',NULL,'2024-07-17','2024-07-23 17:15:46','2024-07-23 17:15:46'),(119,NULL,1,'90',8,'Consequatur consequa',1,2,'uioj99',NULL,'2024-07-26','2024-07-23 17:16:23','2024-07-23 17:33:59');
/*!40000 ALTER TABLE `finance_deposits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `finance_expenses`
--

DROP TABLE IF EXISTS `finance_expenses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `finance_expenses` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `company_id` bigint unsigned DEFAULT NULL,
  `account_id` bigint unsigned DEFAULT NULL,
  `amount` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` bigint unsigned DEFAULT NULL,
  `description` mediumtext COLLATE utf8mb4_unicode_ci,
  `payment_method_id` bigint unsigned DEFAULT NULL,
  `payee_id` bigint unsigned DEFAULT NULL,
  `expense_reference` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expense_file` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `expense_date` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `finance_expenses_company_id_foreign` (`company_id`),
  KEY `finance_expenses_account_id_foreign` (`account_id`),
  KEY `finance_expenses_payment_method_id_foreign` (`payment_method_id`),
  KEY `finance_expenses_payee_id_foreign` (`payee_id`),
  KEY `finance_expenses_category_id_foreign` (`category_id`),
  CONSTRAINT `finance_expenses_account_id_foreign` FOREIGN KEY (`account_id`) REFERENCES `finance_bank_cashes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `finance_expenses_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `expense_types` (`id`) ON DELETE CASCADE,
  CONSTRAINT `finance_expenses_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `finance_expenses_payee_id_foreign` FOREIGN KEY (`payee_id`) REFERENCES `finance_payees` (`id`) ON DELETE CASCADE,
  CONSTRAINT `finance_expenses_payment_method_id_foreign` FOREIGN KEY (`payment_method_id`) REFERENCES `payment_methods` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=114 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `finance_expenses`
--

LOCK TABLES `finance_expenses` WRITE;
/*!40000 ALTER TABLE `finance_expenses` DISABLE KEYS */;
INSERT INTO `finance_expenses` VALUES (3,NULL,2,'3000',1,NULL,2,1,'455343',NULL,'2021-03-29','2020-07-28 17:45:41','2020-07-28 17:45:41'),(9,NULL,1,'20000',NULL,NULL,NULL,NULL,'Payroll',NULL,'2021-03-26','2020-07-29 07:20:58','2020-07-29 07:20:58'),(10,NULL,1,'1000',NULL,NULL,NULL,NULL,'Payroll',NULL,'2021-03-26','2020-07-29 07:38:34','2020-07-29 07:38:34'),(11,NULL,1,'1500',NULL,NULL,NULL,NULL,'Payroll',NULL,'2021-03-26','2020-07-29 09:11:51','2020-07-29 09:11:51'),(12,NULL,1,'1500',NULL,NULL,NULL,NULL,'Payroll',NULL,'2021-03-26','2020-07-29 09:33:49','2020-07-29 09:33:49'),(13,NULL,1,'2190',NULL,NULL,NULL,NULL,'Payroll',NULL,'2021-03-26','2020-07-29 18:25:19','2020-07-29 18:25:19'),(14,NULL,1,'1500',NULL,NULL,NULL,NULL,'Payroll',NULL,'2021-03-26','2020-07-29 19:08:48','2020-07-29 19:08:48'),(16,NULL,1,'310',NULL,NULL,NULL,NULL,'Payroll',NULL,'2021-03-26','2020-07-29 20:32:34','2020-07-29 20:32:34'),(19,NULL,1,'965',NULL,NULL,NULL,NULL,'Payroll',NULL,'2021-02-28','2020-10-15 06:27:00','2020-10-15 06:27:00'),(20,NULL,1,'310',NULL,NULL,NULL,NULL,'Payroll',NULL,'2021-02-28','2020-10-19 11:54:47','2020-10-19 11:54:47'),(21,NULL,1,'3690',NULL,NULL,NULL,NULL,'Payroll',NULL,'2021-01-24','2020-10-19 11:57:30','2020-10-19 11:57:30'),(22,NULL,1,'310',NULL,NULL,NULL,NULL,'Payroll',NULL,'2021-03-05','2021-03-05 12:49:44','2021-03-05 12:49:44'),(23,NULL,1,'49800',NULL,NULL,NULL,NULL,'Payroll',NULL,'2021-03-12','2021-03-12 06:18:02','2021-03-12 06:18:02'),(24,NULL,1,'110',NULL,NULL,NULL,NULL,'Payroll',NULL,'2021-03-12','2021-03-12 06:40:21','2021-03-12 06:40:21'),(25,NULL,1,'1705',NULL,NULL,NULL,NULL,'Payroll',NULL,'2021-03-12','2021-03-12 06:52:46','2021-03-12 06:52:46'),(26,NULL,1,'3880',NULL,NULL,NULL,NULL,'Payroll',NULL,'2021-03-12','2021-03-12 07:20:57','2021-03-12 07:20:57'),(27,NULL,1,'3880',NULL,NULL,NULL,NULL,'Payroll',NULL,'2021-03-12','2021-03-12 07:27:15','2021-03-12 07:27:15'),(28,NULL,1,'1110',NULL,NULL,NULL,NULL,'Payroll',NULL,'2021-03-12','2021-03-12 07:31:31','2021-03-12 07:31:31'),(29,NULL,1,'2590',NULL,NULL,NULL,NULL,'Payroll',NULL,'2021-03-12','2021-03-12 10:24:41','2021-03-12 10:24:41'),(30,NULL,1,'175',NULL,NULL,NULL,NULL,'Payroll',NULL,'2021-03-12','2021-03-12 10:26:26','2021-03-12 10:26:26'),(31,NULL,1,'110',NULL,NULL,NULL,NULL,'Payroll',NULL,'2021-03-12','2021-03-12 10:34:06','2021-03-12 10:34:06'),(32,NULL,1,'310',NULL,NULL,NULL,NULL,'Payroll',NULL,'2021-03-12','2021-03-12 11:03:09','2021-03-12 11:03:09'),(33,NULL,1,'2590',NULL,NULL,NULL,NULL,'Payroll',NULL,'2021-03-12','2021-03-12 11:27:41','2021-03-12 11:27:41'),(34,NULL,1,'0',NULL,NULL,NULL,NULL,'Payroll',NULL,'2021-03-12','2021-03-12 11:40:29','2021-03-12 11:40:29'),(35,NULL,1,'2305',NULL,NULL,NULL,NULL,'Payroll',NULL,'2021-03-12','2021-03-12 11:46:25','2021-03-12 11:46:25'),(36,NULL,1,'110',NULL,NULL,NULL,NULL,'Payroll',NULL,'2021-03-12','2021-03-12 13:03:55','2021-03-12 13:03:55'),(37,NULL,1,'660',NULL,NULL,NULL,NULL,'Payroll',NULL,'2021-03-12','2021-03-12 13:07:59','2021-03-12 13:07:59'),(38,NULL,1,'660',NULL,NULL,NULL,NULL,'Payroll',NULL,'2021-03-12','2021-03-12 13:08:48','2021-03-12 13:08:48'),(39,NULL,1,'420',NULL,NULL,NULL,NULL,'Payroll',NULL,'2021-03-12','2021-03-12 13:12:40','2021-03-12 13:12:40'),(40,NULL,1,'650',NULL,NULL,NULL,NULL,'Payroll',NULL,'2021-03-12','2021-03-12 13:16:06','2021-03-12 13:16:06'),(41,NULL,1,'310',NULL,NULL,NULL,NULL,'Payroll',NULL,'2021-03-12','2021-03-12 13:17:02','2021-03-12 13:17:02'),(42,NULL,1,'660',NULL,NULL,NULL,NULL,'Payroll',NULL,'2021-03-13','2021-03-13 10:07:03','2021-03-13 10:07:03'),(43,NULL,1,'0',NULL,NULL,NULL,NULL,'Payroll',NULL,'2021-03-13','2021-03-13 10:07:25','2021-03-13 10:07:25'),(44,NULL,1,'1490',NULL,NULL,NULL,NULL,'Payroll',NULL,'2021-03-20','2021-03-20 14:25:41','2021-03-20 14:25:41'),(45,NULL,1,'2090',NULL,NULL,NULL,NULL,'Payroll',NULL,'2021-03-20','2021-03-20 14:37:54','2021-03-20 14:37:54'),(46,NULL,1,'2090',NULL,NULL,NULL,NULL,'Payroll',NULL,'2021-03-22','2021-03-22 13:44:20','2021-03-22 13:44:20'),(47,NULL,1,'340',NULL,NULL,NULL,NULL,'Payroll',NULL,'2021-03-22','2021-03-22 14:30:06','2021-03-22 14:30:06'),(48,NULL,1,'175',NULL,NULL,NULL,NULL,'Payroll',NULL,'2021-03-22','2021-03-22 14:36:02','2021-03-22 14:36:02'),(49,NULL,1,'375',NULL,NULL,NULL,NULL,'Payroll',NULL,'2021-04-06','2021-04-06 03:31:41','2021-04-06 03:31:41'),(50,NULL,1,'110',NULL,NULL,NULL,NULL,'Payroll',NULL,'2021-04-06','2021-04-06 03:36:28','2021-04-06 03:36:28'),(51,NULL,1,'200',NULL,NULL,NULL,NULL,'Payroll',NULL,'2021-04-06','2021-04-06 05:07:42','2021-04-06 05:07:42'),(52,NULL,1,'775',NULL,NULL,NULL,NULL,'Payroll',NULL,'2021-04-08','2021-04-08 17:35:48','2021-04-08 17:35:48'),(53,NULL,1,'675',NULL,NULL,NULL,NULL,'Payroll',NULL,'2021-04-08','2021-04-08 17:36:12','2021-04-08 17:36:12'),(54,NULL,1,'675',NULL,NULL,NULL,NULL,'Payroll',NULL,'2021-04-09','2021-04-09 07:27:31','2021-04-09 07:27:31'),(55,NULL,1,'800',NULL,NULL,NULL,NULL,'Payroll',NULL,'2021-04-09','2021-04-09 07:29:25','2021-04-09 07:29:25'),(56,NULL,1,'1050',NULL,NULL,NULL,NULL,'Payroll',NULL,'2021-04-09','2021-04-09 16:48:46','2021-04-09 16:48:46'),(57,NULL,1,'950',NULL,NULL,NULL,NULL,'Payroll',NULL,'2021-04-10','2021-04-10 13:45:13','2021-04-10 13:45:13'),(58,NULL,1,'1050',NULL,NULL,NULL,NULL,'Payroll',NULL,'2021-04-10','2021-04-10 16:01:21','2021-04-10 16:01:21'),(59,NULL,1,'905',NULL,NULL,NULL,NULL,'Payroll',NULL,'2021-04-10','2021-04-10 17:06:06','2021-04-10 17:06:06'),(60,NULL,1,'1090',NULL,NULL,NULL,NULL,'Payroll',NULL,'2021-04-10','2021-04-10 17:07:24','2021-04-10 17:07:24'),(61,NULL,1,'990',NULL,NULL,NULL,NULL,'Payroll',NULL,'2021-04-11','2021-04-11 02:29:36','2021-04-11 02:29:36'),(62,NULL,1,'950',NULL,NULL,NULL,NULL,'Payroll',NULL,'2021-04-11','2021-04-11 02:49:48','2021-04-11 02:49:48'),(63,NULL,1,'83.333',NULL,NULL,NULL,NULL,'Payroll',NULL,'2021-04-11','2021-04-11 04:01:42','2021-04-11 04:01:42'),(64,NULL,1,'83.333',NULL,NULL,NULL,NULL,'Payroll',NULL,'2021-04-11','2021-04-11 04:03:00','2021-04-11 04:03:00'),(65,NULL,1,'83.333',NULL,NULL,NULL,NULL,'Payroll',NULL,'2021-04-11','2021-04-11 04:03:57','2021-04-11 04:03:57'),(66,NULL,1,'83.333',NULL,NULL,NULL,NULL,'Payroll',NULL,'2021-04-11','2021-04-11 04:11:40','2021-04-11 04:11:40'),(67,NULL,1,'715',NULL,NULL,NULL,NULL,'Payroll',NULL,'2021-04-11','2021-04-11 17:40:48','2021-04-11 17:40:48'),(68,NULL,1,'715',NULL,NULL,NULL,NULL,'Payroll',NULL,'2021-04-11','2021-04-11 17:52:03','2021-04-11 17:52:03'),(69,NULL,1,'605',NULL,NULL,NULL,NULL,'Payroll',NULL,'2021-04-12','2021-04-12 01:16:42','2021-04-12 01:16:42'),(70,NULL,1,'605',NULL,NULL,NULL,NULL,'Payroll',NULL,'2021-04-12','2021-04-12 01:19:09','2021-04-12 01:19:09'),(71,NULL,1,'1615',NULL,NULL,NULL,NULL,'Payroll',NULL,'2021-04-12','2021-04-12 17:33:37','2021-04-12 17:33:37'),(72,NULL,1,'215',NULL,NULL,NULL,NULL,'Payroll',NULL,'2021-04-12','2021-04-12 17:34:45','2021-04-12 17:34:45'),(73,NULL,1,'215',NULL,NULL,NULL,NULL,'Payroll',NULL,'2021-04-12','2021-04-12 17:35:23','2021-04-12 17:35:23'),(74,NULL,1,'215',NULL,NULL,NULL,NULL,'Payroll',NULL,'2021-04-12','2021-04-12 17:36:32','2021-04-12 17:36:32'),(75,NULL,1,'215',NULL,NULL,NULL,NULL,'Payroll',NULL,'2021-04-12','2021-04-12 17:36:32','2021-04-12 17:36:32'),(76,NULL,1,'85',NULL,NULL,NULL,NULL,'Payroll',NULL,'2021-04-13','2021-04-13 05:06:17','2021-04-13 05:06:17'),(77,NULL,1,'4055',NULL,NULL,NULL,NULL,'Payroll',NULL,'2021-04-13','2021-04-13 15:28:42','2021-04-13 15:28:42'),(78,NULL,1,'165',NULL,NULL,NULL,NULL,'Payroll',NULL,'2021-04-13','2021-04-13 15:36:59','2021-04-13 15:36:59'),(79,NULL,1,'410',NULL,NULL,NULL,NULL,'Payroll',NULL,'2021-04-14','2021-04-13 21:41:16','2021-04-13 21:41:16'),(82,NULL,1,'165',NULL,NULL,NULL,NULL,'Payroll',NULL,'2021-04-14','2021-04-14 16:15:33','2021-04-14 16:15:33'),(83,NULL,1,'75',NULL,NULL,NULL,NULL,'Payroll',NULL,'2021-04-14','2021-04-14 16:17:30','2021-04-14 16:17:30'),(84,NULL,1,'200',NULL,NULL,NULL,NULL,'Payroll',NULL,'2021-04-14','2021-04-14 16:37:09','2021-04-14 16:37:09'),(85,NULL,1,'275',NULL,NULL,NULL,NULL,'Payroll',NULL,'2021-04-15','2021-04-14 20:39:45','2021-04-14 20:39:45'),(86,NULL,1,'139',NULL,NULL,NULL,NULL,'Payroll',NULL,'2021-04-15','2021-04-14 21:07:53','2021-04-14 21:07:53'),(87,NULL,1,'740',NULL,NULL,NULL,NULL,'Payroll',NULL,'2021-07-03','2021-07-03 13:48:19','2021-07-03 13:48:19'),(88,NULL,1,'350',NULL,NULL,NULL,NULL,'Payroll',NULL,'2022-07-23','2022-07-23 08:15:27','2022-07-23 08:15:27'),(89,NULL,1,'70',NULL,NULL,NULL,NULL,'Payroll',NULL,'2022-10-18','2022-10-18 15:22:39','2022-10-18 15:22:39'),(90,NULL,1,'195',NULL,NULL,NULL,NULL,'Payroll',NULL,'2022-10-24','2022-10-24 06:59:00','2022-10-24 06:59:00'),(91,NULL,1,'195',NULL,NULL,NULL,NULL,'Payroll',NULL,'2022-10-24','2022-10-24 06:59:26','2022-10-24 06:59:26'),(92,NULL,1,'195',NULL,NULL,NULL,NULL,'Payroll',NULL,'2022-10-24','2022-10-24 07:02:13','2022-10-24 07:02:13'),(93,NULL,1,'205',NULL,NULL,NULL,NULL,'Payroll',NULL,'2022-10-24','2022-10-24 07:03:42','2022-10-24 07:03:42'),(94,NULL,1,'185',NULL,NULL,NULL,NULL,'Payroll',NULL,'2022-10-24','2022-10-24 07:13:06','2022-10-24 07:13:06'),(95,NULL,1,'185',NULL,NULL,NULL,NULL,'Payroll',NULL,'2022-10-24','2022-10-24 07:14:39','2022-10-24 07:14:39'),(96,NULL,1,'185',NULL,NULL,NULL,NULL,'Payroll',NULL,'2022-10-24','2022-10-24 07:16:11','2022-10-24 07:16:11'),(97,NULL,1,'185',NULL,NULL,NULL,NULL,'Payroll',NULL,'2022-10-24','2022-10-24 07:19:20','2022-10-24 07:19:20'),(98,NULL,1,'185',NULL,NULL,NULL,NULL,'Payroll',NULL,'2022-10-24','2022-10-24 07:19:55','2022-10-24 07:19:55'),(99,NULL,1,'185',NULL,NULL,NULL,NULL,'Payroll',NULL,'2022-10-24','2022-10-24 09:17:34','2022-10-24 09:17:34'),(100,NULL,1,'185',NULL,NULL,NULL,NULL,'Payroll',NULL,'2022-10-24','2022-10-24 09:18:13','2022-10-24 09:18:13'),(101,NULL,1,'195',NULL,NULL,NULL,NULL,'Payroll',NULL,'2022-10-24','2022-10-24 09:37:13','2022-10-24 09:37:13'),(102,NULL,1,'195',NULL,NULL,NULL,NULL,'Payroll',NULL,'2022-10-24','2022-10-24 09:37:26','2022-10-24 09:37:26'),(103,NULL,1,'195',NULL,NULL,NULL,NULL,'Payroll',NULL,'2022-10-25','2022-10-25 07:41:16','2022-10-25 07:41:16'),(104,NULL,1,'195',NULL,NULL,NULL,NULL,'Payroll',NULL,'2022-10-25','2022-10-25 07:41:53','2022-10-25 07:41:53'),(105,NULL,1,'205',NULL,NULL,NULL,NULL,'Payroll',NULL,'2022-10-25','2022-10-25 07:42:42','2022-10-25 07:42:42'),(106,NULL,1,'195',NULL,NULL,NULL,NULL,'Payroll',NULL,'2022-10-26','2022-10-26 09:16:28','2022-10-26 09:16:28'),(107,NULL,1,'195',NULL,NULL,NULL,NULL,'Payroll',NULL,'2022-10-26','2022-10-26 09:17:07','2022-10-26 09:17:07'),(108,NULL,1,'350',NULL,NULL,NULL,NULL,'Payroll',NULL,'2023-04-15','2023-04-15 05:18:37','2023-04-15 05:18:37'),(109,NULL,1,'55',NULL,NULL,NULL,NULL,'Payroll',NULL,'2023-04-15','2023-04-15 07:58:00','2023-04-15 07:58:00'),(110,NULL,1,'350',NULL,NULL,NULL,NULL,'Payroll',NULL,'2023-09-12','2023-09-12 04:39:31','2023-09-12 04:39:31'),(112,NULL,1,'20',NULL,NULL,NULL,NULL,'Payroll',NULL,'2024-04-25','2024-04-25 11:43:54','2024-04-25 11:43:54'),(113,NULL,1,'120',NULL,NULL,NULL,NULL,'Payroll',NULL,'2024-04-25','2024-04-25 11:47:33','2024-04-25 11:47:33');
/*!40000 ALTER TABLE `finance_expenses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `finance_payees`
--

DROP TABLE IF EXISTS `finance_payees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `finance_payees` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `payee_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_no` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `finance_payees`
--

LOCK TABLES `finance_payees` WRITE;
/*!40000 ALTER TABLE `finance_payees` DISABLE KEYS */;
INSERT INTO `finance_payees` VALUES (1,'Mr. A','563345','2020-07-28 17:22:13','2020-07-28 17:22:13'),(2,'Mr. B','5656353','2020-07-28 17:22:31','2020-07-28 17:22:31');
/*!40000 ALTER TABLE `finance_payees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `finance_payers`
--

DROP TABLE IF EXISTS `finance_payers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `finance_payers` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `payer_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_no` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `finance_payers`
--

LOCK TABLES `finance_payers` WRITE;
/*!40000 ALTER TABLE `finance_payers` DISABLE KEYS */;
INSERT INTO `finance_payers` VALUES (1,'Mr. X','34242','2020-07-28 17:23:01','2020-07-28 17:23:01'),(2,'Mr. Z','54563','2020-07-28 17:23:19','2020-07-28 17:23:19');
/*!40000 ALTER TABLE `finance_payers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `finance_transactions`
--

DROP TABLE IF EXISTS `finance_transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `finance_transactions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `company_id` bigint unsigned DEFAULT NULL,
  `account_id` bigint unsigned DEFAULT NULL,
  `amount` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` bigint unsigned DEFAULT NULL,
  `description` mediumtext COLLATE utf8mb4_unicode_ci,
  `payment_method_id` bigint unsigned DEFAULT NULL,
  `payee_id` bigint unsigned DEFAULT NULL,
  `payer_id` bigint unsigned DEFAULT NULL,
  `expense_reference` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `expense_file` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `expense_date` date DEFAULT NULL,
  `deposit_reference` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deposit_file` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deposit_date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `finance_transactions_company_id_foreign` (`company_id`),
  KEY `finance_transactions_account_id_foreign` (`account_id`),
  KEY `finance_transactions_payment_method_id_foreign` (`payment_method_id`),
  KEY `finance_transactions_payee_id_foreign` (`payee_id`),
  KEY `finance_transactions_payer_id_foreign` (`payer_id`),
  KEY `finance_transactions_category_id_foreign` (`category_id`),
  CONSTRAINT `finance_transactions_account_id_foreign` FOREIGN KEY (`account_id`) REFERENCES `finance_bank_cashes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `finance_transactions_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `expense_types` (`id`) ON DELETE CASCADE,
  CONSTRAINT `finance_transactions_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `finance_transactions_payee_id_foreign` FOREIGN KEY (`payee_id`) REFERENCES `finance_payees` (`id`) ON DELETE CASCADE,
  CONSTRAINT `finance_transactions_payer_id_foreign` FOREIGN KEY (`payer_id`) REFERENCES `finance_payers` (`id`) ON DELETE CASCADE,
  CONSTRAINT `finance_transactions_payment_method_id_foreign` FOREIGN KEY (`payment_method_id`) REFERENCES `payment_methods` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=120 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `finance_transactions`
--

LOCK TABLES `finance_transactions` WRITE;
/*!40000 ALTER TABLE `finance_transactions` DISABLE KEYS */;
INSERT INTO `finance_transactions` VALUES (1,NULL,1,'110500','interest income',NULL,'gfddds',3,NULL,1,NULL,NULL,NULL,'564534',NULL,'2021-03-28','2020-07-28 17:24:20','2020-07-28 17:26:37'),(3,NULL,2,'3000','',1,NULL,2,1,NULL,'455343',NULL,'2021-03-29',NULL,NULL,NULL,'2020-07-28 17:45:41','2020-07-28 17:45:41'),(5,NULL,2,'110500','interest income',NULL,NULL,1,NULL,2,NULL,NULL,NULL,'37763',NULL,'2021-03-27','2020-07-28 18:12:31','2020-07-29 05:28:25'),(6,NULL,2,'2000','transfer',NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,'6736',NULL,'2021-03-30','2020-07-29 05:36:41','2020-07-29 05:36:41'),(7,NULL,1,'2000','transfer',NULL,NULL,1,NULL,NULL,'6736',NULL,'2021-03-30',NULL,NULL,NULL,'2020-07-29 05:36:41','2020-07-29 05:36:41'),(9,NULL,1,'20000','',NULL,NULL,NULL,NULL,NULL,'Payroll',NULL,'2021-03-26',NULL,NULL,NULL,'2020-07-29 07:20:58','2020-07-29 07:20:58'),(10,NULL,1,'1000','',NULL,NULL,NULL,NULL,NULL,'Payroll',NULL,'2021-03-26',NULL,NULL,NULL,'2020-07-29 07:38:34','2020-07-29 07:38:34'),(11,NULL,1,'1500','',NULL,NULL,NULL,NULL,NULL,'Payroll',NULL,'2021-03-26',NULL,NULL,NULL,'2020-07-29 09:11:51','2020-07-29 09:11:51'),(12,NULL,1,'1500','',NULL,NULL,NULL,NULL,NULL,'Payroll',NULL,'2021-03-26',NULL,NULL,NULL,'2020-07-29 09:33:49','2020-07-29 09:33:49'),(13,NULL,1,'2190','',NULL,NULL,NULL,NULL,NULL,'Payroll',NULL,'2021-03-26',NULL,NULL,NULL,'2020-07-29 18:25:19','2020-07-29 18:25:19'),(14,NULL,1,'1500','',NULL,NULL,NULL,NULL,NULL,'Payroll',NULL,'2021-03-26',NULL,NULL,NULL,'2020-07-29 19:08:47','2020-07-29 19:08:47'),(16,NULL,1,'310','',NULL,NULL,NULL,NULL,NULL,'Payroll',NULL,'2021-03-26',NULL,NULL,NULL,'2020-07-29 20:32:34','2020-07-29 20:32:34'),(19,NULL,1,'965','',NULL,NULL,NULL,NULL,NULL,'Payroll',NULL,'2021-02-28',NULL,NULL,NULL,'2020-10-15 06:27:00','2020-10-15 06:27:00'),(20,NULL,1,'310','',NULL,NULL,NULL,NULL,NULL,'Payroll',NULL,'2021-02-28',NULL,NULL,NULL,'2020-10-19 11:54:47','2020-10-19 11:54:47'),(21,NULL,1,'3690','',NULL,NULL,NULL,NULL,NULL,'Payroll',NULL,'2021-01-24',NULL,NULL,NULL,'2020-10-19 11:57:30','2020-10-19 11:57:30'),(22,NULL,1,'310','',NULL,NULL,NULL,NULL,NULL,'Payroll',NULL,'2021-03-05',NULL,NULL,NULL,'2021-03-05 12:49:44','2021-03-05 12:49:44'),(23,NULL,1,'49800','',NULL,NULL,NULL,NULL,NULL,'Payroll',NULL,'2021-03-12',NULL,NULL,NULL,'2021-03-12 06:18:02','2021-03-12 06:18:02'),(24,NULL,1,'110','',NULL,NULL,NULL,NULL,NULL,'Payroll',NULL,'2021-03-12',NULL,NULL,NULL,'2021-03-12 06:40:21','2021-03-12 06:40:21'),(25,NULL,1,'1705','',NULL,NULL,NULL,NULL,NULL,'Payroll',NULL,'2021-03-12',NULL,NULL,NULL,'2021-03-12 06:52:46','2021-03-12 06:52:46'),(26,NULL,1,'3880','',NULL,NULL,NULL,NULL,NULL,'Payroll',NULL,'2021-03-12',NULL,NULL,NULL,'2021-03-12 07:20:57','2021-03-12 07:20:57'),(27,NULL,1,'3880','',NULL,NULL,NULL,NULL,NULL,'Payroll',NULL,'2021-03-12',NULL,NULL,NULL,'2021-03-12 07:27:15','2021-03-12 07:27:15'),(28,NULL,1,'1110','',NULL,NULL,NULL,NULL,NULL,'Payroll',NULL,'2021-03-12',NULL,NULL,NULL,'2021-03-12 07:31:31','2021-03-12 07:31:31'),(29,NULL,1,'2590','',NULL,NULL,NULL,NULL,NULL,'Payroll',NULL,'2021-03-12',NULL,NULL,NULL,'2021-03-12 10:24:41','2021-03-12 10:24:41'),(30,NULL,1,'175','',NULL,NULL,NULL,NULL,NULL,'Payroll',NULL,'2021-03-12',NULL,NULL,NULL,'2021-03-12 10:26:26','2021-03-12 10:26:26'),(31,NULL,1,'110','',NULL,NULL,NULL,NULL,NULL,'Payroll',NULL,'2021-03-12',NULL,NULL,NULL,'2021-03-12 10:34:06','2021-03-12 10:34:06'),(32,NULL,1,'310','',NULL,NULL,NULL,NULL,NULL,'Payroll',NULL,'2021-03-12',NULL,NULL,NULL,'2021-03-12 11:03:09','2021-03-12 11:03:09'),(33,NULL,1,'2590','',NULL,NULL,NULL,NULL,NULL,'Payroll',NULL,'2021-03-12',NULL,NULL,NULL,'2021-03-12 11:27:41','2021-03-12 11:27:41'),(34,NULL,1,'0','',NULL,NULL,NULL,NULL,NULL,'Payroll',NULL,'2021-03-12',NULL,NULL,NULL,'2021-03-12 11:40:29','2021-03-12 11:40:29'),(35,NULL,1,'2305','',NULL,NULL,NULL,NULL,NULL,'Payroll',NULL,'2021-03-12',NULL,NULL,NULL,'2021-03-12 11:46:24','2021-03-12 11:46:24'),(36,NULL,1,'110','',NULL,NULL,NULL,NULL,NULL,'Payroll',NULL,'2021-03-12',NULL,NULL,NULL,'2021-03-12 13:03:55','2021-03-12 13:03:55'),(37,NULL,1,'660','',NULL,NULL,NULL,NULL,NULL,'Payroll',NULL,'2021-03-12',NULL,NULL,NULL,'2021-03-12 13:07:59','2021-03-12 13:07:59'),(38,NULL,1,'660','',NULL,NULL,NULL,NULL,NULL,'Payroll',NULL,'2021-03-12',NULL,NULL,NULL,'2021-03-12 13:08:48','2021-03-12 13:08:48'),(39,NULL,1,'420','',NULL,NULL,NULL,NULL,NULL,'Payroll',NULL,'2021-03-12',NULL,NULL,NULL,'2021-03-12 13:12:40','2021-03-12 13:12:40'),(40,NULL,1,'650','',NULL,NULL,NULL,NULL,NULL,'Payroll',NULL,'2021-03-12',NULL,NULL,NULL,'2021-03-12 13:16:06','2021-03-12 13:16:06'),(41,NULL,1,'310','',NULL,NULL,NULL,NULL,NULL,'Payroll',NULL,'2021-03-12',NULL,NULL,NULL,'2021-03-12 13:17:02','2021-03-12 13:17:02'),(42,NULL,1,'660','',NULL,NULL,NULL,NULL,NULL,'Payroll',NULL,'2021-03-13',NULL,NULL,NULL,'2021-03-13 10:07:03','2021-03-13 10:07:03'),(43,NULL,1,'0','',NULL,NULL,NULL,NULL,NULL,'Payroll',NULL,'2021-03-13',NULL,NULL,NULL,'2021-03-13 10:07:25','2021-03-13 10:07:25'),(44,NULL,1,'1490','',NULL,NULL,NULL,NULL,NULL,'Payroll',NULL,'2021-03-20',NULL,NULL,NULL,'2021-03-20 14:25:41','2021-03-20 14:25:41'),(45,NULL,1,'2090','',NULL,NULL,NULL,NULL,NULL,'Payroll',NULL,'2021-03-20',NULL,NULL,NULL,'2021-03-20 14:37:54','2021-03-20 14:37:54'),(46,NULL,1,'2090','',NULL,NULL,NULL,NULL,NULL,'Payroll',NULL,'2021-03-22',NULL,NULL,NULL,'2021-03-22 13:44:20','2021-03-22 13:44:20'),(47,NULL,1,'340','',NULL,NULL,NULL,NULL,NULL,'Payroll',NULL,'2021-03-22',NULL,NULL,NULL,'2021-03-22 14:30:06','2021-03-22 14:30:06'),(48,NULL,1,'175','',NULL,NULL,NULL,NULL,NULL,'Payroll',NULL,'2021-03-22',NULL,NULL,NULL,'2021-03-22 14:36:02','2021-03-22 14:36:02'),(49,NULL,1,'375','',NULL,NULL,NULL,NULL,NULL,'Payroll',NULL,'2021-04-06',NULL,NULL,NULL,'2021-04-06 03:31:41','2021-04-06 03:31:41'),(50,NULL,1,'110','',NULL,NULL,NULL,NULL,NULL,'Payroll',NULL,'2021-04-06',NULL,NULL,NULL,'2021-04-06 03:36:28','2021-04-06 03:36:28'),(51,NULL,1,'200','',NULL,NULL,NULL,NULL,NULL,'Payroll',NULL,'2021-04-06',NULL,NULL,NULL,'2021-04-06 05:07:42','2021-04-06 05:07:42'),(52,NULL,1,'775','',NULL,NULL,NULL,NULL,NULL,'Payroll',NULL,'2021-04-08',NULL,NULL,NULL,'2021-04-08 17:35:47','2021-04-08 17:35:47'),(53,NULL,1,'675','',NULL,NULL,NULL,NULL,NULL,'Payroll',NULL,'2021-04-08',NULL,NULL,NULL,'2021-04-08 17:36:12','2021-04-08 17:36:12'),(54,NULL,1,'675','',NULL,NULL,NULL,NULL,NULL,'Payroll',NULL,'2021-04-09',NULL,NULL,NULL,'2021-04-09 07:27:31','2021-04-09 07:27:31'),(55,NULL,1,'800','',NULL,NULL,NULL,NULL,NULL,'Payroll',NULL,'2021-04-09',NULL,NULL,NULL,'2021-04-09 07:29:25','2021-04-09 07:29:25'),(56,NULL,1,'1050','',NULL,NULL,NULL,NULL,NULL,'Payroll',NULL,'2021-04-09',NULL,NULL,NULL,'2021-04-09 16:48:46','2021-04-09 16:48:46'),(57,NULL,1,'950','',NULL,NULL,NULL,NULL,NULL,'Payroll',NULL,'2021-04-10',NULL,NULL,NULL,'2021-04-10 13:45:13','2021-04-10 13:45:13'),(58,NULL,1,'1050','',NULL,NULL,NULL,NULL,NULL,'Payroll',NULL,'2021-04-10',NULL,NULL,NULL,'2021-04-10 16:01:21','2021-04-10 16:01:21'),(59,NULL,1,'905','',NULL,NULL,NULL,NULL,NULL,'Payroll',NULL,'2021-04-10',NULL,NULL,NULL,'2021-04-10 17:06:06','2021-04-10 17:06:06'),(60,NULL,1,'1090','',NULL,NULL,NULL,NULL,NULL,'Payroll',NULL,'2021-04-10',NULL,NULL,NULL,'2021-04-10 17:07:24','2021-04-10 17:07:24'),(61,NULL,1,'990','',NULL,NULL,NULL,NULL,NULL,'Payroll',NULL,'2021-04-11',NULL,NULL,NULL,'2021-04-11 02:29:36','2021-04-11 02:29:36'),(62,NULL,1,'950','',NULL,NULL,NULL,NULL,NULL,'Payroll',NULL,'2021-04-11',NULL,NULL,NULL,'2021-04-11 02:49:48','2021-04-11 02:49:48'),(63,NULL,1,'83.333','',NULL,NULL,NULL,NULL,NULL,'Payroll',NULL,'2021-04-11',NULL,NULL,NULL,'2021-04-11 04:01:42','2021-04-11 04:01:42'),(64,NULL,1,'83.333','',NULL,NULL,NULL,NULL,NULL,'Payroll',NULL,'2021-04-11',NULL,NULL,NULL,'2021-04-11 04:03:00','2021-04-11 04:03:00'),(65,NULL,1,'83.333','',NULL,NULL,NULL,NULL,NULL,'Payroll',NULL,'2021-04-11',NULL,NULL,NULL,'2021-04-11 04:03:57','2021-04-11 04:03:57'),(66,NULL,1,'83.333','',NULL,NULL,NULL,NULL,NULL,'Payroll',NULL,'2021-04-11',NULL,NULL,NULL,'2021-04-11 04:11:40','2021-04-11 04:11:40'),(67,NULL,1,'715','',NULL,NULL,NULL,NULL,NULL,'Payroll',NULL,'2021-04-11',NULL,NULL,NULL,'2021-04-11 17:40:47','2021-04-11 17:40:47'),(68,NULL,1,'715','',NULL,NULL,NULL,NULL,NULL,'Payroll',NULL,'2021-04-11',NULL,NULL,NULL,'2021-04-11 17:52:03','2021-04-11 17:52:03'),(69,NULL,1,'605','',NULL,NULL,NULL,NULL,NULL,'Payroll',NULL,'2021-04-12',NULL,NULL,NULL,'2021-04-12 01:16:41','2021-04-12 01:16:41'),(70,NULL,1,'605','',NULL,NULL,NULL,NULL,NULL,'Payroll',NULL,'2021-04-12',NULL,NULL,NULL,'2021-04-12 01:19:09','2021-04-12 01:19:09'),(71,NULL,1,'1615','',NULL,NULL,NULL,NULL,NULL,'Payroll',NULL,'2021-04-12',NULL,NULL,NULL,'2021-04-12 17:33:37','2021-04-12 17:33:37'),(72,NULL,1,'215','',NULL,NULL,NULL,NULL,NULL,'Payroll',NULL,'2021-04-12',NULL,NULL,NULL,'2021-04-12 17:34:45','2021-04-12 17:34:45'),(73,NULL,1,'215','',NULL,NULL,NULL,NULL,NULL,'Payroll',NULL,'2021-04-12',NULL,NULL,NULL,'2021-04-12 17:35:23','2021-04-12 17:35:23'),(74,NULL,1,'215','',NULL,NULL,NULL,NULL,NULL,'Payroll',NULL,'2021-04-12',NULL,NULL,NULL,'2021-04-12 17:36:32','2021-04-12 17:36:32'),(75,NULL,1,'215','',NULL,NULL,NULL,NULL,NULL,'Payroll',NULL,'2021-04-12',NULL,NULL,NULL,'2021-04-12 17:36:32','2021-04-12 17:36:32'),(76,NULL,1,'85','',NULL,NULL,NULL,NULL,NULL,'Payroll',NULL,'2021-04-13',NULL,NULL,NULL,'2021-04-13 05:06:17','2021-04-13 05:06:17'),(77,NULL,1,'4055','',NULL,NULL,NULL,NULL,NULL,'Payroll',NULL,'2021-04-13',NULL,NULL,NULL,'2021-04-13 15:28:42','2021-04-13 15:28:42'),(78,NULL,1,'165','',NULL,NULL,NULL,NULL,NULL,'Payroll',NULL,'2021-04-13',NULL,NULL,NULL,'2021-04-13 15:36:59','2021-04-13 15:36:59'),(79,NULL,1,'410','',NULL,NULL,NULL,NULL,NULL,'Payroll',NULL,'2021-04-14',NULL,NULL,NULL,'2021-04-13 21:41:16','2021-04-13 21:41:16'),(82,NULL,1,'165','',NULL,NULL,NULL,NULL,NULL,'Payroll',NULL,'2021-04-14',NULL,NULL,NULL,'2021-04-14 16:15:33','2021-04-14 16:15:33'),(83,NULL,1,'75','',NULL,NULL,NULL,NULL,NULL,'Payroll',NULL,'2021-04-14',NULL,NULL,NULL,'2021-04-14 16:17:30','2021-04-14 16:17:30'),(84,NULL,1,'200','',NULL,NULL,NULL,NULL,NULL,'Payroll',NULL,'2021-04-14',NULL,NULL,NULL,'2021-04-14 16:37:09','2021-04-14 16:37:09'),(85,NULL,1,'275','',NULL,NULL,NULL,NULL,NULL,'Payroll',NULL,'2021-04-15',NULL,NULL,NULL,'2021-04-14 20:39:45','2021-04-14 20:39:45'),(86,NULL,1,'139','',NULL,NULL,NULL,NULL,NULL,'Payroll',NULL,'2021-04-15',NULL,NULL,NULL,'2021-04-14 21:07:53','2021-04-14 21:07:53'),(87,NULL,1,'740','',NULL,NULL,NULL,NULL,NULL,'Payroll',NULL,'2021-07-03',NULL,NULL,NULL,'2021-07-03 13:48:19','2021-07-03 13:48:19'),(88,NULL,1,'350','',NULL,NULL,NULL,NULL,NULL,'Payroll',NULL,'2022-07-23',NULL,NULL,NULL,'2022-07-23 08:15:27','2022-07-23 08:15:27'),(89,NULL,1,'70','',NULL,NULL,NULL,NULL,NULL,'Payroll',NULL,'2022-10-18',NULL,NULL,NULL,'2022-10-18 15:22:39','2022-10-18 15:22:39'),(90,NULL,1,'195','',NULL,NULL,NULL,NULL,NULL,'Payroll',NULL,'2022-10-24',NULL,NULL,NULL,'2022-10-24 06:59:00','2022-10-24 06:59:00'),(91,NULL,1,'195','',NULL,NULL,NULL,NULL,NULL,'Payroll',NULL,'2022-10-24',NULL,NULL,NULL,'2022-10-24 06:59:26','2022-10-24 06:59:26'),(92,NULL,1,'195','',NULL,NULL,NULL,NULL,NULL,'Payroll',NULL,'2022-10-24',NULL,NULL,NULL,'2022-10-24 07:02:13','2022-10-24 07:02:13'),(93,NULL,1,'205','',NULL,NULL,NULL,NULL,NULL,'Payroll',NULL,'2022-10-24',NULL,NULL,NULL,'2022-10-24 07:03:42','2022-10-24 07:03:42'),(94,NULL,1,'185','',NULL,NULL,NULL,NULL,NULL,'Payroll',NULL,'2022-10-24',NULL,NULL,NULL,'2022-10-24 07:13:06','2022-10-24 07:13:06'),(95,NULL,1,'185','',NULL,NULL,NULL,NULL,NULL,'Payroll',NULL,'2022-10-24',NULL,NULL,NULL,'2022-10-24 07:14:39','2022-10-24 07:14:39'),(96,NULL,1,'185','',NULL,NULL,NULL,NULL,NULL,'Payroll',NULL,'2022-10-24',NULL,NULL,NULL,'2022-10-24 07:16:11','2022-10-24 07:16:11'),(97,NULL,1,'185','',NULL,NULL,NULL,NULL,NULL,'Payroll',NULL,'2022-10-24',NULL,NULL,NULL,'2022-10-24 07:19:20','2022-10-24 07:19:20'),(98,NULL,1,'185','',NULL,NULL,NULL,NULL,NULL,'Payroll',NULL,'2022-10-24',NULL,NULL,NULL,'2022-10-24 07:19:55','2022-10-24 07:19:55'),(99,NULL,1,'185','',NULL,NULL,NULL,NULL,NULL,'Payroll',NULL,'2022-10-24',NULL,NULL,NULL,'2022-10-24 09:17:34','2022-10-24 09:17:34'),(100,NULL,1,'185','',NULL,NULL,NULL,NULL,NULL,'Payroll',NULL,'2022-10-24',NULL,NULL,NULL,'2022-10-24 09:18:13','2022-10-24 09:18:13'),(101,NULL,1,'195','',NULL,NULL,NULL,NULL,NULL,'Payroll',NULL,'2022-10-24',NULL,NULL,NULL,'2022-10-24 09:37:13','2022-10-24 09:37:13'),(102,NULL,1,'195','',NULL,NULL,NULL,NULL,NULL,'Payroll',NULL,'2022-10-24',NULL,NULL,NULL,'2022-10-24 09:37:26','2022-10-24 09:37:26'),(103,NULL,1,'195','',NULL,NULL,NULL,NULL,NULL,'Payroll',NULL,'2022-10-25',NULL,NULL,NULL,'2022-10-25 07:41:16','2022-10-25 07:41:16'),(104,NULL,1,'195','',NULL,NULL,NULL,NULL,NULL,'Payroll',NULL,'2022-10-25',NULL,NULL,NULL,'2022-10-25 07:41:53','2022-10-25 07:41:53'),(105,NULL,1,'205','',NULL,NULL,NULL,NULL,NULL,'Payroll',NULL,'2022-10-25',NULL,NULL,NULL,'2022-10-25 07:42:42','2022-10-25 07:42:42'),(106,NULL,1,'195','',NULL,NULL,NULL,NULL,NULL,'Payroll',NULL,'2022-10-26',NULL,NULL,NULL,'2022-10-26 09:16:28','2022-10-26 09:16:28'),(107,NULL,1,'195','',NULL,NULL,NULL,NULL,NULL,'Payroll',NULL,'2022-10-26',NULL,NULL,NULL,'2022-10-26 09:17:07','2022-10-26 09:17:07'),(108,NULL,1,'350','',NULL,NULL,NULL,NULL,NULL,'Payroll',NULL,'2023-04-15',NULL,NULL,NULL,'2023-04-15 05:18:37','2023-04-15 05:18:37'),(109,NULL,1,'55','',NULL,NULL,NULL,NULL,NULL,'Payroll',NULL,'2023-04-15',NULL,NULL,NULL,'2023-04-15 07:58:00','2023-04-15 07:58:00'),(110,NULL,1,'350','',NULL,NULL,NULL,NULL,NULL,'Payroll',NULL,'2023-09-12',NULL,NULL,NULL,'2023-09-12 04:39:31','2023-09-12 04:39:31'),(111,NULL,1,'78','Envato',NULL,'khkhhk',1,NULL,1,NULL,NULL,NULL,'7878',NULL,'2024-02-13','2024-02-13 04:20:41','2024-02-13 04:20:41'),(112,NULL,1,'20','',NULL,NULL,NULL,NULL,NULL,'Payroll',NULL,'2024-04-25',NULL,NULL,NULL,'2024-04-25 11:43:54','2024-04-25 11:43:54'),(113,NULL,1,'120','',NULL,NULL,NULL,NULL,NULL,'Payroll',NULL,'2024-04-25',NULL,NULL,NULL,'2024-04-25 11:47:33','2024-04-25 11:47:33'),(118,NULL,2,'345','',NULL,'Veniam in et volupt',2,NULL,1,NULL,NULL,NULL,'35435',NULL,'2024-07-17','2024-07-23 17:15:46','2024-07-23 17:15:46'),(119,NULL,1,'90','',NULL,'Consequatur consequa',1,NULL,2,NULL,NULL,NULL,'uioj99',NULL,'2024-07-26','2024-07-23 17:16:23','2024-07-23 17:16:23');
/*!40000 ALTER TABLE `finance_transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `finance_transfers`
--

DROP TABLE IF EXISTS `finance_transfers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `finance_transfers` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `company_id` bigint unsigned DEFAULT NULL,
  `from_account_id` bigint unsigned DEFAULT NULL,
  `to_account_id` bigint unsigned DEFAULT NULL,
  `amount` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` mediumtext COLLATE utf8mb4_unicode_ci,
  `payment_method_id` bigint unsigned DEFAULT NULL,
  `date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `finance_transfers_company_id_foreign` (`company_id`),
  KEY `finance_transfers_from_account_id_foreign` (`from_account_id`),
  KEY `finance_transfers_to_account_id_foreign` (`to_account_id`),
  KEY `finance_transfers_payment_method_id_foreign` (`payment_method_id`),
  CONSTRAINT `finance_transfers_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `finance_transfers_from_account_id_foreign` FOREIGN KEY (`from_account_id`) REFERENCES `finance_bank_cashes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `finance_transfers_payment_method_id_foreign` FOREIGN KEY (`payment_method_id`) REFERENCES `payment_methods` (`id`) ON DELETE CASCADE,
  CONSTRAINT `finance_transfers_to_account_id_foreign` FOREIGN KEY (`to_account_id`) REFERENCES `finance_bank_cashes` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `finance_transfers`
--

LOCK TABLES `finance_transfers` WRITE;
/*!40000 ALTER TABLE `finance_transfers` DISABLE KEYS */;
INSERT INTO `finance_transfers` VALUES (1,NULL,1,2,'2000','6736',NULL,1,'2021-03-30','2020-07-29 05:36:41','2020-07-29 05:36:41');
/*!40000 ALTER TABLE `finance_transfers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `general_settings`
--

DROP TABLE IF EXISTS `general_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `general_settings` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `site_title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `site_logo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `time_zone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency_format` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `default_payment_bank` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_format` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `theme` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `footer` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `footer_link` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `general_settings`
--

LOCK TABLES `general_settings` WRITE;
/*!40000 ALTER TABLE `general_settings` DISABLE KEYS */;
INSERT INTO `general_settings` VALUES (1,'Gestão de RH/DP - NP+','logo.png','America/Rio_Branco','$','prefix','1','d-m-Y','default.css','Gruponpmais','https://www.jwc.com.br','2025-03-15 06:39:06','2025-08-06 02:31:35');
/*!40000 ALTER TABLE `general_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goal_trackings`
--

DROP TABLE IF EXISTS `goal_trackings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `goal_trackings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `company_id` bigint unsigned NOT NULL,
  `goal_type_id` bigint unsigned NOT NULL,
  `subject` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `target_achievement` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `start_date` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `end_date` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `progress` int NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `goal_trackings_company_id_foreign` (`company_id`),
  KEY `goal_trackings_goal_type_id_foreign` (`goal_type_id`),
  CONSTRAINT `goal_trackings_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `goal_trackings_goal_type_id_foreign` FOREIGN KEY (`goal_type_id`) REFERENCES `goal_types` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goal_trackings`
--

LOCK TABLES `goal_trackings` WRITE;
/*!40000 ALTER TABLE `goal_trackings` DISABLE KEYS */;
INSERT INTO `goal_trackings` VALUES (6,10,12,'Conclusão de OSs dentro do prazo padrão','90% das ordens de serviço concluídas no prazo estipulado mensalmente','Monitorar o tempo médio de execução das ordens de serviço atribuídas ao colaborador, garantindo que 90% ou mais sejam encerradas dentro do prazo definido pela coordenação. Essa métrica é crucial para avaliar a produtividade e organização no setor responsável.','01/05/2025','31/05/2025',22,'In Progress','2025-04-17 07:51:20','2025-08-28 20:44:33'),(7,10,13,'sistema','sistema','teste','17-04-2025','30-04-2025',50,'In Progress','2025-04-20 04:10:50','2025-04-20 04:11:08');
/*!40000 ALTER TABLE `goal_trackings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goal_types`
--

DROP TABLE IF EXISTS `goal_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `goal_types` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `goal_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goal_types`
--

LOCK TABLES `goal_types` WRITE;
/*!40000 ALTER TABLE `goal_types` DISABLE KEYS */;
INSERT INTO `goal_types` VALUES (11,'Produtividade no Sistema NP+ Cloud','2025-04-17 07:43:56','2025-04-17 07:43:56'),(12,'Cumprimento de Prazos em Ordens de Serviço (OS)','2025-04-17 07:44:07','2025-04-17 07:44:07'),(13,'Lançamento Correto de Ponto','2025-04-17 07:44:13','2025-04-17 07:44:13'),(14,'Atendimento aos Requisitos de Documentação Digital','2025-04-17 07:44:23','2025-04-17 07:44:23'),(15,'Respostas às Demandas do Chat Interno','2025-04-17 07:44:32','2025-04-17 07:44:32'),(16,'Engajamento com o Sistema de Treinamento Interno','2025-04-17 07:44:44','2025-04-17 07:44:44'),(17,'Aderência ao Fluxo de Trabalho Automatizado','2025-04-17 07:44:51','2025-04-17 07:44:51'),(18,'Qualidade no Preenchimento de Formulários','2025-04-17 07:45:07','2025-04-17 07:45:07'),(19,'Atualização de Dados Pessoais no Sistema de RH','2025-04-17 07:45:18','2025-04-17 07:45:18'),(20,'Eficiência no uso do Sistema Domínio (Contabilidade)','2025-04-17 07:47:22','2025-04-17 07:47:22'),(21,'Precisão nos lançamentos contábeis no Sistema Domínio','2025-04-17 07:47:29','2025-04-17 07:47:29'),(22,'Cumprimento de rotas no Sistema Administrativo','2025-04-17 07:47:36','2025-04-17 07:47:36'),(23,'Pontualidade nos registros no Sistema de Ponto Eletrônico','2025-04-17 07:47:44','2025-04-17 07:47:44'),(24,'Correção nas marcações de ponto no Sistema de Ponto Eletrônico','2025-04-17 07:47:51','2025-04-17 07:47:51'),(25,'Desempenho no Setor Operacional','2025-04-17 07:47:58','2025-04-17 07:47:58'),(26,'Tempo de resposta e resolução no Setor de T.I.','2025-04-17 07:48:04','2025-04-17 07:48:04'),(27,'Eficiência no atendimento de chamados internos (T.I.)','2025-04-17 07:48:11','2025-04-17 07:48:11'),(28,'Controle e atualização de processos no Setor Delic','2025-04-17 07:48:16','2025-04-17 07:48:16'),(29,'Gestão de bens e inventário no Setor de Patrimônio','2025-04-17 07:48:21','2025-04-17 07:48:21'),(30,'Atualização de documentos no Setor de Patrimônio','2025-04-17 07:48:27','2025-04-17 07:48:27'),(31,'Cumprimento de prazos no Setor de DP','2025-04-17 07:48:34','2025-04-17 07:48:34'),(32,'Correta execução de admissões e demissões no DP','2025-04-17 07:48:40','2025-04-17 07:48:40'),(33,'Atualização de dados e cadastros no RH','2025-04-17 07:48:47','2025-04-17 07:48:47'),(34,'Acompanhamento de desempenho no RH','2025-04-17 07:48:52','2025-04-17 07:48:52'),(35,'Entrega de treinamentos e integração no RH','2025-04-17 07:48:58','2025-04-17 07:48:58'),(36,'Conformidade com os padrões de qualidade','2025-04-17 07:49:04','2025-04-17 07:49:04'),(37,'Cumprimento de metas de auditoria interna','2025-04-17 07:49:09','2025-04-17 07:49:09'),(38,'Precisão nos registros de processos e atividades','2025-04-17 07:49:14','2025-04-17 07:49:14'),(39,'Organização de arquivos e documentos físicos/digitais','2025-04-17 07:49:20','2025-04-17 07:49:20');
/*!40000 ALTER TABLE `goal_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `holidays`
--

DROP TABLE IF EXISTS `holidays`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `holidays` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `event_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` mediumtext COLLATE utf8mb4_unicode_ci,
  `company_id` bigint unsigned DEFAULT NULL,
  `department_id` bigint unsigned DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `is_publish` tinyint DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `holidays_company_id_foreign` (`company_id`),
  KEY `holidays_department_id_foreign` (`department_id`),
  CONSTRAINT `holidays_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `holidays_department_id_foreign` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `holidays`
--

LOCK TABLES `holidays` WRITE;
/*!40000 ALTER TABLE `holidays` DISABLE KEYS */;
INSERT INTO `holidays` VALUES (1,'Eid Ul Adha','ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum q',1,NULL,'2021-03-30','2021-04-01',1,'2020-07-27 18:07:35','2020-07-27 18:07:35'),(2,'Victory Day','This is our national victory day',1,NULL,'2022-12-16','2022-12-16',1,'2022-11-17 04:46:58','2022-11-17 04:46:58'),(3,'Test','Test',1,NULL,'2022-11-17','2022-11-18',1,'2022-11-17 04:55:16','2022-11-17 04:55:59'),(4,'Christmas Day','Public Holiday',1,NULL,'2022-12-25','2022-12-25',1,'2022-12-29 07:11:09','2022-12-29 07:11:09'),(5,'Ekushe February','',1,NULL,'2023-02-21','2023-02-22',1,'2023-02-09 04:33:42','2023-02-09 04:33:42');
/*!40000 ALTER TABLE `holidays` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `indicators`
--

DROP TABLE IF EXISTS `indicators`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `indicators` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `company_id` bigint unsigned NOT NULL,
  `designation_id` bigint unsigned NOT NULL,
  `department_id` bigint unsigned NOT NULL,
  `customer_experience` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `marketing` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `administrator` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `professionalism` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `integrity` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `attendance` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `added_by` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `indicators_company_id_foreign` (`company_id`),
  KEY `indicators_department_id_foreign` (`department_id`),
  KEY `indicators_designation_id_foreign` (`designation_id`),
  CONSTRAINT `indicators_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `indicators_department_id_foreign` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`) ON DELETE CASCADE,
  CONSTRAINT `indicators_designation_id_foreign` FOREIGN KEY (`designation_id`) REFERENCES `designations` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `indicators`
--

LOCK TABLES `indicators` WRITE;
/*!40000 ALTER TABLE `indicators` DISABLE KEYS */;
INSERT INTO `indicators` VALUES (4,10,8,18,'Beginner','None','Beginner','Beginner','Beginner','Beginner','admin','2025-04-17 07:52:11','2025-04-17 07:52:11');
/*!40000 ALTER TABLE `indicators` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invoice_items`
--

DROP TABLE IF EXISTS `invoice_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `invoice_items` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `invoice_id` bigint unsigned DEFAULT NULL,
  `project_id` bigint unsigned DEFAULT NULL,
  `item_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `item_tax_type` int NOT NULL DEFAULT '0',
  `item_tax_rate` decimal(5,2) NOT NULL,
  `item_qty` int NOT NULL DEFAULT '0',
  `item_unit_price` decimal(10,2) NOT NULL,
  `item_sub_total` double NOT NULL,
  `sub_total` double NOT NULL,
  `discount_type` tinyint DEFAULT NULL,
  `discount_figure` double NOT NULL,
  `total_tax` double NOT NULL,
  `total_discount` double NOT NULL,
  `grand_total` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `invoice_items_invoice_id_foreign` (`invoice_id`),
  KEY `invoice_items_project_id_foreign` (`project_id`),
  CONSTRAINT `invoice_items_invoice_id_foreign` FOREIGN KEY (`invoice_id`) REFERENCES `invoices` (`id`) ON DELETE CASCADE,
  CONSTRAINT `invoice_items_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoice_items`
--

LOCK TABLES `invoice_items` WRITE;
/*!40000 ALTER TABLE `invoice_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `invoice_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invoices`
--

DROP TABLE IF EXISTS `invoices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `invoices` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `invoice_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `client_id` bigint unsigned DEFAULT NULL,
  `project_id` bigint unsigned DEFAULT NULL,
  `invoice_date` date NOT NULL,
  `invoice_due_date` date NOT NULL,
  `sub_total` double NOT NULL,
  `discount_type` tinyint DEFAULT NULL,
  `discount_figure` double NOT NULL,
  `total_tax` double NOT NULL,
  `total_discount` double NOT NULL,
  `grand_total` double NOT NULL,
  `invoice_note` mediumtext COLLATE utf8mb4_unicode_ci,
  `status` tinyint DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `invoices_client_id_foreign` (`client_id`),
  KEY `invoices_project_id_foreign` (`project_id`),
  CONSTRAINT `invoices_client_id_foreign` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`) ON DELETE CASCADE,
  CONSTRAINT `invoices_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoices`
--

LOCK TABLES `invoices` WRITE;
/*!40000 ALTER TABLE `invoices` DISABLE KEYS */;
/*!40000 ALTER TABLE `invoices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ip_settings`
--

DROP TABLE IF EXISTS `ip_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ip_settings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip_address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ip_settings`
--

LOCK TABLES `ip_settings` WRITE;
/*!40000 ALTER TABLE `ip_settings` DISABLE KEYS */;
INSERT INTO `ip_settings` VALUES (1,'FNF','103.120.140.1','2021-03-28 14:34:42','2021-03-28 16:57:27'),(14,'Lion-Coders','127.54.03.1','2021-03-28 16:58:02','2021-03-28 16:58:02'),(15,'Local','127.0.0.2','2021-03-28 17:26:13','2021-03-29 05:39:40'),(16,'XYZ','103.161.152.57','2021-07-05 03:36:35','2021-08-01 13:04:10');
/*!40000 ALTER TABLE `ip_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_candidates`
--

DROP TABLE IF EXISTS `job_candidates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `job_candidates` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `job_id` bigint unsigned NOT NULL,
  `full_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` text COLLATE utf8mb4_unicode_ci,
  `cover_letter` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `fb_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `linkedin_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cv` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remarks` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `job_candidates_job_id_foreign` (`job_id`),
  CONSTRAINT `job_candidates_job_id_foreign` FOREIGN KEY (`job_id`) REFERENCES `job_posts` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_candidates`
--

LOCK TABLES `job_candidates` WRITE;
/*!40000 ALTER TABLE `job_candidates` DISABLE KEYS */;
INSERT INTO `job_candidates` VALUES (3,1,'Fahim Chowdhury','irfanchowdhury434@gmail.com','2212221212','Dewanhat, Chittagong.','Dear Hiring Manager,\r\n\r\nI would like to apply for the position of Software Developer (PHP-Laravel) as advertised on Facebook. I have extensive experience in web development specializing in PHP-Laravel, JavaScript, jQuery, Ajax, API, little experience with React and others that perfectly fit the advertised job requirements. \r\n\r\nI received my B.Sc. in Computer Science &amp; Engineering from International Islamic University Chittagong and have more than 2.5 years in software development as Junior Software Engineer at Lion Coders , Chittagong. \r\n\r\nPlease find my resume attached. Feel free to contact me if you have any further questions you would like to discuss. Thank you for taking the time to consider my application. I look forward to hearing from you.\r\n\r\n\r\nThanks &amp; Regards,\r\n\r\nMd Irfan Chowdhury\r\n.','','','FahimChowdhury_1700042575.jpg','Aprovado','','2023-11-15 09:32:55','2025-01-09 09:03:42'),(6,7,'carlos candidato a vaga','robsoncrweb@gmail.com','68999909006','Estrada do São Francisco','estou fuln','','','carloscandidatoavaga_1736096840.pdf','Aprovado','','2025-01-06 02:07:21','2025-01-13 11:00:26');
/*!40000 ALTER TABLE `job_candidates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_categories`
--

DROP TABLE IF EXISTS `job_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `job_categories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `job_category` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_categories`
--

LOCK TABLES `job_categories` WRITE;
/*!40000 ALTER TABLE `job_categories` DISABLE KEYS */;
INSERT INTO `job_categories` VALUES (2,'PHP','xdBCMHJABdhRlMqXkA0G'),(7,'Serviços Gerais e Operacionais','xG7AZ8U9rIMGjwxEbQeG'),(8,'Limpeza e Conservação','mpXmSgMBpf2KwK0Qweeb'),(9,'Jardinagem','tuTIxf5tkS2wBCx9b3iT'),(10,'Manutenção Predial','zHuOWTjAUTc1pAFhVdxy'),(11,'Segurança Patrimonial','Z9FJCgv5nItSwcZCajVy'),(12,'Serviços de Portaria','AgNFPlCLdXJiojBlwdK6'),(13,'Zeladoria','WtGKITWalv6CbpsKCHff'),(14,'Manutenção de Equipamentos','2LHHDlUqaEPmILVDOn8x'),(15,'Serviços Gerais e Operacionais (Pintura)','b0cdOGWbrAGjGbskSrEw'),(16,'Serviços Gerais e Operacionais (Pequenos Reparos)','C1oUN5gWiJhOhLf4BZXl'),(17,'Administrativo e Escritório (Assistente Administrativo)','fksHtz9n2WsQB84wauan'),(18,'Administrativo e Escritório (Auxiliar de Escritório)','wcg1SvQWu92ocikn6wVr'),(19,'Construção Civil e Manutenção (Pedreiro)','zyGLDTFbfQ9lpMJcW4Hp'),(20,'Construção Civil e Manutenção (Eletricista)','Mza4ZaJzbDJzn3CLVdSb'),(21,'Serviços de Alimentação (Cozinheiro(a))','IeryjU9nMPQ7WASPK72i'),(22,'Serviços de Alimentação (Auxiliar de Cozinha)','qJSw8WWOiEPKCGfiwfPp'),(23,'Segurança e Vigilância (Vigilante)','eddvlcPY8Nx8Ko970D8J'),(24,'Segurança e Vigilância (Supervisor de Segurança)','ovyIMwrAxA5V0UwSNbPv'),(25,'Supervisor','qjnTR4f2CAlZ3Ork8k3s'),(26,'Técnico e Especializado (Técnico em Informática)','P6NFsPNLh5k4QbRGMG7T'),(27,'Técnico e Especializado (Técnico em Segurança do Trabalho)','pGe9064iFIyonnRkazHn'),(28,'Marketing e Comunicação','MbrxndSdyExM6lp4p1m1'),(29,'Financeiro e Contábil (Assistente Financeiro)','qug8LpNmefWtlM92VyIv'),(30,'Administrativo','AFnWtXQZPrf1Yplauavt');
/*!40000 ALTER TABLE `job_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_experiences`
--

DROP TABLE IF EXISTS `job_experiences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `job_experiences` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_experiences`
--

LOCK TABLES `job_experiences` WRITE;
/*!40000 ALTER TABLE `job_experiences` DISABLE KEYS */;
INSERT INTO `job_experiences` VALUES (1,'Fresher','2024-07-28 08:39:14','2024-07-28 08:39:14'),(4,'2 Years','2024-07-28 08:44:55','2024-07-28 08:44:55'),(13,'1 ano','2024-12-31 09:52:21','2024-12-31 09:52:21'),(14,'2 ano','2024-12-31 09:52:26','2024-12-31 09:52:26'),(15,'3 ano','2024-12-31 09:52:30','2024-12-31 09:52:30'),(16,'4 ano','2024-12-31 09:52:33','2024-12-31 09:52:33'),(17,'5 ano','2024-12-31 09:52:37','2024-12-31 09:52:37'),(18,'6 ano','2024-12-31 09:52:41','2024-12-31 09:52:41');
/*!40000 ALTER TABLE `job_experiences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_interviews`
--

DROP TABLE IF EXISTS `job_interviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `job_interviews` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `job_id` bigint unsigned NOT NULL,
  `added_by` bigint unsigned DEFAULT NULL,
  `interview_place` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `interview_date` date NOT NULL,
  `interview_time` time NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `job_interviews_job_id_foreign` (`job_id`),
  KEY `job_interviews_added_by_foreign` (`added_by`),
  CONSTRAINT `job_interviews_added_by_foreign` FOREIGN KEY (`added_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `job_interviews_job_id_foreign` FOREIGN KEY (`job_id`) REFERENCES `job_posts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_interviews`
--

LOCK TABLES `job_interviews` WRITE;
/*!40000 ALTER TABLE `job_interviews` DISABLE KEYS */;
INSERT INTO `job_interviews` VALUES (2,1,1,'dhaka bangladesh','2023-11-16','03:00:00','&lt;p&gt;&lt;span style=&quot;background-color: #ffffff; color: #718096; font-family: -apple-system, BlinkMacSystemFont, &#039;Segoe UI&#039;, Roboto, Helvetica, Arial, sans-serif, &#039;Apple Color Emoji&#039;, &#039;Segoe UI Emoji&#039;, &#039;Segoe UI Symbol&#039;; font-size: 16px;&quot;&gt;Interview for caregiver position kghomehealth&lt;/span&gt;&lt;/p&gt;','2023-11-15 17:14:24','2023-11-15 17:14:24'),(3,1,1,'CTG, BD','2023-11-18','03:00:00','&lt;p&gt;Interview for caregiver position kghomehealth&lt;/p&gt;','2023-11-15 17:24:36','2023-11-15 17:24:36'),(13,7,1,'teste','2025-01-07','12:00:00','&lt;p&gt;teste&lt;/p&gt;','2025-01-07 09:00:07','2025-01-07 09:00:07'),(14,1,1,'TEste','2025-01-16','12:00:00','&lt;p&gt;asdasdasd&lt;/p&gt;','2025-01-07 09:04:01','2025-01-07 09:04:01'),(15,1,1,'asdasd','2025-01-16','12:00:00','&lt;p&gt;asdasdasd&lt;/p&gt;','2025-01-07 09:15:28','2025-01-07 09:15:28'),(16,1,1,'asasda','2025-01-23','12:00:00','&lt;p&gt;asdadsasd&lt;/p&gt;','2025-01-07 09:18:06','2025-01-07 09:18:06'),(17,1,1,'asdasdas','2025-01-21','12:00:00','&lt;p&gt;asdasdasd&lt;/p&gt;','2025-01-07 09:22:34','2025-01-07 09:22:34');
/*!40000 ALTER TABLE `job_interviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_posts`
--

DROP TABLE IF EXISTS `job_posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `job_posts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `company_id` bigint unsigned NOT NULL,
  `job_category_id` bigint unsigned NOT NULL,
  `job_title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `job_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `no_of_vacancy` int NOT NULL,
  `job_url` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `job_experience_id` bigint unsigned NOT NULL DEFAULT '1',
  `short_description` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `long_description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `closing_date` date NOT NULL,
  `status` tinyint NOT NULL,
  `is_featured` tinyint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `job_posts_job_category_id_foreign` (`job_category_id`),
  KEY `job_posts_company_id_foreign` (`company_id`),
  KEY `job_posts_job_experience_id_foreign` (`job_experience_id`),
  CONSTRAINT `job_posts_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `job_posts_job_category_id_foreign` FOREIGN KEY (`job_category_id`) REFERENCES `job_categories` (`id`) ON DELETE CASCADE,
  CONSTRAINT `job_posts_job_experience_id_foreign` FOREIGN KEY (`job_experience_id`) REFERENCES `job_experiences` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_posts`
--

LOCK TABLES `job_posts` WRITE;
/*!40000 ALTER TABLE `job_posts` DISABLE KEYS */;
INSERT INTO `job_posts` VALUES (1,1,2,'Laravel Developer','full_time',2,'qPnZoMWx83Qb0YnTVl5F','No Preference',1,'Lion-Coders is looking for Intermediate level Software Developers (3) for its Laravel based software developments. The primary role of these developers will be to develop/debug new desktop/xamarin/web applications for its overseas clients.','&lt;p&gt;&amp;bull; Should have experience in working on framework such as Laravel,&lt;br /&gt;Symphony etc&lt;br /&gt;&amp;bull; Excellent working knowledge of Web application development&lt;br /&gt;&amp;bull; Advance coding Skills in PHP, HTML, CSS, JavaScript, and scripting&lt;br /&gt;languages desirable&lt;br /&gt;&amp;bull; Excellent working knowledge of MySQL database&lt;br /&gt;&amp;bull; Good understanding of database performance tuning and sql queries&lt;br /&gt;&amp;bull; Experience working with a PHP framework such as CodeIgniter/Laravel&lt;br /&gt;&amp;bull; Experience in both Front End / Back End Developer.&lt;br /&gt;&amp;bull; Good Knowledge and understanding of CRM, CMS, SHOPPING-CART,&lt;br /&gt;PAYMENT GATEWAY &amp;amp; other API INTEGRATION&lt;/p&gt;','2021-03-06',1,1,'2021-02-22 00:00:00','2025-04-03 00:31:59'),(7,10,26,'Técnico em Informática','full_time',4,'iDfGrmmiQbw0cTcKHqyX','Male',13,'Profissional qualificado para instalar, configurar e realizar manutenção em computadores, redes e sistemas operacionais. Atua no suporte técnico ao usuário, oferecendo soluções rápidas para problemas relacionados a hardware, software e segurança digital. Possui habilidades em montagem de computadores, instalação de programas, atualização de sistemas e configuração de redes locais, garantindo o pleno funcionamento dos recursos tecnológicos.','&lt;h3&gt;&lt;strong&gt;T&amp;eacute;cnico em Inform&amp;aacute;tica &amp;ndash; Especialista em Terceiriza&amp;ccedil;&amp;atilde;o de Servi&amp;ccedil;os de TI&lt;/strong&gt;&lt;/h3&gt;\r\n&lt;p&gt;O T&amp;eacute;cnico em Inform&amp;aacute;tica desempenha um papel fundamental na gest&amp;atilde;o de tecnologia em empresas que terceirizam servi&amp;ccedil;os de TI, garantindo efici&amp;ecirc;ncia, seguran&amp;ccedil;a e continuidade operacional. Esse profissional est&amp;aacute; capacitado para atuar em ambientes corporativos diversos, oferecendo suporte t&amp;eacute;cnico de alta qualidade, manuten&amp;ccedil;&amp;atilde;o preventiva e corretiva de equipamentos, al&amp;eacute;m de realizar a configura&amp;ccedil;&amp;atilde;o e administra&amp;ccedil;&amp;atilde;o de sistemas operacionais e redes.&lt;/p&gt;\r\n&lt;p&gt;No contexto de terceiriza&amp;ccedil;&amp;atilde;o, o T&amp;eacute;cnico em Inform&amp;aacute;tica se destaca por sua capacidade de atender m&amp;uacute;ltiplos clientes e demandas, adaptando-se a diferentes realidades empresariais e setores p&amp;uacute;blicos. Sua fun&amp;ccedil;&amp;atilde;o vai al&amp;eacute;m do suporte t&amp;eacute;cnico b&amp;aacute;sico, abrangendo a implementa&amp;ccedil;&amp;atilde;o de solu&amp;ccedil;&amp;otilde;es tecnol&amp;oacute;gicas que otimizam os processos internos das empresas contratantes, assegurando a continuidade dos servi&amp;ccedil;os prestados.&lt;/p&gt;','2025-01-24',1,1,'2025-01-06 02:05:21','2025-01-06 02:05:21');
/*!40000 ALTER TABLE `job_posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `languages`
--

DROP TABLE IF EXISTS `languages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `languages` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `language` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `languages`
--

LOCK TABLES `languages` WRITE;
/*!40000 ALTER TABLE `languages` DISABLE KEYS */;
INSERT INTO `languages` VALUES (1,NULL,'English','2023-05-06 05:39:11','2023-05-06 05:39:11');
/*!40000 ALTER TABLE `languages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leave_types`
--

DROP TABLE IF EXISTS `leave_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `leave_types` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `leave_type` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `allocated_day` int DEFAULT NULL,
  `company_id` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `leave_types_company_id_foreign` (`company_id`),
  CONSTRAINT `leave_types_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leave_types`
--

LOCK TABLES `leave_types` WRITE;
/*!40000 ALTER TABLE `leave_types` DISABLE KEYS */;
INSERT INTO `leave_types` VALUES (3,'Afastamento por Acidente de Trabalho',15,NULL,'2020-07-26 20:18:48','2024-12-30 09:40:33'),(15,'Afastamento por Motivo de Saúde (Auxílio-Doença)',15,NULL,'2024-12-30 09:38:26','2024-12-30 09:38:26'),(16,'Licença-Maternidade/Paternidade',120,NULL,'2024-12-30 09:39:18','2024-12-30 09:39:18'),(17,'Afastamento por Serviço Militar',0,NULL,'2024-12-30 09:41:12','2024-12-30 09:41:12'),(18,'Afastamento para Estudo ou Interesse Particular',0,NULL,'2024-12-30 09:41:49','2024-12-30 09:41:49'),(19,'Licença por Falecimento (Luto)',2,NULL,'2024-12-30 09:42:16','2024-12-30 09:42:16'),(20,'Licença por Casamento (Licença Gala)',3,NULL,'2024-12-30 09:42:51','2024-12-30 09:42:51'),(21,'Suspensão Disciplinar',0,NULL,'2024-12-30 09:43:19','2024-12-30 09:43:19'),(22,'Licença para Doação de Sangue',1,NULL,'2024-12-30 09:43:42','2024-12-30 09:43:42'),(23,'Licença para Alistamento Eleitoral',2,NULL,'2024-12-30 09:44:16','2024-12-30 09:44:16'),(24,'Afastamento por Motivo de Greve',0,NULL,'2024-12-30 09:44:41','2024-12-30 09:44:41'),(25,'Férias',30,NULL,'2025-05-14 20:01:32','2025-05-14 20:01:32'),(26,'Férias Proporcional',20,NULL,'2025-05-14 20:02:09','2025-05-14 20:02:09'),(27,'aposentadoriaINV',1460,NULL,'2025-05-27 00:26:07','2025-05-27 00:28:04'),(28,'Afastamento por Doença',15,NULL,'2025-05-27 23:21:06','2025-05-27 23:21:06'),(29,'Afastamento Doença(Sem data)',973,NULL,'2025-05-28 17:00:09','2025-05-28 17:05:29'),(30,'Afastamento doença',1142,NULL,'2025-05-28 17:41:45','2025-05-28 17:41:45'),(31,'Afastamento Doença(No data)',2191,NULL,'2025-05-28 17:43:17','2025-05-28 17:43:17'),(32,'Afastamento Doença(10 anos)',3652,NULL,'2025-05-28 18:10:40','2025-05-28 18:10:40'),(33,'Afastamento Aposentado INV(10 anos)',3652,NULL,'2025-05-28 18:11:15','2025-05-28 18:11:15'),(34,'Aposentadoria INV(20 anos)',7305,NULL,'2025-06-03 00:29:52','2025-06-03 00:29:52'),(35,'Acidente de Trabalho(10 anos)',3652,NULL,'2025-06-03 01:30:55','2025-06-03 01:30:55'),(36,'Aposentadoria INV(500 anos)',182625,NULL,'2025-06-03 01:31:15','2025-06-03 01:31:15'),(37,'Afastamento por Motivo de Saúde (Auxílio-Doença) 2',75,NULL,'2025-06-11 06:01:08','2025-06-11 06:01:08');
/*!40000 ALTER TABLE `leave_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leaves`
--

DROP TABLE IF EXISTS `leaves`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `leaves` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `leave_type_id` bigint unsigned DEFAULT NULL,
  `company_id` bigint unsigned NOT NULL,
  `department_id` bigint unsigned NOT NULL,
  `employee_id` bigint unsigned DEFAULT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `total_days` int NOT NULL,
  `leave_reason` mediumtext COLLATE utf8mb4_unicode_ci,
  `remarks` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_notify` tinyint DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `leaves_company_id_foreign` (`company_id`),
  KEY `leaves_employee_id_foreign` (`employee_id`),
  KEY `leaves_leave_type_id_foreign` (`leave_type_id`),
  KEY `leaves_department_id_foreign` (`department_id`),
  CONSTRAINT `leaves_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `leaves_department_id_foreign` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`) ON DELETE CASCADE,
  CONSTRAINT `leaves_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE,
  CONSTRAINT `leaves_leave_type_id_foreign` FOREIGN KEY (`leave_type_id`) REFERENCES `leave_types` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=152 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leaves`
--

LOCK TABLES `leaves` WRITE;
/*!40000 ALTER TABLE `leaves` DISABLE KEYS */;
/*!40000 ALTER TABLE `leaves` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loan_types`
--

DROP TABLE IF EXISTS `loan_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `loan_types` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `type_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loan_types`
--

LOCK TABLES `loan_types` WRITE;
/*!40000 ALTER TABLE `loan_types` DISABLE KEYS */;
INSERT INTO `loan_types` VALUES (1,'Social Security System Loan','2024-07-23 03:41:22','2024-12-31 09:42:40','2024-12-31 09:42:40'),(3,'Home Development Mutual Fund Loan','2024-07-23 03:43:09','2024-12-31 09:42:37','2024-12-31 09:42:37'),(4,'Other Loan','2024-07-23 03:45:02','2024-12-31 09:42:47','2024-12-31 09:42:47'),(5,'Empréstimo Salarial','2024-12-31 09:41:27','2024-12-31 09:41:27',NULL),(6,'Empréstimo para Emergências','2024-12-31 09:41:36','2024-12-31 09:41:36',NULL),(7,'Empréstimo Educacional','2024-12-31 09:41:45','2024-12-31 09:41:45',NULL),(8,'Empréstimo para Aquisição de Bens','2024-12-31 09:41:54','2024-12-31 09:41:54',NULL),(9,'mpréstimo para Viagem ou Lazer','2024-12-31 09:42:03','2024-12-31 09:42:03',NULL),(10,'Empréstimo para Casamento ou Evento Familiar','2024-12-31 09:42:09','2024-12-31 09:42:09',NULL),(11,'Empréstimo para Reforma ou Melhoria Residencial','2024-12-31 09:42:17','2024-12-31 09:42:17',NULL),(12,'Empréstimo de Longo Prazo','2024-12-31 09:42:24','2024-12-31 09:42:24',NULL),(13,'Empréstimo para Saúde e Bem-Estar','2024-12-31 09:42:31','2024-12-31 09:42:31',NULL);
/*!40000 ALTER TABLE `loan_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `locations`
--

DROP TABLE IF EXISTS `locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `locations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `location_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `location_head` bigint unsigned DEFAULT NULL,
  `address1` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` int unsigned DEFAULT NULL,
  `zip` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `locations_location_head_foreign` (`location_head`),
  KEY `locations_country_foreign` (`country`),
  CONSTRAINT `locations_country_foreign` FOREIGN KEY (`country`) REFERENCES `countries` (`id`) ON DELETE SET NULL,
  CONSTRAINT `locations_location_head_foreign` FOREIGN KEY (`location_head`) REFERENCES `employees` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `locations`
--

LOCK TABLES `locations` WRITE;
/*!40000 ALTER TABLE `locations` DISABLE KEYS */;
INSERT INTO `locations` VALUES (1,'https://www.google.com/maps/place/R.+Dr.+Jos%C3%A9+de+Aguiar+-+Floresta,+Rio+Branco+-+AC,+Brasil/@-9.973921,-67.831574,2239m/data=!3m1!1e3!4m6!3m5!1s0x917f8c4af54727b7:0xaadd69fb69227658!8m2!',NULL,'Logradouro:Rua Doutor Jose Luiz de Aguiar, 118, Quadra02 Casa 07 Sala 02 Bairro:Conjunto Bela Vista Município/UF:Rio Branco, AC CEP:69.911-334','','Rio Branco','Acre',NULL,69911334,'2020-07-26 18:12:19','2024-12-29 20:31:30'),(2,'JWC Multiserviços, R. do Eucalipto, 213 - Conj. Bela Vista, Rio Branco - AC, 69911-283',NULL,'R. do Eucalipto, 213 - Conj. Bela Vista, Rio Branco - AC, 69911-283','','Rio Branco','Acre',NULL,69911283,'2020-07-26 18:21:12','2024-12-29 20:29:14'),(4,'ISAO Gestão de Pessoas, Av. Ceará, 1820 - Bosque, Rio Branco - AC, 69900-379',NULL,'Av. Ceará, 1820 - Bosque, Rio Branco - AC, 69900-379','','Rio Branco','Acre',NULL,0,'2024-12-30 10:15:29','2024-12-30 10:15:29');
/*!40000 ALTER TABLE `locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meetings`
--

DROP TABLE IF EXISTS `meetings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `meetings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `company_id` bigint unsigned NOT NULL,
  `meeting_title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meeting_note` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `meeting_date` date NOT NULL,
  `meeting_time` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_notify` tinyint DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `meetings_company_id_foreign` (`company_id`),
  CONSTRAINT `meetings_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meetings`
--

LOCK TABLES `meetings` WRITE;
/*!40000 ALTER TABLE `meetings` DISABLE KEYS */;
INSERT INTO `meetings` VALUES (1,1,'Project Vision','m et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod','2021-04-01','03:20PM','pending',1,'2020-07-28 14:31:11','2020-07-28 14:31:11'),(2,1,'Test Meeting','Test','2023-01-06','02:00PM','ongoing',NULL,'2023-01-02 09:12:22','2023-01-02 09:23:07'),(3,1,'Test Meeting','Fsafsaf','2023-01-20','02:00PM','pending',NULL,'2023-01-02 09:13:01','2023-01-02 09:24:16'),(4,1,'Meeting Ttitle','Test','2023-02-21','12:00AM','completed',NULL,'2023-02-09 05:07:23','2023-02-09 05:07:23'),(5,1,'Meeting Ttitle','','2023-02-22','07:00AM','ongoing',NULL,'2023-02-09 05:10:16','2023-02-09 05:10:16');
/*!40000 ALTER TABLE `meetings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=273 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (106,'2023_05_06_053210_create_countries_table',1),(107,'2023_05_06_053211_create_locations_table',1),(108,'2023_05_06_053212_create_companies_table',1),(109,'2023_05_06_053213_create_departments_table',1),(110,'2023_05_06_053214_create_designations_table',1),(111,'2023_05_06_053215_create_roles_table',1),(112,'2023_05_06_053217_create_users_table',1),(113,'2023_05_06_053218_create_office_shifts_table',1),(114,'2023_05_06_053219_create_statuses_table',1),(115,'2023_05_06_053220_create_employees_table',1),(116,'2023_05_06_053221_create_announcements_table',1),(117,'2023_05_06_053222_create_appraisals_table',1),(118,'2023_05_06_053223_create_asset_categories_table',1),(119,'2023_05_06_053224_create_assets_table',1),(120,'2023_05_06_053225_create_attendances_table',1),(121,'2023_05_06_053226_create_award_types_table',1),(122,'2023_05_06_053227_create_awards_table',1),(123,'2023_05_06_053228_create_c_m_s_table',1),(124,'2023_05_06_053229_create_calendarables_table',1),(125,'2023_05_06_053231_create_clients_table',1),(126,'2023_05_06_053232_create_complaints_table',1),(127,'2023_05_06_053233_create_document_types_table',1),(128,'2023_05_06_053234_create_employee_bank_accounts_table',1),(129,'2023_05_06_053235_create_employee_contacts_table',1),(130,'2023_05_06_053236_create_employee_documents_table',1),(131,'2023_05_06_053237_create_employee_immigrations_table',1),(132,'2023_05_06_053238_create_employee_leave_type_details_table',1),(133,'2023_05_06_053239_create_job_categories_table',1),(134,'2023_05_06_053240_create_job_posts_table',1),(135,'2023_05_06_053241_create_job_interviews_table',1),(136,'2023_05_06_053242_create_employee_interview_table',1),(137,'2023_05_06_053243_create_meetings_table',1),(138,'2023_05_06_053244_create_employee_meeting_table',1),(139,'2023_05_06_053245_create_projects_table',1),(140,'2023_05_06_053246_create_employee_project_table',1),(141,'2023_05_06_053247_create_qualification_languages_table',1),(142,'2023_05_06_053248_create_qualification_skills_table',1),(143,'2023_05_06_053249_create_qualification_education_levels_table',1),(144,'2023_05_06_053250_create_employee_qualificaitons_table',1),(145,'2023_05_06_053251_create_support_tickets_table',1),(146,'2023_05_06_053252_create_employee_support_ticket_table',1),(147,'2023_05_06_053253_create_tasks_table',1),(148,'2023_05_06_053254_create_employee_task_table',1),(149,'2023_05_06_053255_create_trainers_table',1),(150,'2023_05_06_053256_create_training_types_table',1),(151,'2023_05_06_053257_create_training_lists_table',1),(152,'2023_05_06_053258_create_employee_training_list_table',1),(153,'2023_05_06_053259_create_employee_work_experience_table',1),(154,'2023_05_06_053260_create_events_table',1),(155,'2023_05_06_053261_create_expense_types_table',1),(156,'2023_05_06_053262_create_failed_jobs_table',1),(157,'2023_05_06_053263_create_file_manager_settings_table',1),(158,'2023_05_06_053265_create_file_managers_table',1),(159,'2023_05_06_053265_create_finance_bank_cashes_table',1),(160,'2023_05_06_053266_create_finance_payers_table',1),(161,'2023_05_06_053267_create_payment_methods_table',1),(162,'2023_05_06_053268_create_finance_deposits_table',1),(163,'2023_05_06_053269_create_finance_payees_table',1),(164,'2023_05_06_053270_create_finance_expenses_table',1),(165,'2023_05_06_053271_create_finance_transactions_table',1),(166,'2023_05_06_053272_create_finance_transfers_table',1),(167,'2023_05_06_053273_create_general_settings_table',1),(168,'2023_05_06_053274_create_goal_types_table',1),(169,'2023_05_06_053275_create_goal_trackings_table',1),(170,'2023_05_06_053276_create_holidays_table',1),(171,'2023_05_06_053277_create_indicators_table',1),(172,'2023_05_06_053278_create_invoices_table',1),(173,'2023_05_06_053279_create_invoice_items_table',1),(174,'2023_05_06_053280_create_ip_settings_table',1),(175,'2023_05_06_053281_create_job_candidates_table',1),(176,'2023_05_06_053282_create_leave_types_table',1),(177,'2023_05_06_053283_create_leaves_table',1),(178,'2023_05_06_053284_create_permissions_table',1),(179,'2023_05_06_053285_create_model_has_permissions_table',1),(180,'2023_05_06_053287_create_model_has_roles_table',1),(181,'2023_05_06_053288_create_notifications_table',1),(182,'2023_05_06_053289_create_official_documents_table',1),(183,'2023_05_06_053290_create_password_resets_table',1),(184,'2023_05_06_053291_create_payslips_table',1),(185,'2023_05_06_053292_create_policies_table',1),(186,'2023_05_06_053293_create_project_bugs_table',1),(187,'2023_05_06_053294_create_project_discussions_table',1),(188,'2023_05_06_053295_create_project_files_table',1),(189,'2023_05_06_053296_create_promotions_table',1),(190,'2023_05_06_053297_create_resignations_table',1),(191,'2023_05_06_053298_create_role_has_permissions_table',1),(192,'2023_05_06_053299_create_salary_allowances_table',1),(193,'2023_05_06_053300_create_salary_basics_table',1),(194,'2023_05_06_053301_create_salary_commissions_table',1),(195,'2023_05_06_053302_create_salary_deductions_table',1),(196,'2023_05_06_053303_create_salary_loans_table',1),(197,'2023_05_06_053304_create_salary_other_payments_table',1),(198,'2023_05_06_053305_create_salary_overtimes_table',1),(199,'2023_05_06_053306_create_task_discussions_table',1),(200,'2023_05_06_053307_create_task_files_table',1),(201,'2023_05_06_053308_create_tax_types_table',1),(202,'2023_05_06_053309_create_termination_types_table',1),(203,'2023_05_06_053310_create_terminations_table',1),(204,'2023_05_06_053311_create_ticket_comments_table',1),(205,'2023_05_06_053312_create_transfers_table',1),(206,'2023_05_06_053313_create_travel_types_table',1),(207,'2023_05_06_053314_create_travels_table',1),(208,'2023_05_06_053315_create_warnings_type_table',1),(209,'2023_05_06_053316_create_warnings_table',1),(210,'2023_05_06_053317_create_candidate_interview_table',1),(211,'2023_05_06_151650_delete_column_from_document_types_table',2),(212,'2023_05_06_153653_update_foreign_key_to_employees_table',2),(213,'2023_05_07_163304_update_foreign_key_to_projects_table',2),(214,'2023_05_08_004033_update_foreign_key_to_support_tickets_table',2),(215,'2023_05_08_094247_update_foreign_key_to_tasks_table',2),(216,'2023_05_08_101326_add_foreign_key_to_training_types_table',2),(217,'2023_05_08_152355_update_foreign_key_to_file_managers_table',2),(218,'2023_05_08_165246_update_foreign_key_to_payment_methods_table',2),(219,'2023_05_08_165419_update_foreign_key_to_finance_deposits_table',2),(220,'2023_05_09_112302_update_foreign_key_to_finance_expenses_table',2),(221,'2023_05_09_115226_update_foreign_key_to_finance_transactions_table',2),(222,'2023_05_09_122727_update_foreign_key_to_finance_transfers_table',2),(223,'2023_05_09_130054_add_foreign_key_to_goal_trackings_table',2),(224,'2023_05_09_134538_update_foreign_key_to_holidays_table',2),(225,'2023_05_09_134626_add_foreign_key_to_indicators_table',2),(226,'2023_05_09_134702_update_foreign_key_to_invoices_table',2),(227,'2023_05_09_134831_update_foreign_key_to_invoice_items_table',2),(228,'2023_05_09_162641_update_foreign_key_to_leaves_table',2),(229,'2023_05_09_181324_update_foreign_key_to_official_documents_table',2),(230,'2023_05_09_190434_update_foreign_key_to_policies_table',2),(231,'2023_05_09_193007_update_foreign_key_to_terminations_table',2),(232,'2023_05_09_195431_update_foreign_key_to_travel_types_table',2),(233,'2023_05_09_195925_update_foreign_key_to_travels_table',2),(234,'2023_05_09_200229_update_foreign_key_to_warnings_table',2),(235,'2023_08_02_113953_delete_company_id_column_to_training_types_table',2),(236,'2024_04_15_143831_add_column_to_users_table',3),(238,'2024_06_09_114933_create_company_types_table',4),(239,'2018_08_08_100000_create_telescope_entries_table',5),(240,'2024_05_13_123951_update_column_type_to_invoice_items_table',6),(243,'2024_07_22_184915_add_company_type_id_column_to_companies_table',7),(244,'2024_07_22_201241_create_relation_types_table',8),(245,'2024_07_22_230352_add_relation_type_id_column_to_employee_contacts_table',9),(246,'2024_07_23_091947_create_loan_types_table',10),(248,'2024_07_22_230356_add_loan_type_id_column_to_salary_loans_table',11),(249,'2024_07_23_113537_create_deduction_types_table',12),(250,'2024_07_22_230367_add_deduction_type_id_column_to_salary_loans_table',13),(251,'2024_07_23_201134_create_deposit_categories_table',14),(252,'2024_07_22_230368_add_deposit_category_id_column_to_finance_deposits_table',15),(255,'2024_07_22_230370_add_job_experience_id_column_to_job_posts_table',16),(256,'2024_07_28_140520_create_job_experiences_table',17),(257,'2025_01_14_054430_add_area_column_to_employees_table',18),(258,'2025_02_11_170723_add_break_columns_to_office_shifts_table',19),(259,'2025_02_17_175358_add_geolocation_columns_to_employees_table',20),(262,'2025_02_27_175005_create_regionals_table',21),(263,'2025_02_27_175217_create_districts_table',21),(264,'2025_03_11_045044_add_district_column_to_employees_table',22),(265,'2025_03_11_045655_add_city_column_to_districts_table',23),(266,'2025_03_18_053258_add_is_physically_disabled_column_to_employees_table',24),(268,'2025_03_23_052325_add_active_column_to_documents_table',25),(269,'2025_05_30_052129_add_company_id_column_to_roles_table',26),(270,'2025_06_24_054157_add_is_street_vendor-column_to_employees_table',27),(271,'2025_07_12_045646_add_company_relation_to_users_table',28),(272,'2025_07_20_064759_create_company_user_table',29);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `model_has_permissions`
--

DROP TABLE IF EXISTS `model_has_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `model_has_permissions` (
  `permission_id` bigint unsigned NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `model_has_permissions`
--

LOCK TABLES `model_has_permissions` WRITE;
/*!40000 ALTER TABLE `model_has_permissions` DISABLE KEYS */;
INSERT INTO `model_has_permissions` VALUES (49,'App\\\\Models\\\\User',59);
/*!40000 ALTER TABLE `model_has_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `model_has_roles`
--

DROP TABLE IF EXISTS `model_has_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `model_has_roles` (
  `role_id` bigint unsigned NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `model_has_roles`
--

LOCK TABLES `model_has_roles` WRITE;
/*!40000 ALTER TABLE `model_has_roles` DISABLE KEYS */;
INSERT INTO `model_has_roles` VALUES (1,'App\\Models\\User',0),(1,'App\\Models\\User',1),(1,'App\\Models\\User',8),(6,'App\\Models\\User',9),(2,'App\\Models\\User',24),(2,'App\\Models\\User',25),(1,'App\\Models\\User',28),(1,'App\\Models\\User',29),(1,'App\\Models\\User',30),(1,'App\\Models\\User',31),(2,'App\\Models\\User',32),(2,'App\\Models\\User',33),(1,'App\\Models\\User',36),(2,'App\\Models\\User',37),(1,'App\\Models\\User',40),(2,'App\\Models\\User',41),(2,'App\\Models\\User',42),(2,'App\\Models\\User',43),(1,'App\\Models\\User',44),(1,'App\\Models\\User',46),(1,'App\\Models\\User',47),(1,'App\\Models\\User',48),(2,'App\\Models\\User',50),(1,'App\\Models\\User',51),(2,'App\\Models\\User',56),(2,'App\\Models\\User',58),(10,'App\\Models\\User',59),(2,'App\\Models\\User',60),(1,'App\\Models\\User',61),(1,'App\\Models\\User',62),(2,'App\\Models\\User',63),(2,'App\\Models\\User',64),(8,'App\\Models\\User',65),(8,'App\\Models\\User',66),(2,'App\\Models\\User',67),(2,'App\\Models\\User',68),(8,'App\\Models\\User',69),(2,'App\\Models\\User',71),(8,'App\\Models\\User',72),(2,'App\\Models\\User',76),(2,'App\\Models\\User',78),(8,'App\\Models\\User',79),(8,'App\\Models\\User',85),(1,'App\\Models\\User',86),(2,'App\\Models\\User',87),(2,'App\\Models\\User',88),(6,'App\\Models\\User',89),(1,'App\\Models\\User',92),(2,'App\\Models\\User',93),(2,'App\\Models\\User',94),(2,'App\\Models\\User',95),(2,'App\\Models\\User',96),(1,'App\\Models\\User',100),(6,'App\\Models\\User',101),(6,'App\\Models\\User',102),(2,'App\\Models\\User',103),(6,'App\\Models\\User',104),(2,'App\\Models\\User',105),(2,'App\\Models\\User',106),(10,'App\\Models\\User',107),(8,'App\\Models\\User',108),(10,'App\\Models\\User',109),(1,'App\\Models\\User',110),(2,'App\\Models\\User',111),(2,'App\\Models\\User',112),(12,'App\\Models\\User',113),(1,'App\\Models\\User',115),(13,'App\\Models\\User',117),(13,'App\\Models\\User',118),(1,'App\\Models\\User',119),(2,'App\\Models\\User',120),(2,'App\\Models\\User',121),(8,'App\\Models\\User',122),(2,'App\\Models\\User',123),(2,'App\\Models\\User',124),(8,'App\\Models\\User',125),(6,'App\\Models\\User',126),(2,'App\\Models\\User',127),(2,'App\\Models\\User',128),(2,'App\\Models\\User',129),(2,'App\\Models\\User',130),(2,'App\\Models\\User',131),(2,'App\\Models\\User',132),(2,'App\\Models\\User',133),(2,'App\\Models\\User',134),(2,'App\\Models\\User',135),(2,'App\\Models\\User',136),(2,'App\\Models\\User',137),(2,'App\\Models\\User',138),(2,'App\\Models\\User',139),(2,'App\\Models\\User',140),(2,'App\\Models\\User',141),(2,'App\\Models\\User',142),(2,'App\\Models\\User',143),(2,'App\\Models\\User',144),(2,'App\\Models\\User',145),(1,'App\\Models\\User',146),(2,'App\\Models\\User',147),(2,'App\\Models\\User',148),(2,'App\\Models\\User',149),(2,'App\\Models\\User',150),(2,'App\\Models\\User',151),(2,'App\\Models\\User',152),(2,'App\\Models\\User',153),(2,'App\\Models\\User',154),(2,'App\\Models\\User',155),(2,'App\\Models\\User',156),(2,'App\\Models\\User',157),(2,'App\\Models\\User',158),(2,'App\\Models\\User',159),(2,'App\\Models\\User',160),(2,'App\\Models\\User',161),(2,'App\\Models\\User',162),(2,'App\\Models\\User',163),(2,'App\\Models\\User',164),(2,'App\\Models\\User',165),(2,'App\\Models\\User',166),(2,'App\\Models\\User',167),(2,'App\\Models\\User',168),(2,'App\\Models\\User',169),(2,'App\\Models\\User',170),(2,'App\\Models\\User',171),(2,'App\\Models\\User',172),(2,'App\\Models\\User',173),(2,'App\\Models\\User',174),(2,'App\\Models\\User',175),(2,'App\\Models\\User',176),(2,'App\\Models\\User',177),(2,'App\\Models\\User',178),(2,'App\\Models\\User',179),(2,'App\\Models\\User',180),(2,'App\\Models\\User',181),(2,'App\\Models\\User',182),(2,'App\\Models\\User',183),(2,'App\\Models\\User',184),(2,'App\\Models\\User',185),(2,'App\\Models\\User',186),(2,'App\\Models\\User',187),(2,'App\\Models\\User',188),(2,'App\\Models\\User',189),(2,'App\\Models\\User',190),(2,'App\\Models\\User',191),(2,'App\\Models\\User',192),(2,'App\\Models\\User',193),(2,'App\\Models\\User',194),(2,'App\\Models\\User',195),(2,'App\\Models\\User',196),(2,'App\\Models\\User',197),(2,'App\\Models\\User',198),(2,'App\\Models\\User',199),(2,'App\\Models\\User',200),(2,'App\\Models\\User',201),(2,'App\\Models\\User',202),(2,'App\\Models\\User',203),(2,'App\\Models\\User',204),(2,'App\\Models\\User',205),(2,'App\\Models\\User',206),(2,'App\\Models\\User',207),(2,'App\\Models\\User',208),(2,'App\\Models\\User',209),(2,'App\\Models\\User',210),(2,'App\\Models\\User',211),(2,'App\\Models\\User',212),(2,'App\\Models\\User',213),(2,'App\\Models\\User',214),(2,'App\\Models\\User',215),(2,'App\\Models\\User',216),(2,'App\\Models\\User',217),(2,'App\\Models\\User',218),(2,'App\\Models\\User',219),(2,'App\\Models\\User',220),(2,'App\\Models\\User',221),(12,'App\\Models\\User',222),(2,'App\\Models\\User',223),(2,'App\\Models\\User',224),(2,'App\\Models\\User',225),(2,'App\\Models\\User',226),(2,'App\\Models\\User',227),(2,'App\\Models\\User',228),(2,'App\\Models\\User',229),(2,'App\\Models\\User',230),(2,'App\\Models\\User',231),(2,'App\\Models\\User',232),(2,'App\\Models\\User',233),(2,'App\\Models\\User',234),(2,'App\\Models\\User',235),(2,'App\\Models\\User',236),(2,'App\\Models\\User',237),(2,'App\\Models\\User',238),(2,'App\\Models\\User',239),(2,'App\\Models\\User',240),(2,'App\\Models\\User',241),(2,'App\\Models\\User',242),(2,'App\\Models\\User',243),(2,'App\\Models\\User',244),(2,'App\\Models\\User',245),(2,'App\\Models\\User',246),(2,'App\\Models\\User',247),(20,'App\\Models\\User',248),(1,'App\\Models\\User',249),(10,'App\\Models\\User',250),(20,'App\\Models\\User',251),(1,'App\\Models\\User',252),(2,'App\\Models\\User',253),(2,'App\\Models\\User',254),(2,'App\\Models\\User',255),(2,'App\\Models\\User',256),(2,'App\\Models\\User',257),(2,'App\\Models\\User',258),(2,'App\\Models\\User',259),(2,'App\\Models\\User',260),(2,'App\\Models\\User',261),(2,'App\\Models\\User',262),(2,'App\\Models\\User',263),(2,'App\\Models\\User',264),(2,'App\\Models\\User',265),(2,'App\\Models\\User',266),(2,'App\\Models\\User',267),(2,'App\\Models\\User',268),(2,'App\\Models\\User',269),(2,'App\\Models\\User',270),(2,'App\\Models\\User',271),(2,'App\\Models\\User',272),(2,'App\\Models\\User',273),(2,'App\\Models\\User',274),(2,'App\\Models\\User',275),(2,'App\\Models\\User',276),(2,'App\\Models\\User',277),(2,'App\\Models\\User',278),(2,'App\\Models\\User',279),(2,'App\\Models\\User',280),(2,'App\\Models\\User',281),(2,'App\\Models\\User',282),(2,'App\\Models\\User',283),(2,'App\\Models\\User',284),(2,'App\\Models\\User',285),(2,'App\\Models\\User',286),(2,'App\\Models\\User',287),(2,'App\\Models\\User',288),(2,'App\\Models\\User',289),(2,'App\\Models\\User',290),(2,'App\\Models\\User',291),(2,'App\\Models\\User',292),(2,'App\\Models\\User',293),(2,'App\\Models\\User',294),(2,'App\\Models\\User',295),(2,'App\\Models\\User',296),(2,'App\\Models\\User',297),(2,'App\\Models\\User',298),(2,'App\\Models\\User',299),(2,'App\\Models\\User',300),(2,'App\\Models\\User',301),(2,'App\\Models\\User',302),(2,'App\\Models\\User',303),(2,'App\\Models\\User',304),(2,'App\\Models\\User',305),(2,'App\\Models\\User',306),(2,'App\\Models\\User',307),(2,'App\\Models\\User',308),(2,'App\\Models\\User',309),(2,'App\\Models\\User',310),(2,'App\\Models\\User',311),(2,'App\\Models\\User',312),(2,'App\\Models\\User',313),(2,'App\\Models\\User',314),(2,'App\\Models\\User',315),(2,'App\\Models\\User',316),(2,'App\\Models\\User',317),(2,'App\\Models\\User',318),(2,'App\\Models\\User',319),(2,'App\\Models\\User',320),(2,'App\\Models\\User',321),(2,'App\\Models\\User',322),(2,'App\\Models\\User',323),(2,'App\\Models\\User',324),(2,'App\\Models\\User',325),(2,'App\\Models\\User',326),(2,'App\\Models\\User',327),(2,'App\\Models\\User',328),(2,'App\\Models\\User',329),(2,'App\\Models\\User',330),(2,'App\\Models\\User',331),(2,'App\\Models\\User',332),(2,'App\\Models\\User',333),(2,'App\\Models\\User',334),(2,'App\\Models\\User',335),(2,'App\\Models\\User',336),(2,'App\\Models\\User',337),(2,'App\\Models\\User',338),(2,'App\\Models\\User',339),(2,'App\\Models\\User',340),(2,'App\\Models\\User',341),(2,'App\\Models\\User',342),(2,'App\\Models\\User',343),(2,'App\\Models\\User',344),(2,'App\\Models\\User',345),(2,'App\\Models\\User',346),(2,'App\\Models\\User',347),(2,'App\\Models\\User',348),(2,'App\\Models\\User',349),(2,'App\\Models\\User',350),(2,'App\\Models\\User',351),(2,'App\\Models\\User',352),(2,'App\\Models\\User',353),(2,'App\\Models\\User',354),(2,'App\\Models\\User',355),(2,'App\\Models\\User',356),(2,'App\\Models\\User',357),(2,'App\\Models\\User',358),(2,'App\\Models\\User',359),(2,'App\\Models\\User',360),(1,'App\\Models\\User',4064),(1,'App\\Models\\User',4065),(2,'App\\Models\\User',4066),(2,'App\\Models\\User',4067),(1,'App\\Models\\User',4068),(1,'App\\Models\\User',4069),(1,'App\\Models\\User',5160),(1,'App\\Models\\User',5161),(6,'App\\Models\\User',5162),(1,'App\\Models\\User',5163),(1,'App\\Models\\User',5164),(1,'App\\Models\\User',5165),(1,'App\\Models\\User',5166),(1,'App\\Models\\User',5167),(1,'App\\Models\\User',5168),(1,'App\\Models\\User',5169),(2,'App\\Models\\User',5170),(6,'App\\Models\\User',5171),(2,'App\\Models\\User',5172),(6,'App\\Models\\User',5173),(2,'App\\Models\\User',5174),(2,'App\\Models\\User',5175),(2,'App\\Models\\User',5176),(22,'App\\Models\\User',5177),(22,'App\\Models\\User',5178),(22,'App\\Models\\User',5179),(22,'App\\Models\\User',5180),(1,'App\\Models\\User',5181),(2,'App\\Models\\User',5182),(2,'App\\Models\\User',5183),(2,'App\\Models\\User',5184),(22,'App\\Models\\User',5185),(1,'App\\Models\\User',5353),(1,'App\\Models\\User',5354),(1,'App\\Models\\User',5355),(2,'App\\Models\\User',5356),(2,'App\\Models\\User',5357),(2,'App\\Models\\User',5358);
/*!40000 ALTER TABLE `model_has_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notifications` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_id` bigint unsigned NOT NULL,
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifications`
--

LOCK TABLES `notifications` WRITE;
/*!40000 ALTER TABLE `notifications` DISABLE KEYS */;
INSERT INTO `notifications` VALUES ('001c271d-860c-45ff-9de3-44a6195de4a3','App\\Notifications\\EmployeeDocumentExpiryNotifyToAdmin','App\\User',51,'{\"data\":\"A new notification about employee\'s document expiry\",\"link\":\"http:\\/\\/localhost\\/staff\\/employees\"}',NULL,'2023-01-23 05:38:18','2023-01-23 05:38:18'),('0096d6f3-aa02-453a-9bc2-225e366be5f3','App\\Notifications\\LeaveNotificationToAdmin','App\\Models\\User',9,'{\"data\":\"A new leave-notification\",\"link\":\"http:\\/\\/peopleprohrm.test\\/timesheet\\/leaves\"}',NULL,'2023-12-10 05:13:00','2023-12-10 05:13:00'),('00e7234c-517e-4b33-8eb4-0610ef967af3','App\\Notifications\\OfficialDocumentExpiryNotifyToAdmin','App\\User',47,'{\"data\":\"A new notification about official document expiry\",\"link\":\"http:\\/\\/localhost\\/file_manager\\/official_documents\"}',NULL,'2021-12-07 13:35:09','2021-12-07 13:35:09'),('00fb92c0-4635-4a74-ac50-589b65768467','App\\Notifications\\CompanyPolicyNotify','App\\User',51,'{\"data\":\"Company Policy has been published\",\"link\":\"http:\\/\\/localhost\\/peoplepro\\/organization\\/policy\"}',NULL,'2023-02-01 07:30:21','2023-02-01 07:30:21'),('022e77a8-8ab7-4f54-8c07-96866a96cdc2','App\\Notifications\\OfficialDocumentExpiryNotifyToAdmin','App\\User',1,'{\"data\":\"A new notification about official document expiry\",\"link\":\"http:\\/\\/localhost\\/file_manager\\/official_documents\"}','2022-06-05 08:14:54','2021-12-07 13:38:07','2022-06-05 08:14:54'),('025b43ad-33e6-4281-9424-dc882fd1bc5a','App\\Notifications\\LeaveNotificationToAdmin','App\\Models\\User',1,'{\"data\":\"A new leave-notification\",\"link\":\"http:\\/\\/peopleprohrm.test\\/timesheet\\/leaves\"}','2024-01-16 03:22:08','2023-12-10 05:49:41','2024-01-16 03:22:08'),('03e11f54-3aff-4ff8-b7ff-096a58efd13e','App\\Notifications\\LeaveNotificationToAdmin','App\\Models\\User',51,'{\"data\":\"A new leave-notification\",\"link\":\"http:\\/\\/peopleprohrm.test\\/timesheet\\/leaves\"}',NULL,'2023-12-10 05:13:02','2023-12-10 05:13:02'),('03f28b6b-81bb-42fd-ae6d-03b7915b51ad','App\\Notifications\\TicketCreatedNotification','App\\Models\\User',5168,'{\"data\":\"Uma solicita\\u00e7\\u00e3o foi emitido para MARCELO DE OLIVEIRA DA SILVA \",\"link\":\"https:\\/\\/testerh.com.br\\/tickets\\/5Tb0bt8E\"}',NULL,'2025-08-12 19:54:31','2025-08-12 19:54:31'),('054584f3-fb46-4475-aa04-c3956e6542da','App\\Notifications\\LeaveNotificationToAdmin','App\\User',44,'{\"data\":\"A new leave-notification\",\"link\":\"http:\\/\\/localhost\\/peoplepro\\/timesheet\\/leaves\"}',NULL,'2021-10-04 01:15:59','2021-10-04 01:15:59'),('05f14b40-5501-4b98-8153-9dc0dcd8f583','App\\Notifications\\LeaveNotificationToAdmin','App\\Models\\User',1,'{\"data\":\"A new leave-notification\",\"link\":\"http:\\/\\/peopleprohrm.test\\/timesheet\\/leaves\"}','2024-01-16 03:22:08','2023-12-10 05:12:55','2024-01-16 03:22:08'),('069448fd-f24a-4589-8a32-c14c9b032b7f','App\\Notifications\\LeaveNotification','App\\Models\\User',294,'{\"data\":\"A new leave-notification has been published\",\"link\":\"https:\\/\\/rhnpmais.com.br\\/profile#Leave\"}',NULL,'2025-08-27 14:13:31','2025-08-27 14:13:31'),('0755b7e8-a6e0-41cc-b5d2-b8823454714c','App\\Notifications\\TicketCreatedNotification','App\\Models\\User',5165,'{\"data\":\"Uma solicita\\u00e7\\u00e3o foi emitido para MARCELO DE OLIVEIRA DA SILVA \",\"link\":\"http:\\/\\/rhnpmais.com.br\\/tickets\\/oHDPMiJS\"}',NULL,'2025-08-27 13:38:39','2025-08-27 13:38:39'),('078e60cb-22d4-44c7-859c-38c06b2d610e','App\\Notifications\\TicketCreatedNotification','App\\Models\\User',5163,'{\"data\":\"Uma solicita\\u00e7\\u00e3o foi emitido para MARCELO DE OLIVEIRA DA SILVA \",\"link\":\"http:\\/\\/rhnpmais.com.br\\/tickets\\/mzHPUOjR\"}',NULL,'2025-08-27 13:41:21','2025-08-27 13:41:21'),('07cc0e2f-657a-4fef-8fd2-0c69335af90f','App\\Notifications\\TicketCreatedNotification','App\\Models\\User',5163,'{\"data\":\"Uma solicita\\u00e7\\u00e3o foi emitido para LETICIA MACIEL AVELINO  \",\"link\":\"https:\\/\\/www.rhnpmais.com.br\\/tickets\\/RKE5amcW\"}',NULL,'2025-09-01 15:35:12','2025-09-01 15:35:12'),('08227ce0-ad84-488c-b01c-d57a23e13a97','App\\Notifications\\TicketCreatedNotification','App\\Models\\User',5353,'{\"data\":\"Uma solicita\\u00e7\\u00e3o foi emitido para MARCELO DE OLIVEIRA DA SILVA \",\"link\":\"https:\\/\\/www.testerh.com.br\\/tickets\\/frT9FBZR\"}',NULL,'2025-08-28 20:21:37','2025-08-28 20:21:37'),('083f1c28-02e3-4fbf-83c5-48881bb05957','App\\Notifications\\TicketCreatedNotification','App\\Models\\User',5166,'{\"data\":\"Uma solicita\\u00e7\\u00e3o foi emitido para MARCELO DE OLIVEIRA DA SILVA \",\"link\":\"https:\\/\\/testerh.com.br\\/tickets\\/kTXFywmv\"}',NULL,'2025-08-12 20:23:32','2025-08-12 20:23:32'),('08a010bf-a94e-4640-9b33-bbc12da5b816','App\\Notifications\\ComplaintFromNotify','App\\Models\\User',111,'{\"data\":\"jovem aprendiz--Sua reclama\\u00e7\\u00e3o contra 184 foi registrada\",\"link\":\"\\/profile#Employee_Complaint\"}',NULL,'2025-08-18 19:20:04','2025-08-18 19:20:04'),('0962bc16-0584-4f7d-9760-ad37a5f3c09d','App\\Notifications\\LeaveNotificationToAdmin','App\\User',48,'{\"data\":\"A new leave-notification\",\"link\":\"http:\\/\\/localhost\\/peoplepro\\/timesheet\\/leaves\"}',NULL,'2021-10-04 04:09:17','2021-10-04 04:09:17'),('0a2ec41b-5a90-49bc-89e8-337f85776d29','App\\Notifications\\TicketCreatedNotification','App\\Models\\User',5354,'{\"data\":\"Uma solicita\\u00e7\\u00e3o foi emitido para LETICIA MACIEL AVELINO  \",\"link\":\"https:\\/\\/www.rhnpmais.com.br\\/tickets\\/RKE5amcW\"}',NULL,'2025-09-01 15:35:13','2025-09-01 15:35:13'),('0a514bfd-0965-42ee-9531-66e43e5f7536','App\\Notifications\\ComplainAgainstNotify','App\\Models\\User',107,'{\"data\":\"Testando reclamacao--Uma reclama\\u00e7\\u00e3o foi apresentada contra voc\\u00ea por 109\",\"link\":\"ex\\/profile#Employee_Complaint\"}',NULL,'2025-03-26 07:59:17','2025-03-26 07:59:17'),('0ac4b300-c8ef-4fd5-9f38-a0eb71e05d6f','App\\Notifications\\ProjectUpdatedNotification','App\\User',8,'{\"data\":\"Test1 has been updated\",\"link\":\"http:\\/\\/peopleprohrm.com\\/demo\\/project-management\\/projects\\/1\"}',NULL,'2020-10-18 11:21:13','2020-10-18 11:21:13'),('0ac826c3-d95b-42c2-88a7-c70d1776379e','App\\Notifications\\LeaveNotificationToAdmin','App\\Models\\User',51,'{\"data\":\"A new leave-notification\",\"link\":\"http:\\/\\/peopleprohrm.test\\/timesheet\\/leaves\"}',NULL,'2023-12-10 06:13:20','2023-12-10 06:13:20'),('0afbebfa-95a5-409a-834d-b2a01c2fe855','App\\Notifications\\TicketCreatedNotification','App\\Models\\User',5162,'{\"data\":\"Uma solicita\\u00e7\\u00e3o foi emitido para LETICIA MACIEL AVELINO  \",\"link\":\"https:\\/\\/www.rhnpmais.com.br\\/tickets\\/RKE5amcW\"}',NULL,'2025-09-01 15:35:13','2025-09-01 15:35:13'),('0b6fad58-df06-4c09-a154-bb5e3f767530','App\\Notifications\\TicketUpdatedNotification','App\\User',1,'{\"data\":\"Issued ticket for Bob Hobart has been updated\",\"link\":\"http:\\/\\/peopleprohrm.com\\/demo\\/tickets\\/Kkqx8gSB\"}','2020-07-28 17:06:15','2020-07-28 17:06:02','2020-07-28 17:06:15'),('0c48ba7d-e02b-4d50-9521-36fdda73c9bb','App\\Notifications\\LeaveNotificationToAdmin','App\\Models\\User',109,'{\"data\":\"A new leave-notification\",\"link\":\"https:\\/\\/www.testerh.com.br\\/timesheet\\/leaves\"}',NULL,'2025-06-11 02:47:48','2025-06-11 02:47:48'),('0c7b565d-2342-4937-8628-1db54d9a0642','App\\Notifications\\ProjectUpdatedNotification','App\\User',15,'{\"data\":\"Test2 has been updated\",\"link\":\"http:\\/\\/peopleprohrm.com\\/demo\\/project-management\\/projects\\/2\"}',NULL,'2020-10-25 17:12:46','2020-10-25 17:12:46'),('0ce84903-f200-42e8-acbf-9515393b20c2','App\\Notifications\\LeaveNotificationToAdmin','App\\Models\\User',9,'{\"data\":\"A new leave-notification\",\"link\":\"http:\\/\\/peopleprohrm.test\\/timesheet\\/leaves\"}',NULL,'2023-12-10 05:44:57','2023-12-10 05:44:57'),('0d61497a-e239-408a-af8c-8396cb780b8f','App\\Notifications\\LeaveNotificationToAdmin','App\\Models\\User',9,'{\"data\":\"A new leave-notification\",\"link\":\"http:\\/\\/peopleprohrm.test\\/timesheet\\/leaves\"}',NULL,'2023-12-10 05:13:00','2023-12-10 05:13:00'),('0d9195ca-2081-4670-8a2f-26f7388bf0aa','App\\Notifications\\TicketCreatedNotification','App\\Models\\User',5171,'{\"data\":\"Uma solicita\\u00e7\\u00e3o foi emitido para LETICIA MACIEL AVELINO  \",\"link\":\"https:\\/\\/www.rhnpmais.com.br\\/tickets\\/RKE5amcW\"}',NULL,'2025-09-01 15:35:13','2025-09-01 15:35:13'),('0dfaecd8-ef3b-4d7a-a60a-c519b7c8069c','App\\Notifications\\ComplainAgainstNotify','App\\Models\\User',106,'{\"data\":\"teste--Uma reclama\\u00e7\\u00e3o foi apresentada contra voc\\u00ea por 107\",\"link\":\"ex\\/profile#Employee_Complaint\"}',NULL,'2025-03-26 06:45:51','2025-03-26 06:45:51'),('0f407861-62d4-4ef5-9f8a-c717afe26753','App\\Notifications\\TicketCreatedNotification','App\\Models\\User',5169,'{\"data\":\"Uma solicita\\u00e7\\u00e3o foi emitido para MARCELO DE OLIVEIRA DA SILVA \",\"link\":\"http:\\/\\/rhnpmais.com.br\\/tickets\\/mzHPUOjR\"}',NULL,'2025-08-27 13:41:21','2025-08-27 13:41:21'),('11384293-8dee-431c-b884-3939819cc202','App\\Notifications\\LeaveNotification','App\\User',11,'{\"data\":\"A new leave-notification has been published\",\"link\":\"http:\\/\\/localhost\\/peoplepro\\/profile#Leave\"}',NULL,'2023-01-22 13:12:46','2023-01-22 13:12:46'),('1140572c-13d0-456b-b58e-01df812d21b6','App\\Notifications\\InvoicePaidNotification','App\\User',16,'{\"data\":\"Payment of Project : Test2 has been paid\",\"link\":\"http:\\/\\/peopleprohrm.com\\/demo\\/project-management\\/invoices\\/INV-NleUqw\"}',NULL,'2020-10-18 03:13:41','2020-10-18 03:13:41'),('120facb5-8691-454c-847b-1f3c2ad791a5','App\\Notifications\\ProjectCreatedNotifiaction','App\\User',51,'{\"data\":\"A project has been created namely Test and 1 Employees has been assigned for \",\"link\":\"http:\\/\\/localhost\\/peoplepro\\/project-management\\/projects\\/4\"}',NULL,'2023-02-09 05:02:21','2023-02-09 05:02:21'),('123b3110-bf5b-4369-a11f-e849fca343ce','App\\Notifications\\TicketCreatedNotification','App\\Models\\User',5165,'{\"data\":\"Uma solicita\\u00e7\\u00e3o foi emitido para LETICIA MACIEL AVELINO  \",\"link\":\"https:\\/\\/www.rhnpmais.com.br\\/tickets\\/RKE5amcW\"}',NULL,'2025-09-01 15:35:12','2025-09-01 15:35:12'),('1432b73f-b57b-49bc-a620-da950457f5b6','App\\Notifications\\LeaveNotificationToAdmin','App\\Models\\User',9,'{\"data\":\"A new leave-notification\",\"link\":\"http:\\/\\/peopleprohrm.test\\/timesheet\\/leaves\"}',NULL,'2023-12-10 06:16:48','2023-12-10 06:16:48'),('144c0b47-e39d-4bb2-9742-0a1519d2a8b5','App\\Notifications\\InvoicePaidNotification','App\\User',16,'{\"data\":\"Payment of Project : test3 has been paid\",\"link\":\"http:\\/\\/peopleprohrm.com\\/demo\\/project-management\\/invoices\\/INV-IjAIYl\"}',NULL,'2020-10-12 07:50:56','2020-10-12 07:50:56'),('14b47e96-7736-494c-9bcf-ef50d6f66bd5','App\\Notifications\\LeaveNotificationToAdmin','App\\User',1,'{\"data\":\"A new leave-notification\",\"link\":\"http:\\/\\/localhost\\/peoplepro\\/timesheet\\/leaves\"}','2021-11-27 05:42:22','2021-10-04 04:08:51','2021-11-27 05:42:22'),('14d5f7d8-60fe-491a-85b8-334e78085f2a','App\\Notifications\\LeaveNotificationToAdmin','App\\Models\\User',9,'{\"data\":\"A new leave-notification\",\"link\":\"http:\\/\\/peopleprohrm.test\\/timesheet\\/leaves\"}',NULL,'2023-12-10 05:13:11','2023-12-10 05:13:11'),('1713bde5-3d09-4ad5-9b10-ac43e0c9df05','App\\Notifications\\EmployeeTerminationNotify','App\\User',54,'{\"data\":\"You have been terminated from this company  Termination Date-- 14-02-2023\",\"link\":\"\"}',NULL,'2023-02-14 08:26:43','2023-02-14 08:26:43'),('171e1fe6-13b0-4f89-bf95-a92392d4ba91','App\\Notifications\\LeaveNotificationToAdmin','App\\Models\\User',51,'{\"data\":\"A new leave-notification\",\"link\":\"http:\\/\\/peopleprohrm.test\\/timesheet\\/leaves\"}',NULL,'2023-12-10 05:45:48','2023-12-10 05:45:48'),('17531917-73d0-4d40-af45-a2a663c71a94','App\\Notifications\\LeaveNotificationToAdmin','App\\Models\\User',51,'{\"data\":\"A new leave-notification\",\"link\":\"http:\\/\\/peopleprohrm.test\\/timesheet\\/leaves\"}',NULL,'2023-12-10 06:16:45','2023-12-10 06:16:45'),('17c9ff3a-1b0f-4d32-96a4-be21653230cd','App\\Notifications\\LeaveNotificationToAdmin','App\\Models\\User',51,'{\"data\":\"A new leave-notification\",\"link\":\"http:\\/\\/peopleprohrm.test\\/timesheet\\/leaves\"}',NULL,'2023-12-10 05:13:02','2023-12-10 05:13:02'),('17ca50bc-de72-4f31-b362-9b8d6778fb9e','App\\Notifications\\TicketCreatedNotification','App\\Models\\User',146,'{\"data\":\"Um bilhete foi emitido para RebeccaTeste \",\"link\":\"https:\\/\\/testerh.com.br\\/tickets\\/pV5cN7ub\"}',NULL,'2025-05-19 17:38:44','2025-05-19 17:38:44'),('195ca03d-4cfb-4094-93f6-e2617e675fef','App\\Notifications\\OfficialDocumentExpiryNotifyToAdmin','App\\User',36,'{\"data\":\"A new notification about official document expiry\",\"link\":\"http:\\/\\/localhost\\/file_manager\\/official_documents\"}',NULL,'2021-12-07 13:35:08','2021-12-07 13:35:08'),('19b514a6-e29a-4e9f-8c25-75d4429fb52e','App\\Notifications\\LeaveNotificationToAdmin','App\\Models\\User',9,'{\"data\":\"A new leave-notification\",\"link\":\"http:\\/\\/peopleprohrm.test\\/timesheet\\/leaves\"}',NULL,'2023-12-10 05:13:11','2023-12-10 05:13:11'),('19f34faa-70dd-4c4b-abc8-3d79f63880b7','App\\Notifications\\LeaveNotificationToAdmin','App\\Models\\User',9,'{\"data\":\"A new leave-notification\",\"link\":\"http:\\/\\/peopleprohrm.test\\/timesheet\\/leaves\"}',NULL,'2023-12-10 05:13:11','2023-12-10 05:13:11'),('1a5912e4-1c5e-4c29-a1da-b21cc97223c4','App\\Notifications\\ComplaintFromNotify','App\\Models\\User',5184,'{\"data\":\"Reclama\\u00e7\\u00f5es sobre a colaboradora--Sua reclama\\u00e7\\u00e3o contra 274 foi registrada\",\"link\":\"\\/profile#Employee_Complaint\"}',NULL,'2025-08-19 19:53:09','2025-08-19 19:53:09'),('1a9a77bf-fb82-4261-a735-3089080c551b','App\\Notifications\\TicketCreatedNotification','App\\Models\\User',107,'{\"data\":\"Um bilhete foi emitido para RebeccaTeste \",\"link\":\"https:\\/\\/testerh.com.br\\/tickets\\/pV5cN7ub\"}',NULL,'2025-05-19 17:38:44','2025-05-19 17:38:44'),('1ab2c4a7-078e-424e-ab48-80340fe3f7de','App\\Notifications\\LeaveNotificationToAdmin','App\\User',44,'{\"data\":\"A new leave-notification\",\"link\":\"http:\\/\\/localhost\\/peoplepro\\/timesheet\\/leaves\"}',NULL,'2021-10-04 01:21:09','2021-10-04 01:21:09'),('1b525061-8395-4540-bbc2-7550f34c69a8','App\\Notifications\\LeaveNotificationToAdmin','App\\Models\\User',51,'{\"data\":\"A new leave-notification\",\"link\":\"http:\\/\\/peopleprohrm.test\\/timesheet\\/leaves\"}',NULL,'2023-12-10 05:12:59','2023-12-10 05:12:59'),('1bfb1701-e27c-4c38-9aa9-4c65f95edd53','App\\Notifications\\LeaveNotificationToAdmin','App\\Models\\User',9,'{\"data\":\"A new leave-notification\",\"link\":\"http:\\/\\/peopleprohrm.test\\/timesheet\\/leaves\"}',NULL,'2023-12-10 05:13:01','2023-12-10 05:13:01'),('1c20d2b4-c861-466a-8dd1-0bfc4af880b3','App\\Notifications\\LeaveNotificationToAdmin','App\\User',31,'{\"data\":\"A new leave-notification\",\"link\":\"http:\\/\\/localhost\\/peoplepro\\/timesheet\\/leaves\"}',NULL,'2021-10-04 01:22:12','2021-10-04 01:22:12'),('1ce54faa-9ca2-4878-9658-61150b3ad8da','App\\Notifications\\TicketCreatedNotification','App\\Models\\User',5171,'{\"data\":\"Uma solicita\\u00e7\\u00e3o foi emitido para MARCELO DE OLIVEIRA DA SILVA \",\"link\":\"http:\\/\\/rhnpmais.com.br\\/tickets\\/oHDPMiJS\"}',NULL,'2025-08-27 13:38:39','2025-08-27 13:38:39'),('1e87c608-adbc-464b-bfd3-120026eb0c07','App\\Notifications\\TicketCreatedNotification','App\\Models\\User',101,'{\"data\":\"Uma solicita\\u00e7\\u00e3o foi emitido para Enzo \",\"link\":\"https:\\/\\/testerh.com.br\\/tickets\\/WJQAzDm4\"}',NULL,'2025-08-06 19:51:50','2025-08-06 19:51:50'),('1ea13e71-14ea-48dd-8851-e079272f21ca','App\\Notifications\\TicketCreatedNotification','App\\Models\\User',5168,'{\"data\":\"Uma solicita\\u00e7\\u00e3o foi emitido para MARCELO DE OLIVEIRA DA SILVA \",\"link\":\"http:\\/\\/rhnpmais.com.br\\/tickets\\/eALPLUfr\"}',NULL,'2025-08-27 13:41:22','2025-08-27 13:41:22'),('1ebe500f-67aa-4dbb-a2ef-42edd1bace4a','App\\Notifications\\LeaveNotificationToAdmin','App\\User',36,'{\"data\":\"A new leave-notification\",\"link\":\"http:\\/\\/localhost\\/peoplepro\\/timesheet\\/leaves\"}',NULL,'2021-10-04 01:16:18','2021-10-04 01:16:18'),('1f2b963a-c3d7-443e-9f0f-9856280ed383','App\\Notifications\\TicketCreatedNotification','App\\Models\\User',5167,'{\"data\":\"Uma solicita\\u00e7\\u00e3o foi emitido para MARCELO DE OLIVEIRA DA SILVA \",\"link\":\"http:\\/\\/rhnpmais.com.br\\/tickets\\/oHDPMiJS\"}',NULL,'2025-08-27 13:38:39','2025-08-27 13:38:39'),('1f355932-170d-439b-ae87-1f016c92faae','App\\Notifications\\OfficialDocumentExpiryNotifyToAdmin','App\\User',31,'{\"data\":\"A new notification about official document expiry\",\"link\":\"http:\\/\\/localhost\\/file_manager\\/official_documents\"}',NULL,'2021-12-07 13:38:23','2021-12-07 13:38:23'),('1fb3f81d-3bb5-4c24-94db-44e0cdda1072','App\\Notifications\\ProjectUpdatedNotification','App\\User',1,'{\"data\":\"test3 has been updated\",\"link\":\"http:\\/\\/peopleprohrm.com\\/demo\\/project-management\\/projects\\/3\"}','2021-06-17 03:14:26','2020-10-25 17:16:16','2021-06-17 03:14:26'),('2026ebc5-e225-401f-a0e3-0f2304c46544','App\\Notifications\\LeaveNotificationToAdmin','App\\Models\\User',1,'{\"data\":\"A new leave-notification\",\"link\":\"http:\\/\\/peopleprohrm.test\\/timesheet\\/leaves\"}','2024-01-16 03:22:08','2023-12-10 06:19:32','2024-01-16 03:22:08'),('20c8e782-ea37-41ae-96d9-78c5f0ddd80c','App\\Notifications\\LeaveNotificationToAdmin','App\\Models\\User',51,'{\"data\":\"A new leave-notification\",\"link\":\"http:\\/\\/peopleprohrm.test\\/timesheet\\/leaves\"}',NULL,'2023-12-10 05:12:59','2023-12-10 05:12:59'),('20daa08e-b8bb-44bd-91e3-f42290570ce9','App\\Notifications\\LeaveNotificationToAdmin','App\\User',46,'{\"data\":\"A new leave-notification\",\"link\":\"http:\\/\\/localhost\\/peoplepro\\/timesheet\\/leaves\"}',NULL,'2021-10-04 04:09:01','2021-10-04 04:09:01'),('20e9b7ff-4a38-4fae-b035-6db87cccd12d','App\\Notifications\\LeaveNotificationToAdmin','App\\Models\\User',1,'{\"data\":\"A new leave-notification\",\"link\":\"http:\\/\\/peopleprohrm.test\\/timesheet\\/leaves\"}','2024-01-16 03:22:08','2023-12-10 06:21:16','2024-01-16 03:22:08'),('2173284b-75a0-4bc4-91f5-17ad34dcc7ed','App\\Notifications\\LeaveNotificationToAdmin','App\\User',44,'{\"data\":\"A new leave-notification\",\"link\":\"http:\\/\\/localhost\\/peoplepro\\/timesheet\\/leaves\"}',NULL,'2021-10-04 04:09:17','2021-10-04 04:09:17'),('22101cf4-b13f-4491-b990-c6f0b624d91e','App\\Notifications\\TicketCreatedNotification','App\\Models\\User',5355,'{\"data\":\"Uma solicita\\u00e7\\u00e3o foi emitido para LETICIA MACIEL AVELINO  \",\"link\":\"https:\\/\\/www.rhnpmais.com.br\\/tickets\\/RKE5amcW\"}',NULL,'2025-09-01 15:35:13','2025-09-01 15:35:13'),('228740fd-d259-4e86-91e4-9320df68b6b3','App\\Notifications\\LeaveNotificationToAdmin','App\\Models\\User',51,'{\"data\":\"A new leave-notification\",\"link\":\"http:\\/\\/peopleprohrm.test\\/timesheet\\/leaves\"}',NULL,'2023-12-10 06:21:35','2023-12-10 06:21:35'),('229f3904-5c73-4763-8e99-6ac21e9d32b4','App\\Notifications\\OfficialDocumentExpiryNotifyToAdmin','App\\User',44,'{\"data\":\"A new notification about official document expiry\",\"link\":\"http:\\/\\/localhost\\/file_manager\\/official_documents\"}',NULL,'2021-12-07 13:38:23','2021-12-07 13:38:23'),('22ec1a2d-fc0b-4929-bac1-aeb61d7d9ad6','App\\Notifications\\LeaveNotificationToAdmin','App\\Models\\User',51,'{\"data\":\"A new leave-notification\",\"link\":\"http:\\/\\/peopleprohrm.test\\/timesheet\\/leaves\"}',NULL,'2023-12-10 05:12:55','2023-12-10 05:12:55'),('22ef0086-38ab-4db6-a3fc-152fcf7dd744','App\\Notifications\\LeaveNotificationToAdmin','App\\Models\\User',51,'{\"data\":\"A new leave-notification\",\"link\":\"http:\\/\\/peopleprohrm.test\\/timesheet\\/leaves\"}',NULL,'2023-12-10 05:47:31','2023-12-10 05:47:31'),('232dbdbd-f4fc-4c6f-93ba-58d5f854e6b2','App\\Notifications\\TicketAssignedNotification','App\\User',12,'{\"data\":\"2 Employees has been assigned for Bob Hobart ticket\",\"link\":\"http:\\/\\/peopleprohrm.com\\/demo\\/tickets\\/Kkqx8gSB\"}',NULL,'2020-07-28 17:05:30','2020-07-28 17:05:30'),('23750db8-1c65-4493-9583-75d7cd79035e','App\\Notifications\\TicketUpdatedNotification','App\\Models\\User',5160,'{\"data\":\"Solicita\\u00e7\\u00e3o emitido para MARCELO DE OLIVEIRA DA SILVA  Tem sido atualizado\",\"link\":\"https:\\/\\/www.testerh.com.br\\/tickets\\/5Tb0bt8E\"}',NULL,'2025-08-12 20:03:21','2025-08-12 20:03:21'),('23d3ea31-9416-4a74-b53c-5062e2a23fef','App\\Notifications\\LeaveNotificationToAdmin','App\\Models\\User',9,'{\"data\":\"A new leave-notification\",\"link\":\"http:\\/\\/peopleprohrm.test\\/timesheet\\/leaves\"}',NULL,'2023-12-10 06:21:16','2023-12-10 06:21:16'),('24dc0612-a560-41cb-a466-7dfd8fd648cd','App\\Notifications\\LeaveNotificationToAdmin','App\\User',1,'{\"data\":\"A new leave-notification\",\"link\":\"http:\\/\\/localhost\\/peoplepro\\/timesheet\\/leaves\"}','2021-10-04 01:17:04','2021-10-04 01:15:59','2021-10-04 01:17:04'),('2576b494-0728-4b90-bd74-f68fb7502fa5','App\\Notifications\\TicketUpdatedNotification','App\\Models\\User',5166,'{\"data\":\"Solicita\\u00e7\\u00e3o emitido para MARCELO DE OLIVEIRA DA SILVA  Tem sido atualizado\",\"link\":\"https:\\/\\/www.testerh.com.br\\/tickets\\/frT9FBZR\"}',NULL,'2025-08-28 20:28:03','2025-08-28 20:28:03'),('26757a54-9f21-4369-828f-740b1f55efa8','App\\Notifications\\LeaveNotificationToAdmin','App\\Models\\User',51,'{\"data\":\"A new leave-notification\",\"link\":\"http:\\/\\/peopleprohrm.test\\/timesheet\\/leaves\"}',NULL,'2023-12-10 05:44:35','2023-12-10 05:44:35'),('26fd9a32-861a-414f-bed9-656b04743199','App\\Notifications\\EmployeeTravelStatus','App\\User',9,'{\"data\":\"Your travel request status is --- approved\",\"link\":\"http:\\/\\/peopleprohrm.com\\/demo\\/profile#Employee_travel\"}','2021-07-05 15:53:34','2020-08-18 07:13:03','2021-07-05 15:53:34'),('28e93542-4379-4216-9525-418e306719ea','App\\Notifications\\LeaveNotificationToAdmin','App\\Models\\User',51,'{\"data\":\"A new leave-notification\",\"link\":\"http:\\/\\/peopleprohrm.test\\/timesheet\\/leaves\"}',NULL,'2023-12-10 06:13:46','2023-12-10 06:13:46'),('28f5faf8-afa8-4c4a-9b86-9f927d8c9164','App\\Notifications\\TicketCreatedNotification','App\\Models\\User',97,'{\"data\":\"Um bilhete foi emitido para RebeccaTeste \",\"link\":\"https:\\/\\/testerh.com.br\\/tickets\\/bYYHUDWe\"}',NULL,'2025-05-21 02:09:51','2025-05-21 02:09:51'),('290cc4dc-26c8-4dbc-9397-f0ab4c7f359a','App\\Notifications\\LeaveNotificationToAdmin','App\\User',31,'{\"data\":\"A new leave-notification\",\"link\":\"http:\\/\\/localhost\\/peoplepro\\/timesheet\\/leaves\"}',NULL,'2021-10-04 04:08:51','2021-10-04 04:08:51'),('29704e06-94fa-4fc3-a25f-4d9278a6fb61','App\\Notifications\\LeaveNotificationToAdmin','App\\User',36,'{\"data\":\"A new leave-notification\",\"link\":\"http:\\/\\/localhost\\/peoplepro\\/timesheet\\/leaves\"}',NULL,'2021-10-04 01:15:59','2021-10-04 01:15:59'),('29a3a88e-18b5-47d4-a866-3075f112113c','App\\Notifications\\TicketCreatedNotification','App\\Models\\User',5163,'{\"data\":\"Uma solicita\\u00e7\\u00e3o foi emitido para MARCELO DE OLIVEIRA DA SILVA \",\"link\":\"https:\\/\\/testerh.com.br\\/tickets\\/5Tb0bt8E\"}',NULL,'2025-08-12 19:54:31','2025-08-12 19:54:31'),('29d227bd-8bc9-410d-801c-54f4a45c1cef','App\\Notifications\\OfficialDocumentExpiryNotifyToAdmin','App\\User',36,'{\"data\":\"A new notification about official document expiry\",\"link\":\"http:\\/\\/localhost\\/file_manager\\/official_documents\"}',NULL,'2021-12-07 13:38:07','2021-12-07 13:38:07'),('2aa1ad93-d742-4a72-bf58-8aeccf7ea38e','App\\Notifications\\LeaveNotificationToAdmin','App\\Models\\User',9,'{\"data\":\"A new leave-notification\",\"link\":\"http:\\/\\/peopleprohrm.test\\/timesheet\\/leaves\"}',NULL,'2023-12-10 05:43:15','2023-12-10 05:43:15'),('2adc0564-5f99-4835-b6c2-f03c02857210','App\\Notifications\\CompanyPolicyNotify','App\\User',38,'{\"data\":\"Company Policy has been published\",\"link\":\"http:\\/\\/localhost\\/peoplepro\\/organization\\/policy\"}',NULL,'2023-02-01 07:30:21','2023-02-01 07:30:21'),('2aef1ce2-e41f-4562-a8a0-f6317d71c4fe','App\\Notifications\\TicketCreatedNotification','App\\Models\\User',5181,'{\"data\":\"Uma solicita\\u00e7\\u00e3o foi emitido para MARCELO DE OLIVEIRA DA SILVA \",\"link\":\"https:\\/\\/www.testerh.com.br\\/tickets\\/frT9FBZR\"}',NULL,'2025-08-28 20:21:37','2025-08-28 20:21:37'),('2bf302ee-7b63-4ba2-b8b4-ee33368729c7','App\\Notifications\\ComplaintFromNotify','App\\Models\\User',5183,'{\"data\":\"relat\\u00f3rio de desempenho da Funcion\\u00e1ria--Sua reclama\\u00e7\\u00e3o contra 3118 foi registrada\",\"link\":\"\\/profile#Employee_Complaint\"}',NULL,'2025-08-19 19:38:52','2025-08-19 19:38:52'),('2c430bbb-fded-4576-b9c9-b30b9de064dd','App\\Notifications\\TicketCreatedNotification','App\\Models\\User',5167,'{\"data\":\"Uma solicita\\u00e7\\u00e3o foi emitido para MARCELO DE OLIVEIRA DA SILVA \",\"link\":\"http:\\/\\/rhnpmais.com.br\\/tickets\\/eALPLUfr\"}',NULL,'2025-08-27 13:41:22','2025-08-27 13:41:22'),('2d728ddd-2c9c-4b94-9de7-722d59918397','App\\Notifications\\CompanyPolicyNotify','App\\User',9,'{\"data\":\"Company Policy has been published\",\"link\":\"http:\\/\\/localhost\\/peoplepro\\/organization\\/policy\"}','2023-02-01 07:30:48','2023-02-01 07:30:21','2023-02-01 07:30:48'),('2d9f84f7-b18c-4d81-87e3-40ba55ed3ee1','App\\Notifications\\InvoiceReceivedNotification','App\\User',16,'{\"data\":\"Invoice of Project : test3 has been received\",\"link\":\"http:\\/\\/peopleprohrm.com\\/demo\\/project-management\\/invoices\\/INV-IjAIYl\"}',NULL,'2020-10-12 07:50:00','2020-10-12 07:50:00'),('2e6f616c-5008-4c24-9091-5326adc6f72c','App\\Notifications\\TicketUpdatedNotification','App\\Models\\User',5160,'{\"data\":\"Solicita\\u00e7\\u00e3o emitido para MARCELO DE OLIVEIRA DA SILVA  Tem sido atualizado\",\"link\":\"https:\\/\\/www.testerh.com.br\\/tickets\\/frT9FBZR\"}',NULL,'2025-08-28 20:28:03','2025-08-28 20:28:03'),('2e761eb7-c74c-4254-9e5b-53989f1e5698','App\\Notifications\\LeaveNotificationToAdmin','App\\Models\\User',51,'{\"data\":\"A new leave-notification\",\"link\":\"http:\\/\\/peopleprohrm.test\\/timesheet\\/leaves\"}',NULL,'2023-12-10 06:28:53','2023-12-10 06:28:53'),('2ecfea6a-544d-41d3-9024-dfd6b2507130','App\\Notifications\\TicketCreatedNotification','App\\Models\\User',5166,'{\"data\":\"Uma solicita\\u00e7\\u00e3o foi emitido para LETICIA MACIEL AVELINO  \",\"link\":\"https:\\/\\/www.rhnpmais.com.br\\/tickets\\/RKE5amcW\"}',NULL,'2025-09-01 15:35:12','2025-09-01 15:35:12'),('2ed2f76d-2cdd-47c6-b6a8-307bc887ca9d','App\\Notifications\\LeaveNotificationToAdmin','App\\Models\\User',1,'{\"data\":\"A new leave-notification\",\"link\":\"http:\\/\\/peopleprohrm.test\\/timesheet\\/leaves\"}','2024-01-16 03:22:08','2023-12-10 06:16:45','2024-01-16 03:22:08'),('2efcb67b-be28-41e9-a475-29f6a939bc95','App\\Notifications\\LeaveNotificationToAdmin','App\\Models\\User',97,'{\"data\":\"A new leave-notification\",\"link\":\"https:\\/\\/www.testerh.com.br\\/timesheet\\/leaves\"}',NULL,'2025-06-11 02:47:48','2025-06-11 02:47:48'),('2f0d94a5-5710-46c8-a6b2-166a4f0c8c1a','App\\Notifications\\LeaveNotification','App\\User',27,'{\"data\":\"A new leave-notification has been published\",\"link\":\"http:\\/\\/localhost\\/peoplepro\\/profile#Leave\"}',NULL,'2021-10-04 01:11:32','2021-10-04 01:11:32'),('2fae3b63-e1c0-4775-afeb-77e75a446ea8','App\\Notifications\\TicketCreatedNotification','App\\Models\\User',115,'{\"data\":\"Um bilhete foi emitido para Carlos Robson Silva De Araujo \",\"link\":\"https:\\/\\/testerh.com.br\\/tickets\\/06euXSzq\"}','2025-07-11 05:15:46','2025-05-02 06:52:32','2025-07-11 05:15:46'),('300b98a7-65d0-409b-a95d-698c59ce8e9f','App\\Notifications\\TicketCreatedNotification','App\\Models\\User',5160,'{\"data\":\"Uma solicita\\u00e7\\u00e3o foi emitido para MARCELO DE OLIVEIRA DA SILVA \",\"link\":\"http:\\/\\/rhnpmais.com.br\\/tickets\\/mzHPUOjR\"}',NULL,'2025-08-27 13:41:21','2025-08-27 13:41:21'),('304ed1b9-2c99-48da-9f36-98feba1341a4','App\\Notifications\\CompanyPolicyNotify','App\\User',49,'{\"data\":\"Company Policy has been published\",\"link\":\"http:\\/\\/localhost\\/peoplepro\\/organization\\/policy\"}',NULL,'2023-02-01 07:30:21','2023-02-01 07:30:21'),('308bdb65-0973-472f-bbc1-2150211d38dd','App\\Notifications\\LeaveNotificationToAdmin','App\\Models\\User',51,'{\"data\":\"A new leave-notification\",\"link\":\"http:\\/\\/peopleprohrm.test\\/timesheet\\/leaves\"}',NULL,'2023-12-10 05:13:10','2023-12-10 05:13:10'),('309b6c1e-2085-4653-a546-37c5e47e9ff3','App\\Notifications\\TicketCreatedNotification','App\\Models\\User',110,'{\"data\":\"Um bilhete foi emitido para Carlos Robson Silva De Araujo \",\"link\":\"https:\\/\\/testerh.com.br\\/tickets\\/06euXSzq\"}',NULL,'2025-05-02 06:52:32','2025-05-02 06:52:32'),('30f619b0-1a36-469e-9572-a24e7b121264','App\\Notifications\\EmployeeTerminationNotify','App\\User',54,'{\"data\":\"You have been terminated from this company  Termination Date-- 14-02-2023\",\"link\":\"\"}',NULL,'2023-02-14 08:07:58','2023-02-14 08:07:58'),('316584ce-9135-4fb6-ab5f-8344025b051c','App\\Notifications\\LeaveNotificationToAdmin','App\\User',31,'{\"data\":\"A new leave-notification\",\"link\":\"http:\\/\\/localhost\\/peoplepro\\/timesheet\\/leaves\"}',NULL,'2021-10-04 04:09:05','2021-10-04 04:09:05'),('31884f15-caa3-442a-90dc-210209c1fe5a','App\\Notifications\\TicketCreatedNotification','App\\Models\\User',5181,'{\"data\":\"Uma solicita\\u00e7\\u00e3o foi emitido para LETICIA MACIEL AVELINO  \",\"link\":\"https:\\/\\/www.rhnpmais.com.br\\/tickets\\/RKE5amcW\"}',NULL,'2025-09-01 15:35:12','2025-09-01 15:35:12'),('31995334-fd82-4569-9a6b-eb75f000eded','App\\Notifications\\LeaveNotification','App\\Models\\User',246,'{\"data\":\"A new leave-notification has been published\",\"link\":\"https:\\/\\/testerh.com.br\\/profile#Leave\"}',NULL,'2025-06-11 06:02:36','2025-06-11 06:02:36'),('31ac858c-e3c8-470e-bc62-96af53736b50','App\\Notifications\\TicketCreatedNotification','App\\Models\\User',5353,'{\"data\":\"Uma solicita\\u00e7\\u00e3o foi emitido para LETICIA MACIEL AVELINO  \",\"link\":\"https:\\/\\/www.rhnpmais.com.br\\/tickets\\/RKE5amcW\"}',NULL,'2025-09-01 15:35:13','2025-09-01 15:35:13'),('32123099-eeea-465e-9ff1-b6621c5ccc3a','App\\Notifications\\LeaveNotificationToAdmin','App\\User',1,'{\"data\":\"A new leave-notification\",\"link\":\"http:\\/\\/localhost\\/peoplepro\\/timesheet\\/leaves\"}','2021-11-27 05:42:22','2021-10-04 04:09:04','2021-11-27 05:42:22'),('322b32ae-935d-498e-b581-43235b332154','App\\Notifications\\LeaveNotificationToAdmin','App\\User',48,'{\"data\":\"A new leave-notification\",\"link\":\"http:\\/\\/localhost\\/peoplepro\\/timesheet\\/leaves\"}',NULL,'2021-10-04 01:22:12','2021-10-04 01:22:12'),('32881f2d-436b-4210-8570-3532e060a29b','App\\Notifications\\OfficialDocumentExpiryNotifyToAdmin','App\\User',46,'{\"data\":\"A new notification about official document expiry\",\"link\":\"http:\\/\\/localhost\\/file_manager\\/official_documents\"}',NULL,'2021-12-07 13:35:08','2021-12-07 13:35:08'),('3386e315-ab4c-430f-af3c-86b128ff2966','App\\Notifications\\LeaveNotificationToAdmin','App\\User',36,'{\"data\":\"A new leave-notification\",\"link\":\"http:\\/\\/localhost\\/peoplepro\\/timesheet\\/leaves\"}',NULL,'2021-10-04 01:22:12','2021-10-04 01:22:12'),('3480c5be-9187-4d9d-8184-a9fcfedffc12','App\\Notifications\\LeaveNotificationToAdmin','App\\User',36,'{\"data\":\"A new leave-notification\",\"link\":\"http:\\/\\/localhost\\/peoplepro\\/timesheet\\/leaves\"}',NULL,'2021-10-04 04:09:00','2021-10-04 04:09:00'),('34ad7c47-fb17-44e3-902a-afe1e024d8a0','App\\Notifications\\TicketCreatedNotification','App\\Models\\User',146,'{\"data\":\"Um bilhete foi emitido para RebeccaTeste \",\"link\":\"https:\\/\\/testerh.com.br\\/tickets\\/omDo2MYk\"}',NULL,'2025-06-11 01:13:21','2025-06-11 01:13:21'),('37f9fc8d-21ca-47b3-85ff-31009a711976','App\\Notifications\\TicketCreatedNotification','App\\Models\\User',4069,'{\"data\":\"Uma solicita\\u00e7\\u00e3o foi emitido para LETICIA MACIEL AVELINO  \",\"link\":\"https:\\/\\/www.rhnpmais.com.br\\/tickets\\/RKE5amcW\"}',NULL,'2025-09-01 15:35:12','2025-09-01 15:35:12'),('38310d31-a52b-4322-ae50-2feb80229870','App\\Notifications\\OfficialDocumentExpiryNotifyToAdmin','App\\User',44,'{\"data\":\"A new notification about official document expiry\",\"link\":\"http:\\/\\/localhost\\/file_manager\\/official_documents\"}',NULL,'2021-12-07 13:35:08','2021-12-07 13:35:08'),('38dea1f3-870f-4109-bc8f-3a7788d0c158','App\\Notifications\\TicketCreatedNotification','App\\Models\\User',110,'{\"data\":\"Um bilhete foi emitido para RebeccaTeste \",\"link\":\"https:\\/\\/testerh.com.br\\/tickets\\/omDo2MYk\"}',NULL,'2025-06-11 01:13:21','2025-06-11 01:13:21'),('393c9aec-d382-483a-a6fc-743b21f71210','App\\Notifications\\LeaveNotificationToAdmin','App\\User',48,'{\"data\":\"A new leave-notification\",\"link\":\"http:\\/\\/localhost\\/peoplepro\\/timesheet\\/leaves\"}',NULL,'2021-10-04 04:08:52','2021-10-04 04:08:52'),('399d6153-6aca-4952-8eed-54381d115624','App\\Notifications\\LeaveNotificationToAdmin','App\\User',44,'{\"data\":\"A new leave-notification\",\"link\":\"http:\\/\\/localhost\\/peoplepro\\/timesheet\\/leaves\"}',NULL,'2021-10-04 01:16:18','2021-10-04 01:16:18'),('3a3451e9-1ff2-45e9-b264-ead1f799f873','App\\Notifications\\EmployeeTravelStatus','App\\User',9,'{\"data\":\"Your travel request status is --- approved\",\"link\":\"\\/profile#Employee_travel\"}',NULL,'2023-02-09 04:36:18','2023-02-09 04:36:18'),('3a45895d-f518-45ca-846f-2f5bf7fc94f4','App\\Notifications\\LeaveNotificationToAdmin','App\\Models\\User',51,'{\"data\":\"A new leave-notification\",\"link\":\"http:\\/\\/peopleprohrm.test\\/timesheet\\/leaves\"}',NULL,'2023-12-10 05:13:10','2023-12-10 05:13:10'),('3a641727-c233-48de-8ee9-5793929dc711','App\\Notifications\\TicketCreatedNotification','App\\Models\\User',119,'{\"data\":\"Um bilhete foi emitido para Carlos Robson Silva De Araujo \",\"link\":\"https:\\/\\/testerh.com.br\\/tickets\\/06euXSzq\"}','2025-07-24 08:14:31','2025-05-02 06:52:32','2025-07-24 08:14:31'),('3b1292dd-face-4085-abd7-c3efe75581d5','App\\Notifications\\LeaveNotificationToAdmin','App\\Models\\User',9,'{\"data\":\"A new leave-notification\",\"link\":\"http:\\/\\/peopleprohrm.test\\/timesheet\\/leaves\"}',NULL,'2023-12-10 06:13:20','2023-12-10 06:13:20'),('3b9379c5-f0f3-49ae-8cdf-c20d60d8715e','App\\Notifications\\TicketCreatedNotification','App\\Models\\User',5354,'{\"data\":\"Uma solicita\\u00e7\\u00e3o foi emitido para MARCELO DE OLIVEIRA DA SILVA \",\"link\":\"https:\\/\\/www.testerh.com.br\\/tickets\\/M4R7uFan\"}',NULL,'2025-08-27 13:41:45','2025-08-27 13:41:45'),('3b99fa34-18bc-429a-8d74-ccb1fe15f74e','App\\Notifications\\LeaveNotificationToAdmin','App\\User',47,'{\"data\":\"A new leave-notification\",\"link\":\"http:\\/\\/localhost\\/peoplepro\\/timesheet\\/leaves\"}',NULL,'2021-10-04 01:16:18','2021-10-04 01:16:18'),('3ba7bd6b-c3ea-43ca-be6c-61da46f63bea','App\\Notifications\\LeaveNotificationToAdmin','App\\Models\\User',222,'{\"data\":\"A new leave-notification\",\"link\":\"https:\\/\\/www.testerh.com.br\\/timesheet\\/leaves\"}',NULL,'2025-06-11 02:47:48','2025-06-11 02:47:48'),('3c1a20d0-428b-4fb3-9be7-e698846f6a96','App\\Notifications\\LeaveNotificationToAdmin','App\\Models\\User',51,'{\"data\":\"A new leave-notification\",\"link\":\"http:\\/\\/peopleprohrm.test\\/timesheet\\/leaves\"}',NULL,'2023-12-10 05:13:01','2023-12-10 05:13:01'),('3c1f0764-d4b4-4285-b18b-f667d4a30b4a','App\\Notifications\\TicketCreatedNotification','App\\Models\\User',5168,'{\"data\":\"Uma solicita\\u00e7\\u00e3o foi emitido para LETICIA MACIEL AVELINO  \",\"link\":\"https:\\/\\/www.rhnpmais.com.br\\/tickets\\/RKE5amcW\"}',NULL,'2025-09-01 15:35:12','2025-09-01 15:35:12'),('3d6e6707-2bb4-40e4-afb7-cc5f40cf3cd6','App\\Notifications\\TicketUpdatedNotification','App\\Models\\User',1,'{\"data\":\"Solicita\\u00e7\\u00e3o emitido para MARCELO DE OLIVEIRA DA SILVA  Tem sido atualizado\",\"link\":\"https:\\/\\/www.testerh.com.br\\/tickets\\/frT9FBZR\"}',NULL,'2025-08-28 20:28:03','2025-08-28 20:28:03'),('3df7b753-feba-4680-b3b1-7fc90fc92dbc','App\\Notifications\\LeaveNotificationToAdmin','App\\Models\\User',107,'{\"data\":\"A new leave-notification\",\"link\":\"https:\\/\\/www.testerh.com.br\\/timesheet\\/leaves\"}',NULL,'2025-06-11 02:47:48','2025-06-11 02:47:48'),('3e33cf8b-f258-4a8e-9363-f016d99a221a','App\\Notifications\\OfficialDocumentExpiryNotifyToAdmin','App\\User',1,'{\"data\":\"A new notification about official document expiry\",\"link\":\"http:\\/\\/localhost\\/file_manager\\/official_documents\"}','2022-06-05 08:14:54','2021-12-07 13:35:08','2022-06-05 08:14:54'),('3e623e9d-6b8a-4b72-aba8-7d2765db2a34','App\\Notifications\\LeaveNotificationToAdmin','App\\Models\\User',9,'{\"data\":\"A new leave-notification\",\"link\":\"http:\\/\\/peopleprohrm.test\\/timesheet\\/leaves\"}',NULL,'2023-12-10 05:13:10','2023-12-10 05:13:10'),('3f13c63d-9bb3-4460-b667-49cb0fd7b250','App\\Notifications\\LeaveNotificationToAdmin','App\\Models\\User',51,'{\"data\":\"A new leave-notification\",\"link\":\"http:\\/\\/peopleprohrm.test\\/timesheet\\/leaves\"}',NULL,'2023-12-10 05:13:00','2023-12-10 05:13:00'),('3fb66b15-8182-4333-8c26-c2719b2715f9','App\\Notifications\\LeaveNotificationToAdmin','App\\User',51,'{\"data\":\"A new leave-notification\",\"link\":\"http:\\/\\/localhost\\/peoplepro\\/timesheet\\/leaves\"}',NULL,'2023-01-22 13:51:34','2023-01-22 13:51:34'),('401a0b26-3678-4d0e-b8a4-8f12d023e071','App\\Notifications\\CompanyPolicyNotify','App\\User',13,'{\"data\":\"Company Policy has been published\",\"link\":\"http:\\/\\/localhost\\/peoplepro\\/organization\\/policy\"}',NULL,'2023-02-01 07:30:21','2023-02-01 07:30:21'),('40ba2eac-3b99-44c9-8535-a3af1d9e24e8','App\\Notifications\\TicketCreatedNotification','App\\Models\\User',5171,'{\"data\":\"Uma solicita\\u00e7\\u00e3o foi emitido para MARCELO DE OLIVEIRA DA SILVA \",\"link\":\"http:\\/\\/rhnpmais.com.br\\/tickets\\/eALPLUfr\"}',NULL,'2025-08-27 13:41:22','2025-08-27 13:41:22'),('40beebd0-1f45-4a63-b035-b8d75242f290','App\\Notifications\\TicketUpdatedNotification','App\\Models\\User',4069,'{\"data\":\"Solicita\\u00e7\\u00e3o emitido para MARCELO DE OLIVEIRA DA SILVA  Tem sido atualizado\",\"link\":\"https:\\/\\/www.testerh.com.br\\/tickets\\/frT9FBZR\"}',NULL,'2025-08-28 20:28:03','2025-08-28 20:28:03'),('411639d2-162a-4849-8ec8-54a4889b5e5f','App\\Notifications\\TicketCreatedNotification','App\\Models\\User',4069,'{\"data\":\"Uma solicita\\u00e7\\u00e3o foi emitido para MARCELO DE OLIVEIRA DA SILVA \",\"link\":\"http:\\/\\/rhnpmais.com.br\\/tickets\\/eALPLUfr\"}',NULL,'2025-08-27 13:41:22','2025-08-27 13:41:22'),('416038b5-3c8f-427f-a2ba-cc2b89244b08','App\\Notifications\\LeaveNotificationToAdmin','App\\Models\\User',1,'{\"data\":\"A new leave-notification\",\"link\":\"http:\\/\\/peopleprohrm.test\\/timesheet\\/leaves\"}','2024-01-16 03:22:08','2023-12-10 05:13:00','2024-01-16 03:22:08'),('41624e57-0ece-4358-bd24-5fb6724d99da','App\\Notifications\\ComplainAgainstNotify','App\\Models\\User',274,'{\"data\":\"Reclama\\u00e7\\u00f5es sobre a colaboradora--Uma reclama\\u00e7\\u00e3o foi apresentada contra voc\\u00ea por 5184\",\"link\":\"ex\\/profile#Employee_Complaint\"}',NULL,'2025-08-19 19:53:09','2025-08-19 19:53:09'),('41a98e6b-3883-428d-a7e0-74c710fff8f4','App\\Notifications\\TicketCreatedNotification','App\\Models\\User',1,'{\"data\":\"Um bilhete foi emitido para RebeccaTeste \",\"link\":\"https:\\/\\/testerh.com.br\\/tickets\\/pV5cN7ub\"}','2025-05-19 18:51:22','2025-05-19 17:38:44','2025-05-19 18:51:22'),('42094520-498c-4a80-97e9-bc8f54329491','App\\Notifications\\TicketCreatedNotification','App\\Models\\User',146,'{\"data\":\"Um bilhete foi emitido para RebeccaTeste \",\"link\":\"https:\\/\\/testerh.com.br\\/tickets\\/bYYHUDWe\"}',NULL,'2025-05-21 02:09:51','2025-05-21 02:09:51'),('42ae5112-68a8-4350-b4fe-0757c60e00a7','App\\Notifications\\TicketCreatedNotification','App\\Models\\User',4069,'{\"data\":\"Uma solicita\\u00e7\\u00e3o foi emitido para MARCELO DE OLIVEIRA DA SILVA \",\"link\":\"https:\\/\\/www.testerh.com.br\\/tickets\\/M4R7uFan\"}',NULL,'2025-08-27 13:41:44','2025-08-27 13:41:44'),('42c091e8-d723-496d-8719-f71903d1abba','App\\Notifications\\LeaveNotificationToAdmin','App\\User',44,'{\"data\":\"A new leave-notification\",\"link\":\"http:\\/\\/localhost\\/peoplepro\\/timesheet\\/leaves\"}',NULL,'2021-10-04 04:08:52','2021-10-04 04:08:52'),('433436b8-1431-4b37-b0cd-244ef7b9c33b','App\\Notifications\\TicketCreatedNotification','App\\Models\\User',5165,'{\"data\":\"Uma solicita\\u00e7\\u00e3o foi emitido para MARCELO DE OLIVEIRA DA SILVA \",\"link\":\"https:\\/\\/testerh.com.br\\/tickets\\/kTXFywmv\"}',NULL,'2025-08-12 20:23:32','2025-08-12 20:23:32'),('43bf5a15-d83b-45b2-9a39-99ee72b97b67','App\\Notifications\\LeaveNotificationToAdmin','App\\User',47,'{\"data\":\"A new leave-notification\",\"link\":\"http:\\/\\/localhost\\/peoplepro\\/timesheet\\/leaves\"}',NULL,'2021-10-04 04:09:17','2021-10-04 04:09:17'),('4451284a-bcea-48f5-9e8a-6a7ba7122df5','App\\Notifications\\LeaveNotificationToAdmin','App\\Models\\User',9,'{\"data\":\"A new leave-notification\",\"link\":\"http:\\/\\/peopleprohrm.test\\/timesheet\\/leaves\"}',NULL,'2023-12-10 05:12:59','2023-12-10 05:12:59'),('4459627d-72f4-4442-80e5-3966625d6611','App\\Notifications\\ComplainAgainstNotify','App\\Models\\User',105,'{\"data\":\"teste--Uma reclama\\u00e7\\u00e3o foi apresentada contra voc\\u00ea por 92\",\"link\":\"ex\\/profile#Employee_Complaint\"}',NULL,'2025-03-25 08:11:59','2025-03-25 08:11:59'),('44afd540-9453-4b26-8d36-89039406aace','App\\Notifications\\EmployeeTerminationNotify','App\\User',54,'{\"data\":\"You have been terminated from this company  Termination Date-- 14-02-2023\",\"link\":\"\"}',NULL,'2023-02-14 07:23:52','2023-02-14 07:23:52'),('455de838-2662-4831-a69f-905a8db962a1','App\\Notifications\\TicketUpdatedNotification','App\\Models\\User',5162,'{\"data\":\"Solicita\\u00e7\\u00e3o emitido para MARCELO DE OLIVEIRA DA SILVA  Tem sido atualizado\",\"link\":\"https:\\/\\/www.testerh.com.br\\/tickets\\/5Tb0bt8E\"}',NULL,'2025-08-12 20:03:21','2025-08-12 20:03:21'),('45781ac7-43c5-4771-a8b9-4b7976ccb269','App\\Notifications\\LeaveNotificationToAdmin','App\\Models\\User',9,'{\"data\":\"A new leave-notification\",\"link\":\"http:\\/\\/peopleprohrm.test\\/timesheet\\/leaves\"}',NULL,'2023-12-10 06:13:46','2023-12-10 06:13:46'),('45d436aa-14bc-45d5-859a-fa37844a47ae','App\\Notifications\\ComplainAgainstNotify','App\\Models\\User',106,'{\"data\":\"teste--Uma reclama\\u00e7\\u00e3o foi apresentada contra voc\\u00ea por 107\",\"link\":\"ex\\/profile#Employee_Complaint\"}',NULL,'2025-03-26 06:36:09','2025-03-26 06:36:09'),('45ef9b67-b88b-4267-baf7-933ea097b63a','App\\Notifications\\OfficialDocumentExpiryNotifyToAdmin','App\\User',51,'{\"data\":\"A new notification about official document expiry\",\"link\":\"http:\\/\\/localhost\\/file_manager\\/official_documents\"}',NULL,'2023-01-23 06:16:37','2023-01-23 06:16:37'),('45f188d6-f41b-47e1-938a-7912090d9ce6','App\\Notifications\\OfficialDocumentExpiryNotifyToAdmin','App\\User',40,'{\"data\":\"A new notification about official document expiry\",\"link\":\"http:\\/\\/localhost\\/file_manager\\/official_documents\"}',NULL,'2021-12-07 13:38:23','2021-12-07 13:38:23'),('4643c917-18d1-4a33-a4f4-f460505a3d12','App\\Notifications\\LeaveNotificationToAdmin','App\\Models\\User',51,'{\"data\":\"A new leave-notification\",\"link\":\"http:\\/\\/peopleprohrm.test\\/timesheet\\/leaves\"}',NULL,'2023-12-10 05:13:00','2023-12-10 05:13:00'),('464c120c-cab8-4d3d-a296-b35a4c6ed0e9','App\\Notifications\\LeaveNotificationToAdmin','App\\Models\\User',1,'{\"data\":\"A new leave-notification\",\"link\":\"http:\\/\\/peopleprohrm.test\\/timesheet\\/leaves\"}','2024-01-16 03:22:08','2023-12-10 06:17:21','2024-01-16 03:22:08'),('4663aae6-f596-43e8-8e93-3915e6aeefcc','App\\Notifications\\LeaveNotificationToAdmin','App\\Models\\User',1,'{\"data\":\"A new leave-notification\",\"link\":\"http:\\/\\/peopleprohrm.test\\/timesheet\\/leaves\"}','2024-01-16 03:22:08','2023-12-10 05:13:02','2024-01-16 03:22:08'),('47131b6c-c63d-4fc4-90f2-21112849cdc3','App\\Notifications\\TicketUpdatedNotification','App\\Models\\User',5167,'{\"data\":\"Solicita\\u00e7\\u00e3o emitido para MARCELO DE OLIVEIRA DA SILVA  Tem sido atualizado\",\"link\":\"https:\\/\\/www.testerh.com.br\\/tickets\\/frT9FBZR\"}',NULL,'2025-08-28 20:28:03','2025-08-28 20:28:03'),('47b5d11c-c178-4a01-a460-2b482e6a557b','App\\Notifications\\LeaveNotificationToAdmin','App\\User',31,'{\"data\":\"A new leave-notification\",\"link\":\"http:\\/\\/localhost\\/peoplepro\\/timesheet\\/leaves\"}',NULL,'2021-10-04 01:16:18','2021-10-04 01:16:18'),('488d8395-47c2-4c23-807c-850cc25f1cd0','App\\Notifications\\LeaveNotificationToAdmin','App\\Models\\User',51,'{\"data\":\"A new leave-notification\",\"link\":\"http:\\/\\/peopleprohrm.test\\/timesheet\\/leaves\"}',NULL,'2023-12-10 06:16:48','2023-12-10 06:16:48'),('49670c28-0fb0-440a-b2a8-91fc02ab652c','App\\Notifications\\TicketCreatedNotification','App\\Models\\User',1,'{\"data\":\"Uma solicita\\u00e7\\u00e3o foi emitido para MARCELO DE OLIVEIRA DA SILVA \",\"link\":\"https:\\/\\/www.testerh.com.br\\/tickets\\/frT9FBZR\"}',NULL,'2025-08-28 20:21:37','2025-08-28 20:21:37'),('4991585a-e100-4f2a-a5be-cc49b7996875','App\\Notifications\\TicketUpdatedNotification','App\\Models\\User',5163,'{\"data\":\"Solicita\\u00e7\\u00e3o emitido para MARCELO DE OLIVEIRA DA SILVA  Tem sido atualizado\",\"link\":\"https:\\/\\/www.testerh.com.br\\/tickets\\/5Tb0bt8E\"}',NULL,'2025-08-12 20:03:21','2025-08-12 20:03:21'),('499da8e2-f0ef-41e4-9961-4f1256fa6a18','App\\Notifications\\LeaveNotificationToAdmin','App\\User',1,'{\"data\":\"A new leave-notification\",\"link\":\"http:\\/\\/localhost\\/peoplepro\\/timesheet\\/leaves\"}','2023-04-25 04:00:23','2023-04-18 05:28:36','2023-04-25 04:00:23'),('4a92e6d8-d557-4331-9f3c-e4ed43cffd5e','App\\Notifications\\EmployeeTerminationNotify','App\\User',54,'{\"data\":\"You have been terminated from this company  Termination Date-- 14-02-2023\",\"link\":\"\"}',NULL,'2023-02-14 08:19:38','2023-02-14 08:19:38'),('4b3cf8dc-e6f8-49e0-8223-29d99b1309fa','App\\Notifications\\LeaveNotification','App\\User',11,'{\"data\":\"A new leave-notification has been published\",\"link\":\"http:\\/\\/localhost\\/peoplepro\\/profile#Leave\"}',NULL,'2023-01-22 13:08:02','2023-01-22 13:08:02'),('4bb91dda-00f4-4a95-962b-48f372576446','App\\Notifications\\LeaveNotificationToAdmin','App\\Models\\User',51,'{\"data\":\"A new leave-notification\",\"link\":\"http:\\/\\/peopleprohrm.test\\/timesheet\\/leaves\"}',NULL,'2023-12-10 05:44:57','2023-12-10 05:44:57'),('4bd14a53-cb13-4ce4-b740-294a73534f70','App\\Notifications\\TicketCreatedNotification','App\\Models\\User',5166,'{\"data\":\"Uma solicita\\u00e7\\u00e3o foi emitido para MARCELO DE OLIVEIRA DA SILVA \",\"link\":\"http:\\/\\/rhnpmais.com.br\\/tickets\\/mzHPUOjR\"}',NULL,'2025-08-27 13:41:21','2025-08-27 13:41:21'),('4c486763-4a00-4f67-a997-bcff253c887c','App\\Notifications\\EmployeeTerminationNotify','App\\User',54,'{\"data\":\"You have been terminated from this company  Termination Date-- 14-02-2023\",\"link\":\"\"}',NULL,'2023-02-14 08:20:35','2023-02-14 08:20:35'),('4c64c79c-22c1-4242-bbe7-9935926a98d6','App\\Notifications\\OfficialDocumentExpiryNotifyToAdmin','App\\User',48,'{\"data\":\"A new notification about official document expiry\",\"link\":\"http:\\/\\/localhost\\/file_manager\\/official_documents\"}',NULL,'2021-12-07 13:38:23','2021-12-07 13:38:23'),('4c738d31-084d-451e-8349-7b198bbe8c22','App\\Notifications\\CompanyPolicyNotify','App\\User',15,'{\"data\":\"Company Policy has been published\",\"link\":\"http:\\/\\/localhost\\/peoplepro\\/organization\\/policy\"}',NULL,'2023-02-01 07:30:21','2023-02-01 07:30:21'),('4c9b05be-02ef-45eb-b8a6-d6cb4e1ac890','App\\Notifications\\ProjectUpdatedNotification','App\\User',9,'{\"data\":\"Test1 has been updated\",\"link\":\"http:\\/\\/peopleprohrm.com\\/demo\\/project-management\\/projects\\/1\"}','2021-07-05 15:53:34','2020-10-18 11:21:13','2021-07-05 15:53:34'),('4df8b9d8-d38d-44d5-b86e-d9ea5c94b6a3','App\\Notifications\\LeaveNotificationToAdmin','App\\Models\\User',119,'{\"data\":\"A new leave-notification\",\"link\":\"https:\\/\\/www.testerh.com.br\\/timesheet\\/leaves\"}','2025-07-24 08:14:31','2025-06-11 02:47:48','2025-07-24 08:14:31'),('4e550253-19a2-49c4-b64c-08f6f15481d6','App\\Notifications\\TicketUpdatedNotification','App\\Models\\User',1,'{\"data\":\"Solicita\\u00e7\\u00e3o emitido para GLORIA THIERIS FRAN\\u00c7A LIMA   Tem sido atualizado\",\"link\":\"https:\\/\\/testerh.com.br\\/tickets\\/xIdQaprj\"}',NULL,'2025-08-09 02:48:20','2025-08-09 02:48:20'),('4e739e5d-b778-41d8-a8bc-3fc4fcb39a0b','App\\Notifications\\ComplaintFromNotify','App\\Models\\User',105,'{\"data\":\"teste--Sua reclama\\u00e7\\u00e3o contra 104 foi registrada\",\"link\":\"\\/profile#Employee_Complaint\"}',NULL,'2025-03-25 08:21:11','2025-03-25 08:21:11'),('4eba0d1c-dc57-4f14-ac80-ca6613be48b3','App\\Notifications\\CompanyPolicyNotify','App\\User',45,'{\"data\":\"Company Policy has been published\",\"link\":\"http:\\/\\/localhost\\/peoplepro\\/organization\\/policy\"}',NULL,'2023-02-01 07:30:21','2023-02-01 07:30:21'),('4ebc622e-04c9-47a6-bca6-2fe8006e8900','App\\Notifications\\LeaveNotificationToAdmin','App\\Models\\User',1,'{\"data\":\"A new leave-notification\",\"link\":\"http:\\/\\/peopleprohrm.test\\/timesheet\\/leaves\"}','2024-01-16 03:22:08','2023-12-10 05:13:10','2024-01-16 03:22:08'),('4ed5c455-adf6-4003-9ac8-2827c6af237c','App\\Notifications\\CompanyPolicyNotify','App\\User',54,'{\"data\":\"Company Policy has been published\",\"link\":\"http:\\/\\/localhost\\/peoplepro\\/organization\\/policy\"}',NULL,'2023-02-01 07:30:21','2023-02-01 07:30:21'),('4efe1415-0de6-460d-9065-cc5f10e7646a','App\\Notifications\\TicketCreatedNotification','App\\Models\\User',1,'{\"data\":\"Uma solicita\\u00e7\\u00e3o foi emitido para MARCELO DE OLIVEIRA DA SILVA \",\"link\":\"https:\\/\\/testerh.com.br\\/tickets\\/5Tb0bt8E\"}',NULL,'2025-08-12 19:54:31','2025-08-12 19:54:31'),('4f81aeab-da4d-446a-a417-f07383e46932','App\\Notifications\\ComplaintFromNotify','App\\Models\\User',111,'{\"data\":\"teste--Sua reclama\\u00e7\\u00e3o contra 112 foi registrada\",\"link\":\"\\/profile#Employee_Complaint\"}','2025-05-02 06:52:57','2025-03-26 19:26:56','2025-05-02 06:52:57'),('50073dea-e079-42bd-8c09-dacb4707daca','App\\Notifications\\LeaveNotificationToAdmin','App\\User',31,'{\"data\":\"A new leave-notification\",\"link\":\"http:\\/\\/localhost\\/peoplepro\\/timesheet\\/leaves\"}',NULL,'2021-10-04 04:09:17','2021-10-04 04:09:17'),('505d90a9-3bdd-4f6d-8564-a72facac8457','App\\Notifications\\AnnouncementPublished','App\\User',45,'{\"data\":\"A new announcement has been published\",\"link\":\"http:\\/\\/localhost\\/peoplepro\\/organization\\/announcements\"}',NULL,'2023-05-02 07:12:00','2023-05-02 07:12:00'),('50983b79-7b63-4b55-bd68-67bf326b8ca8','App\\Notifications\\LeaveNotificationToAdmin','App\\Models\\User',1,'{\"data\":\"A new leave-notification\",\"link\":\"http:\\/\\/peopleprohrm.test\\/timesheet\\/leaves\"}','2024-01-16 03:22:08','2023-12-10 05:45:48','2024-01-16 03:22:08'),('51b1907f-5b80-4aa4-bc5b-23f72d7335e0','App\\Notifications\\ComplainAgainstNotify','App\\Models\\User',127,'{\"data\":\"relat\\u00f3rio de desempenho da Funcion\\u00e1ria--Uma reclama\\u00e7\\u00e3o foi apresentada contra voc\\u00ea por 5182\",\"link\":\"ex\\/profile#Employee_Complaint\"}',NULL,'2025-08-19 19:12:54','2025-08-19 19:12:54'),('51ffdcc3-4177-4d01-a3b2-f446cfcd0bb2','App\\Notifications\\TicketUpdatedNotification','App\\Models\\User',5165,'{\"data\":\"Solicita\\u00e7\\u00e3o emitido para MARCELO DE OLIVEIRA DA SILVA  Tem sido atualizado\",\"link\":\"https:\\/\\/www.testerh.com.br\\/tickets\\/5Tb0bt8E\"}',NULL,'2025-08-12 20:03:21','2025-08-12 20:03:21'),('547ad83e-f054-45d7-b9bd-fbcc030c0222','App\\Notifications\\LeaveNotificationToAdmin','App\\User',1,'{\"data\":\"A new leave-notification\",\"link\":\"http:\\/\\/localhost\\/peoplepro\\/timesheet\\/leaves\"}','2023-01-23 04:24:37','2023-01-22 13:52:39','2023-01-23 04:24:37'),('553194bb-a032-46ec-a46b-1600af24c6af','App\\Notifications\\LeaveNotificationToAdmin','App\\Models\\User',110,'{\"data\":\"A new leave-notification\",\"link\":\"https:\\/\\/www.testerh.com.br\\/timesheet\\/leaves\"}',NULL,'2025-06-11 02:47:48','2025-06-11 02:47:48'),('557c150f-13ab-43d6-996c-89d2a321bf23','App\\Notifications\\LeaveNotificationToAdmin','App\\Models\\User',146,'{\"data\":\"A new leave-notification\",\"link\":\"https:\\/\\/www.testerh.com.br\\/timesheet\\/leaves\"}',NULL,'2025-06-11 02:47:48','2025-06-11 02:47:48'),('55a498ae-fa49-424f-a6e1-b9c1d24d7422','App\\Notifications\\TicketCreatedNotification','App\\Models\\User',5163,'{\"data\":\"Uma solicita\\u00e7\\u00e3o foi emitido para MARCELO DE OLIVEIRA DA SILVA \",\"link\":\"https:\\/\\/www.testerh.com.br\\/tickets\\/frT9FBZR\"}',NULL,'2025-08-28 20:21:37','2025-08-28 20:21:37'),('55f094bc-cb1a-4d22-b479-b3c39964e86f','App\\Notifications\\TicketUpdatedNotification','App\\Models\\User',5353,'{\"data\":\"Solicita\\u00e7\\u00e3o emitido para MARCELO DE OLIVEIRA DA SILVA  Tem sido atualizado\",\"link\":\"https:\\/\\/www.testerh.com.br\\/tickets\\/frT9FBZR\"}',NULL,'2025-08-28 20:28:03','2025-08-28 20:28:03'),('56a07a3b-d76c-46aa-8286-f26de328b01d','App\\Notifications\\LeaveNotificationToAdmin','App\\Models\\User',9,'{\"data\":\"A new leave-notification\",\"link\":\"http:\\/\\/peopleprohrm.test\\/timesheet\\/leaves\"}',NULL,'2023-12-10 05:12:55','2023-12-10 05:12:55'),('57dab3b7-4c79-4693-bf74-0652fce119bc','App\\Notifications\\LeaveNotificationToAdmin','App\\Models\\User',51,'{\"data\":\"A new leave-notification\",\"link\":\"http:\\/\\/peopleprohrm.test\\/timesheet\\/leaves\"}',NULL,'2023-12-10 05:13:11','2023-12-10 05:13:11'),('57f5e3b5-a5f6-4867-ba8c-bbf06119e588','App\\Notifications\\OfficialDocumentExpiryNotifyToAdmin','App\\User',46,'{\"data\":\"A new notification about official document expiry\",\"link\":\"http:\\/\\/localhost\\/file_manager\\/official_documents\"}',NULL,'2021-12-07 13:38:07','2021-12-07 13:38:07'),('58a29e2c-8f33-4f85-b54f-e457d689f2b0','App\\Notifications\\LeaveNotificationToAdmin','App\\User',48,'{\"data\":\"A new leave-notification\",\"link\":\"http:\\/\\/localhost\\/peoplepro\\/timesheet\\/leaves\"}',NULL,'2021-10-04 04:09:01','2021-10-04 04:09:01'),('59115d91-f398-4d6c-8b2f-517bfb080dcf','App\\Notifications\\TicketCreatedNotification','App\\Models\\User',5167,'{\"data\":\"Uma solicita\\u00e7\\u00e3o foi emitido para MARCELO DE OLIVEIRA DA SILVA \",\"link\":\"https:\\/\\/testerh.com.br\\/tickets\\/kTXFywmv\"}',NULL,'2025-08-12 20:23:32','2025-08-12 20:23:32'),('5ab3f3a4-15eb-4fc0-b399-951fedf5fb2e','App\\Notifications\\TicketCreatedNotification','App\\Models\\User',5354,'{\"data\":\"Uma solicita\\u00e7\\u00e3o foi emitido para MARCELO DE OLIVEIRA DA SILVA \",\"link\":\"http:\\/\\/rhnpmais.com.br\\/tickets\\/mzHPUOjR\"}',NULL,'2025-08-27 13:41:21','2025-08-27 13:41:21'),('5b18bb54-f6de-40c9-a02b-d7641e18480d','App\\Notifications\\LeaveNotificationToAdmin','App\\Models\\User',9,'{\"data\":\"A new leave-notification\",\"link\":\"http:\\/\\/peopleprohrm.test\\/timesheet\\/leaves\"}',NULL,'2023-12-10 05:13:03','2023-12-10 05:13:03'),('5b20b394-aeb6-4452-b528-ee240ebca04a','App\\Notifications\\LeaveNotificationToAdmin','App\\Models\\User',1,'{\"data\":\"A new leave-notification\",\"link\":\"http:\\/\\/peopleprohrm.test\\/timesheet\\/leaves\"}','2024-01-16 03:22:08','2023-12-10 05:43:15','2024-01-16 03:22:08'),('5bcad5db-10b0-4864-93b3-239c540a0238','App\\Notifications\\ProjectUpdatedNotification','App\\User',12,'{\"data\":\"Test1 has been updated\",\"link\":\"http:\\/\\/peopleprohrm.com\\/demo\\/project-management\\/projects\\/1\"}',NULL,'2020-10-18 11:21:13','2020-10-18 11:21:13'),('5bf74554-7084-4547-be3b-8b73a17ac32a','App\\Notifications\\LeaveNotificationToAdmin','App\\Models\\User',9,'{\"data\":\"A new leave-notification\",\"link\":\"http:\\/\\/peopleprohrm.test\\/timesheet\\/leaves\"}',NULL,'2023-12-10 05:13:11','2023-12-10 05:13:11'),('5c2d512d-0c68-46b3-9f81-e201ef165679','App\\Notifications\\TicketCreatedNotification','App\\Models\\User',1,'{\"data\":\"Uma solicita\\u00e7\\u00e3o foi emitido para GLORIA THIERIS FRAN\\u00c7A LIMA  \",\"link\":\"https:\\/\\/www.testerh.com.br\\/tickets\\/xIdQaprj\"}',NULL,'2025-08-07 20:20:22','2025-08-07 20:20:22'),('5c74c077-6f0c-4464-8af0-fd422182f30f','App\\Notifications\\TicketUpdatedNotification','App\\Models\\User',5354,'{\"data\":\"Solicita\\u00e7\\u00e3o emitido para MARCELO DE OLIVEIRA DA SILVA  Tem sido atualizado\",\"link\":\"https:\\/\\/www.testerh.com.br\\/tickets\\/frT9FBZR\"}',NULL,'2025-08-28 20:28:03','2025-08-28 20:28:03'),('5e74e252-c0e2-48c5-8851-7dd6b75ac15c','App\\Notifications\\ComplainAgainstNotify','App\\Models\\User',274,'{\"data\":\"Reclama\\u00e7\\u00f5es sobre a colaboradora--Uma reclama\\u00e7\\u00e3o foi apresentada contra voc\\u00ea por 2802\",\"link\":\"ex\\/profile#Employee_Complaint\"}',NULL,'2025-08-19 19:50:12','2025-08-19 19:50:12'),('5e88977a-61ae-4ca9-9ed8-5f01ff178c43','App\\Notifications\\TicketCreatedNotification','App\\Models\\User',5169,'{\"data\":\"Uma solicita\\u00e7\\u00e3o foi emitido para LETICIA MACIEL AVELINO  \",\"link\":\"https:\\/\\/www.rhnpmais.com.br\\/tickets\\/RKE5amcW\"}',NULL,'2025-09-01 15:35:12','2025-09-01 15:35:12'),('5f116526-e88b-478a-838d-9df709444e59','App\\Notifications\\LeaveNotificationToAdmin','App\\Models\\User',1,'{\"data\":\"A new leave-notification\",\"link\":\"http:\\/\\/peopleprohrm.test\\/timesheet\\/leaves\"}','2024-01-16 03:22:08','2023-12-10 05:13:11','2024-01-16 03:22:08'),('603190d6-dc5f-4477-ba71-3d84741e4a49','App\\Notifications\\TicketCreatedNotification','App\\Models\\User',5169,'{\"data\":\"Uma solicita\\u00e7\\u00e3o foi emitido para MARCELO DE OLIVEIRA DA SILVA \",\"link\":\"https:\\/\\/www.testerh.com.br\\/tickets\\/M4R7uFan\"}',NULL,'2025-08-27 13:41:45','2025-08-27 13:41:45'),('60b1c2c3-dcc0-4618-8196-dd9f44ff2e7d','App\\Notifications\\TicketCreatedNotification','App\\Models\\User',5163,'{\"data\":\"Uma solicita\\u00e7\\u00e3o foi emitido para MARCELO DE OLIVEIRA DA SILVA \",\"link\":\"http:\\/\\/rhnpmais.com.br\\/tickets\\/oHDPMiJS\"}',NULL,'2025-08-27 13:38:39','2025-08-27 13:38:39'),('61219cf8-71d3-4d0f-9a9d-0110847ae20c','App\\Notifications\\AnnouncementPublished','App\\User',13,'{\"data\":\"A new announcement has been published\",\"link\":\"http:\\/\\/localhost\\/peoplepro\\/organization\\/announcements\"}',NULL,'2023-05-02 07:12:00','2023-05-02 07:12:00'),('637d3ab8-63bb-439d-ac3d-9f86c7a11030','App\\Notifications\\TicketCreatedNotification','App\\Models\\User',5353,'{\"data\":\"Uma solicita\\u00e7\\u00e3o foi emitido para MARCELO DE OLIVEIRA DA SILVA \",\"link\":\"http:\\/\\/rhnpmais.com.br\\/tickets\\/eALPLUfr\"}',NULL,'2025-08-27 13:41:22','2025-08-27 13:41:22'),('641c1c91-d33c-451b-836f-c421e15912f7','App\\Notifications\\ClientTaskCreated','App\\User',8,'{\"data\":\"A task has been created of Test2 by a client named maria_g\",\"link\":\"http:\\/\\/peopleprohrm.com\\/demo\\/project-management\\/tasks\\/6\"}',NULL,'2020-10-12 01:53:23','2020-10-12 01:53:23'),('6477e425-daac-4112-a1c8-70a65560dc50','App\\Notifications\\EmployeeImmigrationExpiryNotifyToAdmin','App\\User',1,'{\"data\":\"A new notification about employee immigration expiry\",\"link\":\"http:\\/\\/localhost\\/staff\\/employees\"}','2023-01-29 04:54:27','2023-01-23 06:05:24','2023-01-29 04:54:27'),('649396bb-f4d9-4084-93d0-0fcbb7d7d2c4','App\\Notifications\\TicketCreatedNotification','App\\Models\\User',5160,'{\"data\":\"Uma solicita\\u00e7\\u00e3o foi emitido para MARCELO DE OLIVEIRA DA SILVA \",\"link\":\"https:\\/\\/testerh.com.br\\/tickets\\/kTXFywmv\"}',NULL,'2025-08-12 20:23:32','2025-08-12 20:23:32'),('6508932d-0da5-40a6-9587-a463054752c2','App\\Notifications\\TicketCreatedNotification','App\\Models\\User',5163,'{\"data\":\"Uma solicita\\u00e7\\u00e3o foi emitido para MARCELO DE OLIVEIRA DA SILVA \",\"link\":\"http:\\/\\/rhnpmais.com.br\\/tickets\\/eALPLUfr\"}',NULL,'2025-08-27 13:41:22','2025-08-27 13:41:22'),('6550982d-aec8-4fe4-a11c-c3b2c7d8d3a7','App\\Notifications\\LeaveNotificationToAdmin','App\\Models\\User',51,'{\"data\":\"A new leave-notification\",\"link\":\"http:\\/\\/peopleprohrm.test\\/timesheet\\/leaves\"}',NULL,'2023-12-10 05:13:03','2023-12-10 05:13:03'),('65d40c1a-7f70-46da-b019-0aac28e1d463','App\\Notifications\\OfficialDocumentExpiryNotifyToAdmin','App\\User',1,'{\"data\":\"A new notification about official document expiry\",\"link\":\"http:\\/\\/localhost\\/file_manager\\/official_documents\"}','2023-01-29 04:54:27','2023-01-23 06:16:37','2023-01-29 04:54:27'),('66666fa4-dfd1-4afc-8a81-613c7e6e3cb5','App\\Notifications\\TicketCreatedNotification','App\\Models\\User',115,'{\"data\":\"Um bilhete foi emitido para RebeccaTeste \",\"link\":\"https:\\/\\/testerh.com.br\\/tickets\\/bYYHUDWe\"}','2025-07-11 05:15:46','2025-05-21 02:09:51','2025-07-11 05:15:46'),('66a22ff6-3016-4388-8e7e-e59ab2ee167b','App\\Notifications\\TicketCreatedNotification','App\\Models\\User',5162,'{\"data\":\"Uma solicita\\u00e7\\u00e3o foi emitido para MARCELO DE OLIVEIRA DA SILVA \",\"link\":\"http:\\/\\/rhnpmais.com.br\\/tickets\\/mzHPUOjR\"}',NULL,'2025-08-27 13:41:21','2025-08-27 13:41:21'),('66c824bf-2690-4148-b355-5648ce548f59','App\\Notifications\\LeaveNotificationToAdmin','App\\Models\\User',1,'{\"data\":\"A new leave-notification\",\"link\":\"http:\\/\\/peopleprohrm.test\\/timesheet\\/leaves\"}','2024-01-16 03:22:08','2023-12-10 05:12:59','2024-01-16 03:22:08'),('67298b26-e959-4220-bc84-e299299c6e0d','App\\Notifications\\LeaveNotificationToAdmin','App\\User',51,'{\"data\":\"A new leave-notification\",\"link\":\"http:\\/\\/localhost\\/peoplepro\\/timesheet\\/leaves\"}',NULL,'2023-01-22 13:52:39','2023-01-22 13:52:39'),('6740f5da-8ad7-46f5-b402-6b07e2931163','App\\Notifications\\LeaveNotificationToAdmin','App\\User',36,'{\"data\":\"A new leave-notification\",\"link\":\"http:\\/\\/localhost\\/peoplepro\\/timesheet\\/leaves\"}',NULL,'2021-10-04 04:09:17','2021-10-04 04:09:17'),('6783eb82-7334-4287-b8e2-829d199ca991','App\\Notifications\\OfficialDocumentExpiryNotifyToAdmin','App\\User',1,'{\"data\":\"A new notification about official document expiry\",\"link\":\"http:\\/\\/localhost\\/file_manager\\/official_documents\"}','2023-01-29 04:54:27','2023-01-23 06:19:35','2023-01-29 04:54:27'),('67de7e0d-961f-4825-a210-ca0fdbab211b','App\\Notifications\\EmployeeTerminationNotify','App\\User',54,'{\"data\":\"You have been terminated from this company  Termination Date-- 14-02-2023\",\"link\":\"\"}',NULL,'2023-02-14 07:28:23','2023-02-14 07:28:23'),('6824efa2-e711-4124-99ee-a53387550e7b','App\\Notifications\\LeaveNotificationToAdmin','App\\User',46,'{\"data\":\"A new leave-notification\",\"link\":\"http:\\/\\/localhost\\/peoplepro\\/timesheet\\/leaves\"}',NULL,'2021-10-04 01:22:12','2021-10-04 01:22:12'),('68297e3c-5d8b-4c44-9c84-d8090e728981','App\\Notifications\\TicketCreatedNotification','App\\Models\\User',5165,'{\"data\":\"Uma solicita\\u00e7\\u00e3o foi emitido para MARCELO DE OLIVEIRA DA SILVA \",\"link\":\"http:\\/\\/rhnpmais.com.br\\/tickets\\/mzHPUOjR\"}',NULL,'2025-08-27 13:41:21','2025-08-27 13:41:21'),('68794265-ead0-4050-ad4f-5bb6a5f17d59','App\\Notifications\\LeaveNotificationToAdmin','App\\User',46,'{\"data\":\"A new leave-notification\",\"link\":\"http:\\/\\/localhost\\/peoplepro\\/timesheet\\/leaves\"}',NULL,'2021-10-04 01:21:09','2021-10-04 01:21:09'),('68b4b85e-3a82-4b1d-9d98-2f49c3ae7566','App\\Notifications\\TicketCreatedNotification','App\\Models\\User',5168,'{\"data\":\"Uma solicita\\u00e7\\u00e3o foi emitido para MARCELO DE OLIVEIRA DA SILVA \",\"link\":\"http:\\/\\/rhnpmais.com.br\\/tickets\\/oHDPMiJS\"}',NULL,'2025-08-27 13:38:39','2025-08-27 13:38:39'),('68d675f4-986f-4175-8c53-5b2f9b1ac84f','App\\Notifications\\OfficialDocumentExpiryNotifyToAdmin','App\\User',36,'{\"data\":\"A new notification about official document expiry\",\"link\":\"http:\\/\\/localhost\\/file_manager\\/official_documents\"}',NULL,'2021-12-07 13:38:23','2021-12-07 13:38:23'),('68ec3099-10e8-49b2-87ca-c8fab66a0198','App\\Notifications\\TicketCreatedNotification','App\\Models\\User',5168,'{\"data\":\"Uma solicita\\u00e7\\u00e3o foi emitido para MARCELO DE OLIVEIRA DA SILVA \",\"link\":\"https:\\/\\/testerh.com.br\\/tickets\\/kTXFywmv\"}',NULL,'2025-08-12 20:23:32','2025-08-12 20:23:32'),('69319850-8ca7-4734-8cd6-871d976077f1','App\\Notifications\\ProjectUpdatedNotification','App\\User',8,'{\"data\":\"Test2 has been updated\",\"link\":\"http:\\/\\/peopleprohrm.com\\/demo\\/project-management\\/projects\\/2\"}',NULL,'2020-10-25 17:12:46','2020-10-25 17:12:46'),('69670613-79ff-44d0-ac35-aa934afec828','App\\Notifications\\OfficialDocumentExpiryNotifyToAdmin','App\\User',51,'{\"data\":\"A new notification about official document expiry\",\"link\":\"http:\\/\\/localhost\\/file_manager\\/official_documents\"}',NULL,'2023-01-23 06:19:35','2023-01-23 06:19:35'),('698fe91d-9d59-4cf6-9f26-6e4308dffdb7','App\\Notifications\\TicketCreatedNotification','App\\Models\\User',5354,'{\"data\":\"Uma solicita\\u00e7\\u00e3o foi emitido para MARCELO DE OLIVEIRA DA SILVA \",\"link\":\"http:\\/\\/rhnpmais.com.br\\/tickets\\/oHDPMiJS\"}',NULL,'2025-08-27 13:38:39','2025-08-27 13:38:39'),('69d69625-5bfe-4ced-9a77-c778cf3af03e','App\\Notifications\\LeaveNotificationToAdmin','App\\User',44,'{\"data\":\"A new leave-notification\",\"link\":\"http:\\/\\/localhost\\/peoplepro\\/timesheet\\/leaves\"}',NULL,'2021-10-04 04:09:01','2021-10-04 04:09:01'),('6a087bcc-a08f-48e1-8919-78274e496761','App\\Notifications\\TicketCreatedNotification','App\\Models\\User',97,'{\"data\":\"Um bilhete foi emitido para RebeccaTeste \",\"link\":\"https:\\/\\/testerh.com.br\\/tickets\\/omDo2MYk\"}',NULL,'2025-06-11 01:13:21','2025-06-11 01:13:21'),('6a963963-d552-4340-a09b-14ba5680c21e','App\\Notifications\\LeaveNotificationToAdmin','App\\Models\\User',51,'{\"data\":\"A new leave-notification\",\"link\":\"http:\\/\\/peopleprohrm.test\\/timesheet\\/leaves\"}',NULL,'2023-12-10 05:13:00','2023-12-10 05:13:00'),('6b204c85-682c-49c2-a083-2cc80b934c9c','App\\Notifications\\LeaveNotificationToAdmin','App\\Models\\User',9,'{\"data\":\"A new leave-notification\",\"link\":\"http:\\/\\/peopleprohrm.test\\/timesheet\\/leaves\"}',NULL,'2023-12-10 05:45:48','2023-12-10 05:45:48'),('6b71d128-f5d9-45ee-9b10-20068fccce6c','App\\Notifications\\TicketCreatedNotification','App\\Models\\User',119,'{\"data\":\"Um bilhete foi emitido para RebeccaTeste \",\"link\":\"https:\\/\\/testerh.com.br\\/tickets\\/omDo2MYk\"}','2025-07-24 08:14:31','2025-06-11 01:13:21','2025-07-24 08:14:31'),('6bb25e6f-184c-4125-9f6e-796083f20406','App\\Notifications\\LeaveNotificationToAdmin','App\\Models\\User',1,'{\"data\":\"A new leave-notification\",\"link\":\"http:\\/\\/peopleprohrm.test\\/timesheet\\/leaves\"}','2024-01-16 03:22:08','2023-12-10 05:39:20','2024-01-16 03:22:08'),('6c2f2505-7f00-4170-848a-4fe5a7d8fffa','App\\Notifications\\LeaveNotificationToAdmin','App\\Models\\User',9,'{\"data\":\"A new leave-notification\",\"link\":\"http:\\/\\/peopleprohrm.test\\/timesheet\\/leaves\"}',NULL,'2023-12-10 05:49:41','2023-12-10 05:49:41'),('6c88206a-2ef9-4b4e-b722-bbcc19b84446','App\\Notifications\\LeaveNotificationToAdmin','App\\User',31,'{\"data\":\"A new leave-notification\",\"link\":\"http:\\/\\/localhost\\/peoplepro\\/timesheet\\/leaves\"}',NULL,'2021-10-04 01:21:08','2021-10-04 01:21:08'),('6caef479-8b72-41bb-9d4b-4c9713123ad5','App\\Notifications\\TicketUpdatedNotification','App\\Models\\User',5171,'{\"data\":\"Solicita\\u00e7\\u00e3o emitido para MARCELO DE OLIVEIRA DA SILVA  Tem sido atualizado\",\"link\":\"https:\\/\\/www.testerh.com.br\\/tickets\\/frT9FBZR\"}',NULL,'2025-08-28 20:28:03','2025-08-28 20:28:03'),('6d5b20d0-2fc6-45db-9fe1-8933875f1c0a','App\\Notifications\\ProjectCreatedNotifiaction','App\\User',1,'{\"data\":\"A project has been created namely Test and 1 Employees has been assigned for \",\"link\":\"http:\\/\\/localhost\\/peoplepro\\/project-management\\/projects\\/4\"}','2023-04-12 05:30:49','2023-02-09 05:02:21','2023-04-12 05:30:49'),('6dd2b0eb-2dd5-454e-929d-58b58442531b','App\\Notifications\\AnnouncementPublished','App\\User',57,'{\"data\":\"A new announcement has been published\",\"link\":\"http:\\/\\/localhost\\/peoplepro\\/organization\\/announcements\"}',NULL,'2023-05-02 07:12:00','2023-05-02 07:12:00'),('6de1d6ee-c6f7-4d8e-a3fb-7731cad6d2de','App\\Notifications\\EmployeePromotion','App\\User',9,'{\"data\":\" Congratulation!You have been promoted to  Senior Executive 1\",\"link\":\"\"}','2023-01-04 05:11:40','2023-01-04 05:11:32','2023-01-04 05:11:40'),('7055b620-78ca-4d36-90c6-0c149aead05d','App\\Notifications\\TicketCreatedNotification','App\\Models\\User',5162,'{\"data\":\"Uma solicita\\u00e7\\u00e3o foi emitido para MARCELO DE OLIVEIRA DA SILVA \",\"link\":\"http:\\/\\/rhnpmais.com.br\\/tickets\\/oHDPMiJS\"}',NULL,'2025-08-27 13:38:39','2025-08-27 13:38:39'),('706e620f-1d42-4e0e-9634-cbbfa30b2f37','App\\Notifications\\TicketCreatedNotification','App\\Models\\User',5169,'{\"data\":\"Uma solicita\\u00e7\\u00e3o foi emitido para MARCELO DE OLIVEIRA DA SILVA \",\"link\":\"http:\\/\\/rhnpmais.com.br\\/tickets\\/oHDPMiJS\"}',NULL,'2025-08-27 13:38:39','2025-08-27 13:38:39'),('70aafa4e-434f-4ba2-8aea-ee754cce75c7','App\\Notifications\\TicketCreatedNotification','App\\User',1,'{\"data\":\"A ticket has been issued for Bob Hobart\",\"link\":\"http:\\/\\/peopleprohrm.com\\/demo\\/tickets\\/Kkqx8gSB\"}','2020-07-28 17:05:45','2020-07-28 16:59:09','2020-07-28 17:05:45'),('71b6898f-6589-4d0e-91d8-f9009a26fccd','App\\Notifications\\LeaveNotificationToAdmin','App\\Models\\User',9,'{\"data\":\"A new leave-notification\",\"link\":\"http:\\/\\/peopleprohrm.test\\/timesheet\\/leaves\"}',NULL,'2023-12-10 06:28:53','2023-12-10 06:28:53'),('72c23f9f-6c51-4d5a-91ba-56595808f351','App\\Notifications\\TicketCreatedNotification','App\\Models\\User',5354,'{\"data\":\"Uma solicita\\u00e7\\u00e3o foi emitido para MARCELO DE OLIVEIRA DA SILVA \",\"link\":\"http:\\/\\/rhnpmais.com.br\\/tickets\\/eALPLUfr\"}',NULL,'2025-08-27 13:41:22','2025-08-27 13:41:22'),('7391cd5f-0281-47df-9234-0220ca97ac5d','App\\Notifications\\LeaveNotificationToAdmin','App\\Models\\User',51,'{\"data\":\"A new leave-notification\",\"link\":\"http:\\/\\/peopleprohrm.test\\/timesheet\\/leaves\"}',NULL,'2023-12-10 06:27:17','2023-12-10 06:27:17'),('7436712b-e101-4efb-a01a-dfd14ca69c84','App\\Notifications\\ComplainAgainstNotify','App\\Models\\User',316,'{\"data\":\"teste--Uma reclama\\u00e7\\u00e3o foi apresentada contra voc\\u00ea por 111\",\"link\":\"ex\\/profile#Employee_Complaint\"}',NULL,'2025-08-12 12:15:29','2025-08-12 12:15:29'),('745cc40b-d166-47f8-872b-a28b13c75b6b','App\\Notifications\\TicketCreatedNotification','App\\Models\\User',5167,'{\"data\":\"Uma solicita\\u00e7\\u00e3o foi emitido para MARCELO DE OLIVEIRA DA SILVA \",\"link\":\"https:\\/\\/testerh.com.br\\/tickets\\/5Tb0bt8E\"}',NULL,'2025-08-12 19:54:31','2025-08-12 19:54:31'),('74f5ea51-fe94-483d-8325-f28075651289','App\\Notifications\\CompanyPolicyNotify','App\\User',14,'{\"data\":\"Company Policy has been published\",\"link\":\"http:\\/\\/localhost\\/peoplepro\\/organization\\/policy\"}',NULL,'2023-02-01 07:30:21','2023-02-01 07:30:21'),('7533d3e8-9950-40aa-a25e-1c95e0af4204','App\\Notifications\\OfficialDocumentExpiryNotifyToAdmin','App\\User',40,'{\"data\":\"A new notification about official document expiry\",\"link\":\"http:\\/\\/localhost\\/file_manager\\/official_documents\"}',NULL,'2021-12-07 13:35:08','2021-12-07 13:35:08'),('757ae95d-6c33-4a59-9968-5d36dc0af936','App\\Notifications\\LeaveNotificationToAdmin','App\\User',47,'{\"data\":\"A new leave-notification\",\"link\":\"http:\\/\\/localhost\\/peoplepro\\/timesheet\\/leaves\"}',NULL,'2021-10-04 04:09:01','2021-10-04 04:09:01'),('75865d0f-944d-43e2-aa43-ab1ad12a6e92','App\\Notifications\\TicketCreatedNotification','App\\User',12,'{\"data\":\"A ticket has been issued for Bob Hobart\",\"link\":\"http:\\/\\/peopleprohrm.com\\/demo\\/tickets\\/Kkqx8gSB\"}',NULL,'2020-07-28 16:59:09','2020-07-28 16:59:09'),('75b38c1b-b850-4cff-b1b7-5de44716f3db','App\\Notifications\\TicketCreatedNotification','App\\Models\\User',107,'{\"data\":\"Um bilhete foi emitido para RebeccaTeste \",\"link\":\"https:\\/\\/testerh.com.br\\/tickets\\/omDo2MYk\"}',NULL,'2025-06-11 01:13:21','2025-06-11 01:13:21'),('76e6c668-831f-42c4-b1ad-1bf94eef70ed','App\\Notifications\\LeaveNotificationToAdmin','App\\User',46,'{\"data\":\"A new leave-notification\",\"link\":\"http:\\/\\/localhost\\/peoplepro\\/timesheet\\/leaves\"}',NULL,'2021-10-04 04:08:52','2021-10-04 04:08:52'),('773626a7-3245-4a53-bcf9-f3c9140dca9c','App\\Notifications\\TicketCreatedNotification','App\\Models\\User',4069,'{\"data\":\"Uma solicita\\u00e7\\u00e3o foi emitido para MARCELO DE OLIVEIRA DA SILVA \",\"link\":\"https:\\/\\/www.testerh.com.br\\/tickets\\/frT9FBZR\"}',NULL,'2025-08-28 20:21:37','2025-08-28 20:21:37'),('773781f5-10f9-4e99-a01c-362cdc650fc6','App\\Notifications\\LeaveNotificationToAdmin','App\\User',47,'{\"data\":\"A new leave-notification\",\"link\":\"http:\\/\\/localhost\\/peoplepro\\/timesheet\\/leaves\"}',NULL,'2021-10-04 01:15:59','2021-10-04 01:15:59'),('775ff32d-d901-4c97-b8d4-86d26232de3d','App\\Notifications\\TicketCreatedNotification','App\\Models\\User',107,'{\"data\":\"Um bilhete foi emitido para RebeccaTeste \",\"link\":\"https:\\/\\/testerh.com.br\\/tickets\\/bYYHUDWe\"}',NULL,'2025-05-21 02:09:51','2025-05-21 02:09:51'),('77a66edc-80ca-4b78-83b5-62e88edc7181','App\\Notifications\\LeaveNotificationToAdmin','App\\User',31,'{\"data\":\"A new leave-notification\",\"link\":\"http:\\/\\/localhost\\/peoplepro\\/timesheet\\/leaves\"}',NULL,'2021-10-04 01:15:59','2021-10-04 01:15:59'),('79111b46-d73d-42fb-ae96-151b5ffe26eb','App\\Notifications\\TicketCreatedNotification','App\\Models\\User',4069,'{\"data\":\"Uma solicita\\u00e7\\u00e3o foi emitido para MARCELO DE OLIVEIRA DA SILVA \",\"link\":\"https:\\/\\/testerh.com.br\\/tickets\\/kTXFywmv\"}',NULL,'2025-08-12 20:23:32','2025-08-12 20:23:32'),('7914f808-738f-4453-9a28-843a4c1a5951','App\\Notifications\\LeaveNotificationToAdmin','App\\User',1,'{\"data\":\"A new leave-notification\",\"link\":\"http:\\/\\/localhost\\/peoplepro\\/timesheet\\/leaves\"}','2021-11-27 05:42:22','2021-10-04 04:09:00','2021-11-27 05:42:22'),('795b9487-6bab-4c5d-99b4-f856f136dd38','App\\Notifications\\LeaveNotificationToAdmin','App\\User',48,'{\"data\":\"A new leave-notification\",\"link\":\"http:\\/\\/localhost\\/peoplepro\\/timesheet\\/leaves\"}',NULL,'2021-10-04 01:21:09','2021-10-04 01:21:09'),('79822966-bfc0-4dcb-8652-5b34f652d3f1','App\\Notifications\\TicketUpdatedNotification','App\\Models\\User',5162,'{\"data\":\"Solicita\\u00e7\\u00e3o emitido para MARCELO DE OLIVEIRA DA SILVA  Tem sido atualizado\",\"link\":\"https:\\/\\/www.testerh.com.br\\/tickets\\/frT9FBZR\"}',NULL,'2025-08-28 20:28:03','2025-08-28 20:28:03'),('79cf2205-e643-4220-9374-6111b9b3825c','App\\Notifications\\AnnouncementPublished','App\\User',9,'{\"data\":\"A new announcement has been published\",\"link\":\"http:\\/\\/localhost\\/peoplepro\\/organization\\/announcements\"}',NULL,'2023-05-02 07:12:00','2023-05-02 07:12:00'),('79d7bd21-b8f0-4e4b-a169-bb91a28859ed','App\\Notifications\\TicketCreatedNotification','App\\Models\\User',5166,'{\"data\":\"Uma solicita\\u00e7\\u00e3o foi emitido para MARCELO DE OLIVEIRA DA SILVA \",\"link\":\"http:\\/\\/rhnpmais.com.br\\/tickets\\/eALPLUfr\"}',NULL,'2025-08-27 13:41:22','2025-08-27 13:41:22'),('7abf44af-96a4-4816-b418-bd3170f74ec7','App\\Notifications\\EmployeeDocumentExpiryNotifyToAdmin','App\\User',1,'{\"data\":\"A new notification about employee\'s document expiry\",\"link\":\"http:\\/\\/localhost\\/staff\\/employees\"}','2023-01-29 04:54:27','2023-01-23 05:38:18','2023-01-29 04:54:27'),('7ad86074-a47d-4312-aaeb-a075655d523a','App\\Notifications\\LeaveNotificationToAdmin','App\\Models\\User',51,'{\"data\":\"A new leave-notification\",\"link\":\"http:\\/\\/peopleprohrm.test\\/timesheet\\/leaves\"}',NULL,'2023-12-10 05:13:03','2023-12-10 05:13:03'),('7b38e007-e61a-4c18-9cc8-0d072e65df31','App\\Notifications\\LeaveNotificationToAdmin','App\\User',1,'{\"data\":\"A new leave-notification\",\"link\":\"http:\\/\\/localhost\\/peoplepro\\/timesheet\\/leaves\"}','2021-11-27 05:42:22','2021-10-04 01:21:08','2021-11-27 05:42:22'),('7b62222c-0e8a-4a07-bf25-19c02e4e3631','App\\Notifications\\LeaveNotificationToAdmin','App\\Models\\User',51,'{\"data\":\"A new leave-notification\",\"link\":\"http:\\/\\/peopleprohrm.test\\/timesheet\\/leaves\"}',NULL,'2023-12-10 06:19:32','2023-12-10 06:19:32'),('7c58da93-c6cc-4073-92a3-24af280b8010','App\\Notifications\\LeaveNotificationToAdmin','App\\Models\\User',9,'{\"data\":\"A new leave-notification\",\"link\":\"http:\\/\\/peopleprohrm.test\\/timesheet\\/leaves\"}',NULL,'2023-12-10 05:13:00','2023-12-10 05:13:00'),('7c8e157a-7150-4e6d-b162-a9296f35a5d0','App\\Notifications\\ProjectCreatedNotifiaction','App\\User',9,'{\"data\":\"A project has been created namely Test and 1 Employees has been assigned for \",\"link\":\"http:\\/\\/localhost\\/peoplepro\\/project-management\\/projects\\/4\"}',NULL,'2023-02-09 05:02:21','2023-02-09 05:02:21'),('7cebe6a4-fcee-441a-a8cb-56419afefb48','App\\Notifications\\EmployeeImmigrationExpiryNotifyToAdmin','App\\User',51,'{\"data\":\"A new notification about employee immigration expiry\",\"link\":\"http:\\/\\/localhost\\/staff\\/employees\"}',NULL,'2023-01-23 06:05:24','2023-01-23 06:05:24'),('7d2802a2-6c28-480f-8ab9-69b1b8e48a20','App\\Notifications\\ProjectUpdatedNotification','App\\User',1,'{\"data\":\"test3 has been updated\",\"link\":\"http:\\/\\/peopleprohrm.com\\/demo\\/project-management\\/projects\\/3\"}','2021-06-17 03:14:26','2020-10-25 17:14:23','2021-06-17 03:14:26'),('7dd26dbb-b6b9-41ab-b04c-eedbaac71c10','App\\Notifications\\ComplaintFromNotify','App\\Models\\User',107,'{\"data\":\"teste--Sua reclama\\u00e7\\u00e3o contra 109 foi registrada\",\"link\":\"\\/profile#Employee_Complaint\"}',NULL,'2025-03-26 07:56:03','2025-03-26 07:56:03'),('7ed35fa3-0ee5-494f-b833-54e791de7ba7','App\\Notifications\\TicketCreatedNotification','App\\Models\\User',5162,'{\"data\":\"Uma solicita\\u00e7\\u00e3o foi emitido para MARCELO DE OLIVEIRA DA SILVA \",\"link\":\"http:\\/\\/rhnpmais.com.br\\/tickets\\/eALPLUfr\"}',NULL,'2025-08-27 13:41:22','2025-08-27 13:41:22'),('7f44159d-74d1-4099-8115-7df53e33bea0','App\\Notifications\\TicketCreatedNotification','App\\Models\\User',5355,'{\"data\":\"Uma solicita\\u00e7\\u00e3o foi emitido para MARCELO DE OLIVEIRA DA SILVA \",\"link\":\"https:\\/\\/www.testerh.com.br\\/tickets\\/frT9FBZR\"}',NULL,'2025-08-28 20:21:37','2025-08-28 20:21:37'),('7f5be99e-43e0-410e-b0f2-7f143277b3a4','App\\Notifications\\TicketCreatedNotification','App\\Models\\User',5355,'{\"data\":\"Uma solicita\\u00e7\\u00e3o foi emitido para MARCELO DE OLIVEIRA DA SILVA \",\"link\":\"http:\\/\\/rhnpmais.com.br\\/tickets\\/oHDPMiJS\"}',NULL,'2025-08-27 13:38:39','2025-08-27 13:38:39'),('7fbad02a-1fb1-485d-a451-6c5c8be10824','App\\Notifications\\ClientTaskCreated','App\\User',1,'{\"data\":\"A task has been created of Test2 by a client named maria_g\",\"link\":\"http:\\/\\/peopleprohrm.com\\/demo\\/project-management\\/tasks\\/6\"}','2021-06-17 03:14:26','2020-10-12 01:53:23','2021-06-17 03:14:26'),('808af3e3-2169-4a33-8b18-6be65a69a74b','App\\Notifications\\TicketCreatedNotification','App\\Models\\User',1,'{\"data\":\"Um bilhete foi emitido para RebeccaTeste \",\"link\":\"https:\\/\\/testerh.com.br\\/tickets\\/omDo2MYk\"}','2025-06-13 06:55:07','2025-06-11 01:13:21','2025-06-13 06:55:07'),('80ac7dbf-bf4f-4934-abbf-e90f74abf649','App\\Notifications\\LeaveNotificationToAdmin','App\\Models\\User',9,'{\"data\":\"A new leave-notification\",\"link\":\"http:\\/\\/peopleprohrm.test\\/timesheet\\/leaves\"}',NULL,'2023-12-10 05:39:20','2023-12-10 05:39:20'),('80b934e0-ccb0-4ddc-a3ea-764f8938718a','App\\Notifications\\LeaveNotificationToAdmin','App\\Models\\User',1,'{\"data\":\"A new leave-notification\",\"link\":\"http:\\/\\/peopleprohrm.test\\/timesheet\\/leaves\"}','2024-01-16 03:22:08','2023-12-10 06:16:48','2024-01-16 03:22:08'),('80c39a65-c652-4a42-a174-72a8075f8603','App\\Notifications\\EmployeeTerminationNotify','App\\Models\\User',86,'{\"data\":\"Voc\\u00ea foi dispensado desta empresa  Data de finaliza\\u00e7\\u00e3o-- 13-03-2025\",\"link\":\"\"}',NULL,'2025-03-14 09:17:19','2025-03-14 09:17:19'),('80d0525f-0055-48a7-bf4d-4c3696eeccc4','App\\Notifications\\ComplaintFromNotify','App\\Models\\User',107,'{\"data\":\"teste--Sua reclama\\u00e7\\u00e3o contra 106 foi registrada\",\"link\":\"\\/profile#Employee_Complaint\"}',NULL,'2025-03-26 06:36:09','2025-03-26 06:36:09'),('80fee0ae-5a47-4d34-9bcb-899580522d03','App\\Notifications\\TicketCreatedNotification','App\\Models\\User',5181,'{\"data\":\"Uma solicita\\u00e7\\u00e3o foi emitido para MARCELO DE OLIVEIRA DA SILVA \",\"link\":\"http:\\/\\/rhnpmais.com.br\\/tickets\\/mzHPUOjR\"}',NULL,'2025-08-27 13:41:21','2025-08-27 13:41:21'),('82d1cc33-4d28-43bb-af87-a2a151c9e673','App\\Notifications\\TicketCreatedNotification','App\\Models\\User',5169,'{\"data\":\"Uma solicita\\u00e7\\u00e3o foi emitido para MARCELO DE OLIVEIRA DA SILVA \",\"link\":\"https:\\/\\/testerh.com.br\\/tickets\\/5Tb0bt8E\"}',NULL,'2025-08-12 19:54:31','2025-08-12 19:54:31'),('83068985-5441-40f4-9ef6-4d1cf4dc5ff8','App\\Notifications\\AnnouncementPublished','App\\User',54,'{\"data\":\"A new announcement has been published\",\"link\":\"http:\\/\\/localhost\\/peoplepro\\/organization\\/announcements\"}',NULL,'2023-05-02 07:12:00','2023-05-02 07:12:00'),('83f001c8-9d0a-4484-96b2-edf247f1836f','App\\Notifications\\TicketCreatedNotification','App\\Models\\User',119,'{\"data\":\"Um bilhete foi emitido para RebeccaTeste \",\"link\":\"https:\\/\\/testerh.com.br\\/tickets\\/pV5cN7ub\"}','2025-07-24 08:14:31','2025-05-19 17:38:44','2025-07-24 08:14:31'),('84dc4732-bbd9-43de-a4bc-f923f27d7294','App\\Notifications\\AnnouncementPublished','App\\User',51,'{\"data\":\"A new announcement has been published\",\"link\":\"http:\\/\\/localhost\\/peoplepro\\/organization\\/announcements\"}',NULL,'2023-05-02 07:12:00','2023-05-02 07:12:00'),('85a290fa-06ea-453b-b116-1d70ffbd8145','App\\Notifications\\LeaveNotificationToAdmin','App\\User',47,'{\"data\":\"A new leave-notification\",\"link\":\"http:\\/\\/localhost\\/peoplepro\\/timesheet\\/leaves\"}',NULL,'2021-10-04 04:08:52','2021-10-04 04:08:52'),('864f5ce3-8379-4c7f-9fcc-1925d9c474cf','App\\Notifications\\LeaveNotificationToAdmin','App\\Models\\User',51,'{\"data\":\"A new leave-notification\",\"link\":\"http:\\/\\/peopleprohrm.test\\/timesheet\\/leaves\"}',NULL,'2023-12-10 05:13:11','2023-12-10 05:13:11'),('86a28f71-8ce8-41b4-b6ee-5f4f5909daca','App\\Notifications\\TicketCreatedNotification','App\\Models\\User',146,'{\"data\":\"Um bilhete foi emitido para Carlos Robson Silva De Araujo \",\"link\":\"https:\\/\\/testerh.com.br\\/tickets\\/06euXSzq\"}',NULL,'2025-05-02 06:52:32','2025-05-02 06:52:32'),('86f31a48-dca2-4897-b642-69886f839149','App\\Notifications\\TicketCreatedNotification','App\\Models\\User',5355,'{\"data\":\"Uma solicita\\u00e7\\u00e3o foi emitido para MARCELO DE OLIVEIRA DA SILVA \",\"link\":\"http:\\/\\/rhnpmais.com.br\\/tickets\\/eALPLUfr\"}',NULL,'2025-08-27 13:41:22','2025-08-27 13:41:22'),('8889e6b7-f697-415d-b930-3a822be0ae20','App\\Notifications\\LeaveNotificationToAdmin','App\\Models\\User',1,'{\"data\":\"A new leave-notification\",\"link\":\"http:\\/\\/peopleprohrm.test\\/timesheet\\/leaves\"}','2024-01-16 03:22:08','2023-12-10 06:13:46','2024-01-16 03:22:08'),('8945e212-4565-4c96-9eca-b0a44e4bcffb','App\\Notifications\\TicketUpdatedNotification','App\\Models\\User',4069,'{\"data\":\"Solicita\\u00e7\\u00e3o emitido para GLORIA THIERIS FRAN\\u00c7A LIMA   Tem sido atualizado\",\"link\":\"https:\\/\\/testerh.com.br\\/tickets\\/xIdQaprj\"}',NULL,'2025-08-09 02:48:20','2025-08-09 02:48:20'),('89e46bdf-1373-44e0-a61c-8b950126a3bf','App\\Notifications\\OfficialDocumentExpiryNotifyToAdmin','App\\User',1,'{\"data\":\"A new notification about official document expiry\",\"link\":\"http:\\/\\/localhost\\/file_manager\\/official_documents\"}','2022-06-05 08:14:54','2021-12-07 13:38:23','2022-06-05 08:14:54'),('8a4de812-4794-42d8-a946-da56dcb2574a','App\\Notifications\\TicketCreatedNotification','App\\Models\\User',115,'{\"data\":\"Um bilhete foi emitido para RebeccaTeste \",\"link\":\"https:\\/\\/testerh.com.br\\/tickets\\/omDo2MYk\"}','2025-07-11 05:15:46','2025-06-11 01:13:21','2025-07-11 05:15:46'),('8a7a3452-282b-4110-9c71-5c067d3bc781','App\\Notifications\\LeaveNotificationToAdmin','App\\Models\\User',1,'{\"data\":\"A new leave-notification\",\"link\":\"http:\\/\\/peopleprohrm.test\\/timesheet\\/leaves\"}','2024-01-16 03:22:08','2023-12-10 05:13:03','2024-01-16 03:22:08'),('8ace70d8-ccad-4bcf-a48b-b3266107bf42','App\\Notifications\\LeaveNotificationToAdmin','App\\Models\\User',51,'{\"data\":\"A new leave-notification\",\"link\":\"http:\\/\\/peopleprohrm.test\\/timesheet\\/leaves\"}',NULL,'2023-12-10 05:13:03','2023-12-10 05:13:03'),('8b291e66-2f25-4baa-9a4a-95186bc63bdb','App\\Notifications\\LeaveNotificationToAdmin','App\\User',40,'{\"data\":\"A new leave-notification\",\"link\":\"http:\\/\\/localhost\\/peoplepro\\/timesheet\\/leaves\"}',NULL,'2021-10-04 01:16:18','2021-10-04 01:16:18'),('8ba99bd4-506e-4dac-ada5-207b73b126a8','App\\Notifications\\TicketCreatedNotification','App\\Models\\User',119,'{\"data\":\"Um bilhete foi emitido para RebeccaTeste \",\"link\":\"https:\\/\\/testerh.com.br\\/tickets\\/bYYHUDWe\"}','2025-07-24 08:14:31','2025-05-21 02:09:51','2025-07-24 08:14:31'),('8bde6e2c-1b75-4e64-8af2-2a3c8aca5723','App\\Notifications\\AnnouncementPublished','App\\User',38,'{\"data\":\"A new announcement has been published\",\"link\":\"http:\\/\\/localhost\\/peoplepro\\/organization\\/announcements\"}',NULL,'2023-05-02 07:12:00','2023-05-02 07:12:00'),('8c6c6b32-bbd8-46f6-bbf4-3ceb9892cd66','App\\Notifications\\EmployeeTerminationNotify','App\\User',54,'{\"data\":\"You have been terminated from this company  Termination Date-- 14-02-2023\",\"link\":\"\"}',NULL,'2023-02-14 08:25:42','2023-02-14 08:25:42'),('8ceffae5-09ae-465c-878b-6333951422df','App\\Notifications\\TicketUpdatedNotification','App\\Models\\User',5168,'{\"data\":\"Solicita\\u00e7\\u00e3o emitido para MARCELO DE OLIVEIRA DA SILVA  Tem sido atualizado\",\"link\":\"https:\\/\\/www.testerh.com.br\\/tickets\\/5Tb0bt8E\"}',NULL,'2025-08-12 20:03:21','2025-08-12 20:03:21'),('8d42dd78-4c05-4216-8068-79db89ccf382','App\\Notifications\\TicketCreatedNotification','App\\Models\\User',1,'{\"data\":\"Uma solicita\\u00e7\\u00e3o foi emitido para MARCELO DE OLIVEIRA DA SILVA \",\"link\":\"https:\\/\\/www.testerh.com.br\\/tickets\\/M4R7uFan\"}',NULL,'2025-08-27 13:41:44','2025-08-27 13:41:44'),('8d5c0651-030f-4d23-9041-7904bbedc072','App\\Notifications\\OfficialDocumentExpiryNotifyToAdmin','App\\User',40,'{\"data\":\"A new notification about official document expiry\",\"link\":\"http:\\/\\/localhost\\/file_manager\\/official_documents\"}',NULL,'2021-12-07 13:38:07','2021-12-07 13:38:07'),('8e1da56e-c9b7-4886-a795-291a7944f044','App\\Notifications\\LeaveNotificationToAdmin','App\\User',40,'{\"data\":\"A new leave-notification\",\"link\":\"http:\\/\\/localhost\\/peoplepro\\/timesheet\\/leaves\"}',NULL,'2021-10-04 01:21:08','2021-10-04 01:21:08'),('8e9054a1-fe5d-4a8b-8b33-40655f1306bf','App\\Notifications\\EmployeeAwardNotify','App\\User',9,'{\"data\":\"Congratulation! An Award has been given to you\",\"link\":\"http:\\/\\/peopleprohrm.com\\/demo\\/profile#Employee_Core_hr\"}','2021-07-05 15:53:34','2020-08-18 06:55:40','2021-07-05 15:53:34'),('8f6826ce-c6b9-4056-8ec5-006126553077','App\\Notifications\\TicketUpdatedNotification','App\\Models\\User',5169,'{\"data\":\"Solicita\\u00e7\\u00e3o emitido para MARCELO DE OLIVEIRA DA SILVA  Tem sido atualizado\",\"link\":\"https:\\/\\/www.testerh.com.br\\/tickets\\/5Tb0bt8E\"}',NULL,'2025-08-12 20:03:21','2025-08-12 20:03:21'),('8fc8f7b0-8bbf-4f02-aeba-29198e055b13','App\\Notifications\\LeaveNotificationToAdmin','App\\Models\\User',1,'{\"data\":\"A new leave-notification\",\"link\":\"http:\\/\\/peopleprohrm.test\\/timesheet\\/leaves\"}','2024-01-16 03:22:08','2023-12-10 05:13:11','2024-01-16 03:22:08'),('90cfd472-af51-43fe-92e5-3a8c5266a942','App\\Notifications\\LeaveNotificationToAdmin','App\\User',47,'{\"data\":\"A new leave-notification\",\"link\":\"http:\\/\\/localhost\\/peoplepro\\/timesheet\\/leaves\"}',NULL,'2021-10-04 01:21:09','2021-10-04 01:21:09'),('90e3534b-aed8-419e-9f98-1c945dc1c02d','App\\Notifications\\TicketCreatedNotification','App\\Models\\User',5171,'{\"data\":\"Uma solicita\\u00e7\\u00e3o foi emitido para MARCELO DE OLIVEIRA DA SILVA \",\"link\":\"https:\\/\\/www.testerh.com.br\\/tickets\\/M4R7uFan\"}',NULL,'2025-08-27 13:41:45','2025-08-27 13:41:45'),('925e15c2-da0a-4f40-80f8-61398bc5c885','App\\Notifications\\LeaveNotificationToAdmin','App\\Models\\User',1,'{\"data\":\"A new leave-notification\",\"link\":\"http:\\/\\/peopleprohrm.test\\/timesheet\\/leaves\"}','2024-01-16 03:22:08','2023-12-10 05:13:03','2024-01-16 03:22:08'),('9300b709-c277-4ac6-901c-47e93c37768f','App\\Notifications\\TicketCreatedNotification','App\\Models\\User',5171,'{\"data\":\"Uma solicita\\u00e7\\u00e3o foi emitido para MARCELO DE OLIVEIRA DA SILVA \",\"link\":\"https:\\/\\/www.testerh.com.br\\/tickets\\/frT9FBZR\"}',NULL,'2025-08-28 20:21:37','2025-08-28 20:21:37'),('934ef2c1-32b4-411b-a31b-2e27abd9edc4','App\\Notifications\\TicketUpdatedNotification','App\\Models\\User',1,'{\"data\":\"Solicita\\u00e7\\u00e3o emitido para MARCELO DE OLIVEIRA DA SILVA  Tem sido atualizado\",\"link\":\"https:\\/\\/www.testerh.com.br\\/tickets\\/5Tb0bt8E\"}',NULL,'2025-08-12 20:03:21','2025-08-12 20:03:21'),('93cc9392-a981-41b8-8b56-50ef40b47db0','App\\Notifications\\LeaveNotificationToAdmin','App\\Models\\User',51,'{\"data\":\"A new leave-notification\",\"link\":\"http:\\/\\/peopleprohrm.test\\/timesheet\\/leaves\"}',NULL,'2023-12-10 05:39:20','2023-12-10 05:39:20'),('94454ac0-c2b4-4511-af4e-a3bff878c7f8','App\\Notifications\\LeaveNotificationToAdmin','App\\User',31,'{\"data\":\"A new leave-notification\",\"link\":\"http:\\/\\/localhost\\/peoplepro\\/timesheet\\/leaves\"}',NULL,'2021-10-04 04:09:00','2021-10-04 04:09:00'),('96770543-5381-454f-8fc3-3515825bdc2d','App\\Notifications\\TicketCreatedNotification','App\\Models\\User',5169,'{\"data\":\"Uma solicita\\u00e7\\u00e3o foi emitido para MARCELO DE OLIVEIRA DA SILVA \",\"link\":\"https:\\/\\/www.testerh.com.br\\/tickets\\/frT9FBZR\"}',NULL,'2025-08-28 20:21:37','2025-08-28 20:21:37'),('96a2f2ed-538f-4c94-8197-f5ded6e1a206','App\\Notifications\\TicketCreatedNotification','App\\Models\\User',1,'{\"data\":\"Uma solicita\\u00e7\\u00e3o foi emitido para MARCELO DE OLIVEIRA DA SILVA \",\"link\":\"http:\\/\\/rhnpmais.com.br\\/tickets\\/mzHPUOjR\"}',NULL,'2025-08-27 13:41:21','2025-08-27 13:41:21'),('9783fa27-2b69-4628-84c8-d841ad97dbbd','App\\Notifications\\LeaveNotificationToAdmin','App\\Models\\User',9,'{\"data\":\"A new leave-notification\",\"link\":\"http:\\/\\/peopleprohrm.test\\/timesheet\\/leaves\"}',NULL,'2023-12-10 06:19:32','2023-12-10 06:19:32'),('97de5f4e-3da8-4126-ad12-29894d2d1009','App\\Notifications\\AnnouncementPublished','App\\User',34,'{\"data\":\"A new announcement has been published\",\"link\":\"http:\\/\\/localhost\\/peoplepro\\/organization\\/announcements\"}',NULL,'2023-05-02 07:12:00','2023-05-02 07:12:00'),('98bb4245-0f9a-4a21-84c5-ab5d44904cc7','App\\Notifications\\LeaveNotificationToAdmin','App\\Models\\User',1,'{\"data\":\"A new leave-notification\",\"link\":\"http:\\/\\/peopleprohrm.test\\/timesheet\\/leaves\"}','2024-01-16 03:22:08','2023-12-10 05:13:10','2024-01-16 03:22:08'),('9a2c3218-774f-4990-b41b-f5ba0d5dad5a','App\\Notifications\\TicketUpdatedNotification','App\\User',8,'{\"data\":\"Issued ticket for Bob Hobart has been updated\",\"link\":\"http:\\/\\/peopleprohrm.com\\/demo\\/tickets\\/Kkqx8gSB\"}',NULL,'2020-07-28 17:06:02','2020-07-28 17:06:02'),('9ac63dfb-9827-4516-9359-7ed5208f06c1','App\\Notifications\\ComplainAgainstNotify','App\\Models\\User',109,'{\"data\":\"teste--Uma reclama\\u00e7\\u00e3o foi apresentada contra voc\\u00ea por 107\",\"link\":\"ex\\/profile#Employee_Complaint\"}',NULL,'2025-03-26 07:56:03','2025-03-26 07:56:03'),('9b2fa86f-db94-4694-84be-2c033bbb450d','App\\Notifications\\TicketAssignedNotification','App\\User',8,'{\"data\":\"2 Employees has been assigned for Bob Hobart ticket\",\"link\":\"http:\\/\\/peopleprohrm.com\\/demo\\/tickets\\/Kkqx8gSB\"}',NULL,'2020-07-28 17:05:30','2020-07-28 17:05:30'),('9c0bdc69-c97d-430f-b6dd-ca3e5ba7fb70','App\\Notifications\\TicketCreatedNotification','App\\Models\\User',5162,'{\"data\":\"Uma solicita\\u00e7\\u00e3o foi emitido para MARCELO DE OLIVEIRA DA SILVA \",\"link\":\"https:\\/\\/testerh.com.br\\/tickets\\/kTXFywmv\"}',NULL,'2025-08-12 20:23:32','2025-08-12 20:23:32'),('9c7ef9db-ad32-46c9-a1ce-269a127b41e9','App\\Notifications\\CompanyPolicyNotify','App\\User',12,'{\"data\":\"Company Policy has been published\",\"link\":\"http:\\/\\/localhost\\/peoplepro\\/organization\\/policy\"}',NULL,'2023-02-01 07:30:21','2023-02-01 07:30:21'),('9ce4f9b2-698e-4b79-be29-8572c0c2d6f6','App\\Notifications\\LeaveNotificationToAdmin','App\\User',40,'{\"data\":\"A new leave-notification\",\"link\":\"http:\\/\\/localhost\\/peoplepro\\/timesheet\\/leaves\"}',NULL,'2021-10-04 04:09:00','2021-10-04 04:09:00'),('9d42de54-e758-4c1b-89ab-5e48df006967','App\\Notifications\\LeaveNotificationToAdmin','App\\Models\\User',1,'{\"data\":\"A new leave-notification\",\"link\":\"http:\\/\\/peopleprohrm.test\\/timesheet\\/leaves\"}','2024-01-16 03:22:08','2023-12-10 05:13:11','2024-01-16 03:22:08'),('9e5de11c-c9fd-4b3d-acd5-dc2208b46682','App\\Notifications\\EmployeeTravelStatus','App\\User',9,'{\"data\":\"Your travel request status is --- first level approval\",\"link\":\"http:\\/\\/peopleprohrm.com\\/demo\\/profile#Employee_travel\"}','2021-07-05 15:53:34','2020-08-18 07:11:23','2021-07-05 15:53:34'),('9ea58f45-3966-43a0-a9f1-22f7858a7f23','App\\Notifications\\LeaveNotificationToAdmin','App\\Models\\User',1,'{\"data\":\"A new leave-notification\",\"link\":\"https:\\/\\/www.testerh.com.br\\/timesheet\\/leaves\"}','2025-06-13 06:55:07','2025-06-11 02:47:48','2025-06-13 06:55:07'),('9f21d8ca-f822-4c7f-88e2-c58cfced9c22','App\\Notifications\\TicketCreatedNotification','App\\Models\\User',1,'{\"data\":\"Uma solicita\\u00e7\\u00e3o foi emitido para LETICIA MACIEL AVELINO  \",\"link\":\"https:\\/\\/www.rhnpmais.com.br\\/tickets\\/RKE5amcW\"}',NULL,'2025-09-01 15:35:12','2025-09-01 15:35:12'),('9fe492ca-7b37-4419-935d-31cd42d3af77','App\\Notifications\\ClientTaskCreated','App\\User',8,'{\"data\":\"new2222 has been updated by a client named maria_g\",\"link\":\"http:\\/\\/peopleprohrm.com\\/demo\\/project-management\\/tasks\\/6\"}',NULL,'2020-10-12 02:00:20','2020-10-12 02:00:20'),('a04fe75d-8a16-4982-87c4-259ec51464d7','App\\Notifications\\ComplaintFromNotify','App\\Models\\User',2802,'{\"data\":\"Reclama\\u00e7\\u00f5es sobre a colaboradora--Sua reclama\\u00e7\\u00e3o contra 274 foi registrada\",\"link\":\"\\/profile#Employee_Complaint\"}',NULL,'2025-08-19 19:50:12','2025-08-19 19:50:12'),('a10a1e2e-fd7b-4034-abb7-9090ef35e287','App\\Notifications\\TicketCreatedNotification','App\\Models\\User',111,'{\"data\":\"Um bilhete foi emitido para Carlos Robson Silva De Araujo \",\"link\":\"https:\\/\\/testerh.com.br\\/tickets\\/06euXSzq\"}','2025-05-02 06:52:57','2025-05-02 06:52:32','2025-05-02 06:52:57'),('a1962b4a-4209-4bd9-8bc5-bf1f7f9b980f','App\\Notifications\\TicketCreatedNotification','App\\Models\\User',5163,'{\"data\":\"Uma solicita\\u00e7\\u00e3o foi emitido para MARCELO DE OLIVEIRA DA SILVA \",\"link\":\"https:\\/\\/testerh.com.br\\/tickets\\/kTXFywmv\"}',NULL,'2025-08-12 20:23:32','2025-08-12 20:23:32'),('a2943799-2fc3-402b-97b2-d5c290cd189d','App\\Notifications\\LeaveNotificationToAdmin','App\\Models\\User',1,'{\"data\":\"A new leave-notification\",\"link\":\"http:\\/\\/peopleprohrm.test\\/timesheet\\/leaves\"}','2024-01-16 03:22:08','2023-12-10 05:13:00','2024-01-16 03:22:08'),('a2d4d7ca-ba56-4fbf-afff-f85630d84ae0','App\\Notifications\\TicketCreatedNotification','App\\Models\\User',5160,'{\"data\":\"Uma solicita\\u00e7\\u00e3o foi emitido para MARCELO DE OLIVEIRA DA SILVA \",\"link\":\"http:\\/\\/rhnpmais.com.br\\/tickets\\/oHDPMiJS\"}',NULL,'2025-08-27 13:38:39','2025-08-27 13:38:39'),('a3530a24-01fe-4553-9a32-18866781408d','App\\Notifications\\LeaveNotificationToAdmin','App\\Models\\User',1,'{\"data\":\"A new leave-notification\",\"link\":\"http:\\/\\/peopleprohrm.test\\/timesheet\\/leaves\"}','2024-01-16 03:22:08','2023-12-10 05:48:20','2024-01-16 03:22:08'),('a40b5530-584d-4044-a7e9-7d084458868e','App\\Notifications\\LeaveNotificationToAdmin','App\\Models\\User',51,'{\"data\":\"A new leave-notification\",\"link\":\"http:\\/\\/peopleprohrm.test\\/timesheet\\/leaves\"}',NULL,'2023-12-10 05:43:15','2023-12-10 05:43:15'),('a4149d71-fda4-4df1-a9af-8e69f317181d','App\\Notifications\\LeaveNotificationToAdmin','App\\User',36,'{\"data\":\"A new leave-notification\",\"link\":\"http:\\/\\/localhost\\/peoplepro\\/timesheet\\/leaves\"}',NULL,'2021-10-04 04:08:51','2021-10-04 04:08:51'),('a446d67a-784c-441c-8bf2-150192dbdf01','App\\Notifications\\TicketCreatedNotification','App\\Models\\User',5181,'{\"data\":\"Uma solicita\\u00e7\\u00e3o foi emitido para MARCELO DE OLIVEIRA DA SILVA \",\"link\":\"http:\\/\\/rhnpmais.com.br\\/tickets\\/eALPLUfr\"}',NULL,'2025-08-27 13:41:22','2025-08-27 13:41:22'),('a45dcc68-9faf-4e84-9c1e-109433953c52','App\\Notifications\\EmployeeTerminationNotify','App\\User',54,'{\"data\":\"You have been terminated from this company  Termination Date-- 14-02-2023\",\"link\":\"\"}',NULL,'2023-02-14 06:48:05','2023-02-14 06:48:05'),('a4b6b7c9-d8a9-433c-bd3d-7afc27c4e8d7','App\\Notifications\\LeaveNotificationToAdmin','App\\User',46,'{\"data\":\"A new leave-notification\",\"link\":\"http:\\/\\/localhost\\/peoplepro\\/timesheet\\/leaves\"}',NULL,'2021-10-04 04:09:17','2021-10-04 04:09:17'),('a4e7e18f-ee7f-4534-8dd4-9220d85ea62f','App\\Notifications\\LeaveNotificationToAdmin','App\\Models\\User',1,'{\"data\":\"A new leave-notification\",\"link\":\"http:\\/\\/peopleprohrm.test\\/timesheet\\/leaves\"}','2024-01-16 03:22:08','2023-12-10 05:44:57','2024-01-16 03:22:08'),('a526d3da-a48a-4148-83fe-7039a0925d28','App\\Notifications\\LeaveNotificationToAdmin','App\\User',40,'{\"data\":\"A new leave-notification\",\"link\":\"http:\\/\\/localhost\\/peoplepro\\/timesheet\\/leaves\"}',NULL,'2021-10-04 01:15:59','2021-10-04 01:15:59'),('a56d3401-6930-42f6-ad6d-17760fefdeb9','App\\Notifications\\TicketCreatedNotification','App\\Models\\User',5162,'{\"data\":\"Uma solicita\\u00e7\\u00e3o foi emitido para MARCELO DE OLIVEIRA DA SILVA \",\"link\":\"https:\\/\\/www.testerh.com.br\\/tickets\\/M4R7uFan\"}',NULL,'2025-08-27 13:41:45','2025-08-27 13:41:45'),('a692f74e-dfc2-445d-ae44-50f4f0225fb1','App\\Notifications\\LeaveNotificationToAdmin','App\\User',1,'{\"data\":\"A new leave-notification\",\"link\":\"http:\\/\\/localhost\\/peoplepro\\/timesheet\\/leaves\"}','2021-11-27 05:42:22','2021-10-04 01:22:12','2021-11-27 05:42:22'),('a6ef60fe-a7fe-423b-85d8-cd49a8f2236d','App\\Notifications\\LeaveNotificationToAdmin','App\\User',1,'{\"data\":\"A new leave-notification\",\"link\":\"http:\\/\\/localhost\\/peoplepro\\/timesheet\\/leaves\"}','2021-10-04 01:17:04','2021-10-04 01:16:18','2021-10-04 01:17:04'),('a75351ff-1718-4518-9b7a-aa3ffed2010f','App\\Notifications\\TicketCreatedNotification','App\\Models\\User',5166,'{\"data\":\"Uma solicita\\u00e7\\u00e3o foi emitido para MARCELO DE OLIVEIRA DA SILVA \",\"link\":\"https:\\/\\/www.testerh.com.br\\/tickets\\/frT9FBZR\"}',NULL,'2025-08-28 20:21:37','2025-08-28 20:21:37'),('a79613b0-28f2-44af-ac53-9c835c3915e6','App\\Notifications\\TicketCreatedNotification','App\\Models\\User',4069,'{\"data\":\"Uma solicita\\u00e7\\u00e3o foi emitido para MARCELO DE OLIVEIRA DA SILVA \",\"link\":\"https:\\/\\/testerh.com.br\\/tickets\\/5Tb0bt8E\"}',NULL,'2025-08-12 19:54:31','2025-08-12 19:54:31'),('a7b582da-1283-4294-b970-7e3f3507575a','App\\Notifications\\TicketCreatedNotification','App\\Models\\User',5162,'{\"data\":\"Uma solicita\\u00e7\\u00e3o foi emitido para MARCELO DE OLIVEIRA DA SILVA \",\"link\":\"https:\\/\\/www.testerh.com.br\\/tickets\\/frT9FBZR\"}',NULL,'2025-08-28 20:21:37','2025-08-28 20:21:37'),('a7f0d2ae-9c0e-4864-afe3-45e0b153a8f6','App\\Notifications\\LeaveNotificationToAdmin','App\\Models\\User',9,'{\"data\":\"A new leave-notification\",\"link\":\"http:\\/\\/peopleprohrm.test\\/timesheet\\/leaves\"}',NULL,'2023-12-10 05:44:35','2023-12-10 05:44:35'),('a891dbdf-7a3b-420d-9b96-fa8442b59cce','App\\Notifications\\TicketUpdatedNotification','App\\Models\\User',5163,'{\"data\":\"Solicita\\u00e7\\u00e3o emitido para MARCELO DE OLIVEIRA DA SILVA  Tem sido atualizado\",\"link\":\"https:\\/\\/www.testerh.com.br\\/tickets\\/frT9FBZR\"}',NULL,'2025-08-28 20:28:03','2025-08-28 20:28:03'),('a92e54de-6aa5-4f9e-84ff-db58c857ce6e','App\\Notifications\\ProjectUpdatedNotification','App\\User',11,'{\"data\":\"Test1 has been updated\",\"link\":\"http:\\/\\/peopleprohrm.com\\/demo\\/project-management\\/projects\\/1\"}',NULL,'2020-10-18 11:21:13','2020-10-18 11:21:13'),('a97a0640-b23f-4740-bb36-bc60dec354c6','App\\Notifications\\TicketCreatedNotification','App\\Models\\User',5169,'{\"data\":\"Uma solicita\\u00e7\\u00e3o foi emitido para MARCELO DE OLIVEIRA DA SILVA \",\"link\":\"https:\\/\\/testerh.com.br\\/tickets\\/kTXFywmv\"}',NULL,'2025-08-12 20:23:32','2025-08-12 20:23:32'),('aa98a0bc-377f-4a1e-8c0a-bb07427e34b6','App\\Notifications\\LeaveNotificationToAdmin','App\\Models\\User',1,'{\"data\":\"A new leave-notification\",\"link\":\"http:\\/\\/peopleprohrm.test\\/timesheet\\/leaves\"}','2024-01-16 03:22:08','2023-12-10 06:13:20','2024-01-16 03:22:08'),('ab2e4808-6c93-4da8-8f4d-fb815ba785af','App\\Notifications\\LeaveNotificationToAdmin','App\\User',46,'{\"data\":\"A new leave-notification\",\"link\":\"http:\\/\\/localhost\\/peoplepro\\/timesheet\\/leaves\"}',NULL,'2021-10-04 01:15:59','2021-10-04 01:15:59'),('ab3573b4-5108-48e1-b8cf-65b55d4dd997','App\\Notifications\\TicketUpdatedNotification','App\\Models\\User',4069,'{\"data\":\"Solicita\\u00e7\\u00e3o emitido para MARCELO DE OLIVEIRA DA SILVA  Tem sido atualizado\",\"link\":\"https:\\/\\/www.testerh.com.br\\/tickets\\/5Tb0bt8E\"}',NULL,'2025-08-12 20:03:21','2025-08-12 20:03:21'),('abd9f143-9495-4d48-8a0b-889c0939bfce','App\\Notifications\\LeaveNotificationToAdmin','App\\Models\\User',51,'{\"data\":\"A new leave-notification\",\"link\":\"http:\\/\\/peopleprohrm.test\\/timesheet\\/leaves\"}',NULL,'2023-12-10 05:13:11','2023-12-10 05:13:11'),('ac6e801a-b871-416a-8289-68fe507f2d4c','App\\Notifications\\TicketCreatedNotification','App\\Models\\User',5168,'{\"data\":\"Uma solicita\\u00e7\\u00e3o foi emitido para MARCELO DE OLIVEIRA DA SILVA \",\"link\":\"http:\\/\\/rhnpmais.com.br\\/tickets\\/mzHPUOjR\"}',NULL,'2025-08-27 13:41:21','2025-08-27 13:41:21'),('acefed14-111f-45e2-8bfd-019dc2ee3907','App\\Notifications\\ComplaintFromNotify','App\\Models\\User',107,'{\"data\":\"teste--Sua reclama\\u00e7\\u00e3o contra 106 foi registrada\",\"link\":\"\\/profile#Employee_Complaint\"}',NULL,'2025-03-26 06:45:51','2025-03-26 06:45:51'),('acf895bb-0b15-44b1-af0c-462aaadf33a2','App\\Notifications\\ComplaintFromNotify','App\\Models\\User',107,'{\"data\":\"23213sqwq--Sua reclama\\u00e7\\u00e3o contra 109 foi registrada\",\"link\":\"\\/profile#Employee_Complaint\"}',NULL,'2025-03-26 08:01:26','2025-03-26 08:01:26'),('adacadc8-0fcd-4b16-98b3-799ed0e41b11','App\\Notifications\\OfficialDocumentExpiryNotifyToAdmin','App\\User',46,'{\"data\":\"A new notification about official document expiry\",\"link\":\"http:\\/\\/localhost\\/file_manager\\/official_documents\"}',NULL,'2021-12-07 13:38:23','2021-12-07 13:38:23'),('adc09dcd-eaed-4ded-99c7-35015596a690','App\\Notifications\\TicketCreatedNotification','App\\Models\\User',5165,'{\"data\":\"Uma solicita\\u00e7\\u00e3o foi emitido para MARCELO DE OLIVEIRA DA SILVA \",\"link\":\"http:\\/\\/rhnpmais.com.br\\/tickets\\/eALPLUfr\"}',NULL,'2025-08-27 13:41:22','2025-08-27 13:41:22'),('adf75e6d-d5ea-4cbf-b0c8-2e076aa25e32','App\\Notifications\\AnnouncementPublished','App\\User',49,'{\"data\":\"A new announcement has been published\",\"link\":\"http:\\/\\/localhost\\/peoplepro\\/organization\\/announcements\"}',NULL,'2023-05-02 07:12:00','2023-05-02 07:12:00'),('aeb36c68-ac90-411b-89b3-7f1f44cc593e','App\\Notifications\\TicketUpdatedNotification','App\\Models\\User',5167,'{\"data\":\"Solicita\\u00e7\\u00e3o emitido para MARCELO DE OLIVEIRA DA SILVA  Tem sido atualizado\",\"link\":\"https:\\/\\/www.testerh.com.br\\/tickets\\/5Tb0bt8E\"}',NULL,'2025-08-12 20:03:21','2025-08-12 20:03:21'),('af53a0b7-fcf3-4a5d-acd2-a80f4980b212','App\\Notifications\\LeaveNotificationToAdmin','App\\User',40,'{\"data\":\"A new leave-notification\",\"link\":\"http:\\/\\/localhost\\/peoplepro\\/timesheet\\/leaves\"}',NULL,'2021-10-04 04:09:05','2021-10-04 04:09:05'),('af7d233c-a70f-4ec9-b21e-8103515f9fa2','App\\Notifications\\LeaveNotificationToAdmin','App\\Models\\User',51,'{\"data\":\"A new leave-notification\",\"link\":\"http:\\/\\/peopleprohrm.test\\/timesheet\\/leaves\"}',NULL,'2023-12-10 05:13:10','2023-12-10 05:13:10'),('afc5b977-35bc-4907-898f-c13cedea5815','App\\Notifications\\AnnouncementPublished','App\\User',27,'{\"data\":\"A new announcement has been published\",\"link\":\"http:\\/\\/localhost\\/peoplepro\\/organization\\/announcements\"}',NULL,'2023-05-02 07:12:00','2023-05-02 07:12:00'),('afd8e10b-fd1f-475b-a954-12910b7d51bd','App\\Notifications\\ComplaintFromNotify','App\\Models\\User',92,'{\"data\":\"teste--Sua reclama\\u00e7\\u00e3o contra 105 foi registrada\",\"link\":\"\\/profile#Employee_Complaint\"}',NULL,'2025-03-25 08:11:59','2025-03-25 08:11:59'),('b0683c83-b902-4566-a524-17346097bf64','App\\Notifications\\TicketCreatedNotification','App\\Models\\User',4069,'{\"data\":\"Uma solicita\\u00e7\\u00e3o foi emitido para MARCELO DE OLIVEIRA DA SILVA \",\"link\":\"http:\\/\\/rhnpmais.com.br\\/tickets\\/mzHPUOjR\"}',NULL,'2025-08-27 13:41:21','2025-08-27 13:41:21'),('b0e5a738-ff48-4c14-a02a-2ad571ce0fa6','App\\Notifications\\InvoiceReceivedNotification','App\\User',16,'{\"data\":\"Invoice of Project : Test2 has been received\",\"link\":\"http:\\/\\/peopleprohrm.com\\/demo\\/project-management\\/invoices\\/INV-NleUqw\"}',NULL,'2020-10-18 03:18:53','2020-10-18 03:18:53'),('b1b2d491-fd62-48fc-aeaf-7970c3089d63','App\\Notifications\\TicketUpdatedNotification','App\\Models\\User',5166,'{\"data\":\"Solicita\\u00e7\\u00e3o emitido para MARCELO DE OLIVEIRA DA SILVA  Tem sido atualizado\",\"link\":\"https:\\/\\/www.testerh.com.br\\/tickets\\/5Tb0bt8E\"}',NULL,'2025-08-12 20:03:21','2025-08-12 20:03:21'),('b1d1557e-e6ac-41fc-8235-3d3743d54481','App\\Notifications\\TicketCreatedNotification','App\\Models\\User',1,'{\"data\":\"Um bilhete foi emitido para Carlos Robson Silva De Araujo \",\"link\":\"https:\\/\\/testerh.com.br\\/tickets\\/06euXSzq\"}','2025-05-02 06:53:24','2025-05-02 06:52:32','2025-05-02 06:53:24'),('b1d40b45-dd85-4f48-814f-46d89a0bb12d','App\\Notifications\\LeaveNotificationToAdmin','App\\Models\\User',115,'{\"data\":\"A new leave-notification\",\"link\":\"https:\\/\\/www.testerh.com.br\\/timesheet\\/leaves\"}','2025-07-11 05:15:46','2025-06-11 02:47:48','2025-07-11 05:15:46'),('b1e3b1af-51e7-4971-b10d-bfd6da509f06','App\\Notifications\\LeaveNotificationToAdmin','App\\Models\\User',1,'{\"data\":\"A new leave-notification\",\"link\":\"http:\\/\\/peopleprohrm.test\\/timesheet\\/leaves\"}','2024-01-16 03:22:08','2023-12-10 06:21:35','2024-01-16 03:22:08'),('b2b60f8f-7a96-491e-b4db-a7b162b042f6','App\\Notifications\\LeaveNotificationToAdmin','App\\Models\\User',51,'{\"data\":\"A new leave-notification\",\"link\":\"http:\\/\\/peopleprohrm.test\\/timesheet\\/leaves\"}',NULL,'2023-12-10 06:21:16','2023-12-10 06:21:16'),('b4394ab6-4dec-430f-92d8-a25fe5dae37d','App\\Notifications\\LeaveNotificationToAdmin','App\\User',36,'{\"data\":\"A new leave-notification\",\"link\":\"http:\\/\\/localhost\\/peoplepro\\/timesheet\\/leaves\"}',NULL,'2021-10-04 01:21:08','2021-10-04 01:21:08'),('b4427790-477a-447c-8ac4-2fe3cadb1208','App\\Notifications\\TicketCreatedNotification','App\\Models\\User',5160,'{\"data\":\"Uma solicita\\u00e7\\u00e3o foi emitido para MARCELO DE OLIVEIRA DA SILVA \",\"link\":\"https:\\/\\/testerh.com.br\\/tickets\\/5Tb0bt8E\"}',NULL,'2025-08-12 19:54:31','2025-08-12 19:54:31'),('b4596189-04a4-4ff6-9ab4-1449eac93f7f','App\\Notifications\\TicketCreatedNotification','App\\Models\\User',1,'{\"data\":\"Uma solicita\\u00e7\\u00e3o foi emitido para MARCELO DE OLIVEIRA DA SILVA \",\"link\":\"https:\\/\\/testerh.com.br\\/tickets\\/kTXFywmv\"}',NULL,'2025-08-12 20:23:32','2025-08-12 20:23:32'),('b53b787b-7e84-4eff-bf9d-ecdaac8e42d8','App\\Notifications\\ComplainAgainstNotify','App\\Models\\User',61,'{\"data\":\"teste--Uma reclama\\u00e7\\u00e3o foi apresentada contra voc\\u00ea por 61\",\"link\":\"ex\\/profile#Employee_Complaint\"}',NULL,'2025-03-23 10:20:15','2025-03-23 10:20:15'),('b5769148-054f-4352-bf77-65662b6dd218','App\\Notifications\\TicketCreatedNotification','App\\Models\\User',110,'{\"data\":\"Um bilhete foi emitido para RebeccaTeste \",\"link\":\"https:\\/\\/testerh.com.br\\/tickets\\/bYYHUDWe\"}',NULL,'2025-05-21 02:09:51','2025-05-21 02:09:51'),('b72dcc7f-1134-418f-85c2-847fed5b369d','App\\Notifications\\LeaveNotificationToAdmin','App\\Models\\User',51,'{\"data\":\"A new leave-notification\",\"link\":\"http:\\/\\/peopleprohrm.test\\/timesheet\\/leaves\"}',NULL,'2023-12-10 05:13:00','2023-12-10 05:13:00'),('b8f87453-1177-4edf-8fc4-4969e2a8d122','App\\Notifications\\ProjectUpdatedNotification','App\\User',14,'{\"data\":\"Test2 has been updated\",\"link\":\"http:\\/\\/peopleprohrm.com\\/demo\\/project-management\\/projects\\/2\"}',NULL,'2020-10-25 17:12:46','2020-10-25 17:12:46'),('b92a5108-3377-4552-9613-06dfc07a8fb7','App\\Notifications\\TicketCreatedNotification','App\\Models\\User',1,'{\"data\":\"Uma solicita\\u00e7\\u00e3o foi emitido para Enzo \",\"link\":\"https:\\/\\/testerh.com.br\\/tickets\\/WJQAzDm4\"}','2025-08-06 19:52:00','2025-08-06 19:51:50','2025-08-06 19:52:00'),('b9bf2f31-dc4b-4e06-9413-6f268745ebd1','App\\Notifications\\TicketCreatedNotification','App\\Models\\User',5167,'{\"data\":\"Uma solicita\\u00e7\\u00e3o foi emitido para MARCELO DE OLIVEIRA DA SILVA \",\"link\":\"http:\\/\\/rhnpmais.com.br\\/tickets\\/mzHPUOjR\"}',NULL,'2025-08-27 13:41:21','2025-08-27 13:41:21'),('b9dcc14e-86dc-4942-9801-d685ec4248a2','App\\Notifications\\TicketCreatedNotification','App\\Models\\User',4069,'{\"data\":\"Uma solicita\\u00e7\\u00e3o foi emitido para MARCELO DE OLIVEIRA DA SILVA \",\"link\":\"http:\\/\\/rhnpmais.com.br\\/tickets\\/oHDPMiJS\"}',NULL,'2025-08-27 13:38:39','2025-08-27 13:38:39'),('b9f524f7-70f6-4661-9eb5-3402e13261bb','App\\Notifications\\TicketCreatedNotification','App\\Models\\User',5166,'{\"data\":\"Uma solicita\\u00e7\\u00e3o foi emitido para MARCELO DE OLIVEIRA DA SILVA \",\"link\":\"https:\\/\\/testerh.com.br\\/tickets\\/5Tb0bt8E\"}',NULL,'2025-08-12 19:54:31','2025-08-12 19:54:31'),('baed268a-08f6-4c19-a19a-2e3805ca16d6','App\\Notifications\\InvoiceReceivedNotification','App\\User',16,'{\"data\":\"Invoice of Project : Test2 has been received\",\"link\":\"http:\\/\\/peopleprohrm.com\\/demo\\/project-management\\/invoices\\/INV-NleUqw\"}',NULL,'2020-10-18 03:33:04','2020-10-18 03:33:04'),('bc610769-a549-4f72-968d-a1205afb0222','App\\Notifications\\LeaveNotificationToAdmin','App\\User',51,'{\"data\":\"A new leave-notification\",\"link\":\"http:\\/\\/localhost\\/peoplepro\\/timesheet\\/leaves\"}',NULL,'2023-04-18 05:28:36','2023-04-18 05:28:36'),('bcc9843f-0c01-4627-94f2-29690dfa4686','App\\Notifications\\LeaveNotificationToAdmin','App\\Models\\User',1,'{\"data\":\"A new leave-notification\",\"link\":\"http:\\/\\/peopleprohrm.test\\/timesheet\\/leaves\"}','2024-01-16 03:22:08','2023-12-10 05:47:31','2024-01-16 03:22:08'),('bcdd73f6-8799-4c10-861a-0cb2b87e64d1','App\\Notifications\\LeaveNotificationToAdmin','App\\User',46,'{\"data\":\"A new leave-notification\",\"link\":\"http:\\/\\/localhost\\/peoplepro\\/timesheet\\/leaves\"}',NULL,'2021-10-04 04:09:05','2021-10-04 04:09:05'),('bcf537fb-ce5d-4b41-ab45-d989b95b8942','App\\Notifications\\TicketCreatedNotification','App\\Models\\User',5181,'{\"data\":\"Uma solicita\\u00e7\\u00e3o foi emitido para MARCELO DE OLIVEIRA DA SILVA \",\"link\":\"http:\\/\\/rhnpmais.com.br\\/tickets\\/oHDPMiJS\"}',NULL,'2025-08-27 13:38:39','2025-08-27 13:38:39'),('bd2bb9a5-aca5-494b-8de8-6870ab3aaf9d','App\\Notifications\\LeaveNotificationToAdmin','App\\User',48,'{\"data\":\"A new leave-notification\",\"link\":\"http:\\/\\/localhost\\/peoplepro\\/timesheet\\/leaves\"}',NULL,'2021-10-04 01:16:18','2021-10-04 01:16:18'),('bd671f1e-eef8-4cde-93b2-a73bcca47872','App\\Notifications\\LeaveNotificationToAdmin','App\\Models\\User',1,'{\"data\":\"A new leave-notification\",\"link\":\"http:\\/\\/peopleprohrm.test\\/timesheet\\/leaves\"}','2024-01-16 03:22:08','2023-12-10 05:13:02','2024-01-16 03:22:08'),('bd7c7126-de39-46c4-a9d6-fc5855df4dfa','App\\Notifications\\LeaveNotificationToAdmin','App\\Models\\User',9,'{\"data\":\"A new leave-notification\",\"link\":\"http:\\/\\/peopleprohrm.test\\/timesheet\\/leaves\"}',NULL,'2023-12-10 06:17:21','2023-12-10 06:17:21'),('bd7ea5a2-fc6c-403b-859a-f839c92f0758','App\\Notifications\\TicketCreatedNotification','App\\Models\\User',4069,'{\"data\":\"Uma solicita\\u00e7\\u00e3o foi emitido para GLORIA THIERIS FRAN\\u00c7A LIMA  \",\"link\":\"https:\\/\\/www.testerh.com.br\\/tickets\\/xIdQaprj\"}',NULL,'2025-08-07 20:20:22','2025-08-07 20:20:22'),('bf2d32ac-a272-47f2-836a-b009d401f92b','App\\Notifications\\LeaveNotificationToAdmin','App\\Models\\User',1,'{\"data\":\"A new leave-notification\",\"link\":\"http:\\/\\/peopleprohrm.test\\/timesheet\\/leaves\"}','2024-01-16 03:22:08','2023-12-10 05:13:00','2024-01-16 03:22:08'),('bf455597-1022-4ac9-a3aa-587c4024b3ad','App\\Notifications\\LeaveNotificationToAdmin','App\\User',1,'{\"data\":\"A new leave-notification\",\"link\":\"http:\\/\\/localhost\\/peoplepro\\/timesheet\\/leaves\"}','2023-01-23 04:24:37','2023-01-22 13:51:34','2023-01-23 04:24:37'),('c06cfccc-00dd-4009-8172-351e3d686cc1','App\\Notifications\\TicketUpdatedNotification','App\\Models\\User',5168,'{\"data\":\"Solicita\\u00e7\\u00e3o emitido para MARCELO DE OLIVEIRA DA SILVA  Tem sido atualizado\",\"link\":\"https:\\/\\/www.testerh.com.br\\/tickets\\/frT9FBZR\"}',NULL,'2025-08-28 20:28:03','2025-08-28 20:28:03'),('c1011c75-3b8e-4c03-9a22-e1b0ce9eb8cf','App\\Notifications\\LeaveNotificationToAdmin','App\\Models\\User',9,'{\"data\":\"A new leave-notification\",\"link\":\"http:\\/\\/peopleprohrm.test\\/timesheet\\/leaves\"}',NULL,'2023-12-10 05:13:03','2023-12-10 05:13:03'),('c14d50a8-90b3-42fc-ace1-41c73b16489c','App\\Notifications\\TicketAssignedNotification','App\\User',10,'{\"data\":\"2 Employees has been assigned for Bob Hobart ticket\",\"link\":\"http:\\/\\/peopleprohrm.com\\/demo\\/tickets\\/Kkqx8gSB\"}',NULL,'2020-07-28 17:05:30','2020-07-28 17:05:30'),('c1da0be1-da80-43e5-b888-d21835883344','App\\Notifications\\TicketCreatedNotification','App\\Models\\User',1,'{\"data\":\"Uma solicita\\u00e7\\u00e3o foi emitido para MARCELO DE OLIVEIRA DA SILVA \",\"link\":\"http:\\/\\/rhnpmais.com.br\\/tickets\\/eALPLUfr\"}',NULL,'2025-08-27 13:41:22','2025-08-27 13:41:22'),('c28dbc06-1294-46bf-8f6f-72f63047b948','App\\Notifications\\CompanyPolicyNotify','App\\User',34,'{\"data\":\"Company Policy has been published\",\"link\":\"http:\\/\\/localhost\\/peoplepro\\/organization\\/policy\"}',NULL,'2023-02-01 07:30:21','2023-02-01 07:30:21'),('c313047d-d3e9-42f3-b3d2-d7e0aabc331c','App\\Notifications\\LeaveNotificationToAdmin','App\\Models\\User',1,'{\"data\":\"A new leave-notification\",\"link\":\"http:\\/\\/peopleprohrm.test\\/timesheet\\/leaves\"}','2024-01-16 03:22:08','2023-12-10 05:12:59','2024-01-16 03:22:08'),('c373f767-038a-498d-8832-e5e01831b90a','App\\Notifications\\LeaveNotificationToAdmin','App\\Models\\User',9,'{\"data\":\"A new leave-notification\",\"link\":\"http:\\/\\/peopleprohrm.test\\/timesheet\\/leaves\"}',NULL,'2023-12-10 05:13:02','2023-12-10 05:13:02'),('c562dcfb-1ddc-45e7-9855-0a2f0980610e','App\\Notifications\\TicketCreatedNotification','App\\Models\\User',5353,'{\"data\":\"Uma solicita\\u00e7\\u00e3o foi emitido para MARCELO DE OLIVEIRA DA SILVA \",\"link\":\"http:\\/\\/rhnpmais.com.br\\/tickets\\/mzHPUOjR\"}',NULL,'2025-08-27 13:41:21','2025-08-27 13:41:21'),('c6a47158-f02c-4d44-b96d-543c53edf66a','App\\Notifications\\OfficialDocumentExpiryNotifyToAdmin','App\\User',48,'{\"data\":\"A new notification about official document expiry\",\"link\":\"http:\\/\\/localhost\\/file_manager\\/official_documents\"}',NULL,'2021-12-07 13:35:09','2021-12-07 13:35:09'),('c83164d5-9c5d-430d-b1db-8b0df31b3222','App\\Notifications\\LeaveNotificationToAdmin','App\\Models\\User',51,'{\"data\":\"A new leave-notification\",\"link\":\"http:\\/\\/peopleprohrm.test\\/timesheet\\/leaves\"}',NULL,'2023-12-10 05:13:11','2023-12-10 05:13:11'),('c9b85b47-bd79-4dcf-b5b4-37741e116110','App\\Notifications\\TicketCreatedNotification','App\\Models\\User',5160,'{\"data\":\"Uma solicita\\u00e7\\u00e3o foi emitido para MARCELO DE OLIVEIRA DA SILVA \",\"link\":\"https:\\/\\/www.testerh.com.br\\/tickets\\/frT9FBZR\"}',NULL,'2025-08-28 20:21:37','2025-08-28 20:21:37'),('ca27782b-315d-4084-b2ec-99305ca5d969','App\\Notifications\\TicketCreatedNotification','App\\Models\\User',5160,'{\"data\":\"Uma solicita\\u00e7\\u00e3o foi emitido para LETICIA MACIEL AVELINO  \",\"link\":\"https:\\/\\/www.rhnpmais.com.br\\/tickets\\/RKE5amcW\"}',NULL,'2025-09-01 15:35:12','2025-09-01 15:35:12'),('ca5edf4d-5eae-41fe-a549-a8eb99e917a6','App\\Notifications\\LeaveNotificationToAdmin','App\\Models\\User',1,'{\"data\":\"A new leave-notification\",\"link\":\"http:\\/\\/peopleprohrm.test\\/timesheet\\/leaves\"}','2024-01-16 03:22:08','2023-12-10 05:13:10','2024-01-16 03:22:08'),('caa6a5fc-8dc6-42ff-8c8e-7c8fd2e1a405','App\\Notifications\\TicketCreatedNotification','App\\Models\\User',5160,'{\"data\":\"Uma solicita\\u00e7\\u00e3o foi emitido para MARCELO DE OLIVEIRA DA SILVA \",\"link\":\"http:\\/\\/rhnpmais.com.br\\/tickets\\/eALPLUfr\"}',NULL,'2025-08-27 13:41:22','2025-08-27 13:41:22'),('caed272e-87ec-47ea-ae2c-bb515fe992e3','App\\Notifications\\LeaveNotificationToAdmin','App\\User',47,'{\"data\":\"A new leave-notification\",\"link\":\"http:\\/\\/localhost\\/peoplepro\\/timesheet\\/leaves\"}',NULL,'2021-10-04 04:09:05','2021-10-04 04:09:05'),('cb9d86df-6fa7-42e8-bfa4-eced9de29d05','App\\Notifications\\TicketCreatedNotification','App\\Models\\User',5162,'{\"data\":\"Uma solicita\\u00e7\\u00e3o foi emitido para MARCELO DE OLIVEIRA DA SILVA \",\"link\":\"https:\\/\\/testerh.com.br\\/tickets\\/5Tb0bt8E\"}',NULL,'2025-08-12 19:54:31','2025-08-12 19:54:31'),('cbd8d62e-7758-4224-91e1-6a84d12c00fd','App\\Notifications\\OfficialDocumentExpiryNotifyToAdmin','App\\User',31,'{\"data\":\"A new notification about official document expiry\",\"link\":\"http:\\/\\/localhost\\/file_manager\\/official_documents\"}',NULL,'2021-12-07 13:35:08','2021-12-07 13:35:08'),('cc135169-a6a2-480e-9f58-fe29dee5e36d','App\\Notifications\\LeaveNotificationToAdmin','App\\User',40,'{\"data\":\"A new leave-notification\",\"link\":\"http:\\/\\/localhost\\/peoplepro\\/timesheet\\/leaves\"}',NULL,'2021-10-04 04:09:17','2021-10-04 04:09:17'),('ccc2375e-ae40-429c-9bb1-4782af521582','App\\Notifications\\ComplainAgainstNotify','App\\Models\\User',112,'{\"data\":\"teste--Uma reclama\\u00e7\\u00e3o foi apresentada contra voc\\u00ea por 111\",\"link\":\"ex\\/profile#Employee_Complaint\"}',NULL,'2025-03-26 19:26:56','2025-03-26 19:26:56'),('cce1e2ee-35c5-4fc6-b835-0e31e0b6562c','App\\Notifications\\LeaveNotificationToAdmin','App\\Models\\User',51,'{\"data\":\"A new leave-notification\",\"link\":\"http:\\/\\/peopleprohrm.test\\/timesheet\\/leaves\"}',NULL,'2023-12-10 05:13:00','2023-12-10 05:13:00'),('cd0bf547-0c7e-4c03-a3d0-01de7f908dc0','App\\Notifications\\LeaveNotificationToAdmin','App\\Models\\User',9,'{\"data\":\"A new leave-notification\",\"link\":\"http:\\/\\/peopleprohrm.test\\/timesheet\\/leaves\"}',NULL,'2023-12-10 06:16:45','2023-12-10 06:16:45'),('cd5a7348-3349-4086-83f8-bacc053da18c','App\\Notifications\\TicketCreatedNotification','App\\Models\\User',110,'{\"data\":\"Um bilhete foi emitido para RebeccaTeste \",\"link\":\"https:\\/\\/testerh.com.br\\/tickets\\/pV5cN7ub\"}',NULL,'2025-05-19 17:38:44','2025-05-19 17:38:44'),('cda598c3-8744-4139-a0a7-440573baaa17','App\\Notifications\\TicketCreatedNotification','App\\Models\\User',115,'{\"data\":\"Um bilhete foi emitido para RebeccaTeste \",\"link\":\"https:\\/\\/testerh.com.br\\/tickets\\/pV5cN7ub\"}','2025-07-11 05:15:46','2025-05-19 17:38:44','2025-07-11 05:15:46'),('ce2db6e9-e1bd-4bc7-b3bd-ad9691d5d866','App\\Notifications\\InterviewHostNotification','App\\Models\\User',9,'{\"data\":\"You have been selected as an interview host\\nInterview Title: Laravel Developer\\nInterview Date & Time: 17-11-2023|03:00PM\\nPlease set a reminder.\",\"link\":\"\"}',NULL,'2023-11-15 09:40:32','2023-11-15 09:40:32'),('ce32df8b-4e76-43a8-a657-00b8a41cd766','App\\Notifications\\TicketCreatedNotification','App\\Models\\User',5181,'{\"data\":\"Uma solicita\\u00e7\\u00e3o foi emitido para MARCELO DE OLIVEIRA DA SILVA \",\"link\":\"https:\\/\\/www.testerh.com.br\\/tickets\\/M4R7uFan\"}',NULL,'2025-08-27 13:41:45','2025-08-27 13:41:45'),('ce4c5d67-56b4-41d9-a8aa-d46ec1a2be58','App\\Notifications\\TicketCreatedNotification','App\\Models\\User',101,'{\"data\":\"Uma solicita\\u00e7\\u00e3o foi emitido para GLORIA THIERIS FRAN\\u00c7A LIMA  \",\"link\":\"https:\\/\\/www.testerh.com.br\\/tickets\\/xIdQaprj\"}',NULL,'2025-08-07 20:20:22','2025-08-07 20:20:22'),('ce7e603c-e115-413d-9f14-1d0c2809b75b','App\\Notifications\\LeaveNotificationToAdmin','App\\User',1,'{\"data\":\"A new leave-notification\",\"link\":\"http:\\/\\/localhost\\/peoplepro\\/timesheet\\/leaves\"}','2021-11-27 05:42:22','2021-10-04 04:09:17','2021-11-27 05:42:22'),('ced1e972-39db-4f13-aaed-8fe492e03947','App\\Notifications\\OfficialDocumentExpiryNotifyToAdmin','App\\User',48,'{\"data\":\"A new notification about official document expiry\",\"link\":\"http:\\/\\/localhost\\/file_manager\\/official_documents\"}',NULL,'2021-12-07 13:38:07','2021-12-07 13:38:07'),('cef23a5f-09a4-4b46-bcf6-e16e7e379f0c','App\\Notifications\\TicketCreatedNotification','App\\Models\\User',5165,'{\"data\":\"Uma solicita\\u00e7\\u00e3o foi emitido para MARCELO DE OLIVEIRA DA SILVA \",\"link\":\"https:\\/\\/www.testerh.com.br\\/tickets\\/frT9FBZR\"}',NULL,'2025-08-28 20:21:37','2025-08-28 20:21:37'),('cf4d4735-c5b0-41cb-a3c4-e0838c0a37f8','App\\Notifications\\TicketCreatedNotification','App\\Models\\User',5169,'{\"data\":\"Uma solicita\\u00e7\\u00e3o foi emitido para MARCELO DE OLIVEIRA DA SILVA \",\"link\":\"http:\\/\\/rhnpmais.com.br\\/tickets\\/eALPLUfr\"}',NULL,'2025-08-27 13:41:22','2025-08-27 13:41:22'),('cf60659a-5b76-416a-ac41-949d1eacce0f','App\\Notifications\\ComplaintFromNotify','App\\Models\\User',109,'{\"data\":\"Testando reclamacao--Sua reclama\\u00e7\\u00e3o contra 107 foi registrada\",\"link\":\"\\/profile#Employee_Complaint\"}',NULL,'2025-03-26 07:59:17','2025-03-26 07:59:17'),('cf7d4b40-9d91-4431-a780-0abe6abd13ae','App\\Notifications\\InvoicePaidNotification','App\\User',16,'{\"data\":\"Test1 has been paid\",\"link\":\"http:\\/\\/peopleprohrm.com\\/demo\\/project-management\\/invoices\\/1\"}','2020-10-12 05:08:12','2020-10-12 05:05:30','2020-10-12 05:08:12'),('cfc2cc88-b0cc-423d-b1c5-100119f6420c','App\\Notifications\\TicketCreatedNotification','App\\Models\\User',5353,'{\"data\":\"Uma solicita\\u00e7\\u00e3o foi emitido para MARCELO DE OLIVEIRA DA SILVA \",\"link\":\"https:\\/\\/www.testerh.com.br\\/tickets\\/M4R7uFan\"}',NULL,'2025-08-27 13:41:45','2025-08-27 13:41:45'),('cfd90a21-c28a-4e5a-b0c7-5c60703c47da','App\\Notifications\\LeaveNotificationToAdmin','App\\User',48,'{\"data\":\"A new leave-notification\",\"link\":\"http:\\/\\/localhost\\/peoplepro\\/timesheet\\/leaves\"}',NULL,'2021-10-04 01:15:59','2021-10-04 01:15:59'),('d025bc1e-a647-4d94-8daa-dfba36e22cfa','App\\Notifications\\TicketCreatedNotification','App\\Models\\User',97,'{\"data\":\"Um bilhete foi emitido para Carlos Robson Silva De Araujo \",\"link\":\"https:\\/\\/testerh.com.br\\/tickets\\/06euXSzq\"}',NULL,'2025-05-02 06:52:32','2025-05-02 06:52:32'),('d0b5259d-71ec-4937-8e6d-50d217491718','App\\Notifications\\TicketAssignedNotification','App\\User',9,'{\"data\":\"2 Employees has been assigned for Bob Hobart ticket\",\"link\":\"http:\\/\\/peopleprohrm.com\\/demo\\/tickets\\/Kkqx8gSB\"}','2021-07-05 15:53:34','2020-07-28 17:05:30','2021-07-05 15:53:34'),('d1c48fa1-d34d-4ef3-a702-6558503c8e97','App\\Notifications\\CompanyPolicyNotify','App\\User',11,'{\"data\":\"Company Policy has been published\",\"link\":\"http:\\/\\/localhost\\/peoplepro\\/organization\\/policy\"}',NULL,'2023-02-01 07:30:21','2023-02-01 07:30:21'),('d1f085ce-f949-4d31-abee-1babd42615e8','App\\Notifications\\LeaveNotificationToAdmin','App\\Models\\User',9,'{\"data\":\"A new leave-notification\",\"link\":\"http:\\/\\/peopleprohrm.test\\/timesheet\\/leaves\"}',NULL,'2023-12-10 05:13:02','2023-12-10 05:13:02'),('d29fed5b-da28-4cfd-a9e7-f5648188a750','App\\Notifications\\LeaveNotificationToAdmin','App\\Models\\User',9,'{\"data\":\"A new leave-notification\",\"link\":\"http:\\/\\/peopleprohrm.test\\/timesheet\\/leaves\"}',NULL,'2023-12-10 05:12:59','2023-12-10 05:12:59'),('d2a916f2-92f4-4a98-9fc5-f6d3a2c1178d','App\\Notifications\\TicketCreatedNotification','App\\Models\\User',5354,'{\"data\":\"Uma solicita\\u00e7\\u00e3o foi emitido para MARCELO DE OLIVEIRA DA SILVA \",\"link\":\"https:\\/\\/www.testerh.com.br\\/tickets\\/frT9FBZR\"}',NULL,'2025-08-28 20:21:37','2025-08-28 20:21:37'),('d2a9da67-9c33-413e-b66b-4fffaca5aa0e','App\\Notifications\\LeaveNotificationToAdmin','App\\Models\\User',9,'{\"data\":\"A new leave-notification\",\"link\":\"http:\\/\\/peopleprohrm.test\\/timesheet\\/leaves\"}',NULL,'2023-12-10 05:13:10','2023-12-10 05:13:10'),('d3618620-305e-4c5e-9413-b3313600d80d','App\\Notifications\\LeaveNotificationToAdmin','App\\Models\\User',9,'{\"data\":\"A new leave-notification\",\"link\":\"http:\\/\\/peopleprohrm.test\\/timesheet\\/leaves\"}',NULL,'2023-12-10 05:13:00','2023-12-10 05:13:00'),('d44ee1a9-2d64-422d-99a6-e023251f29b5','App\\Notifications\\TicketCreatedNotification','App\\Models\\User',97,'{\"data\":\"Um bilhete foi emitido para RebeccaTeste \",\"link\":\"https:\\/\\/testerh.com.br\\/tickets\\/pV5cN7ub\"}',NULL,'2025-05-19 17:38:44','2025-05-19 17:38:44'),('d45ac590-d192-442b-afa3-66117f4bb2ec','App\\Notifications\\InvoiceReceivedNotification','App\\User',16,'{\"data\":\"Invoice of Project : test3 has been received\",\"link\":\"http:\\/\\/peopleprohrm.com\\/demo\\/project-management\\/invoices\\/4\"}',NULL,'2020-10-12 07:28:36','2020-10-12 07:28:36'),('d547f33d-e08c-447c-9db8-129b1f1f82a2','App\\Notifications\\OfficialDocumentExpiryNotifyToAdmin','App\\User',44,'{\"data\":\"A new notification about official document expiry\",\"link\":\"http:\\/\\/localhost\\/file_manager\\/official_documents\"}',NULL,'2021-12-07 13:38:07','2021-12-07 13:38:07'),('d5c8faea-597d-4ca9-82cd-12fddfd796b2','App\\Notifications\\TicketUpdatedNotification','App\\Models\\User',101,'{\"data\":\"Solicita\\u00e7\\u00e3o emitido para GLORIA THIERIS FRAN\\u00c7A LIMA   Tem sido atualizado\",\"link\":\"https:\\/\\/testerh.com.br\\/tickets\\/xIdQaprj\"}',NULL,'2025-08-09 02:48:20','2025-08-09 02:48:20'),('d5d902a9-fd3d-45a7-873c-f56dbe3287b3','App\\Notifications\\EmployeeTerminationNotify','App\\Models\\User',86,'{\"data\":\"Voc\\u00ea foi dispensado desta empresa  Data de finaliza\\u00e7\\u00e3o-- 13-03-2025\",\"link\":\"\"}',NULL,'2025-03-14 09:17:19','2025-03-14 09:17:19'),('d678bab5-47c1-4ff8-8152-2c92ad954858','App\\Notifications\\LeaveNotificationToAdmin','App\\User',40,'{\"data\":\"A new leave-notification\",\"link\":\"http:\\/\\/localhost\\/peoplepro\\/timesheet\\/leaves\"}',NULL,'2021-10-04 01:22:12','2021-10-04 01:22:12'),('d69e4610-2282-4cab-892d-ab9a8ec12377','App\\Notifications\\LeaveNotificationToAdmin','App\\User',36,'{\"data\":\"A new leave-notification\",\"link\":\"http:\\/\\/localhost\\/peoplepro\\/timesheet\\/leaves\"}',NULL,'2021-10-04 04:09:05','2021-10-04 04:09:05'),('d6a6f465-5c60-4b89-b0be-bf4ba3201e31','App\\Notifications\\TicketCreatedNotification','App\\Models\\User',5165,'{\"data\":\"Uma solicita\\u00e7\\u00e3o foi emitido para MARCELO DE OLIVEIRA DA SILVA \",\"link\":\"https:\\/\\/testerh.com.br\\/tickets\\/5Tb0bt8E\"}',NULL,'2025-08-12 19:54:31','2025-08-12 19:54:31'),('d6bb80f0-8168-429c-ab79-e26e0bfd8d20','App\\Notifications\\LeaveNotificationToAdmin','App\\User',44,'{\"data\":\"A new leave-notification\",\"link\":\"http:\\/\\/localhost\\/peoplepro\\/timesheet\\/leaves\"}',NULL,'2021-10-04 01:22:12','2021-10-04 01:22:12'),('d6c06da9-cde1-492b-8a6c-7d37f7619039','App\\Notifications\\LeaveNotificationToAdmin','App\\Models\\User',1,'{\"data\":\"A new leave-notification\",\"link\":\"http:\\/\\/peopleprohrm.test\\/timesheet\\/leaves\"}','2024-01-16 03:22:08','2023-12-10 05:13:03','2024-01-16 03:22:08'),('d76ae7ee-1e64-4b07-8ccb-41a7e39ea366','App\\Notifications\\TicketUpdatedNotification','App\\Models\\User',5355,'{\"data\":\"Solicita\\u00e7\\u00e3o emitido para MARCELO DE OLIVEIRA DA SILVA  Tem sido atualizado\",\"link\":\"https:\\/\\/www.testerh.com.br\\/tickets\\/frT9FBZR\"}',NULL,'2025-08-28 20:28:03','2025-08-28 20:28:03'),('d8492db5-f4d6-4409-8c0b-d004830498ba','App\\Notifications\\TicketCreatedNotification','App\\Models\\User',180,'{\"data\":\"Um bilhete foi emitido para RebeccaTeste \",\"link\":\"https:\\/\\/testerh.com.br\\/tickets\\/pV5cN7ub\"}',NULL,'2025-05-19 17:38:44','2025-05-19 17:38:44'),('d9dbf1fb-d92c-47e6-8c8d-f11754d97f48','App\\Notifications\\TicketCreatedNotification','App\\Models\\User',5168,'{\"data\":\"Uma solicita\\u00e7\\u00e3o foi emitido para MARCELO DE OLIVEIRA DA SILVA \",\"link\":\"https:\\/\\/www.testerh.com.br\\/tickets\\/M4R7uFan\"}',NULL,'2025-08-27 13:41:45','2025-08-27 13:41:45'),('d9f5fe40-4172-4f8f-8b11-628c7380fe88','App\\Notifications\\TicketCreatedNotification','App\\Models\\User',5171,'{\"data\":\"Uma solicita\\u00e7\\u00e3o foi emitido para MARCELO DE OLIVEIRA DA SILVA \",\"link\":\"http:\\/\\/rhnpmais.com.br\\/tickets\\/mzHPUOjR\"}',NULL,'2025-08-27 13:41:21','2025-08-27 13:41:21'),('dae8114f-054f-4283-85f9-50cd017f16c3','App\\Notifications\\LeaveNotification','App\\User',9,'{\"data\":\"A new leave-notification has been published\",\"link\":\"http:\\/\\/localhost\\/peoplepro\\/profile#Leave\"}','2023-02-01 07:30:48','2023-01-22 13:08:58','2023-02-01 07:30:48'),('db061f20-f0e3-44aa-bc2d-391a1a93d107','App\\Notifications\\LeaveNotificationToAdmin','App\\Models\\User',125,'{\"data\":\"A new leave-notification\",\"link\":\"https:\\/\\/www.testerh.com.br\\/timesheet\\/leaves\"}',NULL,'2025-06-11 02:47:48','2025-06-11 02:47:48'),('db3fe78e-ae71-41bd-8922-f485b5a788c7','App\\Notifications\\LeaveNotificationToAdmin','App\\User',44,'{\"data\":\"A new leave-notification\",\"link\":\"http:\\/\\/localhost\\/peoplepro\\/timesheet\\/leaves\"}',NULL,'2021-10-04 04:09:05','2021-10-04 04:09:05'),('dc742fb8-d1dd-4825-89f7-446dabab1cf0','App\\Notifications\\LeaveNotificationToAdmin','App\\User',48,'{\"data\":\"A new leave-notification\",\"link\":\"http:\\/\\/localhost\\/peoplepro\\/timesheet\\/leaves\"}',NULL,'2021-10-04 04:09:05','2021-10-04 04:09:05'),('dd7d8a82-9530-421b-9851-2d32080d6641','App\\Notifications\\InterviewHostNotification','App\\Models\\User',9,'{\"data\":\"You have been selected as an interview host\\nInterview Title: Laravel Developer\\nInterview Date & Time: 18-11-2023|03:00PM\\nPlease set a reminder.\",\"link\":\"\"}',NULL,'2023-11-15 17:24:40','2023-11-15 17:24:40'),('df64db6e-f279-4707-b598-5159bf470b0c','App\\Notifications\\TicketCreatedNotification','App\\Models\\User',5165,'{\"data\":\"Uma solicita\\u00e7\\u00e3o foi emitido para MARCELO DE OLIVEIRA DA SILVA \",\"link\":\"https:\\/\\/www.testerh.com.br\\/tickets\\/M4R7uFan\"}',NULL,'2025-08-27 13:41:44','2025-08-27 13:41:44'),('df6f393b-8e7a-4c2b-8adb-8bb6aa48a4da','App\\Notifications\\ComplainAgainstNotify','App\\Models\\User',104,'{\"data\":\"teste--Uma reclama\\u00e7\\u00e3o foi apresentada contra voc\\u00ea por 105\",\"link\":\"ex\\/profile#Employee_Complaint\"}',NULL,'2025-03-25 08:21:11','2025-03-25 08:21:11'),('e13ca350-d4c4-4d3b-9388-b531f1fc641f','App\\Notifications\\LeaveNotificationToAdmin','App\\Models\\User',9,'{\"data\":\"A new leave-notification\",\"link\":\"http:\\/\\/peopleprohrm.test\\/timesheet\\/leaves\"}',NULL,'2023-12-10 05:48:20','2023-12-10 05:48:20'),('e1efd771-c8d7-407e-b853-6c6cff2b39c2','App\\Notifications\\InterviewHostNotification','App\\Models\\User',11,'{\"data\":\"You have been selected as an interview host\\nInterview Title: Laravel Developer\\nInterview Date & Time: 17-11-2023|03:00PM\\nPlease set a reminder.\",\"link\":\"\"}',NULL,'2023-11-15 09:40:32','2023-11-15 09:40:32'),('e1f793a3-1ed5-468a-a9dd-9d2e0ce3f960','App\\Notifications\\EmployeeTerminationNotify','App\\User',40,'{\"data\":\"You have been terminated from this company  Termination Date-- 16-12-2021\",\"link\":\"\"}',NULL,'2021-12-15 06:06:11','2021-12-15 06:06:11'),('e2e65835-cf70-42c8-9d53-c505f81bb347','App\\Notifications\\LeaveNotificationToAdmin','App\\Models\\User',9,'{\"data\":\"A new leave-notification\",\"link\":\"http:\\/\\/peopleprohrm.test\\/timesheet\\/leaves\"}',NULL,'2023-12-10 06:27:17','2023-12-10 06:27:17'),('e31d9ddc-b7e6-439d-bc31-bdb8d7ca100b','App\\Notifications\\LeaveNotificationToAdmin','App\\Models\\User',1,'{\"data\":\"A new leave-notification\",\"link\":\"http:\\/\\/peopleprohrm.test\\/timesheet\\/leaves\"}','2024-01-16 03:22:08','2023-12-10 05:13:00','2024-01-16 03:22:08'),('e3b8524c-573e-4b8e-9465-7789189c5224','App\\Notifications\\EmployeePromotion','App\\User',9,'{\"data\":\" Congratulation!You have been promoted to  Senior Executive 1\",\"link\":\"\"}','2021-07-05 15:53:34','2020-08-18 06:45:52','2021-07-05 15:53:34'),('e48ec231-4e62-423f-ac5f-e17822745846','App\\Notifications\\TicketCreatedNotification','App\\Models\\User',5167,'{\"data\":\"Uma solicita\\u00e7\\u00e3o foi emitido para MARCELO DE OLIVEIRA DA SILVA \",\"link\":\"https:\\/\\/www.testerh.com.br\\/tickets\\/M4R7uFan\"}',NULL,'2025-08-27 13:41:45','2025-08-27 13:41:45'),('e4c5caf5-e81d-434f-a3a6-da957e73421b','App\\Notifications\\TicketCreatedNotification','App\\Models\\User',1,'{\"data\":\"Um bilhete foi emitido para RebeccaTeste \",\"link\":\"https:\\/\\/testerh.com.br\\/tickets\\/bYYHUDWe\"}','2025-05-22 21:16:25','2025-05-21 02:09:51','2025-05-22 21:16:25'),('e55921ed-dd1a-4c4e-8135-740d58257ce0','App\\Notifications\\ComplaintFromNotify','App\\Models\\User',5182,'{\"data\":\"relat\\u00f3rio de desempenho da Funcion\\u00e1ria--Sua reclama\\u00e7\\u00e3o contra 127 foi registrada\",\"link\":\"\\/profile#Employee_Complaint\"}',NULL,'2025-08-19 19:12:54','2025-08-19 19:12:54'),('e5bcedba-c599-4b37-b64d-3999e637ef07','App\\Notifications\\LeaveNotification','App\\User',9,'{\"data\":\"A new leave-notification has been published\",\"link\":\"http:\\/\\/localhost\\/peoplepro\\/profile#Leave\"}','2023-02-01 07:30:48','2023-01-22 13:05:34','2023-02-01 07:30:48'),('e64200a7-67c7-4a50-afa2-d85a611f94e4','App\\Notifications\\LeaveNotificationToAdmin','App\\Models\\User',9,'{\"data\":\"A new leave-notification\",\"link\":\"http:\\/\\/peopleprohrm.test\\/timesheet\\/leaves\"}',NULL,'2023-12-10 05:47:31','2023-12-10 05:47:31'),('e78d2fdb-d20d-4406-a648-c346ebad3276','App\\Notifications\\TicketCreatedNotification','App\\Models\\User',5167,'{\"data\":\"Uma solicita\\u00e7\\u00e3o foi emitido para LETICIA MACIEL AVELINO  \",\"link\":\"https:\\/\\/www.rhnpmais.com.br\\/tickets\\/RKE5amcW\"}',NULL,'2025-09-01 15:35:12','2025-09-01 15:35:12'),('e7ddeccb-8896-401b-b275-757049613204','App\\Notifications\\TicketCreatedNotification','App\\Models\\User',107,'{\"data\":\"Um bilhete foi emitido para Carlos Robson Silva De Araujo \",\"link\":\"https:\\/\\/testerh.com.br\\/tickets\\/06euXSzq\"}',NULL,'2025-05-02 06:52:32','2025-05-02 06:52:32'),('e7faff2c-21f2-49a4-917a-b7c4f0c41b85','App\\Notifications\\EmployeeTransferNotify','App\\User',9,'{\"data\":\"You have been transferred To\",\"link\":\"http:\\/\\/peopleprohrm.com\\/demo\\/profile#Employee_transfer\"}','2021-07-05 15:53:34','2020-08-18 07:44:56','2021-07-05 15:53:34'),('e8002910-7efe-45b1-8a4c-8fa70e586dbb','App\\Notifications\\TicketCreatedNotification','App\\Models\\User',180,'{\"data\":\"Um bilhete foi emitido para RebeccaTeste \",\"link\":\"https:\\/\\/testerh.com.br\\/tickets\\/omDo2MYk\"}',NULL,'2025-06-11 01:13:21','2025-06-11 01:13:21'),('e82fc7b5-2ab7-4799-af55-204684deb53f','App\\Notifications\\ProjectUpdatedNotification','App\\User',8,'{\"data\":\"test3 has been updated\",\"link\":\"http:\\/\\/peopleprohrm.com\\/demo\\/project-management\\/projects\\/3\"}',NULL,'2020-10-25 17:16:16','2020-10-25 17:16:16'),('e87c99c0-81ce-4aa8-9922-f99fb463ea2f','App\\Notifications\\LeaveNotificationToAdmin','App\\Models\\User',122,'{\"data\":\"A new leave-notification\",\"link\":\"https:\\/\\/www.testerh.com.br\\/timesheet\\/leaves\"}','2025-08-06 14:42:50','2025-06-11 02:47:48','2025-08-06 14:42:50'),('e8ef14ff-2fe5-4d4d-84f7-17ff19f83dc6','App\\Notifications\\LeaveNotificationToAdmin','App\\Models\\User',9,'{\"data\":\"A new leave-notification\",\"link\":\"http:\\/\\/peopleprohrm.test\\/timesheet\\/leaves\"}',NULL,'2023-12-10 05:13:03','2023-12-10 05:13:03'),('e9510f77-7e7e-43e7-aa6d-c6ca3799817c','App\\Notifications\\TicketCreatedNotification','App\\Models\\User',5353,'{\"data\":\"Uma solicita\\u00e7\\u00e3o foi emitido para MARCELO DE OLIVEIRA DA SILVA \",\"link\":\"http:\\/\\/rhnpmais.com.br\\/tickets\\/oHDPMiJS\"}',NULL,'2025-08-27 13:38:39','2025-08-27 13:38:39'),('eac4e6ff-a002-488d-83dd-a44128ab8be7','App\\Notifications\\LeaveNotificationToAdmin','App\\Models\\User',9,'{\"data\":\"A new leave-notification\",\"link\":\"http:\\/\\/peopleprohrm.test\\/timesheet\\/leaves\"}',NULL,'2023-12-10 05:13:00','2023-12-10 05:13:00'),('eb39757d-ea53-4cb1-bfb4-126dd2c044a9','App\\Notifications\\LeaveNotificationToAdmin','App\\Models\\User',1,'{\"data\":\"A new leave-notification\",\"link\":\"http:\\/\\/peopleprohrm.test\\/timesheet\\/leaves\"}','2024-01-16 03:22:08','2023-12-10 05:13:01','2024-01-16 03:22:08'),('ec2836ae-1de2-48ce-aa3d-d5ef1f9cb193','App\\Notifications\\TicketUpdatedNotification','App\\Models\\User',5181,'{\"data\":\"Solicita\\u00e7\\u00e3o emitido para MARCELO DE OLIVEIRA DA SILVA  Tem sido atualizado\",\"link\":\"https:\\/\\/www.testerh.com.br\\/tickets\\/frT9FBZR\"}',NULL,'2025-08-28 20:28:03','2025-08-28 20:28:03'),('ec32bc86-7300-4509-b28a-1b91e2e99711','App\\Notifications\\ProjectUpdatedNotification','App\\User',8,'{\"data\":\"test3 has been updated\",\"link\":\"http:\\/\\/peopleprohrm.com\\/demo\\/project-management\\/projects\\/3\"}',NULL,'2020-10-25 17:14:23','2020-10-25 17:14:23'),('ec517324-8a08-46cd-8bcc-e381809474b5','App\\Notifications\\ClientTaskCreated','App\\User',1,'{\"data\":\"new2222 has been updated by a client named maria_g\",\"link\":\"http:\\/\\/peopleprohrm.com\\/demo\\/project-management\\/tasks\\/6\"}','2021-06-17 03:14:26','2020-10-12 02:00:20','2021-06-17 03:14:26'),('ecc3dc35-43c0-4f70-9704-c6abf6300464','App\\Notifications\\ProjectUpdatedNotification','App\\User',1,'{\"data\":\"Test2 has been updated\",\"link\":\"http:\\/\\/peopleprohrm.com\\/demo\\/project-management\\/projects\\/2\"}','2021-06-17 03:14:26','2020-10-25 17:12:46','2021-06-17 03:14:26'),('ed5e044a-30b4-434d-b88b-4fce4f03bc43','App\\Notifications\\CompanyPolicyNotify','App\\User',27,'{\"data\":\"Company Policy has been published\",\"link\":\"http:\\/\\/localhost\\/peoplepro\\/organization\\/policy\"}',NULL,'2023-02-01 07:30:21','2023-02-01 07:30:21'),('ed8a63b0-3c36-4acc-9235-ec3636a11b95','App\\Notifications\\LeaveNotificationToAdmin','App\\Models\\User',1,'{\"data\":\"A new leave-notification\",\"link\":\"http:\\/\\/peopleprohrm.test\\/timesheet\\/leaves\"}','2024-01-16 03:22:08','2023-12-10 06:27:17','2024-01-16 03:22:08'),('ed994f46-e157-4ed1-8a8a-1f15120c7845','App\\Notifications\\TicketAssignedNotification','App\\User',1,'{\"data\":\"2 Employees has been assigned for Bob Hobart ticket\",\"link\":\"http:\\/\\/peopleprohrm.com\\/demo\\/tickets\\/Kkqx8gSB\"}','2020-07-28 17:05:45','2020-07-28 17:05:30','2020-07-28 17:05:45'),('ee103974-8f7c-4054-b2bb-d26961d15b0b','App\\Notifications\\OfficialDocumentExpiryNotifyToAdmin','App\\User',47,'{\"data\":\"A new notification about official document expiry\",\"link\":\"http:\\/\\/localhost\\/file_manager\\/official_documents\"}',NULL,'2021-12-07 13:38:07','2021-12-07 13:38:07'),('eec61a4c-5746-4f57-8a8b-13ca901a48d3','App\\Notifications\\TicketCreatedNotification','App\\Models\\User',5163,'{\"data\":\"Uma solicita\\u00e7\\u00e3o foi emitido para MARCELO DE OLIVEIRA DA SILVA \",\"link\":\"https:\\/\\/www.testerh.com.br\\/tickets\\/M4R7uFan\"}',NULL,'2025-08-27 13:41:44','2025-08-27 13:41:44'),('ef653d39-343e-4af3-99b5-9c2d9c94941f','App\\Notifications\\LeaveNotificationToAdmin','App\\Models\\User',1,'{\"data\":\"A new leave-notification\",\"link\":\"http:\\/\\/peopleprohrm.test\\/timesheet\\/leaves\"}','2024-01-16 03:22:08','2023-12-10 05:13:11','2024-01-16 03:22:08'),('efe59846-7051-407f-9db0-f52d065a2c29','App\\Notifications\\LeaveNotificationToAdmin','App\\Models\\User',1,'{\"data\":\"A new leave-notification\",\"link\":\"http:\\/\\/peopleprohrm.test\\/timesheet\\/leaves\"}','2024-01-16 03:22:08','2023-12-10 05:44:35','2024-01-16 03:22:08'),('f12de395-9a7c-41a8-a371-17d3b7695108','App\\Notifications\\TicketCreatedNotification','App\\Models\\User',5160,'{\"data\":\"Uma solicita\\u00e7\\u00e3o foi emitido para MARCELO DE OLIVEIRA DA SILVA \",\"link\":\"https:\\/\\/www.testerh.com.br\\/tickets\\/M4R7uFan\"}',NULL,'2025-08-27 13:41:44','2025-08-27 13:41:44'),('f1b63956-f95d-4f80-a056-fef67ca0c6a8','App\\Notifications\\ComplainAgainstNotify','App\\Models\\User',184,'{\"data\":\"jovem aprendiz--Uma reclama\\u00e7\\u00e3o foi apresentada contra voc\\u00ea por 111\",\"link\":\"ex\\/profile#Employee_Complaint\"}',NULL,'2025-08-18 19:20:03','2025-08-18 19:20:03'),('f309c646-fbdd-47b2-8d4a-e210b3fe57d6','App\\Notifications\\TicketCreatedNotification','App\\Models\\User',5168,'{\"data\":\"Uma solicita\\u00e7\\u00e3o foi emitido para MARCELO DE OLIVEIRA DA SILVA \",\"link\":\"https:\\/\\/www.testerh.com.br\\/tickets\\/frT9FBZR\"}',NULL,'2025-08-28 20:21:37','2025-08-28 20:21:37'),('f35ee30c-7e14-4c60-a1df-d181ee8726c4','App\\Notifications\\TicketCreatedNotification','App\\Models\\User',1,'{\"data\":\"Uma solicita\\u00e7\\u00e3o foi emitido para MARCELO DE OLIVEIRA DA SILVA \",\"link\":\"http:\\/\\/rhnpmais.com.br\\/tickets\\/oHDPMiJS\"}',NULL,'2025-08-27 13:38:39','2025-08-27 13:38:39'),('f3916735-e04a-45d5-804e-2b6dce15434e','App\\Notifications\\LeaveNotificationToAdmin','App\\Models\\User',113,'{\"data\":\"A new leave-notification\",\"link\":\"https:\\/\\/www.testerh.com.br\\/timesheet\\/leaves\"}',NULL,'2025-06-11 02:47:48','2025-06-11 02:47:48'),('f3e175d4-7635-430e-8021-bf3dfdd34560','App\\Notifications\\TicketCreatedNotification','App\\Models\\User',5166,'{\"data\":\"Uma solicita\\u00e7\\u00e3o foi emitido para MARCELO DE OLIVEIRA DA SILVA \",\"link\":\"http:\\/\\/rhnpmais.com.br\\/tickets\\/oHDPMiJS\"}',NULL,'2025-08-27 13:38:39','2025-08-27 13:38:39'),('f4e9fe25-dad1-44a7-8812-d065639d2e42','App\\Notifications\\OfficialDocumentExpiryNotifyToAdmin','App\\User',31,'{\"data\":\"A new notification about official document expiry\",\"link\":\"http:\\/\\/localhost\\/file_manager\\/official_documents\"}',NULL,'2021-12-07 13:38:07','2021-12-07 13:38:07'),('f54ec51a-eef0-4b8d-9441-bd65c02e744a','App\\Notifications\\TicketCreatedNotification','App\\Models\\User',5166,'{\"data\":\"Uma solicita\\u00e7\\u00e3o foi emitido para MARCELO DE OLIVEIRA DA SILVA \",\"link\":\"https:\\/\\/www.testerh.com.br\\/tickets\\/M4R7uFan\"}',NULL,'2025-08-27 13:41:45','2025-08-27 13:41:45'),('f5a68bdd-6431-42cf-8baa-5b166146c290','App\\Notifications\\LeaveNotificationToAdmin','App\\Models\\User',1,'{\"data\":\"A new leave-notification\",\"link\":\"http:\\/\\/peopleprohrm.test\\/timesheet\\/leaves\"}','2024-01-16 03:22:08','2023-12-10 05:13:00','2024-01-16 03:22:08'),('f5bca5b5-9c10-4222-a977-85e2b83aed64','App\\Notifications\\InterviewHostNotification','App\\Models\\User',9,'{\"data\":\"You have been selected as an interview host\\nInterview Title: Laravel Developer\\nInterview Date & Time: 16-11-2023|03:00PM\\nPlease set a reminder.\",\"link\":\"\"}',NULL,'2023-11-15 17:14:29','2023-11-15 17:14:29'),('f5d5c284-1526-4ec5-aa8d-f686edbe4d2e','App\\Notifications\\TicketCreatedNotification','App\\Models\\User',5355,'{\"data\":\"Uma solicita\\u00e7\\u00e3o foi emitido para MARCELO DE OLIVEIRA DA SILVA \",\"link\":\"http:\\/\\/rhnpmais.com.br\\/tickets\\/mzHPUOjR\"}',NULL,'2025-08-27 13:41:21','2025-08-27 13:41:21'),('f5f135f0-ea07-433a-9b95-c527f0df2a13','App\\Notifications\\LeaveNotificationToAdmin','App\\Models\\User',108,'{\"data\":\"A new leave-notification\",\"link\":\"https:\\/\\/www.testerh.com.br\\/timesheet\\/leaves\"}',NULL,'2025-06-11 02:47:48','2025-06-11 02:47:48'),('f69f0707-2803-4c0e-8d30-134272ac9637','App\\Notifications\\LeaveNotificationToAdmin','App\\User',40,'{\"data\":\"A new leave-notification\",\"link\":\"http:\\/\\/localhost\\/peoplepro\\/timesheet\\/leaves\"}',NULL,'2021-10-04 04:08:52','2021-10-04 04:08:52'),('f6b8fafd-1e8e-4519-b7ea-c0eb8d894f0c','App\\Notifications\\LeaveNotificationToAdmin','App\\User',47,'{\"data\":\"A new leave-notification\",\"link\":\"http:\\/\\/localhost\\/peoplepro\\/timesheet\\/leaves\"}',NULL,'2021-10-04 01:22:12','2021-10-04 01:22:12'),('f6f34a1a-bb5f-4e44-b0ce-5f1e389e84f1','App\\Notifications\\LeaveNotificationToAdmin','App\\User',46,'{\"data\":\"A new leave-notification\",\"link\":\"http:\\/\\/localhost\\/peoplepro\\/timesheet\\/leaves\"}',NULL,'2021-10-04 01:16:18','2021-10-04 01:16:18'),('f746d414-0eda-4377-9592-8f118906c841','App\\Notifications\\LeaveNotificationToAdmin','App\\Models\\User',9,'{\"data\":\"A new leave-notification\",\"link\":\"http:\\/\\/peopleprohrm.test\\/timesheet\\/leaves\"}',NULL,'2023-12-10 05:13:10','2023-12-10 05:13:10'),('f7b7f0bc-87c5-47de-815c-0da9d6912884','App\\Notifications\\ProjectUpdatedNotification','App\\User',1,'{\"data\":\"Test1 has been updated\",\"link\":\"http:\\/\\/peopleprohrm.com\\/demo\\/project-management\\/projects\\/1\"}','2021-06-17 03:14:26','2020-10-18 11:21:13','2021-06-17 03:14:26'),('f86d68e0-1f30-4149-820a-be970a73f920','App\\Notifications\\LeaveNotification','App\\User',11,'{\"data\":\"A new leave-notification has been published\",\"link\":\"http:\\/\\/localhost\\/peoplepro\\/profile#Leave\"}',NULL,'2023-01-22 13:31:00','2023-01-22 13:31:00'),('f9d1b131-58ba-45d6-90a0-1798448512ae','App\\Notifications\\ComplainAgainstNotify','App\\Models\\User',109,'{\"data\":\"23213sqwq--Uma reclama\\u00e7\\u00e3o foi apresentada contra voc\\u00ea por 107\",\"link\":\"ex\\/profile#Employee_Complaint\"}',NULL,'2025-03-26 08:01:26','2025-03-26 08:01:26'),('f9e97bdd-e9d2-4238-b4e1-c63ed7a87c9c','App\\Notifications\\TicketUpdatedNotification','App\\Models\\User',5165,'{\"data\":\"Solicita\\u00e7\\u00e3o emitido para MARCELO DE OLIVEIRA DA SILVA  Tem sido atualizado\",\"link\":\"https:\\/\\/www.testerh.com.br\\/tickets\\/frT9FBZR\"}',NULL,'2025-08-28 20:28:03','2025-08-28 20:28:03'),('fa1c5825-43e9-4ee9-a48d-792f43b0d79d','App\\Notifications\\TicketUpdatedNotification','App\\User',12,'{\"data\":\"Issued ticket for Bob Hobart has been updated\",\"link\":\"http:\\/\\/peopleprohrm.com\\/demo\\/tickets\\/Kkqx8gSB\"}',NULL,'2020-07-28 17:06:02','2020-07-28 17:06:02'),('fafa293c-59d1-4a5e-8543-bc5c68f6bc07','App\\Notifications\\LeaveNotificationToAdmin','App\\Models\\User',51,'{\"data\":\"A new leave-notification\",\"link\":\"http:\\/\\/peopleprohrm.test\\/timesheet\\/leaves\"}',NULL,'2023-12-10 05:48:20','2023-12-10 05:48:20'),('fb29ecc1-31c9-4399-91bd-045910288a95','App\\Notifications\\ComplainAgainstNotify','App\\Models\\User',3118,'{\"data\":\"relat\\u00f3rio de desempenho da Funcion\\u00e1ria--Uma reclama\\u00e7\\u00e3o foi apresentada contra voc\\u00ea por 5183\",\"link\":\"ex\\/profile#Employee_Complaint\"}',NULL,'2025-08-19 19:38:52','2025-08-19 19:38:52'),('fb519d4e-7ebb-424f-b96d-d1dafb521268','App\\Notifications\\TicketCreatedNotification','App\\Models\\User',5355,'{\"data\":\"Uma solicita\\u00e7\\u00e3o foi emitido para MARCELO DE OLIVEIRA DA SILVA \",\"link\":\"https:\\/\\/www.testerh.com.br\\/tickets\\/M4R7uFan\"}',NULL,'2025-08-27 13:41:45','2025-08-27 13:41:45'),('fbcbaf5f-e594-4365-9dd2-86ec0a99f453','App\\Notifications\\ComplaintFromNotify','App\\Models\\User',111,'{\"data\":\"teste--Sua reclama\\u00e7\\u00e3o contra 316 foi registrada\",\"link\":\"\\/profile#Employee_Complaint\"}',NULL,'2025-08-12 12:15:29','2025-08-12 12:15:29'),('fc1b814d-a506-4217-b293-f48771b0b912','App\\Notifications\\TicketUpdatedNotification','App\\Models\\User',5169,'{\"data\":\"Solicita\\u00e7\\u00e3o emitido para MARCELO DE OLIVEIRA DA SILVA  Tem sido atualizado\",\"link\":\"https:\\/\\/www.testerh.com.br\\/tickets\\/frT9FBZR\"}',NULL,'2025-08-28 20:28:03','2025-08-28 20:28:03'),('fc357a40-ae27-4527-a58d-ff76767d94b7','App\\Notifications\\LeaveNotificationToAdmin','App\\Models\\User',51,'{\"data\":\"A new leave-notification\",\"link\":\"http:\\/\\/peopleprohrm.test\\/timesheet\\/leaves\"}',NULL,'2023-12-10 06:17:21','2023-12-10 06:17:21'),('fd8f2436-1abb-4d71-af1a-b8b104891862','App\\Notifications\\OfficialDocumentExpiryNotifyToAdmin','App\\User',47,'{\"data\":\"A new notification about official document expiry\",\"link\":\"http:\\/\\/localhost\\/file_manager\\/official_documents\"}',NULL,'2021-12-07 13:38:23','2021-12-07 13:38:23'),('fdc839a9-6f17-4d2a-98c3-f06238d0aa11','App\\Notifications\\ComplaintFromNotify','App\\Models\\User',61,'{\"data\":\"teste--Sua reclama\\u00e7\\u00e3o contra 61 foi registrada\",\"link\":\"\\/profile#Employee_Complaint\"}',NULL,'2025-03-23 10:20:15','2025-03-23 10:20:15'),('fddcacf7-2aa7-46e6-bb8a-f5afc134e82d','App\\Notifications\\LeaveNotificationToAdmin','App\\Models\\User',1,'{\"data\":\"A new leave-notification\",\"link\":\"http:\\/\\/peopleprohrm.test\\/timesheet\\/leaves\"}','2024-01-16 03:22:08','2023-12-10 06:28:53','2024-01-16 03:22:08'),('fea68d3b-bf7b-452f-b3de-d41d30a787ec','App\\Notifications\\TicketCreatedNotification','App\\User',8,'{\"data\":\"A ticket has been issued for Bob Hobart\",\"link\":\"http:\\/\\/peopleprohrm.com\\/demo\\/tickets\\/Kkqx8gSB\"}',NULL,'2020-07-28 16:59:09','2020-07-28 16:59:09'),('fea88b58-5878-4f9b-925d-d407d95d8672','App\\Notifications\\LeaveNotificationToAdmin','App\\Models\\User',9,'{\"data\":\"A new leave-notification\",\"link\":\"http:\\/\\/peopleprohrm.test\\/timesheet\\/leaves\"}',NULL,'2023-12-10 06:21:35','2023-12-10 06:21:35'),('fee607b8-9899-441a-8860-4f71714092b7','App\\Notifications\\TicketCreatedNotification','App\\Models\\User',180,'{\"data\":\"Um bilhete foi emitido para RebeccaTeste \",\"link\":\"https:\\/\\/testerh.com.br\\/tickets\\/bYYHUDWe\"}',NULL,'2025-05-21 02:09:51','2025-05-21 02:09:51'),('ff3380a7-4842-4350-a608-5edf9f140fe2','App\\Notifications\\TicketCreatedNotification','App\\Models\\User',5167,'{\"data\":\"Uma solicita\\u00e7\\u00e3o foi emitido para MARCELO DE OLIVEIRA DA SILVA \",\"link\":\"https:\\/\\/www.testerh.com.br\\/tickets\\/frT9FBZR\"}',NULL,'2025-08-28 20:21:37','2025-08-28 20:21:37'),('ffdfe8cd-e146-4ce5-844b-87e6a641e4ad','App\\Notifications\\LeaveNotificationToAdmin','App\\Models\\User',51,'{\"data\":\"A new leave-notification\",\"link\":\"http:\\/\\/peopleprohrm.test\\/timesheet\\/leaves\"}',NULL,'2023-12-10 05:49:41','2023-12-10 05:49:41');
/*!40000 ALTER TABLE `notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `office_shifts`
--

DROP TABLE IF EXISTS `office_shifts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `office_shifts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `shift_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `default_shift` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_id` bigint unsigned NOT NULL,
  `sunday_in` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sunday_out` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `saturday_in` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `saturday_out` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `friday_in` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `friday_out` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `thursday_in` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `thursday_out` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `wednesday_in` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `wednesday_out` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tuesday_in` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tuesday_out` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `monday_in` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `monday_out` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `monday_break_in` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `monday_break_out` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tuesday_break_in` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tuesday_break_out` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `wednesday_break_in` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `wednesdat_break_out` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `thursday_break_in` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `thursday_break_out` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `friday_break_in` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `friday_break_out` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `saturday_break_in` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `saturday_break_out` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `office_shifts_company_id_foreign` (`company_id`),
  CONSTRAINT `office_shifts_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `office_shifts`
--

LOCK TABLES `office_shifts` WRITE;
/*!40000 ALTER TABLE `office_shifts` DISABLE KEYS */;
INSERT INTO `office_shifts` VALUES (1,'Morning Shift',NULL,1,'09:00AM','05:00PM','09:00AM','05:00PM','','','09:00AM','05:00PM','09:00AM','05:00PM','09:00AM','05:00PM','09:00AM','05:00PM','2020-07-27 04:06:46','2022-09-14 06:19:29',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(2,'MidDay',NULL,1,'','','04:00PM','09:00PM','12:00PM','09:00PM','12:00PM','09:00PM','','','12:00PM','09:00PM','12:00PM','09:00PM','2020-07-27 04:22:37','2021-06-30 00:20:24',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(3,'Turno JWC',NULL,10,'','','08:00PM','12:00PM','07:00AM','05:00PM','07:00PM','05:30PM','07:00AM','05:30PM','07:00AM','05:30PM','07:00AM','05:30PM','2024-12-30 14:55:39','2024-12-30 14:55:39',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(4,'SUATS SOLUÇÕES',NULL,1,'00:00AM','0000PM','08:00AM','12:00PM','07:00AM','12:00PM','07:00AM','12:00PM','07:00AM','12:00PM','07:00AM','12:00PM','07:00AM','12:00PM','2025-04-02 18:35:34','2025-04-02 18:35:34',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(5,'TURNO ISAO CONTABILIDADE',NULL,12,'08:00AM','12:00PM','08:00AM','12:00PM','07:00AM','12:00PM','07:00AM','12:00PM','07:00AM','12:00PM','07:00AM','12:00PM','07:00AM','12:00PM','2025-04-21 18:14:43','2025-04-21 18:14:43',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(6,'SUATS - AGENTE DE PORTARIA',NULL,1,'18:00PM','23:00PM','18:00PM','23:00PM','18:00PM','23:00PM','18:00PM','23:00PM','18:00PM','23:00PM','18:00PM','23:00PM','18:00PM','23:00PM','2025-04-29 18:40:11','2025-04-29 18:40:11',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `office_shifts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `official_documents`
--

DROP TABLE IF EXISTS `official_documents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `official_documents` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `company_id` bigint unsigned DEFAULT NULL,
  `document_type_id` bigint unsigned DEFAULT NULL,
  `added_by` bigint unsigned DEFAULT NULL,
  `document_title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `identification_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` mediumtext COLLATE utf8mb4_unicode_ci,
  `document_file` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `expiry_date` date NOT NULL,
  `is_notify` tinyint DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `official_documents_company_id_foreign` (`company_id`),
  KEY `official_documents_document_type_id_foreign` (`document_type_id`),
  KEY `official_documents_added_by_foreign` (`added_by`),
  CONSTRAINT `official_documents_added_by_foreign` FOREIGN KEY (`added_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `official_documents_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `official_documents_document_type_id_foreign` FOREIGN KEY (`document_type_id`) REFERENCES `document_types` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `official_documents`
--

LOCK TABLES `official_documents` WRITE;
/*!40000 ALTER TABLE `official_documents` DISABLE KEYS */;
/*!40000 ALTER TABLE `official_documents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
INSERT INTO `password_resets` VALUES ('new@gmail.com','$2y$10$day4AQ4g8sFvMwhMrTxpJuLXZCpVF2IK9kVS.6qZxeR6b7CVt2eGy','2020-10-06 04:22:35'),('irfanchowdhury80@gmail.com','$2y$10$3Opuz3k6NY0WRJbDgHO8gOz2UlR4GOumTVsQgu61.mPbmzt8DnYi6','2024-01-14 08:13:48'),('irfanchowdhury434@gmail.com','$2y$10$Xzahp1UflMrb3lzE/C9lQeGQ0z.E9UoA.1XjW7KRLIuuwTGdfp.NS','2024-03-31 07:18:22'),('enzonagasava@gmail.com','$2y$10$da2.viRWlcbyyrSKEMESSuZ85nKxkkUuMHBK2s2dT3u87riFTPupC','2025-08-05 18:05:55');
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_methods`
--

DROP TABLE IF EXISTS `payment_methods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment_methods` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `company_id` bigint unsigned DEFAULT NULL,
  `method_name` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_percentage` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `account_number` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `payment_methods_company_id_foreign` (`company_id`),
  CONSTRAINT `payment_methods_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_methods`
--

LOCK TABLES `payment_methods` WRITE;
/*!40000 ALTER TABLE `payment_methods` DISABLE KEYS */;
INSERT INTO `payment_methods` VALUES (1,NULL,'Paypal','10%','123','2020-07-27 03:52:20','2020-07-27 03:53:03'),(2,NULL,'Bank','5%','786','2020-07-27 03:53:17','2020-07-27 03:53:17'),(3,NULL,'Cash','2%%','999','2020-07-27 03:53:29','2023-11-07 06:39:23');
/*!40000 ALTER TABLE `payment_methods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payslips`
--

DROP TABLE IF EXISTS `payslips`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payslips` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `payslip_key` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payslip_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `employee_id` bigint unsigned NOT NULL,
  `company_id` bigint unsigned NOT NULL,
  `payment_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `basic_salary` double NOT NULL,
  `net_salary` double NOT NULL,
  `allowances` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `commissions` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `loans` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `deductions` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `overtimes` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `other_payments` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `pension_type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pension_amount` double NOT NULL,
  `hours_worked` int NOT NULL,
  `status` tinyint NOT NULL,
  `month_year` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `payslips_employee_id_foreign` (`employee_id`),
  CONSTRAINT `payslips_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=193 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payslips`
--

LOCK TABLES `payslips` WRITE;
/*!40000 ALTER TABLE `payslips` DISABLE KEYS */;
/*!40000 ALTER TABLE `payslips` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permissions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=298 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions`
--

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
INSERT INTO `permissions` VALUES (1,'user','web',NULL,NULL),(2,'view-user','web',NULL,NULL),(3,'edit-user','web',NULL,NULL),(4,'delete-user','web',NULL,NULL),(5,'last-login-user','web',NULL,NULL),(6,'role-access-user','web',NULL,NULL),(7,'details-employee','web',NULL,NULL),(8,'view-details-employee','web',NULL,NULL),(9,'store-details-employee','web',NULL,NULL),(10,'modify-details-employee','web',NULL,NULL),(11,'customize-setting','web',NULL,NULL),(12,'role-access','web',NULL,NULL),(13,'general-setting','web',NULL,NULL),(14,'view-general-setting','web',NULL,NULL),(15,'store-general-setting','web',NULL,NULL),(16,'mail-setting','web',NULL,NULL),(17,'view-mail-setting','web',NULL,NULL),(18,'store-mail-setting','web',NULL,NULL),(19,'language-setting','web',NULL,NULL),(20,'core_hr','web',NULL,NULL),(21,'view-calendar','web',NULL,NULL),(22,'promotion','web',NULL,NULL),(23,'view-promotion','web',NULL,NULL),(24,'store-promotion','web',NULL,NULL),(25,'edit-promotion','web',NULL,NULL),(26,'delete-promotion','web',NULL,NULL),(27,'award','web',NULL,NULL),(28,'view-award','web',NULL,NULL),(29,'store-award','web',NULL,NULL),(30,'edit-award','web',NULL,NULL),(31,'delete-award','web',NULL,NULL),(32,'transfer','web',NULL,NULL),(33,'view-transfer','web',NULL,NULL),(34,'store-transfer','web',NULL,NULL),(35,'edit-transfer','web',NULL,NULL),(36,'delete-transfer','web',NULL,NULL),(37,'travel','web',NULL,NULL),(38,'view-travel','web',NULL,NULL),(39,'store-travel','web',NULL,NULL),(40,'edit-travel','web',NULL,NULL),(41,'delete-travel','web',NULL,NULL),(42,'resignation','web',NULL,NULL),(43,'view-resignation','web',NULL,NULL),(44,'store-resignation','web',NULL,NULL),(45,'edit-resignation','web',NULL,NULL),(46,'delete-resignation','web',NULL,NULL),(47,'complaint','web',NULL,NULL),(48,'view-complaint','web',NULL,NULL),(49,'store-complaint','web',NULL,NULL),(50,'edit-complaint','web',NULL,NULL),(51,'delete-complaint','web',NULL,NULL),(52,'warning','web',NULL,NULL),(53,'view-warning','web',NULL,NULL),(54,'store-warning','web',NULL,NULL),(55,'edit-warning','web',NULL,NULL),(56,'delete-warning','web',NULL,NULL),(57,'termination','web',NULL,NULL),(58,'view-termination','web',NULL,NULL),(59,'store-termination','web',NULL,NULL),(60,'edit-termination','web',NULL,NULL),(61,'delete-termination','web',NULL,NULL),(62,'timesheet','web',NULL,NULL),(63,'attendance','web',NULL,NULL),(64,'view-attendance','web',NULL,NULL),(65,'edit-attendance','web',NULL,NULL),(66,'office_shift','web',NULL,NULL),(67,'view-office_shift','web',NULL,NULL),(68,'store-office_shift','web',NULL,NULL),(69,'edit-office_shift','web',NULL,NULL),(70,'delete-office_shift','web',NULL,NULL),(71,'holiday','web',NULL,NULL),(72,'view-holiday','web',NULL,NULL),(73,'store-holiday','web',NULL,NULL),(74,'edit-holiday','web',NULL,NULL),(75,'delete-holiday','web',NULL,NULL),(76,'leave','web',NULL,NULL),(77,'view-holiday','web',NULL,NULL),(78,'store-holiday','web',NULL,NULL),(79,'edit-holiday','web',NULL,NULL),(80,'delete-holiday','web',NULL,NULL),(81,'payment-module','web',NULL,NULL),(82,'view-payslip','web',NULL,NULL),(83,'make-payment','web',NULL,NULL),(84,'make-bulk_payment','web',NULL,NULL),(85,'view-paylist','web',NULL,NULL),(86,'set-salary','web',NULL,NULL),(87,'hr_report','web',NULL,NULL),(88,'report-payslip','web',NULL,NULL),(89,'report-attendance','web',NULL,NULL),(90,'report-training','web',NULL,NULL),(91,'report-project','web',NULL,NULL),(92,'report-task','web',NULL,NULL),(93,'report-employee','web',NULL,NULL),(94,'report-account','web',NULL,NULL),(95,'report-deposit','web',NULL,NULL),(96,'report-expense','web',NULL,NULL),(97,'report-transaction','web',NULL,NULL),(98,'recruitment','web',NULL,NULL),(99,'job_employer','web',NULL,NULL),(100,'view-job_employer','web',NULL,NULL),(101,'store-job_employer','web',NULL,NULL),(102,'edit-job_employer','web',NULL,NULL),(103,'delete-job_employer','web',NULL,NULL),(104,'job_post','web',NULL,NULL),(105,'view-job_post','web',NULL,NULL),(106,'store-job_post','web',NULL,NULL),(107,'edit-job_post','web',NULL,NULL),(108,'delete-job_post','web',NULL,NULL),(109,'job_candidate','web',NULL,NULL),(110,'view-job_candidate','web',NULL,NULL),(111,'store-job_candidate','web',NULL,NULL),(112,'delete-job_candidate','web',NULL,NULL),(113,'job_interview','web',NULL,NULL),(114,'view-job_interview','web',NULL,NULL),(115,'store-job_interview','web',NULL,NULL),(116,'delete-job_interview','web',NULL,NULL),(117,'project-management','web',NULL,NULL),(118,'project','web',NULL,NULL),(119,'view-project','web',NULL,NULL),(120,'store-project','web',NULL,NULL),(121,'edit-project','web',NULL,NULL),(122,'delete-project','web',NULL,NULL),(123,'task','web',NULL,NULL),(124,'view-task','web',NULL,NULL),(125,'store-task','web',NULL,NULL),(126,'edit-task','web',NULL,NULL),(127,'delete-task','web',NULL,NULL),(128,'client','web',NULL,NULL),(129,'view-client','web',NULL,NULL),(130,'store-client','web',NULL,NULL),(131,'edit-client','web',NULL,NULL),(132,'delete-client','web',NULL,NULL),(133,'invoice','web',NULL,NULL),(134,'view-invoice','web',NULL,NULL),(135,'store-invoice','web',NULL,NULL),(136,'edit-invoice','web',NULL,NULL),(137,'delete-invoice','web',NULL,NULL),(138,'ticket','web',NULL,NULL),(139,'view-ticket','web',NULL,NULL),(140,'store-ticket','web',NULL,NULL),(141,'edit-ticket','web',NULL,NULL),(142,'delete-ticket','web',NULL,NULL),(143,'import-module','web',NULL,NULL),(144,'import-attendance','web',NULL,NULL),(145,'import-employee','web',NULL,NULL),(146,'file_module','web',NULL,NULL),(147,'file_manager','web',NULL,NULL),(148,'view-file_manager','web',NULL,NULL),(149,'store-file_manager','web',NULL,NULL),(150,'edit-file_manager','web',NULL,NULL),(151,'delete-file_manager','web',NULL,NULL),(152,'view-file_config','web',NULL,NULL),(153,'official_document','web',NULL,NULL),(154,'view-official_document','web',NULL,NULL),(155,'store-official_document','web',NULL,NULL),(156,'edit-official_document','web',NULL,NULL),(157,'delete-official_document','web',NULL,NULL),(158,'event-meeting','web',NULL,NULL),(159,'meeting','web',NULL,NULL),(160,'view-meeting','web',NULL,NULL),(161,'store-meeting','web',NULL,NULL),(162,'edit-meeting','web',NULL,NULL),(163,'delete-meeting','web',NULL,NULL),(164,'event','web',NULL,NULL),(165,'view-event','web',NULL,NULL),(166,'store-event','web',NULL,NULL),(167,'edit-event','web',NULL,NULL),(168,'delete-event','web',NULL,NULL),(169,'role','web',NULL,NULL),(170,'view-role','web',NULL,NULL),(171,'store-role','web',NULL,NULL),(172,'edit-role','web',NULL,NULL),(173,'delete-role','web',NULL,NULL),(174,'assign-module','web',NULL,NULL),(175,'assign-role','web',NULL,NULL),(176,'assign-ticket','web',NULL,NULL),(177,'assign-project','web',NULL,NULL),(178,'assign-task','web',NULL,NULL),(179,'finance','web',NULL,NULL),(180,'account','web',NULL,NULL),(181,'view-account','web',NULL,NULL),(182,'store-account','web',NULL,NULL),(183,'edit-account','web',NULL,NULL),(184,'delete-account','web',NULL,NULL),(185,'view-transaction','web',NULL,NULL),(186,'view-balance_transfer','web',NULL,NULL),(187,'store-balance_transfer','web',NULL,NULL),(188,'expense','web',NULL,NULL),(189,'view-expense','web',NULL,NULL),(190,'store-expense','web',NULL,NULL),(191,'edit-expense','web',NULL,NULL),(192,'delete-expense','web',NULL,NULL),(193,'deposit','web',NULL,NULL),(194,'view-deposit','web',NULL,NULL),(195,'store-deposit','web',NULL,NULL),(196,'edit-deposit','web',NULL,NULL),(197,'delete-deposit','web',NULL,NULL),(198,'payer','web',NULL,NULL),(199,'view-payer','web',NULL,NULL),(200,'store-payer','web',NULL,NULL),(201,'edit-payer','web',NULL,NULL),(202,'delete-payer','web',NULL,NULL),(203,'payee','web',NULL,NULL),(204,'view-payee','web',NULL,NULL),(205,'store-payee','web',NULL,NULL),(206,'edit-payee','web',NULL,NULL),(207,'delete-payee','web',NULL,NULL),(208,'training_module','web',NULL,NULL),(209,'trainer','web',NULL,NULL),(210,'view-trainer','web',NULL,NULL),(211,'store-trainer','web',NULL,NULL),(212,'edit-trainer','web',NULL,NULL),(213,'delete-trainer','web',NULL,NULL),(214,'training','web',NULL,NULL),(215,'view-training','web',NULL,NULL),(216,'store-training','web',NULL,NULL),(217,'edit-training','web',NULL,NULL),(218,'delete-training','web',NULL,NULL),(219,'access-module','web',NULL,NULL),(220,'access-variable_type','web',NULL,NULL),(221,'access-variable_method','web',NULL,NULL),(222,'access-language','web',NULL,NULL),(223,'announcement','web',NULL,NULL),(224,'store-announcement','web',NULL,NULL),(225,'edit-announcement','web',NULL,NULL),(226,'delete-announcement','web',NULL,NULL),(227,'company','web',NULL,NULL),(228,'view-company','web',NULL,NULL),(229,'store-company','web',NULL,NULL),(230,'edit-company','web',NULL,NULL),(231,'delete-company','web',NULL,NULL),(232,'department','web',NULL,NULL),(233,'view-department','web',NULL,NULL),(234,'store-department','web',NULL,NULL),(235,'edit-department','web',NULL,NULL),(236,'delete-department','web',NULL,NULL),(237,'designation','web',NULL,NULL),(238,'view-designation','web',NULL,NULL),(239,'store-designation','web',NULL,NULL),(240,'edit-designation','web',NULL,NULL),(241,'delete-designation','web',NULL,NULL),(242,'location','web',NULL,NULL),(243,'view-location','web',NULL,NULL),(244,'store-location','web',NULL,NULL),(245,'edit-location','web',NULL,NULL),(246,'delete-location','web',NULL,NULL),(247,'policy','web',NULL,NULL),(248,'store-policy','web',NULL,NULL),(249,'edit-policy','web',NULL,NULL),(250,'delete-policy','web',NULL,NULL),(251,'view-cms','web',NULL,NULL),(252,'store-cms','web',NULL,NULL),(253,'store-user','web',NULL,NULL),(254,'delete-attendance','web',NULL,NULL),(255,'view-leave','web',NULL,NULL),(256,'store-leave','web',NULL,NULL),(257,'edit-leave','web',NULL,NULL),(258,'delete-leave','web',NULL,NULL),(259,'cms','web',NULL,NULL),(260,'performance','web',NULL,NULL),(261,'goal-type','web',NULL,NULL),(262,'view-goal-type','web',NULL,NULL),(263,'store-goal-type','web',NULL,NULL),(264,'edit-goal-type','web',NULL,NULL),(265,'delete-goal-type','web',NULL,NULL),(266,'goal-tracking','web',NULL,NULL),(267,'view-goal-tracking','web',NULL,NULL),(268,'store-goal-tracking','web',NULL,NULL),(269,'edit-goal-tracking','web',NULL,NULL),(270,'delete-goal-tracking','web',NULL,NULL),(271,'indicator','web',NULL,NULL),(272,'view-indicator','web',NULL,NULL),(273,'store-indicator','web',NULL,NULL),(274,'edit-indicator','web',NULL,NULL),(275,'delete-indicator','web',NULL,NULL),(276,'appraisal','web',NULL,NULL),(277,'view-appraisal','web',NULL,NULL),(278,'store-appraisal','web',NULL,NULL),(279,'edit-appraisal','web',NULL,NULL),(280,'delete-appraisal','web',NULL,NULL),(281,'assets-and-category','web',NULL,NULL),(282,'category','web',NULL,NULL),(283,'view-assets-category','web',NULL,NULL),(284,'store-assets-category','web',NULL,NULL),(285,'edit-assets-category','web',NULL,NULL),(286,'delete-assets-category','web',NULL,NULL),(287,'assets','web',NULL,NULL),(288,'view-assets','web',NULL,NULL),(289,'store-assets','web',NULL,NULL),(290,'edit-assets','web',NULL,NULL),(291,'delete-assets','web',NULL,NULL),(292,'daily-attendances','web',NULL,NULL),(293,'date-wise-attendances','web',NULL,NULL),(294,'monthly-attendances','web',NULL,NULL),(295,'set-permission','web',NULL,NULL),(296,'get-leave-notification','web',NULL,NULL),(297,'report-pension','web',NULL,NULL);
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `policies`
--

DROP TABLE IF EXISTS `policies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `policies` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `company_id` bigint unsigned DEFAULT NULL,
  `added_by` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `policies_company_id_foreign` (`company_id`),
  KEY `policies_added_by_foreign` (`added_by`),
  CONSTRAINT `policies_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `policies`
--

LOCK TABLES `policies` WRITE;
/*!40000 ALTER TABLE `policies` DISABLE KEYS */;
INSERT INTO `policies` VALUES (4,'Política Corporativa da JWC Multiserviços','A política corporativa da JWC Multiserviços reflete nosso compromisso com a excelência, a ética e a sustentabilidade em todas as nossas operações. Guiados por valores como integridade, respeito ao cliente, inovação e responsabilidade social, buscamos entregar serviços de alta qualidade, promovendo um ambiente de trabalho seguro, inclusivo e colaborativo. Nosso foco está em construir parcerias duradouras e impactar positivamente a comunidade, sempre alinhados às melhores práticas e regulamentações do setor.',10,'admin','2024-12-30 10:34:32','2024-12-30 10:34:32');
/*!40000 ALTER TABLE `policies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_bugs`
--

DROP TABLE IF EXISTS `project_bugs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `project_bugs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `project_id` bigint unsigned NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `title` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `bug_attachment` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `project_bugs_user_id_foreign` (`user_id`),
  KEY `project_bugs_project_id_foreign` (`project_id`),
  CONSTRAINT `project_bugs_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE,
  CONSTRAINT `project_bugs_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_bugs`
--

LOCK TABLES `project_bugs` WRITE;
/*!40000 ALTER TABLE `project_bugs` DISABLE KEYS */;
/*!40000 ALTER TABLE `project_bugs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_discussions`
--

DROP TABLE IF EXISTS `project_discussions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `project_discussions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `project_id` bigint unsigned NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `project_discussion` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `discussion_attachment` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `project_discussions_user_id_foreign` (`user_id`),
  KEY `project_discussions_project_id_foreign` (`project_id`),
  CONSTRAINT `project_discussions_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE,
  CONSTRAINT `project_discussions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_discussions`
--

LOCK TABLES `project_discussions` WRITE;
/*!40000 ALTER TABLE `project_discussions` DISABLE KEYS */;
INSERT INTO `project_discussions` VALUES (1,1,1,'Hola','','2020-07-28 15:12:38','2020-07-28 15:12:38');
/*!40000 ALTER TABLE `project_discussions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_files`
--

DROP TABLE IF EXISTS `project_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `project_files` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `project_id` bigint unsigned NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `file_title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_attachment` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_description` mediumtext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `project_files_user_id_foreign` (`user_id`),
  KEY `project_files_project_id_foreign` (`project_id`),
  CONSTRAINT `project_files_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE,
  CONSTRAINT `project_files_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_files`
--

LOCK TABLES `project_files` WRITE;
/*!40000 ALTER TABLE `project_files` DISABLE KEYS */;
/*!40000 ALTER TABLE `project_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projects`
--

DROP TABLE IF EXISTS `projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `projects` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `client_id` bigint unsigned DEFAULT NULL,
  `company_id` bigint unsigned DEFAULT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `project_priority` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` mediumtext COLLATE utf8mb4_unicode_ci,
  `summary` mediumtext COLLATE utf8mb4_unicode_ci,
  `project_status` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'not started',
  `project_note` longtext COLLATE utf8mb4_unicode_ci,
  `project_progress` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_notify` tinyint DEFAULT NULL,
  `added_by` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `projects_client_id_foreign` (`client_id`),
  KEY `projects_company_id_foreign` (`company_id`),
  KEY `projects_added_by_foreign` (`added_by`),
  CONSTRAINT `projects_added_by_foreign` FOREIGN KEY (`added_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `projects_client_id_foreign` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`) ON DELETE SET NULL,
  CONSTRAINT `projects_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projects`
--

LOCK TABLES `projects` WRITE;
/*!40000 ALTER TABLE `projects` DISABLE KEYS */;
INSERT INTO `projects` VALUES (1,'Test1',NULL,1,'2021-03-29','2021-04-02','medium','&lt;ul&gt;\r\n&lt;li&gt;Section 2: Functional Objectives&lt;br /&gt;Each objective gives a desired behavior for the system, a business justification, and a measure to determine if the final system has successfully met the objective. These objectives are organized by priority. In order for the new system to be considered successful, all high priority objectives must be met.&lt;/li&gt;\r\n&lt;li&gt;Section 3: Non-Functional Objectives&lt;br /&gt;This section is organized by category. Each objective specifies a technical requirement or constraint on the overall characteristics of the system. Each objective is measurable.&lt;/li&gt;\r\n&lt;li&gt;Section 4: Context Model&lt;br /&gt;This section gives a text description of the goal of the system, and a pictorial description of the scope of the system in a context diagram. Those entities outside the system that interact with the system are described.&lt;/li&gt;\r\n&lt;/ul&gt;','tinguish. In a free hour, when our power of choice is untrammelled and when nothing prevents our being able to do what we like best, every pleasure is to be welcomed and every pain avoided. But in certain circumstances and owing to the claims of duty or the obligations of business it will','in_progress','Note','36',NULL,NULL,'2020-07-28 14:58:29','2020-11-02 02:47:03'),(3,'test3',NULL,1,'2021-03-31','2021-04-04','high','&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n&lt;ul&gt;\r\n&lt;li&gt;&lt;strong&gt;A sales agent should be able to use the system in his job after x days of training.&lt;/strong&gt;&lt;/li&gt;\r\n&lt;li&gt;&lt;strong&gt;A user who already knows what product he is interested in should be able to locate and view that page in x seconds.&lt;/strong&gt;&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;','','not_started',NULL,'55',NULL,NULL,'2020-08-03 09:26:42','2020-11-02 02:51:05'),(4,'Test',NULL,1,'2023-02-21','2023-02-22','medium','&lt;p&gt;Test&lt;/p&gt;','','not started',NULL,NULL,NULL,NULL,'2023-02-09 05:02:21','2023-02-09 05:02:21');
/*!40000 ALTER TABLE `projects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `promotions`
--

DROP TABLE IF EXISTS `promotions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `promotions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `promotion_title` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` mediumtext COLLATE utf8mb4_unicode_ci,
  `company_id` bigint unsigned NOT NULL,
  `employee_id` bigint unsigned NOT NULL,
  `promotion_date` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `promotions_company_id_foreign` (`company_id`),
  KEY `promotions_employee_id_foreign` (`employee_id`),
  CONSTRAINT `promotions_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `promotions_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `promotions`
--

LOCK TABLES `promotions` WRITE;
/*!40000 ALTER TABLE `promotions` DISABLE KEYS */;
/*!40000 ALTER TABLE `promotions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qualification_education_levels`
--

DROP TABLE IF EXISTS `qualification_education_levels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qualification_education_levels` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `company_id` bigint unsigned DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `qualification_education_levels_company_id_foreign` (`company_id`),
  CONSTRAINT `qualification_education_levels_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qualification_education_levels`
--

LOCK TABLES `qualification_education_levels` WRITE;
/*!40000 ALTER TABLE `qualification_education_levels` DISABLE KEYS */;
INSERT INTO `qualification_education_levels` VALUES (2,NULL,'Diploma','2020-07-27 03:54:06','2020-07-27 03:54:06'),(5,NULL,'Ensino Fundamental Incompleto','2025-01-06 01:45:44','2025-01-06 01:45:44'),(6,NULL,'Ensino Fundamental Completo','2025-01-06 01:45:52','2025-01-06 01:45:52'),(7,NULL,'Ensino Médio Incompleto','2025-01-06 01:45:59','2025-01-06 01:45:59'),(8,NULL,'Ensino Médio Completo','2025-01-06 01:46:04','2025-01-06 01:46:04'),(9,NULL,'Graduação Incompleta','2025-01-06 01:46:19','2025-01-06 01:46:19'),(10,NULL,'Graduação Completa','2025-01-06 01:46:25','2025-01-06 01:46:25'),(11,NULL,'Pós-Graduação Lato Sensu (Especialização)','2025-01-06 01:46:31','2025-01-06 01:46:31'),(12,NULL,'Mestrado','2025-01-06 01:46:35','2025-01-06 01:46:35'),(13,NULL,'Curso Técnico Incompleto','2025-01-06 01:46:42','2025-01-06 01:46:42'),(14,NULL,'Curso Técnico Completo','2025-01-06 01:46:47','2025-01-06 01:46:47'),(15,NULL,'Curso Profissionalizante','2025-01-06 01:46:52','2025-01-06 01:46:52'),(16,NULL,'Certificação Profissional','2025-01-06 01:46:59','2025-01-06 01:46:59'),(17,NULL,'Certificação Internacional','2025-01-06 01:47:04','2025-01-06 01:47:04'),(18,NULL,'Certificado de Idiomas','2025-01-06 01:47:08','2025-01-06 01:47:08'),(19,NULL,'Não Alfabetizado','2025-01-06 01:47:16','2025-01-06 01:47:16'),(20,NULL,'Curso Livre','2025-01-06 01:47:21','2025-01-06 01:47:21'),(21,NULL,'Educação Superior','2025-01-06 01:47:30','2025-01-06 01:47:30');
/*!40000 ALTER TABLE `qualification_education_levels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qualification_languages`
--

DROP TABLE IF EXISTS `qualification_languages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qualification_languages` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `company_id` bigint unsigned DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `qualification_languages_company_id_foreign` (`company_id`),
  CONSTRAINT `qualification_languages_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qualification_languages`
--

LOCK TABLES `qualification_languages` WRITE;
/*!40000 ALTER TABLE `qualification_languages` DISABLE KEYS */;
INSERT INTO `qualification_languages` VALUES (1,NULL,'English','2020-10-20 03:32:36','2020-10-20 03:32:36'),(4,NULL,'Português (PT-BR)','2025-01-06 01:49:46','2025-01-06 01:49:46'),(5,NULL,'Inglês','2025-01-06 01:49:52','2025-01-06 01:49:52'),(6,NULL,'Espanhol','2025-01-06 01:49:58','2025-01-06 01:49:58');
/*!40000 ALTER TABLE `qualification_languages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qualification_skills`
--

DROP TABLE IF EXISTS `qualification_skills`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qualification_skills` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `company_id` bigint unsigned DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `qualification_skills_company_id_foreign` (`company_id`),
  CONSTRAINT `qualification_skills_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qualification_skills`
--

LOCK TABLES `qualification_skills` WRITE;
/*!40000 ALTER TABLE `qualification_skills` DISABLE KEYS */;
INSERT INTO `qualification_skills` VALUES (2,NULL,'Photoshop','2020-10-20 03:33:02','2020-10-20 03:33:02'),(4,NULL,'Tecnologia e Desenvolvimento de Software','2025-01-06 01:51:08','2025-01-06 01:51:08'),(5,NULL,'Gestão e Negócios','2025-01-06 01:51:14','2025-01-06 01:51:14'),(6,NULL,'Marketing e Comunicação','2025-01-06 01:51:21','2025-01-06 01:51:21'),(7,NULL,'Indústria e Produção','2025-01-06 01:51:27','2025-01-06 01:51:27'),(8,NULL,'Habilidades Interpessoais (Soft Skills)','2025-01-06 01:51:37','2025-01-06 01:51:37'),(9,NULL,'Habilidades Linguísticas','2025-01-06 01:51:44','2025-01-06 01:51:44'),(10,NULL,'Habilidades Operacionais','2025-01-06 01:51:56','2025-01-06 01:51:56'),(11,NULL,'Habilidades Específicas por Setor Saúde','2025-01-06 01:52:05','2025-01-06 01:52:05'),(12,NULL,'Habilidades Administrativas','2025-01-06 01:52:29','2025-01-06 01:52:29'),(13,NULL,'Habilidades de Logística e Transporte','2025-01-06 01:52:40','2025-01-06 01:52:40'),(14,NULL,'Habilidades Educacionais e de Treinamento','2025-01-06 01:52:47','2025-01-06 01:52:47'),(15,NULL,'Habilidades em Finanças e Pagamentos','2025-01-06 01:52:57','2025-01-06 01:52:57'),(16,NULL,'Habilidades de Cozinha e Serviços Alimentares','2025-01-06 01:53:03','2025-01-06 01:53:03');
/*!40000 ALTER TABLE `qualification_skills` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `regionals`
--

DROP TABLE IF EXISTS `regionals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `regionals` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `regionals`
--

LOCK TABLES `regionals` WRITE;
/*!40000 ALTER TABLE `regionals` DISABLE KEYS */;
INSERT INTO `regionals` VALUES (1,'REGIONAL BELO JARDIM','2025-02-27 21:18:46','2025-02-27 21:18:46'),(2,'REGIONAL 06 DE AGOSTO','2025-02-27 21:18:46','2025-02-27 21:18:46'),(3,'REGIONAL CADEIA VELHA','2025-02-27 21:18:46','2025-02-27 21:18:46'),(4,'REGIONAL SAO FRANCISCO','2025-02-27 21:18:46','2025-02-27 21:18:46'),(5,'REGIONAL TANCREDO NEVES','2025-02-27 21:18:46','2025-02-27 21:18:46'),(6,'REGIONAL EXTACAO EXPERIMENTAL','2025-02-27 21:18:46','2025-02-27 21:18:46'),(7,'REGIONAL FLORESTA','2025-02-27 21:18:46','2025-02-27 21:18:46'),(8,'REGIONAL CALAFATE','2025-02-27 21:18:46','2025-02-27 21:18:46'),(9,'REGIONAL DA BAIXADA','2025-02-27 21:18:46','2025-02-27 21:18:46'),(10,'REGIONAL TRANSACREANA I','2025-02-27 21:18:46','2025-02-27 21:18:46'),(11,'REGIONAL TRANSACREANA II','2025-02-27 21:18:46','2025-02-27 21:18:46'),(12,'REGIONAL BACIA DO RIOZINHO DO RÔLA','2025-02-27 21:18:46','2025-03-18 08:29:08'),(13,'REGIONAL REGIONAL 1 DISTRITO','2025-02-27 21:18:46','2025-02-27 21:18:46'),(14,'REGIONAL REGIONAL 2 DISTRITO','2025-02-27 21:18:46','2025-02-27 21:18:46'),(15,'REGIONAL BELO JARDIM','2025-03-15 06:39:06','2025-03-15 06:39:06'),(16,'REGIONAL 06 DE AGOSTO','2025-03-15 06:39:07','2025-03-15 06:39:07'),(17,'REGIONAL CADEIA VELHA','2025-03-15 06:39:07','2025-03-15 06:39:07'),(18,'REGIONAL SAO FRANCISCO','2025-03-15 06:39:07','2025-03-15 06:39:07'),(19,'REGIONAL TANCREDO NEVES','2025-03-15 06:39:07','2025-03-15 06:39:07'),(20,'REGIONAL EXTACAO EXPERIMENTAL','2025-03-15 06:39:07','2025-03-15 06:39:07'),(21,'REGIONAL FLORESTA','2025-03-15 06:39:07','2025-03-15 06:39:07'),(22,'REGIONAL CALAFATE','2025-03-15 06:39:07','2025-03-15 06:39:07'),(23,'REGIONAL DA BAIXADA','2025-03-15 06:39:07','2025-03-15 06:39:07'),(24,'REGIONAL TRANSACREANA I','2025-03-15 06:39:07','2025-03-15 06:39:07'),(25,'REGIONAL TRANSACREANA II','2025-03-15 06:39:07','2025-03-15 06:39:07'),(26,'REGIONAL BACIA DO RIOZINHO DO ROLA','2025-03-15 06:39:07','2025-03-15 06:39:07'),(27,'REGIONAL REGIONAL 1 DISTRITO','2025-03-15 06:39:07','2025-03-15 06:39:07'),(28,'REGIONAL REGIONAL 2 DISTRITO','2025-03-15 06:39:07','2025-03-15 06:39:07'),(29,'VILA ACRE','2025-03-18 08:29:08','2025-03-18 08:29:08'),(30,'BELO JARDIM','2025-03-18 08:29:08','2025-03-18 08:29:08'),(31,'06 DE AGOSTO','2025-03-18 08:29:08','2025-03-18 08:29:08'),(32,'CADEIA VELHA','2025-03-18 08:29:08','2025-03-18 08:29:08'),(33,'SÃO FRANCISCO','2025-03-18 08:29:08','2025-03-18 08:29:08'),(34,'REGIONAL ESTAÇÃO EXPERIMENTAL','2025-03-18 08:29:08','2025-03-18 08:29:08'),(35,'REGIONAL DO CALAFATE','2025-03-18 08:29:08','2025-03-18 08:29:08'),(36,'REGIONAIS RURAIS','2025-03-18 08:29:08','2025-03-18 08:29:08'),(37,'RREGIONAL TRANSACREANA II','2025-03-18 08:29:08','2025-03-18 08:29:08'),(38,'REGIONAL 1º DISTRITO','2025-03-18 08:29:08','2025-03-18 08:29:08'),(39,'REGIONAL 2º DISTRITO','2025-03-18 08:29:08','2025-03-18 08:29:08');
/*!40000 ALTER TABLE `regionals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `relation_types`
--

DROP TABLE IF EXISTS `relation_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `relation_types` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `type_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `relation_types`
--

LOCK TABLES `relation_types` WRITE;
/*!40000 ALTER TABLE `relation_types` DISABLE KEYS */;
INSERT INTO `relation_types` VALUES (1,'Self','2024-07-22 15:55:26','2024-12-31 09:40:29','2024-12-31 09:40:29'),(2,'Parent','2024-07-22 15:55:49','2024-12-31 09:40:36','2024-12-31 09:40:36'),(4,'Supervisor/Subordinado','2024-12-31 09:39:20','2024-12-31 09:39:20',NULL),(5,'Colegas de Equipe','2024-12-31 09:39:28','2024-12-31 09:39:28',NULL),(6,'Mentor/Mentee','2024-12-31 09:39:38','2024-12-31 09:39:38',NULL),(7,'Parceiro Interno','2024-12-31 09:39:45','2024-12-31 09:39:45',NULL),(8,'Cliente/Fornecedor Interno','2024-12-31 09:39:54','2024-12-31 09:39:54',NULL),(9,'Avaliação 360°','2024-12-31 09:40:03','2024-12-31 09:40:03',NULL),(10,'Transição ou Promoção','2024-12-31 09:40:12','2024-12-31 09:40:12',NULL),(11,'Parceiro Externo','2024-12-31 09:40:20','2024-12-31 09:40:20',NULL);
/*!40000 ALTER TABLE `relation_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resignations`
--

DROP TABLE IF EXISTS `resignations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `resignations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `description` mediumtext COLLATE utf8mb4_unicode_ci,
  `company_id` bigint unsigned DEFAULT NULL,
  `department_id` bigint unsigned DEFAULT NULL,
  `employee_id` bigint unsigned DEFAULT NULL,
  `notice_date` date DEFAULT NULL,
  `resignation_date` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `resignations_company_id_foreign` (`company_id`),
  KEY `resignations_department_id_foreign` (`department_id`),
  KEY `resignations_employee_id_foreign` (`employee_id`),
  CONSTRAINT `resignations_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `resignations_department_id_foreign` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`) ON DELETE CASCADE,
  CONSTRAINT `resignations_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resignations`
--

LOCK TABLES `resignations` WRITE;
/*!40000 ALTER TABLE `resignations` DISABLE KEYS */;
/*!40000 ALTER TABLE `resignations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_has_permissions`
--

DROP TABLE IF EXISTS `role_has_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role_has_permissions` (
  `permission_id` bigint unsigned NOT NULL,
  `role_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `role_has_permissions_role_id_foreign` (`role_id`),
  CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_has_permissions`
--

LOCK TABLES `role_has_permissions` WRITE;
/*!40000 ALTER TABLE `role_has_permissions` DISABLE KEYS */;
INSERT INTO `role_has_permissions` VALUES (6,6),(7,6),(8,6),(9,6),(10,6),(11,6),(13,6),(14,6),(15,6),(16,6),(17,6),(18,6),(20,6),(21,6),(25,6),(32,6),(33,6),(34,6),(35,6),(36,6),(42,6),(43,6),(44,6),(46,6),(57,6),(58,6),(59,6),(60,6),(61,6),(62,6),(63,6),(64,6),(65,6),(66,6),(67,6),(68,6),(69,6),(70,6),(71,6),(72,6),(73,6),(74,6),(75,6),(76,6),(98,6),(104,6),(105,6),(106,6),(107,6),(108,6),(109,6),(110,6),(112,6),(138,6),(139,6),(140,6),(141,6),(142,6),(144,6),(145,6),(146,6),(147,6),(148,6),(149,6),(150,6),(151,6),(152,6),(153,6),(154,6),(156,6),(157,6),(158,6),(159,6),(160,6),(161,6),(162,6),(163,6),(164,6),(165,6),(166,6),(167,6),(168,6),(169,6),(170,6),(171,6),(172,6),(173,6),(176,6),(208,6),(209,6),(210,6),(211,6),(212,6),(213,6),(214,6),(215,6),(216,6),(217,6),(218,6),(220,6),(221,6),(222,6),(227,6),(228,6),(229,6),(230,6),(231,6),(232,6),(233,6),(234,6),(235,6),(236,6),(237,6),(238,6),(239,6),(240,6),(241,6),(253,6),(254,6),(255,6),(256,6),(257,6),(258,6),(295,6),(296,6),(1,8),(2,8),(3,8),(4,8),(5,8),(6,8),(7,8),(8,8),(9,8),(10,8),(11,8),(13,8),(14,8),(15,8),(16,8),(17,8),(18,8),(20,8),(21,8),(22,8),(23,8),(24,8),(25,8),(26,8),(27,8),(28,8),(29,8),(30,8),(31,8),(32,8),(33,8),(34,8),(35,8),(36,8),(37,8),(38,8),(39,8),(41,8),(42,8),(43,8),(44,8),(46,8),(47,8),(48,8),(49,8),(50,8),(51,8),(52,8),(53,8),(54,8),(55,8),(56,8),(57,8),(58,8),(59,8),(60,8),(61,8),(62,8),(63,8),(64,8),(65,8),(66,8),(67,8),(68,8),(69,8),(70,8),(71,8),(72,8),(73,8),(74,8),(75,8),(76,8),(81,8),(82,8),(83,8),(84,8),(85,8),(86,8),(87,8),(90,8),(91,8),(92,8),(93,8),(94,8),(95,8),(96,8),(97,8),(98,8),(104,8),(105,8),(106,8),(107,8),(108,8),(109,8),(110,8),(112,8),(113,8),(114,8),(115,8),(116,8),(117,8),(118,8),(119,8),(120,8),(121,8),(122,8),(123,8),(124,8),(125,8),(126,8),(127,8),(128,8),(129,8),(130,8),(131,8),(132,8),(133,8),(134,8),(135,8),(136,8),(137,8),(138,8),(139,8),(140,8),(141,8),(142,8),(144,8),(145,8),(146,8),(147,8),(148,8),(149,8),(150,8),(151,8),(152,8),(153,8),(154,8),(156,8),(157,8),(158,8),(159,8),(160,8),(161,8),(162,8),(163,8),(164,8),(165,8),(166,8),(167,8),(168,8),(169,8),(170,8),(171,8),(172,8),(173,8),(176,8),(177,8),(178,8),(179,8),(180,8),(181,8),(182,8),(183,8),(184,8),(185,8),(186,8),(187,8),(188,8),(189,8),(190,8),(191,8),(192,8),(193,8),(194,8),(195,8),(196,8),(197,8),(198,8),(199,8),(200,8),(201,8),(202,8),(203,8),(204,8),(205,8),(206,8),(207,8),(208,8),(209,8),(210,8),(211,8),(212,8),(213,8),(214,8),(215,8),(216,8),(217,8),(218,8),(220,8),(221,8),(222,8),(223,8),(224,8),(225,8),(226,8),(227,8),(228,8),(229,8),(230,8),(231,8),(232,8),(233,8),(234,8),(235,8),(236,8),(237,8),(238,8),(239,8),(240,8),(241,8),(251,8),(252,8),(253,8),(254,8),(255,8),(256,8),(257,8),(258,8),(259,8),(260,8),(261,8),(262,8),(263,8),(264,8),(265,8),(266,8),(267,8),(268,8),(269,8),(270,8),(271,8),(272,8),(273,8),(274,8),(275,8),(276,8),(277,8),(278,8),(279,8),(280,8),(281,8),(282,8),(283,8),(284,8),(285,8),(286,8),(287,8),(288,8),(289,8),(290,8),(291,8),(292,8),(293,8),(294,8),(295,8),(296,8),(297,8),(1,10),(2,10),(3,10),(4,10),(5,10),(6,10),(7,10),(8,10),(9,10),(10,10),(11,10),(13,10),(14,10),(15,10),(16,10),(17,10),(18,10),(20,10),(21,10),(22,10),(23,10),(24,10),(25,10),(26,10),(27,10),(28,10),(29,10),(30,10),(31,10),(32,10),(33,10),(34,10),(35,10),(36,10),(37,10),(38,10),(39,10),(41,10),(42,10),(43,10),(44,10),(46,10),(47,10),(48,10),(49,10),(50,10),(51,10),(52,10),(53,10),(54,10),(55,10),(56,10),(57,10),(58,10),(59,10),(60,10),(61,10),(62,10),(63,10),(64,10),(65,10),(66,10),(67,10),(68,10),(69,10),(70,10),(71,10),(72,10),(73,10),(74,10),(75,10),(76,10),(81,10),(82,10),(83,10),(84,10),(85,10),(86,10),(87,10),(90,10),(91,10),(92,10),(93,10),(94,10),(95,10),(96,10),(97,10),(98,10),(104,10),(105,10),(106,10),(107,10),(108,10),(109,10),(110,10),(112,10),(113,10),(114,10),(115,10),(116,10),(117,10),(118,10),(119,10),(120,10),(121,10),(122,10),(123,10),(124,10),(125,10),(126,10),(127,10),(128,10),(129,10),(130,10),(131,10),(132,10),(133,10),(134,10),(135,10),(136,10),(137,10),(138,10),(139,10),(140,10),(141,10),(142,10),(144,10),(145,10),(146,10),(147,10),(148,10),(149,10),(150,10),(151,10),(152,10),(153,10),(154,10),(156,10),(157,10),(158,10),(159,10),(160,10),(161,10),(162,10),(163,10),(164,10),(165,10),(166,10),(167,10),(168,10),(169,10),(170,10),(171,10),(172,10),(173,10),(176,10),(177,10),(178,10),(179,10),(180,10),(181,10),(182,10),(183,10),(184,10),(185,10),(186,10),(187,10),(188,10),(189,10),(190,10),(191,10),(192,10),(193,10),(194,10),(195,10),(196,10),(197,10),(198,10),(199,10),(200,10),(201,10),(202,10),(203,10),(204,10),(205,10),(206,10),(207,10),(208,10),(209,10),(210,10),(211,10),(212,10),(213,10),(214,10),(215,10),(216,10),(217,10),(218,10),(220,10),(221,10),(222,10),(223,10),(224,10),(225,10),(226,10),(227,10),(228,10),(229,10),(230,10),(231,10),(232,10),(233,10),(234,10),(235,10),(236,10),(237,10),(238,10),(239,10),(240,10),(241,10),(242,10),(243,10),(244,10),(245,10),(246,10),(247,10),(248,10),(249,10),(250,10),(251,10),(252,10),(253,10),(254,10),(255,10),(256,10),(257,10),(258,10),(259,10),(260,10),(261,10),(262,10),(263,10),(264,10),(265,10),(266,10),(267,10),(268,10),(269,10),(270,10),(271,10),(272,10),(273,10),(274,10),(275,10),(276,10),(277,10),(278,10),(279,10),(280,10),(292,10),(293,10),(294,10),(295,10),(296,10),(297,10),(1,12),(2,12),(3,12),(4,12),(5,12),(6,12),(7,12),(8,12),(9,12),(10,12),(11,12),(13,12),(14,12),(15,12),(16,12),(17,12),(18,12),(20,12),(21,12),(22,12),(23,12),(24,12),(25,12),(26,12),(27,12),(28,12),(29,12),(30,12),(31,12),(32,12),(33,12),(34,12),(35,12),(36,12),(37,12),(38,12),(39,12),(41,12),(42,12),(43,12),(44,12),(46,12),(47,12),(48,12),(49,12),(50,12),(51,12),(52,12),(53,12),(54,12),(55,12),(56,12),(57,12),(58,12),(59,12),(60,12),(61,12),(62,12),(63,12),(64,12),(65,12),(66,12),(67,12),(68,12),(69,12),(70,12),(71,12),(72,12),(73,12),(74,12),(75,12),(76,12),(81,12),(82,12),(83,12),(84,12),(85,12),(86,12),(87,12),(90,12),(91,12),(92,12),(93,12),(94,12),(95,12),(96,12),(97,12),(98,12),(104,12),(105,12),(106,12),(107,12),(108,12),(109,12),(110,12),(112,12),(113,12),(114,12),(115,12),(116,12),(117,12),(118,12),(119,12),(120,12),(121,12),(122,12),(123,12),(124,12),(125,12),(126,12),(127,12),(128,12),(129,12),(130,12),(131,12),(132,12),(133,12),(134,12),(135,12),(136,12),(137,12),(138,12),(139,12),(140,12),(141,12),(142,12),(144,12),(145,12),(146,12),(147,12),(148,12),(149,12),(150,12),(151,12),(152,12),(153,12),(154,12),(156,12),(157,12),(158,12),(159,12),(160,12),(161,12),(162,12),(163,12),(164,12),(165,12),(166,12),(167,12),(168,12),(169,12),(170,12),(171,12),(172,12),(173,12),(176,12),(177,12),(178,12),(179,12),(180,12),(181,12),(182,12),(183,12),(184,12),(185,12),(186,12),(187,12),(188,12),(189,12),(190,12),(191,12),(192,12),(193,12),(194,12),(195,12),(196,12),(197,12),(198,12),(199,12),(200,12),(201,12),(202,12),(203,12),(204,12),(205,12),(206,12),(207,12),(208,12),(209,12),(210,12),(211,12),(212,12),(213,12),(214,12),(215,12),(216,12),(217,12),(218,12),(220,12),(221,12),(222,12),(223,12),(224,12),(225,12),(226,12),(227,12),(228,12),(229,12),(230,12),(231,12),(232,12),(233,12),(234,12),(235,12),(236,12),(237,12),(238,12),(239,12),(240,12),(241,12),(242,12),(243,12),(244,12),(245,12),(246,12),(247,12),(248,12),(249,12),(250,12),(251,12),(252,12),(253,12),(254,12),(255,12),(256,12),(257,12),(258,12),(259,12),(260,12),(261,12),(262,12),(263,12),(264,12),(265,12),(266,12),(267,12),(268,12),(269,12),(270,12),(271,12),(272,12),(273,12),(274,12),(275,12),(276,12),(277,12),(278,12),(279,12),(280,12),(281,12),(282,12),(283,12),(284,12),(285,12),(286,12),(287,12),(288,12),(289,12),(290,12),(291,12),(292,12),(293,12),(294,12),(295,12),(296,12),(297,12),(7,13),(8,13),(9,13),(10,13),(20,13),(21,13),(62,13),(63,13),(64,13),(65,13),(66,13),(67,13),(68,13),(69,13),(71,13),(72,13),(73,13),(74,13),(76,13),(81,13),(82,13),(85,13),(98,13),(104,13),(105,13),(106,13),(107,13),(109,13),(110,13),(113,13),(114,13),(115,13),(117,13),(118,13),(119,13),(120,13),(121,13),(123,13),(124,13),(125,13),(126,13),(133,13),(134,13),(135,13),(144,13),(145,13),(158,13),(159,13),(160,13),(161,13),(162,13),(164,13),(165,13),(166,13),(167,13),(208,13),(214,13),(215,13),(216,13),(217,13),(227,13),(228,13),(230,13),(232,13),(233,13),(234,13),(235,13),(237,13),(238,13),(239,13),(240,13),(242,13),(243,13),(244,13),(245,13),(255,13),(256,13),(257,13),(296,13),(1,20),(2,20),(3,20),(4,20),(5,20),(6,20),(7,20),(8,20),(9,20),(10,20),(11,20),(13,20),(14,20),(15,20),(16,20),(17,20),(18,20),(20,20),(21,20),(22,20),(23,20),(24,20),(25,20),(26,20),(27,20),(28,20),(29,20),(30,20),(31,20),(32,20),(33,20),(34,20),(35,20),(36,20),(37,20),(38,20),(39,20),(41,20),(42,20),(43,20),(44,20),(46,20),(47,20),(48,20),(49,20),(50,20),(51,20),(52,20),(53,20),(54,20),(55,20),(56,20),(57,20),(58,20),(59,20),(60,20),(61,20),(62,20),(63,20),(64,20),(65,20),(66,20),(67,20),(68,20),(69,20),(70,20),(71,20),(72,20),(73,20),(74,20),(75,20),(76,20),(81,20),(82,20),(83,20),(84,20),(85,20),(86,20),(87,20),(90,20),(91,20),(92,20),(93,20),(94,20),(95,20),(96,20),(97,20),(98,20),(104,20),(105,20),(106,20),(107,20),(108,20),(109,20),(110,20),(112,20),(113,20),(114,20),(115,20),(116,20),(117,20),(118,20),(119,20),(120,20),(121,20),(122,20),(123,20),(124,20),(125,20),(126,20),(127,20),(128,20),(129,20),(130,20),(131,20),(132,20),(133,20),(134,20),(135,20),(136,20),(137,20),(138,20),(139,20),(140,20),(141,20),(142,20),(144,20),(145,20),(146,20),(147,20),(148,20),(149,20),(150,20),(151,20),(152,20),(153,20),(154,20),(156,20),(157,20),(158,20),(159,20),(160,20),(161,20),(162,20),(163,20),(164,20),(165,20),(166,20),(167,20),(168,20),(169,20),(170,20),(171,20),(172,20),(173,20),(176,20),(177,20),(178,20),(179,20),(180,20),(181,20),(182,20),(183,20),(184,20),(185,20),(186,20),(187,20),(188,20),(189,20),(190,20),(191,20),(192,20),(193,20),(194,20),(195,20),(196,20),(197,20),(198,20),(199,20),(200,20),(201,20),(202,20),(203,20),(204,20),(205,20),(206,20),(207,20),(208,20),(209,20),(210,20),(211,20),(212,20),(213,20),(214,20),(215,20),(216,20),(217,20),(218,20),(220,20),(221,20),(222,20),(223,20),(224,20),(225,20),(226,20),(227,20),(228,20),(229,20),(230,20),(231,20),(232,20),(233,20),(234,20),(235,20),(236,20),(237,20),(238,20),(239,20),(240,20),(241,20),(242,20),(243,20),(244,20),(245,20),(246,20),(247,20),(248,20),(249,20),(250,20),(251,20),(252,20),(253,20),(254,20),(255,20),(256,20),(257,20),(258,20),(259,20),(260,20),(261,20),(262,20),(263,20),(264,20),(265,20),(266,20),(267,20),(268,20),(269,20),(270,20),(271,20),(272,20),(273,20),(274,20),(275,20),(276,20),(277,20),(278,20),(279,20),(280,20),(281,20),(282,20),(283,20),(284,20),(285,20),(286,20),(287,20),(288,20),(289,20),(290,20),(291,20),(292,20),(293,20),(294,20),(295,20),(296,20),(297,20),(1,22),(2,22),(3,22),(5,22),(6,22),(7,22),(8,22),(9,22),(10,22),(11,22),(13,22),(14,22),(15,22),(16,22),(17,22),(18,22),(20,22),(21,22),(22,22),(23,22),(24,22),(25,22),(27,22),(28,22),(29,22),(30,22),(32,22),(33,22),(34,22),(35,22),(37,22),(38,22),(39,22),(42,22),(43,22),(44,22),(47,22),(48,22),(49,22),(50,22),(52,22),(53,22),(54,22),(55,22),(57,22),(58,22),(59,22),(60,22),(62,22),(63,22),(64,22),(65,22),(66,22),(67,22),(68,22),(69,22),(71,22),(72,22),(73,22),(74,22),(76,22),(81,22),(82,22),(83,22),(84,22),(85,22),(86,22),(87,22),(90,22),(91,22),(92,22),(93,22),(94,22),(95,22),(96,22),(97,22),(98,22),(104,22),(105,22),(106,22),(107,22),(109,22),(110,22),(113,22),(114,22),(115,22),(117,22),(118,22),(119,22),(120,22),(121,22),(123,22),(124,22),(125,22),(126,22),(128,22),(129,22),(130,22),(131,22),(133,22),(134,22),(135,22),(136,22),(138,22),(139,22),(140,22),(141,22),(144,22),(145,22),(146,22),(147,22),(148,22),(149,22),(150,22),(152,22),(153,22),(154,22),(156,22),(158,22),(159,22),(160,22),(161,22),(162,22),(164,22),(165,22),(166,22),(167,22),(169,22),(170,22),(171,22),(172,22),(176,22),(177,22),(178,22),(179,22),(180,22),(181,22),(182,22),(183,22),(185,22),(186,22),(187,22),(188,22),(189,22),(190,22),(191,22),(193,22),(194,22),(195,22),(196,22),(198,22),(199,22),(200,22),(201,22),(203,22),(204,22),(205,22),(206,22),(208,22),(209,22),(210,22),(211,22),(212,22),(214,22),(215,22),(216,22),(217,22),(220,22),(221,22),(222,22),(223,22),(224,22),(225,22),(227,22),(228,22),(229,22),(230,22),(232,22),(233,22),(234,22),(235,22),(237,22),(238,22),(239,22),(240,22),(242,22),(243,22),(244,22),(245,22),(247,22),(248,22),(249,22),(251,22),(252,22),(253,22),(255,22),(256,22),(257,22),(259,22),(260,22),(261,22),(262,22),(263,22),(264,22),(266,22),(267,22),(268,22),(269,22),(271,22),(272,22),(273,22),(274,22),(276,22),(277,22),(278,22),(279,22),(281,22),(282,22),(283,22),(284,22),(285,22),(287,22),(288,22),(289,22),(290,22),(292,22),(293,22),(294,22),(295,22),(296,22),(297,22);
/*!40000 ALTER TABLE `role_has_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `company_id` bigint unsigned DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `is_active` tinyint DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `roles_company_id_foreign` (`company_id`),
  CONSTRAINT `roles_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,NULL,'admin','web','Can access and change everything',1,NULL,NULL),(2,NULL,'Funcionário','web','Default access',1,'2020-07-26 13:50:45','2020-07-26 13:50:45'),(3,NULL,'client','web','When you create a client, this role and associated.',1,'2020-10-08 03:10:23','2020-10-08 03:10:23'),(6,NULL,'RH','web','O setor de Recursos Humanos (RH) é responsável por centralizar e gerenciar todas as funções relacionadas à gestão de pessoas e operações administrativas, utilizando ferramentas como dashboards personalizáveis, gerenciamento de funções e acessos, quadros de horários, folha de pagamento e relatórios de performance. Além disso, o RH abrange recrutamento, treinamento, eventos, suporte a funcionários, gestão financeira e de ativos, promovendo eficiência, organização e alinhamento estratégico com os objetivos da organização.',1,'2021-09-05 03:12:28','2024-12-29 20:10:54'),(8,NULL,'Gerente Suats','web','',1,'2024-12-30 10:35:34','2024-12-30 14:26:51'),(10,NULL,'Gerente JWC','web','',1,'2024-12-30 14:27:23','2024-12-30 14:27:23'),(11,NULL,'Operacional Suats','web','',1,'2025-02-05 19:08:25','2025-02-05 19:08:25'),(12,NULL,'Operacional JWC','web','',1,'2025-03-26 19:46:21','2025-03-26 19:46:21'),(13,NULL,'Departamento pessoal','web','',1,'2025-04-01 01:20:34','2025-04-01 01:20:34'),(20,10,'Administrador JWC','web','',1,'2025-06-24 22:53:09','2025-06-24 22:53:09'),(22,10,'RH OPERACIONAL - JWC','web','Responsável por executar atividades operacionais no sistema de RH, como o cadastro e atualização de dados de colaboradores, gestão de benefícios e apoio nos processos de admissão, férias e desligamento. Mantém a documentação dos funcionários atualizada. Também realiza a geração de relatórios básicos e garante a conformidade com os procedimentos internos e legislação trabalhista. Suporte essencial para o funcionamento eficiente e organizado da área de Recursos Humanos.',1,'2025-08-19 12:18:15','2025-08-19 12:18:15');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salary_allowances`
--

DROP TABLE IF EXISTS `salary_allowances`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `salary_allowances` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `employee_id` bigint unsigned NOT NULL,
  `month_year` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_date` date DEFAULT NULL,
  `allowance_title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `allowance_amount` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_taxable` tinyint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `salary_allowances_employee_id_foreign` (`employee_id`),
  CONSTRAINT `salary_allowances_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salary_allowances`
--

LOCK TABLES `salary_allowances` WRITE;
/*!40000 ALTER TABLE `salary_allowances` DISABLE KEYS */;
/*!40000 ALTER TABLE `salary_allowances` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salary_basics`
--

DROP TABLE IF EXISTS `salary_basics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `salary_basics` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `employee_id` bigint unsigned NOT NULL,
  `month_year` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_date` date DEFAULT NULL,
  `payslip_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `basic_salary` double NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `salary_basics_employee_id_foreign` (`employee_id`),
  CONSTRAINT `salary_basics_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salary_basics`
--

LOCK TABLES `salary_basics` WRITE;
/*!40000 ALTER TABLE `salary_basics` DISABLE KEYS */;
/*!40000 ALTER TABLE `salary_basics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salary_commissions`
--

DROP TABLE IF EXISTS `salary_commissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `salary_commissions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `employee_id` bigint unsigned NOT NULL,
  `month_year` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `commission_title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_date` date DEFAULT NULL,
  `commission_amount` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `salary_commissions_employee_id_foreign` (`employee_id`),
  CONSTRAINT `salary_commissions_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salary_commissions`
--

LOCK TABLES `salary_commissions` WRITE;
/*!40000 ALTER TABLE `salary_commissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `salary_commissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salary_deductions`
--

DROP TABLE IF EXISTS `salary_deductions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `salary_deductions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `employee_id` bigint unsigned NOT NULL,
  `month_year` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_date` date DEFAULT NULL,
  `deduction_title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deduction_amount` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deduction_type_id` bigint unsigned NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `salary_deductions_employee_id_foreign` (`employee_id`),
  KEY `salary_deductions_deduction_type_id_foreign` (`deduction_type_id`),
  CONSTRAINT `salary_deductions_deduction_type_id_foreign` FOREIGN KEY (`deduction_type_id`) REFERENCES `deduction_types` (`id`),
  CONSTRAINT `salary_deductions_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salary_deductions`
--

LOCK TABLES `salary_deductions` WRITE;
/*!40000 ALTER TABLE `salary_deductions` DISABLE KEYS */;
/*!40000 ALTER TABLE `salary_deductions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salary_loans`
--

DROP TABLE IF EXISTS `salary_loans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `salary_loans` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `employee_id` bigint unsigned NOT NULL,
  `month_year` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_date` date DEFAULT NULL,
  `loan_title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `loan_amount` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `loan_type_id` bigint unsigned NOT NULL DEFAULT '1',
  `loan_time` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount_remaining` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `time_remaining` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `monthly_payable` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reason` mediumtext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `salary_loans_employee_id_foreign` (`employee_id`),
  KEY `salary_loans_loan_type_id_foreign` (`loan_type_id`),
  CONSTRAINT `salary_loans_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE,
  CONSTRAINT `salary_loans_loan_type_id_foreign` FOREIGN KEY (`loan_type_id`) REFERENCES `loan_types` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salary_loans`
--

LOCK TABLES `salary_loans` WRITE;
/*!40000 ALTER TABLE `salary_loans` DISABLE KEYS */;
/*!40000 ALTER TABLE `salary_loans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salary_other_payments`
--

DROP TABLE IF EXISTS `salary_other_payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `salary_other_payments` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `employee_id` bigint unsigned NOT NULL,
  `month_year` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `first_date` date DEFAULT NULL,
  `other_payment_title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `other_payment_amount` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `salary_other_payments_employee_id_foreign` (`employee_id`),
  CONSTRAINT `salary_other_payments_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salary_other_payments`
--

LOCK TABLES `salary_other_payments` WRITE;
/*!40000 ALTER TABLE `salary_other_payments` DISABLE KEYS */;
/*!40000 ALTER TABLE `salary_other_payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salary_overtimes`
--

DROP TABLE IF EXISTS `salary_overtimes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `salary_overtimes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `employee_id` bigint unsigned NOT NULL,
  `month_year` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_date` date DEFAULT NULL,
  `overtime_title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `no_of_days` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `overtime_hours` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `overtime_rate` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `overtime_amount` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `salary_overtimes_employee_id_foreign` (`employee_id`),
  CONSTRAINT `salary_overtimes_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salary_overtimes`
--

LOCK TABLES `salary_overtimes` WRITE;
/*!40000 ALTER TABLE `salary_overtimes` DISABLE KEYS */;
/*!40000 ALTER TABLE `salary_overtimes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `statuses`
--

DROP TABLE IF EXISTS `statuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `statuses` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `status_title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `statuses`
--

LOCK TABLES `statuses` WRITE;
/*!40000 ALTER TABLE `statuses` DISABLE KEYS */;
INSERT INTO `statuses` VALUES (7,'Ativo','2025-01-14 07:59:58','2025-01-14 07:59:58'),(8,'Inativo','2025-01-14 08:00:08','2025-01-14 08:00:08'),(9,'Em Período de Experiência','2025-01-14 08:00:16','2025-01-14 08:00:16'),(10,'Em Processo de Contratação','2025-01-14 08:00:24','2025-01-14 08:00:24');
/*!40000 ALTER TABLE `statuses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `support_tickets`
--

DROP TABLE IF EXISTS `support_tickets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `support_tickets` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `company_id` bigint unsigned DEFAULT NULL,
  `department_id` bigint unsigned DEFAULT NULL,
  `employee_id` bigint unsigned DEFAULT NULL,
  `ticket_code` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ticket_priority` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` mediumtext COLLATE utf8mb4_unicode_ci,
  `ticket_remarks` mediumtext COLLATE utf8mb4_unicode_ci,
  `ticket_status` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ticket_note` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_notify` tinyint DEFAULT NULL,
  `ticket_attachment` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `support_tickets_ticket_code_unique` (`ticket_code`),
  KEY `support_tickets_company_id_foreign` (`company_id`),
  KEY `support_tickets_department_id_foreign` (`department_id`),
  KEY `support_tickets_employee_id_foreign` (`employee_id`),
  CONSTRAINT `support_tickets_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `support_tickets_department_id_foreign` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`) ON DELETE CASCADE,
  CONSTRAINT `support_tickets_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `support_tickets`
--

LOCK TABLES `support_tickets` WRITE;
/*!40000 ALTER TABLE `support_tickets` DISABLE KEYS */;
/*!40000 ALTER TABLE `support_tickets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task_discussions`
--

DROP TABLE IF EXISTS `task_discussions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `task_discussions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `task_id` bigint unsigned NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `task_discussion` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `task_discussions_user_id_foreign` (`user_id`),
  KEY `task_discussions_task_id_foreign` (`task_id`),
  CONSTRAINT `task_discussions_task_id_foreign` FOREIGN KEY (`task_id`) REFERENCES `tasks` (`id`) ON DELETE CASCADE,
  CONSTRAINT `task_discussions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task_discussions`
--

LOCK TABLES `task_discussions` WRITE;
/*!40000 ALTER TABLE `task_discussions` DISABLE KEYS */;
/*!40000 ALTER TABLE `task_discussions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task_files`
--

DROP TABLE IF EXISTS `task_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `task_files` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `task_id` bigint unsigned NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `file_title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_attachment` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_description` mediumtext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `task_files_user_id_foreign` (`user_id`),
  KEY `task_files_task_id_foreign` (`task_id`),
  CONSTRAINT `task_files_task_id_foreign` FOREIGN KEY (`task_id`) REFERENCES `tasks` (`id`) ON DELETE CASCADE,
  CONSTRAINT `task_files_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task_files`
--

LOCK TABLES `task_files` WRITE;
/*!40000 ALTER TABLE `task_files` DISABLE KEYS */;
INSERT INTO `task_files` VALUES (2,7,NULL,'Task by Sahiba','task_file_1672559303.png','Test','2023-01-01 07:48:23','2023-01-01 07:48:23');
/*!40000 ALTER TABLE `task_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tasks`
--

DROP TABLE IF EXISTS `tasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tasks` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `task_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `project_id` bigint unsigned NOT NULL,
  `company_id` bigint unsigned DEFAULT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `task_hour` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` mediumtext COLLATE utf8mb4_unicode_ci,
  `task_status` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'not started',
  `task_note` mediumtext COLLATE utf8mb4_unicode_ci,
  `task_progress` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_notify` tinyint DEFAULT NULL,
  `added_by` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tasks_project_id_foreign` (`project_id`),
  KEY `tasks_company_id_foreign` (`company_id`),
  KEY `tasks_added_by_foreign` (`added_by`),
  CONSTRAINT `tasks_added_by_foreign` FOREIGN KEY (`added_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `tasks_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tasks_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tasks`
--

LOCK TABLES `tasks` WRITE;
/*!40000 ALTER TABLE `tasks` DISABLE KEYS */;
INSERT INTO `tasks` VALUES (1,'Test1 Task',1,1,'2021-03-29','2021-04-01','20','&lt;table style=&quot;border-collapse: collapse; width: 100%; height: 45px;&quot; border=&quot;1&quot;&gt;\r\n&lt;tbody&gt;\r\n&lt;tr style=&quot;height: 15px;&quot;&gt;\r\n&lt;td style=&quot;width: 20%; height: 15px;&quot;&gt;gsba&lt;/td&gt;\r\n&lt;td style=&quot;width: 20%; height: 15px;&quot;&gt;svnba&lt;/td&gt;\r\n&lt;td style=&quot;width: 20%; height: 15px;&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n&lt;td style=&quot;width: 20%; height: 15px;&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n&lt;td style=&quot;width: 20%; height: 15px;&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n&lt;/tr&gt;\r\n&lt;tr style=&quot;height: 15px;&quot;&gt;\r\n&lt;td style=&quot;width: 20%; height: 15px;&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n&lt;td style=&quot;width: 20%; height: 15px;&quot;&gt;dfsd&lt;/td&gt;\r\n&lt;td style=&quot;width: 20%; height: 15px;&quot;&gt;dfsf&lt;/td&gt;\r\n&lt;td style=&quot;width: 20%; height: 15px;&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n&lt;td style=&quot;width: 20%; height: 15px;&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n&lt;/tr&gt;\r\n&lt;tr style=&quot;height: 15px;&quot;&gt;\r\n&lt;td style=&quot;width: 20%; height: 15px;&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n&lt;td style=&quot;width: 20%; height: 15px;&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n&lt;td style=&quot;width: 20%; height: 15px;&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n&lt;td style=&quot;width: 20%; height: 15px;&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n&lt;td style=&quot;width: 20%; height: 15px;&quot;&gt;&amp;nbsp;&lt;/td&gt;\r\n&lt;/tr&gt;\r\n&lt;/tbody&gt;\r\n&lt;/table&gt;','',NULL,'9',NULL,1,'2020-07-28 15:14:01','2020-11-02 01:42:14'),(3,'aa',1,1,'2021-03-31','2021-04-02','16','&lt;p&gt;new&lt;/p&gt;','not started',NULL,NULL,NULL,NULL,'2020-10-11 17:12:09','2020-11-02 01:49:48'),(7,'Mission 95',1,1,'2023-01-01','2023-01-07','56','&lt;p&gt;Test&lt;/p&gt;','not started',NULL,NULL,NULL,1,'2023-01-01 07:21:58','2023-01-01 07:21:58'),(8,'Task Title',1,1,'2023-02-21','2023-02-22','50','&lt;p&gt;Test&lt;/p&gt;','not started',NULL,NULL,NULL,1,'2023-02-09 05:05:12','2023-02-09 05:05:12'),(9,'teste',1,10,'2025-04-17','2025-04-17','2','','not started',NULL,NULL,NULL,1,'2025-04-17 07:55:15','2025-04-17 07:55:15');
/*!40000 ALTER TABLE `tasks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tax_types`
--

DROP TABLE IF EXISTS `tax_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tax_types` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rate` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` mediumtext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tax_types`
--

LOCK TABLES `tax_types` WRITE;
/*!40000 ALTER TABLE `tax_types` DISABLE KEYS */;
INSERT INTO `tax_types` VALUES (1,'No tax','0','fixed','zero tax','2020-07-28 16:31:42','2020-07-28 16:31:42'),(2,'Vat','5','percentage','5% vat for all item','2020-07-28 16:32:12','2020-07-28 16:32:12');
/*!40000 ALTER TABLE `tax_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `termination_types`
--

DROP TABLE IF EXISTS `termination_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `termination_types` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `termination_title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `termination_types`
--

LOCK TABLES `termination_types` WRITE;
/*!40000 ALTER TABLE `termination_types` DISABLE KEYS */;
INSERT INTO `termination_types` VALUES (1,'Rescisão Sem Justa Causa (Pelo Empregador)','2020-07-26 20:22:03','2024-12-30 09:49:45'),(2,'Rescisão Com Justa Causa (Pelo Empregador)','2020-07-26 20:22:27','2024-12-30 09:50:06'),(5,'Pedido de Demissão (Pelo Empregado)','2024-12-30 09:50:28','2024-12-30 09:50:28'),(6,'Rescisão por Acordo (Distrato)','2024-12-30 09:50:50','2024-12-30 09:50:50'),(7,'Rescisão por Falecimento do Empregado','2024-12-30 09:51:05','2024-12-30 09:51:05'),(8,'Rescisão por Culpa Recíproca','2024-12-30 09:51:25','2024-12-30 09:51:25'),(9,'Rescisão por Força Maior','2024-12-30 09:51:56','2024-12-30 09:51:56'),(10,'Rescisão por Aposentadoria','2024-12-30 09:52:18','2024-12-30 09:52:18'),(11,'Término de Contrato por Prazo Determinado','2024-12-30 09:52:38','2024-12-30 09:52:38');
/*!40000 ALTER TABLE `termination_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `terminations`
--

DROP TABLE IF EXISTS `terminations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `terminations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `description` mediumtext COLLATE utf8mb4_unicode_ci,
  `company_id` bigint unsigned NOT NULL,
  `terminated_employee` bigint unsigned NOT NULL,
  `termination_type` bigint unsigned DEFAULT NULL,
  `termination_date` date NOT NULL,
  `notice_date` date NOT NULL,
  `status` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `terminations_company_id_foreign` (`company_id`),
  KEY `terminations_terminated_employee_foreign` (`terminated_employee`),
  KEY `terminations_termination_type_foreign` (`termination_type`),
  CONSTRAINT `terminations_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `terminations_terminated_employee_foreign` FOREIGN KEY (`terminated_employee`) REFERENCES `employees` (`id`) ON DELETE CASCADE,
  CONSTRAINT `terminations_termination_type_foreign` FOREIGN KEY (`termination_type`) REFERENCES `termination_types` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `terminations`
--

LOCK TABLES `terminations` WRITE;
/*!40000 ALTER TABLE `terminations` DISABLE KEYS */;
/*!40000 ALTER TABLE `terminations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ticket_comments`
--

DROP TABLE IF EXISTS `ticket_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ticket_comments` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `ticket_id` bigint unsigned NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `ticket_comments` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ticket_comments_ticket_id_foreign` (`ticket_id`),
  KEY `ticket_comments_user_id_foreign` (`user_id`),
  CONSTRAINT `ticket_comments_ticket_id_foreign` FOREIGN KEY (`ticket_id`) REFERENCES `support_tickets` (`id`) ON DELETE CASCADE,
  CONSTRAINT `ticket_comments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket_comments`
--

LOCK TABLES `ticket_comments` WRITE;
/*!40000 ALTER TABLE `ticket_comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `ticket_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trainers`
--

DROP TABLE IF EXISTS `trainers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trainers` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_no` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_id` bigint unsigned DEFAULT NULL,
  `address` mediumtext COLLATE utf8mb4_unicode_ci,
  `expertise` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `trainers_company_id_foreign` (`company_id`),
  CONSTRAINT `trainers_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trainers`
--

LOCK TABLES `trainers` WRITE;
/*!40000 ALTER TABLE `trainers` DISABLE KEYS */;
INSERT INTO `trainers` VALUES (1,'Pink','Floyd','floyd@pink.com','76352839',1,'Backstreet 22,Austria','Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est','','2020-07-27 19:14:54','2020-07-27 19:14:54');
/*!40000 ALTER TABLE `trainers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `training_lists`
--

DROP TABLE IF EXISTS `training_lists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `training_lists` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `description` mediumtext COLLATE utf8mb4_unicode_ci,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `training_cost` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remarks` mediumtext COLLATE utf8mb4_unicode_ci,
  `company_id` bigint unsigned DEFAULT NULL,
  `trainer_id` bigint unsigned DEFAULT NULL,
  `training_type_id` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `training_lists_company_id_foreign` (`company_id`),
  KEY `training_lists_trainer_id_foreign` (`trainer_id`),
  KEY `training_lists_training_type_id_foreign` (`training_type_id`),
  CONSTRAINT `training_lists_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE SET NULL,
  CONSTRAINT `training_lists_trainer_id_foreign` FOREIGN KEY (`trainer_id`) REFERENCES `trainers` (`id`) ON DELETE SET NULL,
  CONSTRAINT `training_lists_training_type_id_foreign` FOREIGN KEY (`training_type_id`) REFERENCES `training_types` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `training_lists`
--

LOCK TABLES `training_lists` WRITE;
/*!40000 ALTER TABLE `training_lists` DISABLE KEYS */;
INSERT INTO `training_lists` VALUES (1,'Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est','2021-04-01','2021-04-02','200','',NULL,1,1,1,'2020-07-27 19:17:38','2020-07-27 19:17:38'),(2,'','2023-02-21','2023-02-22','5000','',NULL,1,1,1,'2023-02-09 04:43:34','2023-02-09 04:43:34'),(3,'1002','2025-04-17','2025-04-30','1000','',NULL,10,1,2,'2025-04-17 07:55:49','2025-04-17 07:55:49');
/*!40000 ALTER TABLE `training_lists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `training_types`
--

DROP TABLE IF EXISTS `training_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `training_types` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `training_types`
--

LOCK TABLES `training_types` WRITE;
/*!40000 ALTER TABLE `training_types` DISABLE KEYS */;
INSERT INTO `training_types` VALUES (1,'Job Training','','2020-07-27 19:10:52','2020-07-27 19:10:52'),(2,'Workshop','','2020-07-27 19:10:59','2020-07-27 19:10:59'),(3,'Mind Training','','2020-07-27 19:11:07','2020-07-27 19:11:07'),(10,'test','','2023-08-02 05:35:23','2023-08-02 05:35:23'),(11,'test123','','2023-08-02 05:36:42','2023-08-02 05:36:42'),(14,'test55','','2023-11-07 10:01:52','2023-11-07 10:01:52');
/*!40000 ALTER TABLE `training_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transfers`
--

DROP TABLE IF EXISTS `transfers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transfers` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `description` mediumtext COLLATE utf8mb4_unicode_ci,
  `company_id` bigint unsigned DEFAULT NULL,
  `from_department_id` bigint unsigned DEFAULT NULL,
  `to_department_id` bigint unsigned DEFAULT NULL,
  `employee_id` bigint unsigned DEFAULT NULL,
  `transfer_date` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `transfers_company_id_foreign` (`company_id`),
  KEY `transfers_from_department_id_foreign` (`from_department_id`),
  KEY `transfers_to_department_id_foreign` (`to_department_id`),
  KEY `transfers_employee_id_foreign` (`employee_id`),
  CONSTRAINT `transfers_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `transfers_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE,
  CONSTRAINT `transfers_from_department_id_foreign` FOREIGN KEY (`from_department_id`) REFERENCES `departments` (`id`) ON DELETE CASCADE,
  CONSTRAINT `transfers_to_department_id_foreign` FOREIGN KEY (`to_department_id`) REFERENCES `departments` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transfers`
--

LOCK TABLES `transfers` WRITE;
/*!40000 ALTER TABLE `transfers` DISABLE KEYS */;
/*!40000 ALTER TABLE `transfers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `translations`
--

DROP TABLE IF EXISTS `translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `translations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `language_id` int unsigned NOT NULL,
  `group` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `key` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `translations_language_id_foreign` (`language_id`),
  CONSTRAINT `translations_language_id_foreign` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `translations`
--

LOCK TABLES `translations` WRITE;
/*!40000 ALTER TABLE `translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `travel_types`
--

DROP TABLE IF EXISTS `travel_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `travel_types` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `arrangement_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_id` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `travel_types_company_id_foreign` (`company_id`),
  CONSTRAINT `travel_types_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `travel_types`
--

LOCK TABLES `travel_types` WRITE;
/*!40000 ALTER TABLE `travel_types` DISABLE KEYS */;
INSERT INTO `travel_types` VALUES (2,'Guest House',NULL,'2020-07-27 03:51:34','2020-07-27 03:51:34'),(3,'Hotel',NULL,'2020-07-27 03:51:39','2020-07-27 03:51:39'),(6,'Por Projeto Específico (alocação temporária)',NULL,'2025-01-06 01:42:47','2025-01-06 01:42:47'),(7,'Contrato Mensal (alocação contínua)',NULL,'2025-01-06 01:42:57','2025-01-06 01:42:57'),(8,'Contrato Diário (serviço por diária)',NULL,'2025-01-06 01:43:04','2025-01-06 01:43:04'),(9,'Por Demanda (On-Demand) (chamado conforme necessidade)',NULL,'2025-01-06 01:43:10','2025-01-06 01:43:10'),(10,'Revezamento de Turnos (escala rotativa)',NULL,'2025-01-06 01:43:16','2025-01-06 01:43:16'),(11,'Presencial em Cliente (alocação no local do cliente)',NULL,'2025-01-06 01:43:25','2025-01-06 01:43:25'),(12,'Contrato por Tempo Determinado (curto prazo)',NULL,'2025-01-06 01:43:35','2025-01-06 01:43:35'),(13,'Contrato por Tempo Indeterminado (longo prazo)',NULL,'2025-01-06 01:43:41','2025-01-06 01:43:41'),(14,'Contrato de Escopo Fechado (entrega de um serviço específico)',NULL,'2025-01-06 01:43:47','2025-01-06 01:43:47'),(15,'Contrato de Escopo Aberto (serviços contínuos)',NULL,'2025-01-06 01:43:53','2025-01-06 01:43:53'),(16,'Contrato Emergencial (alocação rápida para urgências)',NULL,'2025-01-06 01:44:00','2025-01-06 01:44:00'),(17,'Contrato de Substituição (cobrir afastamento de funcionários)',NULL,'2025-01-06 01:44:06','2025-01-06 01:44:06'),(18,'Contrato Digital Assinado (assinatura eletrônica)',NULL,'2025-01-06 01:44:22','2025-01-06 01:44:22'),(19,'Contrato Físico Assinado (assinatura manual)',NULL,'2025-01-06 01:44:29','2025-01-06 01:44:29'),(20,'Documentação Presencial (entrega física de documentos)',NULL,'2025-01-06 01:44:42','2025-01-06 01:44:42');
/*!40000 ALTER TABLE `travel_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `travels`
--

DROP TABLE IF EXISTS `travels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `travels` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `description` mediumtext COLLATE utf8mb4_unicode_ci,
  `company_id` bigint unsigned NOT NULL,
  `employee_id` bigint unsigned NOT NULL,
  `travel_type` bigint unsigned DEFAULT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `purpose_of_visit` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `place_of_visit` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `expected_budget` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `actual_budget` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `travel_mode` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `travels_company_id_foreign` (`company_id`),
  KEY `travels_employee_id_foreign` (`employee_id`),
  KEY `travels_travel_type_foreign` (`travel_type`),
  CONSTRAINT `travels_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `travels_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE,
  CONSTRAINT `travels_travel_type_foreign` FOREIGN KEY (`travel_type`) REFERENCES `travel_types` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `travels`
--

LOCK TABLES `travels` WRITE;
/*!40000 ALTER TABLE `travels` DISABLE KEYS */;
/*!40000 ALTER TABLE `travels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `username` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `profile_photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `profile_bg` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role_users_id` bigint unsigned NOT NULL,
  `is_active` tinyint DEFAULT NULL,
  `contact_no` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_login_ip` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_login_date` timestamp(2) NULL DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `google_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `company_id` bigint unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `users_role_users_id_foreign` (`role_users_id`),
  KEY `users_company_id_foreign` (`company_id`),
  CONSTRAINT `users_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`),
  CONSTRAINT `users_role_users_id_foreign` FOREIGN KEY (`role_users_id`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5359 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Carlos','Robson','admin','admin@gmail.com',NULL,'$2y$10$IbqirwmK9WRD.HCuSPmIb.44ZzgBOMPkPbZwyQVJ7E/vofvHfL86O','admin_1722235144.jpg',NULL,1,1,'1234','172.23.0.1','2025-09-02 23:38:31.00','7c0m0vR88NWhGVj0vvOQhoRA6xrMMrnjJDuc4LXm1rrEkb9FhFgZmGCusZ16','112073730973873758091',NULL,'2025-09-02 16:02:14',NULL,1);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `warnings`
--

DROP TABLE IF EXISTS `warnings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `warnings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `subject` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` mediumtext COLLATE utf8mb4_unicode_ci,
  `company_id` bigint unsigned NOT NULL,
  `warning_to` bigint unsigned NOT NULL,
  `warning_type` bigint unsigned DEFAULT NULL,
  `warning_date` date NOT NULL,
  `status` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `warnings_company_id_foreign` (`company_id`),
  KEY `warnings_warning_to_foreign` (`warning_to`),
  KEY `warnings_warning_type_foreign` (`warning_type`),
  CONSTRAINT `warnings_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `warnings_warning_to_foreign` FOREIGN KEY (`warning_to`) REFERENCES `employees` (`id`) ON DELETE CASCADE,
  CONSTRAINT `warnings_warning_type_foreign` FOREIGN KEY (`warning_type`) REFERENCES `warnings_type` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `warnings`
--

LOCK TABLES `warnings` WRITE;
/*!40000 ALTER TABLE `warnings` DISABLE KEYS */;
/*!40000 ALTER TABLE `warnings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `warnings_type`
--

DROP TABLE IF EXISTS `warnings_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `warnings_type` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `warning_title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `warnings_type`
--

LOCK TABLES `warnings_type` WRITE;
/*!40000 ALTER TABLE `warnings_type` DISABLE KEYS */;
INSERT INTO `warnings_type` VALUES (1,'Aviso trabalhado','2020-07-26 20:20:57','2024-12-30 09:47:27'),(2,'Aviso indenizado','2020-07-26 20:21:17','2024-12-30 09:48:05'),(5,'Aviso de Advertência','2024-12-31 09:43:48','2024-12-31 09:43:48'),(6,'Aviso de Suspensão','2024-12-31 09:43:56','2024-12-31 09:43:56'),(7,'Aviso de Demissão','2024-12-31 09:44:03','2024-12-31 09:44:03'),(8,'Aviso de Mudança de Política','2024-12-31 09:44:09','2024-12-31 09:44:09'),(9,'Aviso de Convocação para Reunião','2024-12-31 09:44:16','2024-12-31 09:44:16'),(10,'Aviso de Atraso ou Falta','2024-12-31 09:44:22','2024-12-31 09:44:22'),(11,'Aviso de Promoção ou Reajuste Salarial','2024-12-31 09:44:29','2024-12-31 09:44:29'),(12,'Aviso de Férias','2024-12-31 09:44:35','2024-12-31 09:44:35'),(13,'Aviso de Alteração de Escala de Trabalho','2024-12-31 09:44:41','2024-12-31 09:44:41'),(14,'Aviso de Condições de Saúde e Segurança','2024-12-31 09:44:48','2024-12-31 09:44:48');
/*!40000 ALTER TABLE `warnings_type` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-09-03  2:41:13
