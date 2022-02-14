-- MariaDB dump 10.19  Distrib 10.5.12-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: csfp_db
-- ------------------------------------------------------
-- Server version	10.5.12-MariaDB-1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `accounts_useraccount`
--

DROP TABLE IF EXISTS `accounts_useraccount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accounts_useraccount` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `email` varchar(255) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_useraccount`
--

LOCK TABLES `accounts_useraccount` WRITE;
/*!40000 ALTER TABLE `accounts_useraccount` DISABLE KEYS */;
INSERT INTO `accounts_useraccount` VALUES (1,'!vME14VZ5BWkAre1S4n8PnkOg7X8c7Zaii3hi9o2t',NULL,0,'nsbloading@gmail.com','Me',1,0,'Entity');
/*!40000 ALTER TABLE `accounts_useraccount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounts_useraccount_groups`
--

DROP TABLE IF EXISTS `accounts_useraccount_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accounts_useraccount_groups` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `useraccount_id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `accounts_useraccount_gro_useraccount_id_group_id_9e1772b3_uniq` (`useraccount_id`,`group_id`),
  KEY `accounts_useraccount_groups_group_id_07495d90_fk_auth_group_id` (`group_id`),
  CONSTRAINT `accounts_useraccount_groups_group_id_07495d90_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `accounts_useraccount_useraccount_id_1eefb17f_fk_accounts_` FOREIGN KEY (`useraccount_id`) REFERENCES `accounts_useraccount` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_useraccount_groups`
--

