-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: localhost    Database: curso_drf
-- ------------------------------------------------------
-- Server version	8.0.40

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add plataforma',7,'add_plataforma'),(26,'Can change plataforma',7,'change_plataforma'),(27,'Can delete plataforma',7,'delete_plataforma'),(28,'Can view plataforma',7,'view_plataforma'),(29,'Can add contenido',8,'add_contenido'),(30,'Can change contenido',8,'change_contenido'),(31,'Can delete contenido',8,'delete_contenido'),(32,'Can view contenido',8,'view_contenido'),(33,'Can add resena',9,'add_resena'),(34,'Can change resena',9,'change_resena'),(35,'Can delete resena',9,'delete_resena'),(36,'Can view resena',9,'view_resena'),(37,'Can add Token',10,'add_token'),(38,'Can change Token',10,'change_token'),(39,'Can delete Token',10,'delete_token'),(40,'Can view Token',10,'view_token'),(41,'Can add Token',11,'add_tokenproxy'),(42,'Can change Token',11,'change_tokenproxy'),(43,'Can delete Token',11,'delete_tokenproxy'),(44,'Can view Token',11,'view_tokenproxy');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$1000000$J43S85URtcLoDjjAOM9mVt$k246O6tDuDBX7P6qJ7nIUbpUqgqoFx7W1c/VBKCLDzs=','2026-05-06 04:43:13.101031',1,'alberto','','','alberto@mail.com',1,1,'2025-12-03 20:32:27.907277'),(7,'pbkdf2_sha256$1000000$RII6db5SPSkbvsreyPSJ3D$mRwEzEJ97f0++Vf1bwhBJ9fpdikbWCyAHL5YSp2A2Es=',NULL,0,'ana','','','ana@mail.com',0,1,'2026-01-22 16:23:29.445179'),(8,'pbkdf2_sha256$1000000$StvpTVFBaZ7Cc1AvYGWhZU$QY98ewTkpd5/Aw6aus4rOCi5iyTs6vp17r3BwGIYTXM=',NULL,0,'marisol','','','marisol@mail.com',0,1,'2026-01-22 17:35:29.048500'),(9,'pbkdf2_sha256$1000000$JIg3njubScMJtTKuG6NQlJ$BV+mpWN4MgIPnuKilE0fRwq0GtGV1K8Wtq15xv3ItXw=',NULL,0,'jose','','','jose@mail.com',0,1,'2026-05-07 04:27:01.032195');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authtoken_token`
--

DROP TABLE IF EXISTS `authtoken_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `authtoken_token` (
  `key` varchar(40) NOT NULL,
  `created` datetime(6) NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`key`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `authtoken_token_user_id_35299eff_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authtoken_token`
--

LOCK TABLES `authtoken_token` WRITE;
/*!40000 ALTER TABLE `authtoken_token` DISABLE KEYS */;
INSERT INTO `authtoken_token` VALUES ('1fcf55e4ba88e87bcb2a3bd0aec297b5fb0de214','2026-05-07 04:27:01.813936',9),('2b4fe3f88b62a877acd911a5c686a4d868e822f2','2026-01-22 16:23:29.802888',7),('85ea416de68a6c7c2fa617d42b0ce24f4a83d643','2026-01-16 19:55:37.181228',1);
/*!40000 ALTER TABLE `authtoken_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contenido`
--

DROP TABLE IF EXISTS `contenido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contenido` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `titulo` varchar(100) NOT NULL,
  `descripcion` varchar(200) NOT NULL,
  `activo` tinyint(1) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `plataforma_id` bigint NOT NULL,
  `avg_calif` double NOT NULL,
  `numero_calif` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `contenido_plataforma_id_d23b2724_fk_plataforma_id` (`plataforma_id`),
  CONSTRAINT `contenido_plataforma_id_d23b2724_fk_plataforma_id` FOREIGN KEY (`plataforma_id`) REFERENCES `plataforma` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contenido`
--

LOCK TABLES `contenido` WRITE;
/*!40000 ALTER TABLE `contenido` DISABLE KEYS */;
INSERT INTO `contenido` VALUES (3,'El gran peleador','Es la historia de un peleador',1,'2026-01-22 00:24:06.366009',3,3.5,2),(4,'RCHP','Es un artisca que contiene musica',1,'2026-01-22 00:26:34.448386',4,2,1),(5,'El conquistador - Temporada I','Es la serie mas esperada',1,'2026-01-22 00:27:18.340404',6,3.5,2),(6,'Las bellas princesas','Es una pelicula infantil',1,'2026-01-22 00:27:48.079325',5,0,0);
/*!40000 ALTER TABLE `contenido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2025-12-03 20:37:42.630854','1','Spotify',1,'[{\"added\": {}}]',7,1),(2,'2025-12-03 20:41:50.299606','1','Tame impala',1,'[{\"added\": {}}]',8,1),(3,'2025-12-03 20:43:39.143591','2','Netflix',1,'[{\"added\": {}}]',7,1),(4,'2025-12-03 20:43:54.912770','2','La gran pelea',1,'[{\"added\": {}}]',8,1),(5,'2025-12-03 20:51:19.688964','1','4',1,'[{\"added\": {}}]',9,1),(6,'2025-12-17 22:47:50.073692','2','ana',2,'[{\"changed\": {\"fields\": [\"Staff status\"]}}]',4,1),(7,'2026-01-16 19:55:37.182233','1','85ea416de68a6c7c2fa617d42b0ce24f4a83d643',1,'[{\"added\": {}}]',11,1),(8,'2026-01-16 19:55:40.722832','2','d35254fc772962d9f129ce06fc834cea3c69c327',1,'[{\"added\": {}}]',11,1),(9,'2026-01-21 23:56:30.507534','2','ana',3,'',4,1),(10,'2026-01-21 23:56:30.507534','5','joel',3,'',4,1),(11,'2026-01-21 23:56:30.507534','3','jose',3,'',4,1),(12,'2026-01-21 23:56:30.507534','6','maria',3,'',4,1),(13,'2026-01-21 23:56:30.508537','4','marisol',3,'',4,1),(14,'2026-01-21 23:56:42.236120','9','5',3,'',9,1),(15,'2026-01-21 23:56:42.236120','8','4',3,'',9,1),(16,'2026-01-21 23:56:51.660213','2','Netflix',3,'',7,1),(17,'2026-01-21 23:56:51.660213','1','Spotify',3,'',7,1),(18,'2026-05-06 04:44:15.807048','7','ana',2,'[{\"changed\": {\"fields\": [\"password\"]}}]',4,1),(19,'2026-05-06 04:44:30.553252','8','marisol',2,'[{\"changed\": {\"fields\": [\"password\"]}}]',4,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(10,'authtoken','token'),(11,'authtoken','tokenproxy'),(5,'contenttypes','contenttype'),(8,'peliculas','contenido'),(7,'peliculas','plataforma'),(9,'peliculas','resena'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2025-12-03 20:31:19.938295'),(2,'auth','0001_initial','2025-12-03 20:31:22.306572'),(3,'admin','0001_initial','2025-12-03 20:31:22.863791'),(4,'admin','0002_logentry_remove_auto_add','2025-12-03 20:31:22.879791'),(5,'admin','0003_logentry_add_action_flag_choices','2025-12-03 20:31:22.911015'),(6,'contenttypes','0002_remove_content_type_name','2025-12-03 20:31:23.145771'),(7,'auth','0002_alter_permission_name_max_length','2025-12-03 20:31:23.366906'),(8,'auth','0003_alter_user_email_max_length','2025-12-03 20:31:23.438631'),(9,'auth','0004_alter_user_username_opts','2025-12-03 20:31:23.455854'),(10,'auth','0005_alter_user_last_login_null','2025-12-03 20:31:23.634305'),(11,'auth','0006_require_contenttypes_0002','2025-12-03 20:31:23.634305'),(12,'auth','0007_alter_validators_add_error_messages','2025-12-03 20:31:23.671577'),(13,'auth','0008_alter_user_username_max_length','2025-12-03 20:31:23.887768'),(14,'auth','0009_alter_user_last_name_max_length','2025-12-03 20:31:24.130399'),(15,'auth','0010_alter_group_name_max_length','2025-12-03 20:31:24.177718'),(16,'auth','0011_update_proxy_permissions','2025-12-03 20:31:24.205833'),(17,'auth','0012_alter_user_first_name_max_length','2025-12-03 20:31:24.420177'),(18,'peliculas','0001_initial','2025-12-03 20:31:25.341716'),(19,'sessions','0001_initial','2025-12-03 20:31:25.487187'),(20,'peliculas','0002_contenido_avg_calif_contenido_numero_calif','2025-12-18 17:39:22.301503'),(21,'authtoken','0001_initial','2026-01-16 19:51:57.890331'),(22,'authtoken','0002_auto_20160226_1747','2026-01-16 19:51:57.926151'),(23,'authtoken','0003_tokenproxy','2026-01-16 19:51:57.934096'),(24,'authtoken','0004_alter_tokenproxy_options','2026-01-16 19:51:57.944324');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('43t6zqg91b1nt3zixktfbrocc5kxv9cs','.eJxVjEEOgjAQRe_StWksZWhx6Z4zkD8zraAGEgor492VhIVu_3vvv0yPbR36raSlH9VcjDOn340hjzTtQO-YbrOVeVqXke2u2IMW282antfD_TsYUIZvHUGEeA6-VWmFcwzZM9VCOaNSREAJVDtWJmmc8wgQqpyG6BsPmPcHBNg4tA:1wKU7a:XDJFpOoABN7zfKy5vEjSj6IfaHGmYzPfWJrLwDtKog4','2026-05-20 04:44:30.583955'),('5d94uklp3g0s8kokb09n1zmwie87spti','.eJxVjEEOgjAQRe_StWksZWhx6Z4zkD8zraAGEgor492VhIVu_3vvv0yPbR36raSlH9VcjDOn340hjzTtQO-YbrOVeVqXke2u2IMW282antfD_TsYUIZvHUGEeA6-VWmFcwzZM9VCOaNSREAJVDtWJmmc8wgQqpyG6BsPmPcHBNg4tA:1vQwVh:biPWEZJbiVngZNrDae9ux8hDZ6K6PBkyfPgKGbBKZ4E','2025-12-17 23:43:49.178705'),('6w6bfq52ok9gprme5xzd1zmvqr039rwu','.eJxVjEEOgjAQRe_StWksZWhx6Z4zkD8zraAGEgor492VhIVu_3vvv0yPbR36raSlH9VcjDOn340hjzTtQO-YbrOVeVqXke2u2IMW282antfD_TsYUIZvHUGEeA6-VWmFcwzZM9VCOaNSREAJVDtWJmmc8wgQqpyG6BsPmPcHBNg4tA:1vWKZi:Ygws3ajKdaHokIl3Gk0-hK5Ua6lqVMN3Hm4ue8_va9c','2026-01-01 20:26:14.494765'),('uat24qdh5d80n19wercg48tiwa3q5bga','.eJxVjEEOgjAQRe_StWksZWhx6Z4zkD8zraAGEgor492VhIVu_3vvv0yPbR36raSlH9VcjDOn340hjzTtQO-YbrOVeVqXke2u2IMW282antfD_TsYUIZvHUGEeA6-VWmFcwzZM9VCOaNSREAJVDtWJmmc8wgQqpyG6BsPmPcHBNg4tA:1vgpur:yU55UqFUeMvmx5P8ZuWaecaZAlNnWPLxMvPgc6yHiN4','2026-01-30 19:55:29.278423');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plataforma`
--

DROP TABLE IF EXISTS `plataforma`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plataforma` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) NOT NULL,
  `acerca` varchar(150) NOT NULL,
  `sitio_web` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plataforma`
--

LOCK TABLES `plataforma` WRITE;
/*!40000 ALTER TABLE `plataforma` DISABLE KEYS */;
INSERT INTO `plataforma` VALUES (3,'netflix','Straming de peliculas y series','https://www.netgilx.com'),(4,'spotify','Straming de musica','https://www.spotify.com'),(5,'Disney +','Straming de peliculas y series','https://www.disney.com'),(6,'Amazon music','Straming de musica','https://www.amazonmusic.com');
/*!40000 ALTER TABLE `plataforma` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resena`
--

DROP TABLE IF EXISTS `resena`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `resena` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `puntuacion` smallint unsigned NOT NULL,
  `descripcion` varchar(200) DEFAULT NULL,
  `activo` tinyint(1) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `contenido_id` bigint NOT NULL,
  `usuario_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `resena_contenido_id_48d601b1_fk_contenido_id` (`contenido_id`),
  KEY `resena_usuario_id_6ab690cd_fk_auth_user_id` (`usuario_id`),
  CONSTRAINT `resena_contenido_id_48d601b1_fk_contenido_id` FOREIGN KEY (`contenido_id`) REFERENCES `contenido` (`id`),
  CONSTRAINT `resena_usuario_id_6ab690cd_fk_auth_user_id` FOREIGN KEY (`usuario_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `resena_chk_1` CHECK ((`puntuacion` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resena`
--

LOCK TABLES `resena` WRITE;
/*!40000 ALTER TABLE `resena` DISABLE KEYS */;
INSERT INTO `resena` VALUES (10,3,'Mas o menos, no es lo que esperaba updated',0,'2026-01-22 16:49:30.862214','2026-01-22 16:49:30.862214',3,7),(11,3,'Mas o menos, no es lo que esperaba',1,'2026-01-22 16:53:15.348530','2026-01-22 16:53:15.348530',5,7),(12,4,'Esta buena',1,'2026-01-22 17:38:34.272350','2026-01-22 17:38:34.272350',5,8),(13,2,'Mas o menos nuevo comentario',1,'2026-05-06 05:27:29.393650','2026-05-06 05:27:29.393650',4,7),(14,2,'Tema de throttling',0,'2026-05-12 04:31:00.073488','2026-05-12 04:31:00.073488',3,9);
/*!40000 ALTER TABLE `resena` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-05-14 12:26:03