LOCK TABLES `accounts_useraccount_groups` WRITE;
/*!40000 ALTER TABLE `accounts_useraccount_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `accounts_useraccount_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounts_useraccount_user_permissions`
--

DROP TABLE IF EXISTS `accounts_useraccount_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accounts_useraccount_user_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `useraccount_id` bigint(20) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `accounts_useraccount_use_useraccount_id_permissio_54014a73_uniq` (`useraccount_id`,`permission_id`),
  KEY `accounts_useraccount_permission_id_5751e5ed_fk_auth_perm` (`permission_id`),
  CONSTRAINT `accounts_useraccount_permission_id_5751e5ed_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `accounts_useraccount_useraccount_id_9ee22c82_fk_accounts_` FOREIGN KEY (`useraccount_id`) REFERENCES `accounts_useraccount` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_useraccount_user_permissions`
--

LOCK TABLES `accounts_useraccount_user_permissions` WRITE;
/*!40000 ALTER TABLE `accounts_useraccount_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `accounts_useraccount_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add content type',4,'add_contenttype'),(14,'Can change content type',4,'change_contenttype'),(15,'Can delete content type',4,'delete_contenttype'),(16,'Can view content type',4,'view_contenttype'),(17,'Can add session',5,'add_session'),(18,'Can change session',5,'change_session'),(19,'Can delete session',5,'delete_session'),(20,'Can view session',5,'view_session'),(21,'Can add user account',6,'add_useraccount'),(22,'Can change user account',6,'change_useraccount'),(23,'Can delete user account',6,'delete_useraccount'),(24,'Can view user account',6,'view_useraccount'),(25,'Can add user social auth',7,'add_usersocialauth'),(26,'Can change user social auth',7,'change_usersocialauth'),(27,'Can delete user social auth',7,'delete_usersocialauth'),(28,'Can view user social auth',7,'view_usersocialauth'),(29,'Can add nonce',8,'add_nonce'),(30,'Can change nonce',8,'change_nonce'),(31,'Can delete nonce',8,'delete_nonce'),(32,'Can view nonce',8,'view_nonce'),(33,'Can add association',9,'add_association'),(34,'Can change association',9,'change_association'),(35,'Can delete association',9,'delete_association'),(36,'Can view association',9,'view_association'),(37,'Can add code',10,'add_code'),(38,'Can change code',10,'change_code'),(39,'Can delete code',10,'delete_code'),(40,'Can view code',10,'view_code'),(41,'Can add partial',11,'add_partial'),(42,'Can change partial',11,'change_partial'),(43,'Can delete partial',11,'delete_partial'),(44,'Can view partial',11,'view_partial'),(45,'Can add outstanding token',12,'add_outstandingtoken'),(46,'Can change outstanding token',12,'change_outstandingtoken'),(47,'Can delete outstanding token',12,'delete_outstandingtoken'),(48,'Can view outstanding token',12,'view_outstandingtoken'),(49,'Can add blacklisted token',13,'add_blacklistedtoken'),(50,'Can change blacklisted token',13,'change_blacklistedtoken'),(51,'Can delete blacklisted token',13,'delete_blacklistedtoken'),(52,'Can view blacklisted token',13,'view_blacklistedtoken');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_accounts_useraccount_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_accounts_useraccount_id` FOREIGN KEY (`user_id`) REFERENCES `accounts_useraccount` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (6,'accounts','useraccount'),(1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'contenttypes','contenttype'),(5,'sessions','session'),(9,'social_django','association'),(10,'social_django','code'),(8,'social_django','nonce'),(11,'social_django','partial'),(7,'social_django','usersocialauth'),(13,'token_blacklist','blacklistedtoken'),(12,'token_blacklist','outstandingtoken');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2021-11-22 09:00:18.652375'),(2,'contenttypes','0002_remove_content_type_name','2021-11-22 09:00:19.065721'),(3,'auth','0001_initial','2021-11-22 09:00:22.098842'),(4,'auth','0002_alter_permission_name_max_length','2021-11-22 09:00:22.727467'),(5,'auth','0003_alter_user_email_max_length','2021-11-22 09:00:22.750404'),(6,'auth','0004_alter_user_username_opts','2021-11-22 09:00:22.774909'),(7,'auth','0005_alter_user_last_login_null','2021-11-22 09:00:22.800971'),(8,'auth','0006_require_contenttypes_0002','2021-11-22 09:00:22.816513'),(9,'auth','0007_alter_validators_add_error_messages','2021-11-22 09:00:22.846322'),(10,'auth','0008_alter_user_username_max_length','2021-11-22 09:00:22.873850'),(11,'auth','0009_alter_user_last_name_max_length','2021-11-22 09:00:22.920824'),(12,'auth','0010_alter_group_name_max_length','2021-11-22 09:00:23.915720'),(13,'auth','0011_update_proxy_permissions','2021-11-22 09:00:23.939257'),(14,'auth','0012_alter_user_first_name_max_length','2021-11-22 09:00:23.971431'),(15,'accounts','0001_initial','2021-11-22 09:00:29.466430'),(16,'admin','0001_initial','2021-11-22 09:00:31.213377'),(17,'admin','0002_logentry_remove_auto_add','2021-11-22 09:00:31.237729'),(18,'admin','0003_logentry_add_action_flag_choices','2021-11-22 09:00:31.617480'),(19,'knox','0001_initial','2021-11-22 09:00:32.611428'),(20,'knox','0002_auto_20150916_1425','2021-11-22 09:00:34.456720'),(21,'knox','0003_auto_20150916_1526','2021-11-22 09:00:35.339628'),(22,'knox','0004_authtoken_expires','2021-11-22 09:00:35.489976'),(23,'knox','0005_authtoken_token_key','2021-11-22 09:00:35.894731'),(24,'knox','0006_auto_20160818_0932','2021-11-22 09:00:37.310087'),(25,'knox','0007_auto_20190111_0542','2021-11-22 09:00:37.399908'),(26,'sessions','0001_initial','2021-11-22 09:00:37.961194'),(27,'accounts','0002_auto_20211125_1436','2021-11-25 11:36:47.756726'),(28,'default','0001_initial','2021-11-25 11:36:50.371938'),(29,'social_auth','0001_initial','2021-11-25 11:36:50.399045'),(30,'default','0002_add_related_name','2021-11-25 11:36:50.441114'),(31,'social_auth','0002_add_related_name','2021-11-25 11:36:50.465138'),(32,'default','0003_alter_email_max_length','2021-11-25 11:36:51.513776'),(33,'social_auth','0003_alter_email_max_length','2021-11-25 11:36:51.541620'),(34,'default','0004_auto_20160423_0400','2021-11-25 11:36:51.774127'),(35,'social_auth','0004_auto_20160423_0400','2021-11-25 11:36:51.959703'),(36,'social_auth','0005_auto_20160727_2333','2021-11-25 11:36:52.548082'),(37,'social_django','0006_partial','2021-11-25 11:36:53.060531'),(38,'social_django','0007_code_timestamp','2021-11-25 11:36:53.476826'),(39,'social_django','0008_partial_timestamp','2021-11-25 11:36:53.814304'),(40,'social_django','0009_auto_20191118_0520','2021-11-25 11:36:54.125101'),(41,'social_django','0010_uid_db_index','2021-11-25 11:36:54.450445'),(42,'social_django','0011_auto_20211125_1436','2021-11-25 11:36:59.508145'),(43,'token_blacklist','0001_initial','2021-11-25 11:37:02.008602'),(44,'token_blacklist','0002_outstandingtoken_jti_hex','2021-11-25 11:37:02.156535'),(45,'token_blacklist','0003_auto_20171017_2007','2021-11-25 11:37:02.208301'),(46,'token_blacklist','0004_auto_20171017_2013','2021-11-25 11:37:03.437233'),(47,'token_blacklist','0005_remove_outstandingtoken_jti','2021-11-25 11:37:03.679348'),(48,'token_blacklist','0006_auto_20171017_2113','2021-11-25 11:37:03.809360'),(49,'token_blacklist','0007_auto_20171017_2214','2021-11-25 11:37:06.543043'),(50,'token_blacklist','0008_migrate_to_bigautofield','2021-11-25 11:37:10.806366'),(51,'token_blacklist','0010_fix_migrate_to_bigautofield','2021-11-25 11:37:10.886878'),(52,'token_blacklist','0011_linearizes_history','2021-11-25 11:37:10.900363'),(53,'social_django','0004_auto_20160423_0400','2021-11-25 11:37:10.918851'),(54,'social_django','0001_initial','2021-11-25 11:37:10.934449'),(55,'social_django','0003_alter_email_max_length','2021-11-25 11:37:10.951662'),(56,'social_django','0005_auto_20160727_2333','2021-11-25 11:37:10.968653'),(57,'social_django','0002_add_related_name','2021-11-25 11:37:11.002419'),(58,'accounts','0003_auto_20211125_2141','2021-11-25 18:42:43.190653');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('2x2hngrixxa8idl2r3rj63y9si7vx9w8','eyJyZWRpcmVjdF91cmkiOiJodHRwOi8vbG9jYWxob3N0OjgwMDAvZ29vZ2xlIiwiZ29vZ2xlLW9hdXRoMl9zdGF0ZSI6IkIycDA2UElERk54ME5iem5kdkQ1MDZoR01vemtwMUFLIn0:1n8FtK:mLYnUyoc3Re2MtJ81VSwl5k-PtgMnvdRHdNC2DF19qI','2022-01-28 06:16:50.305888'),('etj63vrjzf5zvg10dkx14q5nlwbw7b6o','eyJyZWRpcmVjdF91cmkiOiJodHRwOi8vbG9jYWxob3N0OjgwMDAvZ29vZ2xlIiwiZ29vZ2xlLW9hdXRoMl9zdGF0ZSI6ImE3OEFqT0tncGNCcU1vNE1EZ1J5d1FCekFaSTJST2VHIn0:1n8H8q:a6UzROtqaEcsHuiSz0ZrVnl73pSsSGEK-SDqszW5_LM','2022-01-28 07:36:56.423464');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `knox_authtoken`
--

DROP TABLE IF EXISTS `knox_authtoken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `knox_authtoken` (
  `digest` varchar(128) NOT NULL,
  `salt` varchar(16) NOT NULL,
  `created` datetime(6) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `expiry` datetime(6) DEFAULT NULL,
  `token_key` varchar(8) NOT NULL,
  PRIMARY KEY (`digest`),
  UNIQUE KEY `salt` (`salt`),
  KEY `knox_authtoken_user_id_e5a5d899_fk_accounts_useraccount_id` (`user_id`),
  KEY `knox_authtoken_token_key_8f4f7d47` (`token_key`),
  CONSTRAINT `knox_authtoken_user_id_e5a5d899_fk_accounts_useraccount_id` FOREIGN KEY (`user_id`) REFERENCES `accounts_useraccount` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `knox_authtoken`
--

LOCK TABLES `knox_authtoken` WRITE;
/*!40000 ALTER TABLE `knox_authtoken` DISABLE KEYS */;
/*!40000 ALTER TABLE `knox_authtoken` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `social_auth_association`
--

DROP TABLE IF EXISTS `social_auth_association`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `social_auth_association` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `server_url` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `secret` varchar(255) NOT NULL,
  `issued` int(11) NOT NULL,
  `lifetime` int(11) NOT NULL,
  `assoc_type` varchar(64) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `social_auth_association_server_url_handle_078befa2_uniq` (`server_url`,`handle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `social_auth_association`
--

LOCK TABLES `social_auth_association` WRITE;
/*!40000 ALTER TABLE `social_auth_association` DISABLE KEYS */;
/*!40000 ALTER TABLE `social_auth_association` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `social_auth_code`
--

DROP TABLE IF EXISTS `social_auth_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `social_auth_code` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `email` varchar(254) NOT NULL,
  `code` varchar(32) NOT NULL,
  `verified` tinyint(1) NOT NULL,
  `timestamp` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `social_auth_code_email_code_801b2d02_uniq` (`email`,`code`),
  KEY `social_auth_code_code_a2393167` (`code`),
  KEY `social_auth_code_timestamp_176b341f` (`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `social_auth_code`
--

LOCK TABLES `social_auth_code` WRITE;
/*!40000 ALTER TABLE `social_auth_code` DISABLE KEYS */;
/*!40000 ALTER TABLE `social_auth_code` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `social_auth_nonce`
--

DROP TABLE IF EXISTS `social_auth_nonce`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `social_auth_nonce` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `server_url` varchar(255) NOT NULL,
  `timestamp` int(11) NOT NULL,
  `salt` varchar(65) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `social_auth_nonce_server_url_timestamp_salt_f6284463_uniq` (`server_url`,`timestamp`,`salt`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `social_auth_nonce`
--

LOCK TABLES `social_auth_nonce` WRITE;
/*!40000 ALTER TABLE `social_auth_nonce` DISABLE KEYS */;
/*!40000 ALTER TABLE `social_auth_nonce` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `social_auth_partial`
--

DROP TABLE IF EXISTS `social_auth_partial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `social_auth_partial` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `token` varchar(32) NOT NULL,
  `next_step` smallint(5) unsigned NOT NULL CHECK (`next_step` >= 0),
  `backend` varchar(32) NOT NULL,
  `data` longtext NOT NULL,
  `timestamp` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `social_auth_partial_token_3017fea3` (`token`),
  KEY `social_auth_partial_timestamp_50f2119f` (`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `social_auth_partial`
--

LOCK TABLES `social_auth_partial` WRITE;
/*!40000 ALTER TABLE `social_auth_partial` DISABLE KEYS */;
/*!40000 ALTER TABLE `social_auth_partial` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `social_auth_usersocialauth`
--

DROP TABLE IF EXISTS `social_auth_usersocialauth`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `social_auth_usersocialauth` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `provider` varchar(32) NOT NULL,
  `uid` varchar(255) NOT NULL,
  `extra_data` longtext NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `social_auth_usersocialauth_provider_uid_e6b5e668_uniq` (`provider`,`uid`),
  KEY `social_auth_usersoci_user_id_17d28448_fk_accounts_` (`user_id`),
  KEY `social_auth_usersocialauth_uid_796e51dc` (`uid`),
  CONSTRAINT `social_auth_usersoci_user_id_17d28448_fk_accounts_` FOREIGN KEY (`user_id`) REFERENCES `accounts_useraccount` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `social_auth_usersocialauth`
--

LOCK TABLES `social_auth_usersocialauth` WRITE;
/*!40000 ALTER TABLE `social_auth_usersocialauth` DISABLE KEYS */;
INSERT INTO `social_auth_usersocialauth` VALUES (1,'google-oauth2','nsbloading@gmail.com','{\"auth_time\": 1642145824, \"expires\": 3599, \"token_type\": \"Bearer\", \"first_name\": \"Me\", \"last_name\": \"Entity\", \"access_token\": \"ya29.A0ARrdaM8PTRHQgixBz6ToaALc72dCm_XKjGpnGcdS62KZXN6DduoMaOMsKQXDLtutNh7HGcTqK3s1thphOtmoNGhJTocwPEw2LH4bNaIMfkhox2h6GGX9kLbMemjU0gSNkE_awC0IcM8sUZArEIqolqJbsHyj\"}',1,'2022-01-14 07:37:04.312811','2022-01-14 07:37:04.328804');
/*!40000 ALTER TABLE `social_auth_usersocialauth` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `token_blacklist_blacklistedtoken`
--

DROP TABLE IF EXISTS `token_blacklist_blacklistedtoken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `token_blacklist_blacklistedtoken` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `blacklisted_at` datetime(6) NOT NULL,
  `token_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `token_id` (`token_id`),
  CONSTRAINT `token_blacklist_blacklistedtoken_token_id_3cc7fe56_fk` FOREIGN KEY (`token_id`) REFERENCES `token_blacklist_outstandingtoken` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `token_blacklist_blacklistedtoken`
--

LOCK TABLES `token_blacklist_blacklistedtoken` WRITE;
/*!40000 ALTER TABLE `token_blacklist_blacklistedtoken` DISABLE KEYS */;
/*!40000 ALTER TABLE `token_blacklist_blacklistedtoken` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `token_blacklist_outstandingtoken`
--

DROP TABLE IF EXISTS `token_blacklist_outstandingtoken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `token_blacklist_outstandingtoken` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `token` longtext NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `expires_at` datetime(6) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `jti` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `token_blacklist_outstandingtoken_jti_hex_d9bdf6f7_uniq` (`jti`),
  KEY `token_blacklist_outs_user_id_83bc629a_fk_accounts_` (`user_id`),
  CONSTRAINT `token_blacklist_outs_user_id_83bc629a_fk_accounts_` FOREIGN KEY (`user_id`) REFERENCES `accounts_useraccount` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `token_blacklist_outstandingtoken`
--

LOCK TABLES `token_blacklist_outstandingtoken` WRITE;
/*!40000 ALTER TABLE `token_blacklist_outstandingtoken` DISABLE KEYS */;
INSERT INTO `token_blacklist_outstandingtoken` VALUES (1,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY0MjIzMjIyNCwianRpIjoiNTdhNWE3ZGMzMzc5NDhmZjhlMmYzOGFjMmRjMjA3OTUiLCJ1c2VyX2lkIjoxfQ.0ao4B5FYShIxuQu_z0P8O7ivavBWQDmy5GNfIPsnP-c','2022-01-14 07:37:04.362179','2022-01-15 07:37:04.000000',1,'57a5a7dc337948ff8e2f38ac2dc20795');
/*!40000 ALTER TABLE `token_blacklist_outstandingtoken` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-02-14 15:22:58
