-- MySQL dump 10.15  Distrib 10.0.35-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: api_production
-- ------------------------------------------------------
-- Server version	10.0.35-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `ar_internal_metadata`
--

DROP TABLE IF EXISTS `ar_internal_metadata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ar_internal_metadata` (
  `key` varchar(255) NOT NULL,
  `value` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ar_internal_metadata`
--

LOCK TABLES `ar_internal_metadata` WRITE;
/*!40000 ALTER TABLE `ar_internal_metadata` DISABLE KEYS */;
INSERT INTO `ar_internal_metadata` VALUES ('environment','production','2019-01-08 07:36:38','2019-01-08 07:36:38.000000');
/*!40000 ALTER TABLE `ar_internal_metadata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `architectures`
--

DROP TABLE IF EXISTS `architectures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `architectures` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 NOT NULL,
  `available` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `arch_name_index` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `architectures`
--

LOCK TABLES `architectures` WRITE;
/*!40000 ALTER TABLE `architectures` DISABLE KEYS */;
INSERT INTO `architectures` VALUES (1,'aarch64',0),(2,'armv4l',0),(3,'armv5l',0),(4,'armv6l',0),(5,'armv7l',0),(6,'armv5el',0),(7,'armv6el',0),(8,'armv7el',1),(9,'armv7hl',0),(10,'armv8el',1),(11,'hppa',0),(12,'i586',1),(13,'i686',0),(14,'ia64',0),(15,'local',0),(16,'m68k',0),(17,'mips',0),(18,'mips32',0),(19,'mips64',0),(20,'ppc',0),(21,'ppc64',0),(22,'ppc64p7',0),(23,'ppc64le',0),(24,'s390',0),(25,'s390x',0),(26,'sparc',0),(27,'sparc64',0),(28,'sparc64v',0),(29,'sparcv8',0),(30,'sparcv9',0),(31,'sparcv9v',0),(32,'x86_64',1),(33,'aarch64_ilp32',0),(34,'k1om',0),(35,'riscv64',0);
/*!40000 ALTER TABLE `architectures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `architectures_distributions`
--

DROP TABLE IF EXISTS `architectures_distributions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `architectures_distributions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `distribution_id` int(11) DEFAULT NULL,
  `architecture_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `architectures_distributions`
--

LOCK TABLES `architectures_distributions` WRITE;
/*!40000 ALTER TABLE `architectures_distributions` DISABLE KEYS */;
/*!40000 ALTER TABLE `architectures_distributions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attrib_allowed_values`
--

DROP TABLE IF EXISTS `attrib_allowed_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attrib_allowed_values` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `attrib_type_id` int(11) NOT NULL,
  `value` text CHARACTER SET utf8,
  PRIMARY KEY (`id`),
  KEY `attrib_type_id` (`attrib_type_id`),
  CONSTRAINT `attrib_allowed_values_ibfk_1` FOREIGN KEY (`attrib_type_id`) REFERENCES `attrib_types` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attrib_allowed_values`
--

LOCK TABLES `attrib_allowed_values` WRITE;
/*!40000 ALTER TABLE `attrib_allowed_values` DISABLE KEYS */;
INSERT INTO `attrib_allowed_values` VALUES (1,9,'DisableDevel'),(2,9,'BugownerOnly'),(3,17,'Stable'),(4,17,'Testing'),(5,17,'Development'),(6,17,'Private');
/*!40000 ALTER TABLE `attrib_allowed_values` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attrib_default_values`
--

DROP TABLE IF EXISTS `attrib_default_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attrib_default_values` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `attrib_type_id` int(11) NOT NULL,
  `value` text CHARACTER SET utf8 NOT NULL,
  `position` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `attrib_type_id` (`attrib_type_id`),
  CONSTRAINT `attrib_default_values_ibfk_1` FOREIGN KEY (`attrib_type_id`) REFERENCES `attrib_types` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attrib_default_values`
--

LOCK TABLES `attrib_default_values` WRITE;
/*!40000 ALTER TABLE `attrib_default_values` DISABLE KEYS */;
/*!40000 ALTER TABLE `attrib_default_values` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attrib_issues`
--

DROP TABLE IF EXISTS `attrib_issues`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attrib_issues` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `attrib_id` int(11) NOT NULL,
  `issue_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_attrib_issues_on_attrib_id_and_issue_id` (`attrib_id`,`issue_id`),
  KEY `issue_id` (`issue_id`),
  CONSTRAINT `attrib_issues_ibfk_1` FOREIGN KEY (`attrib_id`) REFERENCES `attribs` (`id`),
  CONSTRAINT `attrib_issues_ibfk_2` FOREIGN KEY (`issue_id`) REFERENCES `issues` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attrib_issues`
--

LOCK TABLES `attrib_issues` WRITE;
/*!40000 ALTER TABLE `attrib_issues` DISABLE KEYS */;
/*!40000 ALTER TABLE `attrib_issues` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attrib_namespace_modifiable_bies`
--

DROP TABLE IF EXISTS `attrib_namespace_modifiable_bies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attrib_namespace_modifiable_bies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `attrib_namespace_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `group_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `attrib_namespace_user_role_all_index` (`attrib_namespace_id`,`user_id`,`group_id`),
  KEY `bs_user_id` (`user_id`),
  KEY `bs_group_id` (`group_id`),
  CONSTRAINT `attrib_namespace_modifiable_bies_ibfk_1` FOREIGN KEY (`attrib_namespace_id`) REFERENCES `attrib_namespaces` (`id`),
  CONSTRAINT `attrib_namespace_modifiable_bies_ibfk_4` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `attrib_namespace_modifiable_bies_ibfk_5` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attrib_namespace_modifiable_bies`
--

LOCK TABLES `attrib_namespace_modifiable_bies` WRITE;
/*!40000 ALTER TABLE `attrib_namespace_modifiable_bies` DISABLE KEYS */;
INSERT INTO `attrib_namespace_modifiable_bies` VALUES (1,1,1,NULL);
/*!40000 ALTER TABLE `attrib_namespace_modifiable_bies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attrib_namespaces`
--

DROP TABLE IF EXISTS `attrib_namespaces`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attrib_namespaces` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_attrib_namespaces_on_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attrib_namespaces`
--

LOCK TABLES `attrib_namespaces` WRITE;
/*!40000 ALTER TABLE `attrib_namespaces` DISABLE KEYS */;
INSERT INTO `attrib_namespaces` VALUES (1,'OBS');
/*!40000 ALTER TABLE `attrib_namespaces` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attrib_type_modifiable_bies`
--

DROP TABLE IF EXISTS `attrib_type_modifiable_bies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attrib_type_modifiable_bies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `attrib_type_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `group_id` int(11) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `attrib_type_user_role_all_index` (`attrib_type_id`,`user_id`,`group_id`,`role_id`),
  KEY `user_id` (`user_id`),
  KEY `group_id` (`group_id`),
  KEY `role_id` (`role_id`),
  CONSTRAINT `attrib_type_modifiable_bies_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `attrib_type_modifiable_bies_ibfk_2` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`),
  CONSTRAINT `attrib_type_modifiable_bies_ibfk_3` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attrib_type_modifiable_bies`
--

LOCK TABLES `attrib_type_modifiable_bies` WRITE;
/*!40000 ALTER TABLE `attrib_type_modifiable_bies` DISABLE KEYS */;
INSERT INTO `attrib_type_modifiable_bies` VALUES (1,1,1,NULL,NULL),(2,2,1,NULL,NULL),(3,3,1,NULL,NULL),(4,4,1,NULL,NULL),(5,5,1,NULL,NULL),(6,6,1,NULL,NULL),(7,7,1,NULL,NULL),(8,8,1,NULL,NULL),(9,9,1,NULL,NULL),(10,10,NULL,NULL,2),(11,11,NULL,NULL,2),(12,12,NULL,NULL,2),(13,13,NULL,NULL,2),(14,14,NULL,NULL,2),(15,15,NULL,NULL,2),(16,16,NULL,NULL,2),(17,16,NULL,NULL,3),(18,16,NULL,NULL,4),(19,17,NULL,NULL,2),(20,18,NULL,NULL,1),(21,19,NULL,NULL,2),(22,20,NULL,NULL,2),(23,21,NULL,NULL,2),(24,22,NULL,NULL,2),(25,23,NULL,NULL,1);
/*!40000 ALTER TABLE `attrib_type_modifiable_bies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attrib_types`
--

DROP TABLE IF EXISTS `attrib_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attrib_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 NOT NULL,
  `description` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `value_count` int(11) DEFAULT NULL,
  `attrib_namespace_id` int(11) NOT NULL,
  `issue_list` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_attrib_types_on_attrib_namespace_id_and_name` (`attrib_namespace_id`,`name`),
  KEY `index_attrib_types_on_name` (`name`),
  CONSTRAINT `attrib_types_ibfk_1` FOREIGN KEY (`attrib_namespace_id`) REFERENCES `attrib_namespaces` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attrib_types`
--

LOCK TABLES `attrib_types` WRITE;
/*!40000 ALTER TABLE `attrib_types` DISABLE KEYS */;
INSERT INTO `attrib_types` VALUES (1,'VeryImportantProject','Mark this project as very important. For instance for the project list in the web interface.',NULL,0,1,0),(2,'UpdateProject','Mark this project as frozen, updates are handled via the project defined in the value.',NULL,1,1,0),(3,'RejectRequests','Request against this object get rejected. The first (optional) value will be given as reason to the requester. Adding more values limits the rejection to the given request types (like \"submit\" or \"delete\").',NULL,NULL,1,0),(4,'ApprovedRequestSource','Bypass the automatic request review when the request creator isn\'t the maintainer of this object.',NULL,0,1,0),(5,'Maintained','Marks this as object as maintained. For instance to find packages automatically when using the maintenance features like \"osc mbranch\".',NULL,0,1,0),(6,'MaintenanceProject','Mark this project as central maintenance project, which is used to coordinate all official updates.',NULL,0,1,0),(7,'MaintenanceIdTemplate','Released maintenance updates get an ID on first release. This attribute can be used to modify the default scheme.',NULL,1,1,0),(8,'ScreenShots',NULL,NULL,NULL,1,0),(9,'OwnerRootProject','Mark this project as starting point for the package ownership search. Optional values: \"DisableDevel\": don\'t follow devel project links. \"BugownerOnly\": limit the result to bugowners (ignoring the maintainer role).',NULL,NULL,1,0),(10,'RequestCloned','Use this attribute to reference a request which will get superseded when a new submit request from this project gets created.',NULL,1,1,0),(11,'ProjectStatusPackageFailComment','Use this attribute to explain why this package is failing. This is displayed on the project status page for instance.',NULL,1,1,0),(12,'InitializeDevelPackage','Accepting a new package via a submit request to this project will set the devel project of the new package to the source of the request.',NULL,0,1,0),(13,'BranchTarget','Branches from this project will not follow any project links for the target link.',NULL,0,1,0),(14,'BranchRepositoriesFromProject','Use repository definitions from the specified project when creating a branch.',NULL,1,1,0),(15,'AutoCleanup','The object will recieve a delete request at specified time (YYYY-MM-DD HH:MM:SS) in the value',NULL,1,1,0),(16,'Issues','Use this attribute to reference issues this object has',NULL,0,1,0),(17,'QualityCategory','Use this attrbitue to classify the usability of a project. This gets used by the user package search for instance.',NULL,1,1,0),(18,'IncidentPriority','A numeric value which defines the importance of this incident project.',NULL,1,1,0),(19,'EmbargoDate','A timestamp until outgoing requests can not get accepted.',NULL,1,1,0),(20,'MakeOriginOlder','Initialize packages by making the build results newer then updated ones',NULL,0,1,0),(21,'BranchSkipRepositories','Skip the listed repositories when branching from this projet.',NULL,NULL,1,0),(22,'PlannedReleaseDate','A timestamp for the planned release date of an incident.',NULL,1,1,0),(23,'ImageTemplates',NULL,NULL,NULL,1,0);
/*!40000 ALTER TABLE `attrib_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attrib_values`
--

DROP TABLE IF EXISTS `attrib_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attrib_values` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `attrib_id` int(11) NOT NULL,
  `value` text CHARACTER SET utf8 NOT NULL,
  `position` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_attrib_values_on_attrib_id` (`attrib_id`),
  CONSTRAINT `attrib_values_ibfk_1` FOREIGN KEY (`attrib_id`) REFERENCES `attribs` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attrib_values`
--

LOCK TABLES `attrib_values` WRITE;
/*!40000 ALTER TABLE `attrib_values` DISABLE KEYS */;
/*!40000 ALTER TABLE `attrib_values` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attribs`
--

DROP TABLE IF EXISTS `attribs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attribs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `attrib_type_id` int(11) NOT NULL,
  `package_id` int(11) DEFAULT NULL,
  `binary` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `project_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `attribs_index` (`attrib_type_id`,`package_id`,`project_id`,`binary`),
  UNIQUE KEY `attribs_on_proj_and_pack` (`attrib_type_id`,`project_id`,`package_id`,`binary`),
  KEY `index_attribs_on_package_id` (`package_id`),
  KEY `index_attribs_on_project_id` (`project_id`),
  CONSTRAINT `attribs_ibfk_1` FOREIGN KEY (`attrib_type_id`) REFERENCES `attrib_types` (`id`),
  CONSTRAINT `attribs_ibfk_2` FOREIGN KEY (`package_id`) REFERENCES `packages` (`id`),
  CONSTRAINT `attribs_ibfk_3` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attribs`
--

LOCK TABLES `attribs` WRITE;
/*!40000 ALTER TABLE `attribs` DISABLE KEYS */;
/*!40000 ALTER TABLE `attribs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `backend_infos`
--

DROP TABLE IF EXISTS `backend_infos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `backend_infos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `backend_infos`
--

LOCK TABLES `backend_infos` WRITE;
/*!40000 ALTER TABLE `backend_infos` DISABLE KEYS */;
INSERT INTO `backend_infos` VALUES (1,'lastnotification_nr','16','2019-01-08 07:44:42','2019-01-08 07:45:11.080970');
/*!40000 ALTER TABLE `backend_infos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `backend_packages`
--

DROP TABLE IF EXISTS `backend_packages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `backend_packages` (
  `package_id` int(11) NOT NULL AUTO_INCREMENT,
  `links_to_id` int(11) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `srcmd5` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `changesmd5` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `verifymd5` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `expandedmd5` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `error` text COLLATE utf8_unicode_ci,
  `maxmtime` datetime DEFAULT NULL,
  PRIMARY KEY (`package_id`),
  KEY `index_backend_packages_on_links_to_id` (`links_to_id`),
  CONSTRAINT `backend_packages_ibfk_1` FOREIGN KEY (`package_id`) REFERENCES `packages` (`id`),
  CONSTRAINT `backend_packages_ibfk_2` FOREIGN KEY (`links_to_id`) REFERENCES `packages` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `backend_packages`
--

LOCK TABLES `backend_packages` WRITE;
/*!40000 ALTER TABLE `backend_packages` DISABLE KEYS */;
INSERT INTO `backend_packages` VALUES (1,NULL,'2019-01-08 07:44:57.423055','9ae68a4be4436c91235f47a969772c40',NULL,'43120274eeabbb64d479ab04ea398637','a306c4e39f06b6c3326b33d7295c1616',NULL,NULL),(2,NULL,'2019-01-08 07:45:12.730962','83dc19a28b26f2e418cea3ec154e9077',NULL,'392c3c6ae8d9848827d3f3f55c159939','7309f2f77e98da9ad67dd8c86cac8567',NULL,NULL),(3,NULL,'2019-01-08 12:45:49.540966','a254e58c1a4edf7c391e299f5cfc277e',NULL,'a254e58c1a4edf7c391e299f5cfc277e','a254e58c1a4edf7c391e299f5cfc277e',NULL,NULL);
/*!40000 ALTER TABLE `backend_packages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `binary_releases`
--

DROP TABLE IF EXISTS `binary_releases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `binary_releases` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `repository_id` int(11) NOT NULL,
  `operation` enum('added','removed','modified') DEFAULT 'added',
  `obsolete_time` datetime DEFAULT NULL,
  `release_package_id` int(11) DEFAULT NULL,
  `binary_name` varchar(255) NOT NULL,
  `binary_epoch` varchar(64) DEFAULT NULL,
  `binary_version` varchar(64) NOT NULL,
  `binary_release` varchar(64) NOT NULL,
  `binary_arch` varchar(64) NOT NULL,
  `binary_disturl` varchar(255) DEFAULT NULL,
  `binary_buildtime` datetime DEFAULT NULL,
  `binary_releasetime` datetime NOT NULL,
  `binary_supportstatus` varchar(255) DEFAULT NULL,
  `binary_maintainer` varchar(255) DEFAULT NULL,
  `medium` varchar(255) DEFAULT NULL,
  `binary_updateinfo` varchar(255) DEFAULT NULL,
  `binary_updateinfo_version` varchar(255) DEFAULT NULL,
  `modify_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ra_name_index` (`repository_id`,`binary_name`),
  KEY `exact_search_index` (`binary_name`,`binary_epoch`,`binary_version`,`binary_release`,`binary_arch`),
  KEY `release_package_id` (`release_package_id`),
  KEY `index_binary_releases_on_binary_updateinfo` (`binary_updateinfo`),
  KEY `index_binary_releases_on_medium` (`medium`),
  KEY `index_binary_releases_on_binary_name_and_binary_arch` (`binary_name`,`binary_arch`),
  CONSTRAINT `binary_releases_ibfk_1` FOREIGN KEY (`repository_id`) REFERENCES `repositories` (`id`),
  CONSTRAINT `binary_releases_ibfk_2` FOREIGN KEY (`release_package_id`) REFERENCES `packages` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `binary_releases`
--

LOCK TABLES `binary_releases` WRITE;
/*!40000 ALTER TABLE `binary_releases` DISABLE KEYS */;
/*!40000 ALTER TABLE `binary_releases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blacklist_tags`
--

DROP TABLE IF EXISTS `blacklist_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blacklist_tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blacklist_tags`
--

LOCK TABLES `blacklist_tags` WRITE;
/*!40000 ALTER TABLE `blacklist_tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `blacklist_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bs_request_action_accept_infos`
--

DROP TABLE IF EXISTS `bs_request_action_accept_infos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bs_request_action_accept_infos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bs_request_action_id` int(11) DEFAULT NULL,
  `rev` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `srcmd5` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `xsrcmd5` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `osrcmd5` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `oxsrcmd5` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `oproject` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `opackage` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `bs_request_action_id` (`bs_request_action_id`),
  CONSTRAINT `bs_request_action_accept_infos_ibfk_1` FOREIGN KEY (`bs_request_action_id`) REFERENCES `bs_request_actions` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bs_request_action_accept_infos`
--

LOCK TABLES `bs_request_action_accept_infos` WRITE;
/*!40000 ALTER TABLE `bs_request_action_accept_infos` DISABLE KEYS */;
/*!40000 ALTER TABLE `bs_request_action_accept_infos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bs_request_actions`
--

DROP TABLE IF EXISTS `bs_request_actions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bs_request_actions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bs_request_id` int(11) DEFAULT NULL,
  `type` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `target_project` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `target_package` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `target_releaseproject` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `source_project` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `source_package` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `source_rev` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `sourceupdate` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `updatelink` tinyint(1) DEFAULT '0',
  `person_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `group_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `role` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `target_repository` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `makeoriginolder` tinyint(1) DEFAULT '0',
  `target_package_id` int(11) DEFAULT NULL,
  `target_project_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `bs_request_id` (`bs_request_id`),
  KEY `index_bs_request_actions_on_target_project` (`target_project`),
  KEY `index_bs_request_actions_on_target_package` (`target_package`),
  KEY `index_bs_request_actions_on_source_project` (`source_project`),
  KEY `index_bs_request_actions_on_source_package` (`source_package`),
  KEY `index_bs_request_actions_on_bs_request_id_and_target_project_id` (`bs_request_id`,`target_project_id`),
  KEY `index_bs_request_actions_on_bs_request_id_and_target_package_id` (`bs_request_id`,`target_package_id`),
  KEY `index_bs_request_actions_on_target_project_id` (`target_project_id`),
  KEY `index_bs_request_actions_on_target_package_id` (`target_package_id`),
  CONSTRAINT `bs_request_actions_ibfk_1` FOREIGN KEY (`bs_request_id`) REFERENCES `bs_requests` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bs_request_actions`
--

LOCK TABLES `bs_request_actions` WRITE;
/*!40000 ALTER TABLE `bs_request_actions` DISABLE KEYS */;
/*!40000 ALTER TABLE `bs_request_actions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bs_request_counter`
--

DROP TABLE IF EXISTS `bs_request_counter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bs_request_counter` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `counter` int(11) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bs_request_counter`
--

LOCK TABLES `bs_request_counter` WRITE;
/*!40000 ALTER TABLE `bs_request_counter` DISABLE KEYS */;
INSERT INTO `bs_request_counter` VALUES (1,1);
/*!40000 ALTER TABLE `bs_request_counter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bs_request_histories`
--

DROP TABLE IF EXISTS `bs_request_histories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bs_request_histories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bs_request_id` int(11) DEFAULT NULL,
  `state` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_bin,
  `commenter` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `superseded_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `bs_request_id` (`bs_request_id`),
  CONSTRAINT `bs_request_histories_ibfk_1` FOREIGN KEY (`bs_request_id`) REFERENCES `bs_requests` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bs_request_histories`
--

LOCK TABLES `bs_request_histories` WRITE;
/*!40000 ALTER TABLE `bs_request_histories` DISABLE KEYS */;
/*!40000 ALTER TABLE `bs_request_histories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bs_requests`
--

DROP TABLE IF EXISTS `bs_requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bs_requests` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` text COLLATE utf8_bin,
  `creator` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `state` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_bin,
  `commenter` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `superseded_by` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `accept_at` datetime DEFAULT NULL,
  `priority` enum('critical','important','moderate','low') COLLATE utf8_bin DEFAULT 'moderate',
  `number` int(11) DEFAULT NULL,
  `updated_when` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_bs_requests_on_number` (`number`),
  KEY `index_bs_requests_on_creator` (`creator`),
  KEY `index_bs_requests_on_state` (`state`),
  KEY `index_bs_requests_on_superseded_by` (`superseded_by`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bs_requests`
--

LOCK TABLES `bs_requests` WRITE;
/*!40000 ALTER TABLE `bs_requests` DISABLE KEYS */;
/*!40000 ALTER TABLE `bs_requests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache_lines`
--

DROP TABLE IF EXISTS `cache_lines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache_lines` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `package` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `project` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `request` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_cache_lines_on_project` (`project`),
  KEY `index_cache_lines_on_project_and_package` (`project`,`package`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_lines`
--

LOCK TABLES `cache_lines` WRITE;
/*!40000 ALTER TABLE `cache_lines` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache_lines` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `channel_binaries`
--

DROP TABLE IF EXISTS `channel_binaries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `channel_binaries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `channel_binary_list_id` int(11) NOT NULL,
  `project_id` int(11) DEFAULT NULL,
  `repository_id` int(11) DEFAULT NULL,
  `architecture_id` int(11) DEFAULT NULL,
  `package` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `binaryarch` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `supportstatus` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_channel_binaries_on_project_id_and_package` (`project_id`,`package`),
  KEY `channel_binary_list_id` (`channel_binary_list_id`),
  KEY `repository_id` (`repository_id`),
  KEY `architecture_id` (`architecture_id`),
  KEY `index_channel_binaries_on_name_and_channel_binary_list_id` (`name`,`channel_binary_list_id`),
  CONSTRAINT `channel_binaries_ibfk_1` FOREIGN KEY (`channel_binary_list_id`) REFERENCES `channel_binary_lists` (`id`),
  CONSTRAINT `channel_binaries_ibfk_2` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`),
  CONSTRAINT `channel_binaries_ibfk_3` FOREIGN KEY (`repository_id`) REFERENCES `repositories` (`id`),
  CONSTRAINT `channel_binaries_ibfk_4` FOREIGN KEY (`architecture_id`) REFERENCES `architectures` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `channel_binaries`
--

LOCK TABLES `channel_binaries` WRITE;
/*!40000 ALTER TABLE `channel_binaries` DISABLE KEYS */;
/*!40000 ALTER TABLE `channel_binaries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `channel_binary_lists`
--

DROP TABLE IF EXISTS `channel_binary_lists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `channel_binary_lists` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `channel_id` int(11) NOT NULL,
  `project_id` int(11) DEFAULT NULL,
  `repository_id` int(11) DEFAULT NULL,
  `architecture_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `channel_id` (`channel_id`),
  KEY `project_id` (`project_id`),
  KEY `repository_id` (`repository_id`),
  KEY `architecture_id` (`architecture_id`),
  CONSTRAINT `channel_binary_lists_ibfk_1` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`),
  CONSTRAINT `channel_binary_lists_ibfk_2` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`),
  CONSTRAINT `channel_binary_lists_ibfk_3` FOREIGN KEY (`repository_id`) REFERENCES `repositories` (`id`),
  CONSTRAINT `channel_binary_lists_ibfk_4` FOREIGN KEY (`architecture_id`) REFERENCES `architectures` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `channel_binary_lists`
--

LOCK TABLES `channel_binary_lists` WRITE;
/*!40000 ALTER TABLE `channel_binary_lists` DISABLE KEYS */;
/*!40000 ALTER TABLE `channel_binary_lists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `channel_targets`
--

DROP TABLE IF EXISTS `channel_targets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `channel_targets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `channel_id` int(11) NOT NULL,
  `repository_id` int(11) NOT NULL,
  `prefix` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_template` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `disabled` tinyint(1) DEFAULT '0',
  `requires_issue` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_channel_targets_on_channel_id_and_repository_id` (`channel_id`,`repository_id`),
  KEY `repository_id` (`repository_id`),
  CONSTRAINT `channel_targets_ibfk_1` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`),
  CONSTRAINT `channel_targets_ibfk_2` FOREIGN KEY (`repository_id`) REFERENCES `repositories` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `channel_targets`
--

LOCK TABLES `channel_targets` WRITE;
/*!40000 ALTER TABLE `channel_targets` DISABLE KEYS */;
/*!40000 ALTER TABLE `channel_targets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `channels`
--

DROP TABLE IF EXISTS `channels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `channels` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `package_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_unique` (`package_id`),
  CONSTRAINT `channels_ibfk_1` FOREIGN KEY (`package_id`) REFERENCES `packages` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `channels`
--

LOCK TABLES `channels` WRITE;
/*!40000 ALTER TABLE `channels` DISABLE KEYS */;
/*!40000 ALTER TABLE `channels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cloud_ec2_configurations`
--

DROP TABLE IF EXISTS `cloud_ec2_configurations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cloud_ec2_configurations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `external_id` varchar(255) DEFAULT NULL,
  `arn` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_cloud_ec2_configurations_on_external_id_and_arn` (`external_id`,`arn`),
  KEY `index_cloud_ec2_configurations_on_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cloud_ec2_configurations`
--

LOCK TABLES `cloud_ec2_configurations` WRITE;
/*!40000 ALTER TABLE `cloud_ec2_configurations` DISABLE KEYS */;
/*!40000 ALTER TABLE `cloud_ec2_configurations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cloud_user_upload_jobs`
--

DROP TABLE IF EXISTS `cloud_user_upload_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cloud_user_upload_jobs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `job_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_cloud_user_upload_jobs_on_job_id` (`job_id`),
  KEY `index_cloud_user_upload_jobs_on_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cloud_user_upload_jobs`
--

LOCK TABLES `cloud_user_upload_jobs` WRITE;
/*!40000 ALTER TABLE `cloud_user_upload_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `cloud_user_upload_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `body` text COLLATE utf8_unicode_ci,
  `parent_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `commentable_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `commentable_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `parent_id` (`parent_id`),
  KEY `index_comments_on_commentable_type_and_commentable_id` (`commentable_type`,`commentable_id`),
  CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `comments_ibfk_4` FOREIGN KEY (`parent_id`) REFERENCES `comments` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `configurations`
--

DROP TABLE IF EXISTS `configurations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `configurations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_bin DEFAULT '',
  `description` text CHARACTER SET utf8,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_bin DEFAULT '',
  `registration` enum('allow','confirmation','deny') COLLATE utf8_bin DEFAULT 'allow',
  `anonymous` tinyint(1) DEFAULT '1',
  `default_access_disabled` tinyint(1) DEFAULT '0',
  `allow_user_to_create_home_project` tinyint(1) DEFAULT '1',
  `disallow_group_creation` tinyint(1) DEFAULT '0',
  `change_password` tinyint(1) DEFAULT '1',
  `hide_private_options` tinyint(1) DEFAULT '0',
  `gravatar` tinyint(1) DEFAULT '1',
  `enforce_project_keys` tinyint(1) DEFAULT '0',
  `download_on_demand` tinyint(1) DEFAULT '1',
  `download_url` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ymp_url` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `bugzilla_url` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `http_proxy` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `no_proxy` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `theme` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `obs_url` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `cleanup_after_days` int(11) DEFAULT NULL,
  `admin_email` varchar(255) COLLATE utf8_bin DEFAULT 'unconfigured@openbuildservice.org',
  `cleanup_empty_projects` tinyint(1) DEFAULT '1',
  `disable_publish_for_branches` tinyint(1) DEFAULT '1',
  `default_tracker` varchar(255) COLLATE utf8_bin DEFAULT 'bnc',
  `api_url` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `unlisted_projects_filter` varchar(255) COLLATE utf8_bin DEFAULT '^home:.+',
  `unlisted_projects_filter_description` varchar(255) COLLATE utf8_bin DEFAULT 'home projects',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `configurations`
--

LOCK TABLES `configurations` WRITE;
/*!40000 ALTER TABLE `configurations` DISABLE KEYS */;
INSERT INTO `configurations` VALUES (1,'Open Build Service','  <p class=\"description\">\n    The <a href=\"http://openbuildservice.org\">Open Build Service (OBS)</a>\n    is an open and complete distribution development platform that provides a transparent infrastructure for development of Linux distributions, used by openSUSE, MeeGo and other distributions.\n    Supporting also Fedora, Debian, Ubuntu, RedHat and other Linux distributions.\n  </p>\n  <p class=\"description\">\n    The OBS is developed under the umbrella of the <a href=\"http://www.opensuse.org\">openSUSE project</a>. Please find further informations on the <a href=\"http://wiki.opensuse.org/openSUSE:Build_Service\">openSUSE Project wiki pages</a>.\n  </p>\n\n  <p class=\"description\">\n    The Open Build Service developer team is greeting you. In case you use your OBS productive in your facility, please do us a favor and add yourself at <a href=\"http://wiki.opensuse.org/openSUSE:Build_Service_installations\">this wiki page</a>. Have fun and fast build times!\n  </p>\n','2019-01-08 07:34:32','2019-01-08 07:34:32.000000','private','allow',1,0,1,0,1,0,1,0,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'unconfigured@openbuildservice.org',1,1,'bnc',NULL,'^home:.+','home projects');
/*!40000 ALTER TABLE `configurations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data_migrations`
--

DROP TABLE IF EXISTS `data_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `data_migrations` (
  `version` varchar(255) NOT NULL,
  UNIQUE KEY `unique_data_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_migrations`
--

LOCK TABLES `data_migrations` WRITE;
/*!40000 ALTER TABLE `data_migrations` DISABLE KEYS */;
INSERT INTO `data_migrations` VALUES ('20170306084550'),('20170831143534'),('20171108123126'),('20180109170324'),('20180131174510');
/*!40000 ALTER TABLE `data_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `db_project_types`
--

DROP TABLE IF EXISTS `db_project_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `db_project_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `db_project_types`
--

LOCK TABLES `db_project_types` WRITE;
/*!40000 ALTER TABLE `db_project_types` DISABLE KEYS */;
INSERT INTO `db_project_types` VALUES (1,'standard'),(2,'maintenance'),(3,'maintenance_incident'),(4,'maintenance_release');
/*!40000 ALTER TABLE `db_project_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `db_projects_tags`
--

DROP TABLE IF EXISTS `db_projects_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `db_projects_tags` (
  `db_project_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  UNIQUE KEY `projects_tags_all_index` (`db_project_id`,`tag_id`),
  KEY `tag_id` (`tag_id`),
  CONSTRAINT `db_projects_tags_ibfk_1` FOREIGN KEY (`db_project_id`) REFERENCES `projects` (`id`),
  CONSTRAINT `db_projects_tags_ibfk_2` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `db_projects_tags`
--

LOCK TABLES `db_projects_tags` WRITE;
/*!40000 ALTER TABLE `db_projects_tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `db_projects_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `delayed_jobs`
--

DROP TABLE IF EXISTS `delayed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `delayed_jobs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `priority` int(11) DEFAULT '0',
  `attempts` int(11) DEFAULT '0',
  `handler` mediumtext COLLATE utf8_bin,
  `last_error` text CHARACTER SET utf8,
  `run_at` datetime DEFAULT NULL,
  `locked_at` datetime DEFAULT NULL,
  `failed_at` datetime DEFAULT NULL,
  `locked_by` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `queue` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_delayed_jobs_on_queue` (`queue`)
) ENGINE=InnoDB AUTO_INCREMENT=106 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delayed_jobs`
--

LOCK TABLES `delayed_jobs` WRITE;
/*!40000 ALTER TABLE `delayed_jobs` DISABLE KEYS */;
INSERT INTO `delayed_jobs` VALUES (1,0,0,'--- !ruby/object:Delayed::PerformableMethod\nobject: !ruby/ActiveRecord:Configuration\n  attributes:\n    id: 1\n    title: Open Build Service\n    description: |2\n        <p class=\"description\">\n          The <a href=\"http://openbuildservice.org\">Open Build Service (OBS)</a>\n          is an open and complete distribution development platform that provides a transparent infrastructure for development of Linux distributions, used by openSUSE, MeeGo and other distributions.\n          Supporting also Fedora, Debian, Ubuntu, RedHat and other Linux distributions.\n        </p>\n        <p class=\"description\">\n          The OBS is developed under the umbrella of the <a href=\"http://www.opensuse.org\">openSUSE project</a>. Please find further informations on the <a href=\"http://wiki.opensuse.org/openSUSE:Build_Service\">openSUSE Project wiki pages</a>.\n        </p>\n\n        <p class=\"description\">\n          The Open Build Service developer team is greeting you. In case you use your OBS productive in your facility, please do us a favor and add yourself at <a href=\"http://wiki.opensuse.org/openSUSE:Build_Service_installations\">this wiki page</a>. Have fun and fast build times!\n        </p>\n    created_at: 2019-01-08 07:34:32.494049035 Z\n    updated_at: 2019-01-08 07:34:32.494049035 Z\n    name: private\n    registration: allow\n    anonymous: true\n    default_access_disabled: false\n    allow_user_to_create_home_project: true\n    disallow_group_creation: false\n    change_password: true\n    hide_private_options: false\n    gravatar: true\n    enforce_project_keys: false\n    download_on_demand: true\n    download_url: \n    ymp_url: \n    bugzilla_url: \n    http_proxy: \n    no_proxy: \n    theme: \n    obs_url: \n    cleanup_after_days: \n    admin_email: unconfigured@openbuildservice.org\nmethod_name: :write_to_backend\nargs: []\n',NULL,'2019-01-08 07:34:32',NULL,NULL,NULL,NULL),(24,0,6,'--- !ruby/object:ActiveJob::QueueAdapters::DelayedJobAdapter::JobWrapper\njob_data:\n  job_class: FullTextIndexJob\n  job_id: d135499e-f843-4ad7-b631-2da9e133b23a\n  provider_job_id: \n  queue_name: quick\n  priority: \n  arguments: []\n  executions: 0\n  locale: en\n','exit\n/usr/lib64/ruby/gems/2.5.0/gems/thinking-sphinx-3.4.2/lib/thinking_sphinx/commands/base.rb:33:in `exit\'\n/usr/lib64/ruby/gems/2.5.0/gems/thinking-sphinx-3.4.2/lib/thinking_sphinx/commands/base.rb:33:in `handle_failure\'\n/usr/lib64/ruby/gems/2.5.0/gems/thinking-sphinx-3.4.2/lib/thinking_sphinx/commands/base.rb:11:in `rescue in call_with_handling\'\n/usr/lib64/ruby/gems/2.5.0/gems/thinking-sphinx-3.4.2/lib/thinking_sphinx/commands/base.rb:8:in `call_with_handling\'\n/usr/lib64/ruby/gems/2.5.0/gems/thinking-sphinx-3.4.2/lib/thinking_sphinx/commands/base.rb:5:in `call\'\n/usr/lib64/ruby/gems/2.5.0/gems/thinking-sphinx-3.4.2/lib/thinking_sphinx/interfaces/sql.rb:31:in `index\'\n/srv/www/obs/api/app/jobs/full_text_index_job.rb:12:in `block in perform\'\n/usr/lib64/ruby/gems/2.5.0/gems/activerecord-5.1.4/lib/active_record/connection_adapters/abstract/connection_pool.rb:408:in `with_connection\'\n/srv/www/obs/api/app/jobs/full_text_index_job.rb:8:in `perform\'\n/usr/lib64/ruby/gems/2.5.0/gems/activejob-5.1.4/lib/active_job/execution.rb:37:in `block in perform_now\'\n/usr/lib64/ruby/gems/2.5.0/gems/activesupport-5.1.4/lib/active_support/callbacks.rb:108:in `block in run_callbacks\'\n/usr/lib64/ruby/gems/2.5.0/gems/i18n-0.9.1/lib/i18n.rb:265:in `with_locale\'\n/usr/lib64/ruby/gems/2.5.0/gems/activejob-5.1.4/lib/active_job/translation.rb:7:in `block (2 levels) in <module:Translation>\'\n/usr/lib64/ruby/gems/2.5.0/gems/activesupport-5.1.4/lib/active_support/callbacks.rb:117:in `instance_exec\'\n/usr/lib64/ruby/gems/2.5.0/gems/activesupport-5.1.4/lib/active_support/callbacks.rb:117:in `block in run_callbacks\'\n/usr/lib64/ruby/gems/2.5.0/gems/activejob-5.1.4/lib/active_job/logging.rb:24:in `block (4 levels) in <module:Logging>\'\n/usr/lib64/ruby/gems/2.5.0/gems/activesupport-5.1.4/lib/active_support/notifications.rb:166:in `block in instrument\'\n/usr/lib64/ruby/gems/2.5.0/gems/activesupport-5.1.4/lib/active_support/notifications/instrumenter.rb:21:in `instrument\'\n/usr/lib64/ruby/gems/2.5.0/gems/activesupport-5.1.4/lib/active_support/notifications.rb:166:in `instrument\'\n/usr/lib64/ruby/gems/2.5.0/gems/activejob-5.1.4/lib/active_job/logging.rb:23:in `block (3 levels) in <module:Logging>\'\n/usr/lib64/ruby/gems/2.5.0/gems/activejob-5.1.4/lib/active_job/logging.rb:44:in `block in tag_logger\'\n/usr/lib64/ruby/gems/2.5.0/gems/activesupport-5.1.4/lib/active_support/tagged_logging.rb:69:in `block in tagged\'\n/usr/lib64/ruby/gems/2.5.0/gems/activesupport-5.1.4/lib/active_support/tagged_logging.rb:26:in `tagged\'\n/usr/lib64/ruby/gems/2.5.0/gems/activesupport-5.1.4/lib/active_support/tagged_logging.rb:69:in `tagged\'\n/usr/lib64/ruby/gems/2.5.0/gems/activejob-5.1.4/lib/active_job/logging.rb:44:in `tag_logger\'\n/usr/lib64/ruby/gems/2.5.0/gems/activejob-5.1.4/lib/active_job/logging.rb:20:in `block (2 levels) in <module:Logging>\'\n/usr/lib64/ruby/gems/2.5.0/gems/activesupport-5.1.4/lib/active_support/callbacks.rb:117:in `instance_exec\'\n/usr/lib64/ruby/gems/2.5.0/gems/activesupport-5.1.4/lib/active_support/callbacks.rb:117:in `block in run_callbacks\'\n/usr/lib64/ruby/gems/2.5.0/gems/activesupport-5.1.4/lib/active_support/callbacks.rb:135:in `run_callbacks\'\n/usr/lib64/ruby/gems/2.5.0/gems/activejob-5.1.4/lib/active_job/execution.rb:33:in `perform_now\'\n/usr/lib64/ruby/gems/2.5.0/gems/activejob-5.1.4/lib/active_job/execution.rb:22:in `block in execute\'\n/usr/lib64/ruby/gems/2.5.0/gems/activesupport-5.1.4/lib/active_support/callbacks.rb:108:in `block in run_callbacks\'\n/usr/lib64/ruby/gems/2.5.0/gems/activejob-5.1.4/lib/active_job/railtie.rb:26:in `block (4 levels) in <class:Railtie>\'\n/usr/lib64/ruby/gems/2.5.0/gems/activesupport-5.1.4/lib/active_support/execution_wrapper.rb:85:in `wrap\'\n/usr/lib64/ruby/gems/2.5.0/gems/activesupport-5.1.4/lib/active_support/reloader.rb:68:in `block in wrap\'\n/usr/lib64/ruby/gems/2.5.0/gems/activesupport-5.1.4/lib/active_support/execution_wrapper.rb:85:in `wrap\'\n/usr/lib64/ruby/gems/2.5.0/gems/activesupport-5.1.4/lib/active_support/reloader.rb:67:in `wrap\'\n/usr/lib64/ruby/gems/2.5.0/gems/activejob-5.1.4/lib/active_job/railtie.rb:25:in `block (3 levels) in <class:Railtie>\'\n/usr/lib64/ruby/gems/2.5.0/gems/activesupport-5.1.4/lib/active_support/callbacks.rb:117:in `instance_exec\'\n/usr/lib64/ruby/gems/2.5.0/gems/activesupport-5.1.4/lib/active_support/callbacks.rb:117:in `block in run_callbacks\'\n/usr/lib64/ruby/gems/2.5.0/gems/activesupport-5.1.4/lib/active_support/callbacks.rb:135:in `run_callbacks\'\n/usr/lib64/ruby/gems/2.5.0/gems/activejob-5.1.4/lib/active_job/execution.rb:20:in `execute\'\n/usr/lib64/ruby/gems/2.5.0/gems/activejob-5.1.4/lib/active_job/queue_adapters/delayed_job_adapter.rb:36:in `perform\'\n/usr/lib64/ruby/gems/2.5.0/gems/delayed_job-4.1.4/lib/delayed/backend/base.rb:81:in `block in invoke_job\'\n/usr/lib64/ruby/gems/2.5.0/gems/airbrake-7.1.0/lib/airbrake/delayed_job.rb:11:in `block (2 levels) in <class:Airbrake>\'\n/usr/lib64/ruby/gems/2.5.0/gems/delayed_job-4.1.4/lib/delayed/lifecycle.rb:79:in `block (2 levels) in add\'\n/usr/lib64/ruby/gems/2.5.0/gems/delayed_job-4.1.4/lib/delayed/lifecycle.rb:61:in `block in initialize\'\n/usr/lib64/ruby/gems/2.5.0/gems/delayed_job-4.1.4/lib/delayed/lifecycle.rb:79:in `block in add\'\n/usr/lib64/ruby/gems/2.5.0/gems/delayed_job-4.1.4/lib/delayed/lifecycle.rb:66:in `execute\'\n/usr/lib64/ruby/gems/2.5.0/gems/delayed_job-4.1.4/lib/delayed/lifecycle.rb:40:in `run_callbacks\'\n/usr/lib64/ruby/gems/2.5.0/gems/delayed_job-4.1.4/lib/delayed/backend/base.rb:78:in `invoke_job\'\n/usr/lib64/ruby/gems/2.5.0/gems/delayed_job-4.1.4/lib/delayed/worker.rb:230:in `block (2 levels) in run\'\n/usr/lib64/ruby/2.5.0/timeout.rb:93:in `block in timeout\'\n/usr/lib64/ruby/2.5.0/timeout.rb:103:in `timeout\'\n/usr/lib64/ruby/gems/2.5.0/gems/delayed_job-4.1.4/lib/delayed/worker.rb:230:in `block in run\'\n/usr/lib64/ruby/2.5.0/benchmark.rb:308:in `realtime\'\n/usr/lib64/ruby/gems/2.5.0/gems/delayed_job-4.1.4/lib/delayed/worker.rb:229:in `run\'\n/usr/lib64/ruby/gems/2.5.0/gems/delayed_job-4.1.4/lib/delayed/worker.rb:312:in `block in reserve_and_run_one_job\'\n/usr/lib64/ruby/gems/2.5.0/gems/delayed_job-4.1.4/lib/delayed/lifecycle.rb:61:in `block in initialize\'\n/usr/lib64/ruby/gems/2.5.0/gems/delayed_job-4.1.4/lib/delayed/lifecycle.rb:66:in `execute\'\n/usr/lib64/ruby/gems/2.5.0/gems/delayed_job-4.1.4/lib/delayed/lifecycle.rb:40:in `run_callbacks\'\n/usr/lib64/ruby/gems/2.5.0/gems/delayed_job-4.1.4/lib/delayed/worker.rb:312:in `reserve_and_run_one_job\'\n/usr/lib64/ruby/gems/2.5.0/gems/delayed_job-4.1.4/lib/delayed/worker.rb:213:in `block in work_off\'\n/usr/lib64/ruby/gems/2.5.0/gems/delayed_job-4.1.4/lib/delayed/worker.rb:212:in `times\'\n/usr/lib64/ruby/gems/2.5.0/gems/delayed_job-4.1.4/lib/delayed/worker.rb:212:in `work_off\'\n/usr/lib64/ruby/gems/2.5.0/gems/delayed_job-4.1.4/lib/delayed/worker.rb:175:in `block (4 levels) in start\'\n/usr/lib64/ruby/2.5.0/benchmark.rb:308:in `realtime\'\n/usr/lib64/ruby/gems/2.5.0/gems/delayed_job-4.1.4/lib/delayed/worker.rb:174:in `block (3 levels) in start\'\n/usr/lib64/ruby/gems/2.5.0/gems/delayed_job-4.1.4/lib/delayed/lifecycle.rb:61:in `block in initialize\'\n/usr/lib64/ruby/gems/2.5.0/gems/delayed_job-4.1.4/lib/delayed/lifecycle.rb:66:in `execute\'\n/usr/lib64/ruby/gems/2.5.0/gems/delayed_job-4.1.4/lib/delayed/lifecycle.rb:40:in `run_callbacks\'\n/usr/lib64/ruby/gems/2.5.0/gems/delayed_job-4.1.4/lib/delayed/worker.rb:173:in `block (2 levels) in start\'\n/usr/lib64/ruby/gems/2.5.0/gems/delayed_job-4.1.4/lib/delayed/worker.rb:172:in `loop\'\n/usr/lib64/ruby/gems/2.5.0/gems/delayed_job-4.1.4/lib/delayed/worker.rb:172:in `block in start\'\n/usr/lib64/ruby/gems/2.5.0/gems/delayed_job-4.1.4/lib/delayed/plugins/clear_locks.rb:7:in `block (2 levels) in <class:ClearLocks>\'\n/usr/lib64/ruby/gems/2.5.0/gems/delayed_job-4.1.4/lib/delayed/lifecycle.rb:79:in `block (2 levels) in add\'\n/usr/lib64/ruby/gems/2.5.0/gems/delayed_job-4.1.4/lib/delayed/lifecycle.rb:61:in `block in initialize\'\n/usr/lib64/ruby/gems/2.5.0/gems/delayed_job-4.1.4/lib/delayed/lifecycle.rb:79:in `block in add\'\n/usr/lib64/ruby/gems/2.5.0/gems/delayed_job-4.1.4/lib/delayed/lifecycle.rb:66:in `execute\'\n/usr/lib64/ruby/gems/2.5.0/gems/delayed_job-4.1.4/lib/delayed/lifecycle.rb:40:in `run_callbacks\'\n/usr/lib64/ruby/gems/2.5.0/gems/delayed_job-4.1.4/lib/delayed/worker.rb:171:in `start\'\n/usr/lib64/ruby/gems/2.5.0/gems/delayed_job-4.1.4/lib/delayed/command.rb:137:in `run\'\n/usr/lib64/ruby/gems/2.5.0/gems/delayed_job-4.1.4/lib/delayed/command.rb:125:in `block in run_process\'\n/usr/lib64/ruby/gems/2.5.0/gems/daemons-1.2.6/lib/daemons/application.rb:270:in `block in start_proc\'\n/usr/lib64/ruby/gems/2.5.0/gems/daemons-1.2.6/lib/daemons/daemonize.rb:84:in `call_as_daemon\'\n/usr/lib64/ruby/gems/2.5.0/gems/daemons-1.2.6/lib/daemons/application.rb:274:in `start_proc\'\n/usr/lib64/ruby/gems/2.5.0/gems/daemons-1.2.6/lib/daemons/application.rb:300:in `start\'\n/usr/lib64/ruby/gems/2.5.0/gems/daemons-1.2.6/lib/daemons/controller.rb:56:in `run\'\n/usr/lib64/ruby/gems/2.5.0/gems/daemons-1.2.6/lib/daemons.rb:197:in `block in run_proc\'\n/usr/lib64/ruby/gems/2.5.0/gems/daemons-1.2.6/lib/daemons/cmdline.rb:92:in `catch_exceptions\'\n/usr/lib64/ruby/gems/2.5.0/gems/daemons-1.2.6/lib/daemons.rb:196:in `run_proc\'\n/usr/lib64/ruby/gems/2.5.0/gems/delayed_job-4.1.4/lib/delayed/command.rb:123:in `run_process\'\n/usr/lib64/ruby/gems/2.5.0/gems/delayed_job-4.1.4/lib/delayed/command.rb:104:in `block in daemonize\'\n/usr/lib64/ruby/gems/2.5.0/gems/delayed_job-4.1.4/lib/delayed/command.rb:102:in `times\'\n/usr/lib64/ruby/gems/2.5.0/gems/delayed_job-4.1.4/lib/delayed/command.rb:102:in `daemonize\'\nscript/delayed_job.api.rb:5:in `<main>\'','2019-01-08 12:54:58',NULL,NULL,NULL,'quick'),(72,0,5,'--- !ruby/object:ActiveJob::QueueAdapters::DelayedJobAdapter::JobWrapper\njob_data:\n  job_class: FullTextIndexJob\n  job_id: 5b4159d7-1fa7-42fa-8b57-5f433c7fd79a\n  provider_job_id: \n  queue_name: quick\n  priority: \n  arguments: []\n  executions: 0\n  locale: en\n','exit\n/usr/lib64/ruby/gems/2.5.0/gems/thinking-sphinx-3.4.2/lib/thinking_sphinx/commands/base.rb:33:in `exit\'\n/usr/lib64/ruby/gems/2.5.0/gems/thinking-sphinx-3.4.2/lib/thinking_sphinx/commands/base.rb:33:in `handle_failure\'\n/usr/lib64/ruby/gems/2.5.0/gems/thinking-sphinx-3.4.2/lib/thinking_sphinx/commands/base.rb:11:in `rescue in call_with_handling\'\n/usr/lib64/ruby/gems/2.5.0/gems/thinking-sphinx-3.4.2/lib/thinking_sphinx/commands/base.rb:8:in `call_with_handling\'\n/usr/lib64/ruby/gems/2.5.0/gems/thinking-sphinx-3.4.2/lib/thinking_sphinx/commands/base.rb:5:in `call\'\n/usr/lib64/ruby/gems/2.5.0/gems/thinking-sphinx-3.4.2/lib/thinking_sphinx/interfaces/sql.rb:31:in `index\'\n/srv/www/obs/api/app/jobs/full_text_index_job.rb:12:in `block in perform\'\n/usr/lib64/ruby/gems/2.5.0/gems/activerecord-5.1.4/lib/active_record/connection_adapters/abstract/connection_pool.rb:408:in `with_connection\'\n/srv/www/obs/api/app/jobs/full_text_index_job.rb:8:in `perform\'\n/usr/lib64/ruby/gems/2.5.0/gems/activejob-5.1.4/lib/active_job/execution.rb:37:in `block in perform_now\'\n/usr/lib64/ruby/gems/2.5.0/gems/activesupport-5.1.4/lib/active_support/callbacks.rb:108:in `block in run_callbacks\'\n/usr/lib64/ruby/gems/2.5.0/gems/i18n-0.9.1/lib/i18n.rb:265:in `with_locale\'\n/usr/lib64/ruby/gems/2.5.0/gems/activejob-5.1.4/lib/active_job/translation.rb:7:in `block (2 levels) in <module:Translation>\'\n/usr/lib64/ruby/gems/2.5.0/gems/activesupport-5.1.4/lib/active_support/callbacks.rb:117:in `instance_exec\'\n/usr/lib64/ruby/gems/2.5.0/gems/activesupport-5.1.4/lib/active_support/callbacks.rb:117:in `block in run_callbacks\'\n/usr/lib64/ruby/gems/2.5.0/gems/activejob-5.1.4/lib/active_job/logging.rb:24:in `block (4 levels) in <module:Logging>\'\n/usr/lib64/ruby/gems/2.5.0/gems/activesupport-5.1.4/lib/active_support/notifications.rb:166:in `block in instrument\'\n/usr/lib64/ruby/gems/2.5.0/gems/activesupport-5.1.4/lib/active_support/notifications/instrumenter.rb:21:in `instrument\'\n/usr/lib64/ruby/gems/2.5.0/gems/activesupport-5.1.4/lib/active_support/notifications.rb:166:in `instrument\'\n/usr/lib64/ruby/gems/2.5.0/gems/activejob-5.1.4/lib/active_job/logging.rb:23:in `block (3 levels) in <module:Logging>\'\n/usr/lib64/ruby/gems/2.5.0/gems/activejob-5.1.4/lib/active_job/logging.rb:44:in `block in tag_logger\'\n/usr/lib64/ruby/gems/2.5.0/gems/activesupport-5.1.4/lib/active_support/tagged_logging.rb:69:in `block in tagged\'\n/usr/lib64/ruby/gems/2.5.0/gems/activesupport-5.1.4/lib/active_support/tagged_logging.rb:26:in `tagged\'\n/usr/lib64/ruby/gems/2.5.0/gems/activesupport-5.1.4/lib/active_support/tagged_logging.rb:69:in `tagged\'\n/usr/lib64/ruby/gems/2.5.0/gems/activejob-5.1.4/lib/active_job/logging.rb:44:in `tag_logger\'\n/usr/lib64/ruby/gems/2.5.0/gems/activejob-5.1.4/lib/active_job/logging.rb:20:in `block (2 levels) in <module:Logging>\'\n/usr/lib64/ruby/gems/2.5.0/gems/activesupport-5.1.4/lib/active_support/callbacks.rb:117:in `instance_exec\'\n/usr/lib64/ruby/gems/2.5.0/gems/activesupport-5.1.4/lib/active_support/callbacks.rb:117:in `block in run_callbacks\'\n/usr/lib64/ruby/gems/2.5.0/gems/activesupport-5.1.4/lib/active_support/callbacks.rb:135:in `run_callbacks\'\n/usr/lib64/ruby/gems/2.5.0/gems/activejob-5.1.4/lib/active_job/execution.rb:33:in `perform_now\'\n/usr/lib64/ruby/gems/2.5.0/gems/activejob-5.1.4/lib/active_job/execution.rb:22:in `block in execute\'\n/usr/lib64/ruby/gems/2.5.0/gems/activesupport-5.1.4/lib/active_support/callbacks.rb:108:in `block in run_callbacks\'\n/usr/lib64/ruby/gems/2.5.0/gems/activejob-5.1.4/lib/active_job/railtie.rb:26:in `block (4 levels) in <class:Railtie>\'\n/usr/lib64/ruby/gems/2.5.0/gems/activesupport-5.1.4/lib/active_support/execution_wrapper.rb:85:in `wrap\'\n/usr/lib64/ruby/gems/2.5.0/gems/activesupport-5.1.4/lib/active_support/reloader.rb:68:in `block in wrap\'\n/usr/lib64/ruby/gems/2.5.0/gems/activesupport-5.1.4/lib/active_support/execution_wrapper.rb:85:in `wrap\'\n/usr/lib64/ruby/gems/2.5.0/gems/activesupport-5.1.4/lib/active_support/reloader.rb:67:in `wrap\'\n/usr/lib64/ruby/gems/2.5.0/gems/activejob-5.1.4/lib/active_job/railtie.rb:25:in `block (3 levels) in <class:Railtie>\'\n/usr/lib64/ruby/gems/2.5.0/gems/activesupport-5.1.4/lib/active_support/callbacks.rb:117:in `instance_exec\'\n/usr/lib64/ruby/gems/2.5.0/gems/activesupport-5.1.4/lib/active_support/callbacks.rb:117:in `block in run_callbacks\'\n/usr/lib64/ruby/gems/2.5.0/gems/activesupport-5.1.4/lib/active_support/callbacks.rb:135:in `run_callbacks\'\n/usr/lib64/ruby/gems/2.5.0/gems/activejob-5.1.4/lib/active_job/execution.rb:20:in `execute\'\n/usr/lib64/ruby/gems/2.5.0/gems/activejob-5.1.4/lib/active_job/queue_adapters/delayed_job_adapter.rb:36:in `perform\'\n/usr/lib64/ruby/gems/2.5.0/gems/delayed_job-4.1.4/lib/delayed/backend/base.rb:81:in `block in invoke_job\'\n/usr/lib64/ruby/gems/2.5.0/gems/airbrake-7.1.0/lib/airbrake/delayed_job.rb:11:in `block (2 levels) in <class:Airbrake>\'\n/usr/lib64/ruby/gems/2.5.0/gems/delayed_job-4.1.4/lib/delayed/lifecycle.rb:79:in `block (2 levels) in add\'\n/usr/lib64/ruby/gems/2.5.0/gems/delayed_job-4.1.4/lib/delayed/lifecycle.rb:61:in `block in initialize\'\n/usr/lib64/ruby/gems/2.5.0/gems/delayed_job-4.1.4/lib/delayed/lifecycle.rb:79:in `block in add\'\n/usr/lib64/ruby/gems/2.5.0/gems/delayed_job-4.1.4/lib/delayed/lifecycle.rb:66:in `execute\'\n/usr/lib64/ruby/gems/2.5.0/gems/delayed_job-4.1.4/lib/delayed/lifecycle.rb:40:in `run_callbacks\'\n/usr/lib64/ruby/gems/2.5.0/gems/delayed_job-4.1.4/lib/delayed/backend/base.rb:78:in `invoke_job\'\n/usr/lib64/ruby/gems/2.5.0/gems/delayed_job-4.1.4/lib/delayed/worker.rb:230:in `block (2 levels) in run\'\n/usr/lib64/ruby/2.5.0/timeout.rb:93:in `block in timeout\'\n/usr/lib64/ruby/2.5.0/timeout.rb:103:in `timeout\'\n/usr/lib64/ruby/gems/2.5.0/gems/delayed_job-4.1.4/lib/delayed/worker.rb:230:in `block in run\'\n/usr/lib64/ruby/2.5.0/benchmark.rb:308:in `realtime\'\n/usr/lib64/ruby/gems/2.5.0/gems/delayed_job-4.1.4/lib/delayed/worker.rb:229:in `run\'\n/usr/lib64/ruby/gems/2.5.0/gems/delayed_job-4.1.4/lib/delayed/worker.rb:312:in `block in reserve_and_run_one_job\'\n/usr/lib64/ruby/gems/2.5.0/gems/delayed_job-4.1.4/lib/delayed/lifecycle.rb:61:in `block in initialize\'\n/usr/lib64/ruby/gems/2.5.0/gems/delayed_job-4.1.4/lib/delayed/lifecycle.rb:66:in `execute\'\n/usr/lib64/ruby/gems/2.5.0/gems/delayed_job-4.1.4/lib/delayed/lifecycle.rb:40:in `run_callbacks\'\n/usr/lib64/ruby/gems/2.5.0/gems/delayed_job-4.1.4/lib/delayed/worker.rb:312:in `reserve_and_run_one_job\'\n/usr/lib64/ruby/gems/2.5.0/gems/delayed_job-4.1.4/lib/delayed/worker.rb:213:in `block in work_off\'\n/usr/lib64/ruby/gems/2.5.0/gems/delayed_job-4.1.4/lib/delayed/worker.rb:212:in `times\'\n/usr/lib64/ruby/gems/2.5.0/gems/delayed_job-4.1.4/lib/delayed/worker.rb:212:in `work_off\'\n/usr/lib64/ruby/gems/2.5.0/gems/delayed_job-4.1.4/lib/delayed/worker.rb:175:in `block (4 levels) in start\'\n/usr/lib64/ruby/2.5.0/benchmark.rb:308:in `realtime\'\n/usr/lib64/ruby/gems/2.5.0/gems/delayed_job-4.1.4/lib/delayed/worker.rb:174:in `block (3 levels) in start\'\n/usr/lib64/ruby/gems/2.5.0/gems/delayed_job-4.1.4/lib/delayed/lifecycle.rb:61:in `block in initialize\'\n/usr/lib64/ruby/gems/2.5.0/gems/delayed_job-4.1.4/lib/delayed/lifecycle.rb:66:in `execute\'\n/usr/lib64/ruby/gems/2.5.0/gems/delayed_job-4.1.4/lib/delayed/lifecycle.rb:40:in `run_callbacks\'\n/usr/lib64/ruby/gems/2.5.0/gems/delayed_job-4.1.4/lib/delayed/worker.rb:173:in `block (2 levels) in start\'\n/usr/lib64/ruby/gems/2.5.0/gems/delayed_job-4.1.4/lib/delayed/worker.rb:172:in `loop\'\n/usr/lib64/ruby/gems/2.5.0/gems/delayed_job-4.1.4/lib/delayed/worker.rb:172:in `block in start\'\n/usr/lib64/ruby/gems/2.5.0/gems/delayed_job-4.1.4/lib/delayed/plugins/clear_locks.rb:7:in `block (2 levels) in <class:ClearLocks>\'\n/usr/lib64/ruby/gems/2.5.0/gems/delayed_job-4.1.4/lib/delayed/lifecycle.rb:79:in `block (2 levels) in add\'\n/usr/lib64/ruby/gems/2.5.0/gems/delayed_job-4.1.4/lib/delayed/lifecycle.rb:61:in `block in initialize\'\n/usr/lib64/ruby/gems/2.5.0/gems/delayed_job-4.1.4/lib/delayed/lifecycle.rb:79:in `block in add\'\n/usr/lib64/ruby/gems/2.5.0/gems/delayed_job-4.1.4/lib/delayed/lifecycle.rb:66:in `execute\'\n/usr/lib64/ruby/gems/2.5.0/gems/delayed_job-4.1.4/lib/delayed/lifecycle.rb:40:in `run_callbacks\'\n/usr/lib64/ruby/gems/2.5.0/gems/delayed_job-4.1.4/lib/delayed/worker.rb:171:in `start\'\n/usr/lib64/ruby/gems/2.5.0/gems/delayed_job-4.1.4/lib/delayed/command.rb:137:in `run\'\n/usr/lib64/ruby/gems/2.5.0/gems/delayed_job-4.1.4/lib/delayed/command.rb:125:in `block in run_process\'\n/usr/lib64/ruby/gems/2.5.0/gems/daemons-1.2.6/lib/daemons/application.rb:270:in `block in start_proc\'\n/usr/lib64/ruby/gems/2.5.0/gems/daemons-1.2.6/lib/daemons/daemonize.rb:84:in `call_as_daemon\'\n/usr/lib64/ruby/gems/2.5.0/gems/daemons-1.2.6/lib/daemons/application.rb:274:in `start_proc\'\n/usr/lib64/ruby/gems/2.5.0/gems/daemons-1.2.6/lib/daemons/application.rb:300:in `start\'\n/usr/lib64/ruby/gems/2.5.0/gems/daemons-1.2.6/lib/daemons/controller.rb:56:in `run\'\n/usr/lib64/ruby/gems/2.5.0/gems/daemons-1.2.6/lib/daemons.rb:197:in `block in run_proc\'\n/usr/lib64/ruby/gems/2.5.0/gems/daemons-1.2.6/lib/daemons/cmdline.rb:92:in `catch_exceptions\'\n/usr/lib64/ruby/gems/2.5.0/gems/daemons-1.2.6/lib/daemons.rb:196:in `run_proc\'\n/usr/lib64/ruby/gems/2.5.0/gems/delayed_job-4.1.4/lib/delayed/command.rb:123:in `run_process\'\n/usr/lib64/ruby/gems/2.5.0/gems/delayed_job-4.1.4/lib/delayed/command.rb:104:in `block in daemonize\'\n/usr/lib64/ruby/gems/2.5.0/gems/delayed_job-4.1.4/lib/delayed/command.rb:102:in `times\'\n/usr/lib64/ruby/gems/2.5.0/gems/delayed_job-4.1.4/lib/delayed/command.rb:102:in `daemonize\'\nscript/delayed_job.api.rb:5:in `<main>\'','2019-01-08 12:50:42',NULL,NULL,NULL,'quick');
/*!40000 ALTER TABLE `delayed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `distribution_icons`
--

DROP TABLE IF EXISTS `distribution_icons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `distribution_icons` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `width` int(11) DEFAULT NULL,
  `height` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `distribution_icons`
--

LOCK TABLES `distribution_icons` WRITE;
/*!40000 ALTER TABLE `distribution_icons` DISABLE KEYS */;
/*!40000 ALTER TABLE `distribution_icons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `distribution_icons_distributions`
--

DROP TABLE IF EXISTS `distribution_icons_distributions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `distribution_icons_distributions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `distribution_id` int(11) DEFAULT NULL,
  `distribution_icon_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `distribution_icons_distributions`
--

LOCK TABLES `distribution_icons_distributions` WRITE;
/*!40000 ALTER TABLE `distribution_icons_distributions` DISABLE KEYS */;
/*!40000 ALTER TABLE `distribution_icons_distributions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `distributions`
--

DROP TABLE IF EXISTS `distributions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `distributions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vendor` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `project` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `reponame` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `repository` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `link` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `distributions`
--

LOCK TABLES `distributions` WRITE;
/*!40000 ALTER TABLE `distributions` DISABLE KEYS */;
/*!40000 ALTER TABLE `distributions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `download_repositories`
--

DROP TABLE IF EXISTS `download_repositories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `download_repositories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `repository_id` int(11) NOT NULL,
  `arch` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `repotype` varchar(255) DEFAULT NULL,
  `archfilter` varchar(255) DEFAULT NULL,
  `masterurl` varchar(255) DEFAULT NULL,
  `mastersslfingerprint` varchar(255) DEFAULT NULL,
  `pubkey` text,
  PRIMARY KEY (`id`),
  KEY `repository_id` (`repository_id`),
  CONSTRAINT `download_repositories_ibfk_1` FOREIGN KEY (`repository_id`) REFERENCES `repositories` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `download_repositories`
--

LOCK TABLES `download_repositories` WRITE;
/*!40000 ALTER TABLE `download_repositories` DISABLE KEYS */;
INSERT INTO `download_repositories` VALUES (1,2,'armv8el','https://releases.jolla.com/releases/2.2.1.18/jolla/armv7hl/','rpmmd',NULL,NULL,NULL,NULL),(2,3,'i586','https://releases.jolla.com/releases/2.2.1.18/jolla/i486/','rpmmd',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `download_repositories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `downloads`
--

DROP TABLE IF EXISTS `downloads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `downloads` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `baseurl` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `metafile` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `mtype` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `architecture_id` int(11) DEFAULT NULL,
  `db_project_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_downloads_on_db_project_id` (`db_project_id`),
  KEY `index_downloads_on_architecture_id` (`architecture_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `downloads`
--

LOCK TABLES `downloads` WRITE;
/*!40000 ALTER TABLE `downloads` DISABLE KEYS */;
/*!40000 ALTER TABLE `downloads` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event_subscriptions`
--

DROP TABLE IF EXISTS `event_subscriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event_subscriptions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `eventtype` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `receiver_role` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `group_id` int(11) DEFAULT NULL,
  `channel` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `index_event_subscriptions_on_user_id` (`user_id`),
  KEY `index_event_subscriptions_on_group_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_subscriptions`
--

LOCK TABLES `event_subscriptions` WRITE;
/*!40000 ALTER TABLE `event_subscriptions` DISABLE KEYS */;
/*!40000 ALTER TABLE `event_subscriptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `events`
--

DROP TABLE IF EXISTS `events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `events` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `eventtype` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `payload` text COLLATE utf8_unicode_ci,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `undone_jobs` int(11) DEFAULT '0',
  `mails_sent` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `index_events_on_eventtype` (`eventtype`),
  KEY `index_events_on_created_at` (`created_at`),
  KEY `index_events_on_mails_sent` (`mails_sent`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `events`
--

LOCK TABLES `events` WRITE;
/*!40000 ALTER TABLE `events` DISABLE KEYS */;
INSERT INTO `events` VALUES (1,'Event::CreateProject','{\"project\":\"sailfishos:2.2.1.18:armv7hl\",\"sender\":\"Admin\"}','2019-01-08 07:44:42','2019-01-08 07:45:07.056417',0,1),(2,'Event::CreateProject','{\"project\":\"sailfishos:2.2.1.18:i486\",\"sender\":\"Admin\"}','2019-01-08 07:44:54','2019-01-08 07:45:07.064935',0,1),(3,'Event::CreateProject','{\"project\":\"sailfishos:2.2.1.18\",\"sender\":\"Admin\"}','2019-01-08 07:44:54','2019-01-08 07:45:07.069481',0,1),(4,'Event::UpdateProject','{\"project\":\"sailfishos:2.2.1.18\",\"sender\":\"Admin\"}','2019-01-08 07:44:54','2019-01-08 07:45:07.074488',0,1),(5,'Event::UpdateProjectConfig','{\"project\":\"sailfishos:2.2.1.18\",\"sender\":\"Admin\"}','2019-01-08 07:44:54','2019-01-08 07:45:07.079798',0,1),(6,'Event::CreatePackage','{\"project\":\"sailfishos:2.2.1.18\",\"package\":\"sb2-tools-qt5-armv7hl\",\"sender\":\"Admin\"}','2019-01-08 07:44:54','2019-01-08 07:45:07.084993',0,1),(7,'Event::UpdatePackage','{\"project\":\"sailfishos:2.2.1.18\",\"package\":\"sb2-tools-qt5-armv7hl\",\"sender\":\"Admin\"}','2019-01-08 07:44:54','2019-01-08 07:45:07.089541',0,1),(8,'Event::Commit','{\"project\":\"sailfishos:2.2.1.18\",\"package\":\"sb2-tools-qt5-armv7hl\",\"comment\":\"osc copypac from project:sailfishos:2.2.1.18 package:sb2-tools-qt5-armv7hl revision:3, using expand, using client side copy\",\"user\":\"Admin\",\"files\":\"Added:\\n  _service\\n\\n\",\"rev\":\"1\"}','2019-01-08 07:44:54','2019-01-08 07:45:07.094295',0,1),(9,'Event::UpdatePackage','{\"project\":\"sailfishos:2.2.1.18\",\"package\":\"sb2-tools-qt5-armv7hl\",\"sender\":\"Admin\"}','2019-01-08 07:44:54','2019-01-08 07:45:07.099764',0,1),(10,'Event::ServiceSuccess','{\"project\":\"sailfishos:2.2.1.18\",\"package\":\"sb2-tools-qt5-armv7hl\",\"comment\":\"osc copypac from project:sailfishos:2.2.1.18 package:sb2-tools-qt5-armv7hl revision:3, using expand, using client side copy\",\"rev\":\"1\",\"user\":\"Admin\"}','2019-01-08 07:44:54','2019-01-08 07:45:07.163488',0,1),(11,'Event::CreatePackage','{\"project\":\"sailfishos:2.2.1.18\",\"package\":\"sb2-tools-armv7hl\",\"sender\":\"Admin\"}','2019-01-08 07:44:54','2019-01-08 07:45:07.168973',0,1),(12,'Event::UpdatePackage','{\"project\":\"sailfishos:2.2.1.18\",\"package\":\"sb2-tools-armv7hl\",\"sender\":\"Admin\"}','2019-01-08 07:45:11','2019-01-08 07:45:37.227491',0,1),(13,'Event::Commit','{\"project\":\"sailfishos:2.2.1.18\",\"package\":\"sb2-tools-armv7hl\",\"comment\":\"osc copypac from project:sailfishos:2.2.1.18 package:sb2-tools-armv7hl revision:3, using expand, using client side copy\",\"user\":\"Admin\",\"files\":\"Added:\\n  _service\\n\\n\",\"rev\":\"1\"}','2019-01-08 07:45:11','2019-01-08 07:45:37.239633',0,1),(14,'Event::UpdatePackage','{\"project\":\"sailfishos:2.2.1.18\",\"package\":\"sb2-tools-armv7hl\",\"sender\":\"Admin\"}','2019-01-08 07:45:11','2019-01-08 07:45:37.251600',0,1),(15,'Event::ServiceSuccess','{\"project\":\"sailfishos:2.2.1.18\",\"package\":\"sb2-tools-armv7hl\",\"comment\":\"osc copypac from project:sailfishos:2.2.1.18 package:sb2-tools-armv7hl revision:3, using expand, using client side copy\",\"rev\":\"1\",\"user\":\"Admin\"}','2019-01-08 07:45:11','2019-01-08 07:45:37.291994',0,1);
/*!40000 ALTER TABLE `events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flags`
--

DROP TABLE IF EXISTS `flags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `flags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` enum('enable','disable') CHARACTER SET utf8 NOT NULL,
  `repo` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `project_id` int(11) DEFAULT NULL,
  `package_id` int(11) DEFAULT NULL,
  `architecture_id` int(11) DEFAULT NULL,
  `position` int(11) NOT NULL,
  `flag` enum('useforbuild','sourceaccess','binarydownload','debuginfo','build','publish','access','lock') CHARACTER SET utf8 NOT NULL,
  `pkgname` tinyblob,
  PRIMARY KEY (`id`),
  KEY `index_flags_on_flag` (`flag`),
  KEY `architecture_id` (`architecture_id`),
  KEY `index_flags_on_package_id` (`package_id`),
  KEY `index_flags_on_project_id` (`project_id`),
  CONSTRAINT `flags_ibfk_3` FOREIGN KEY (`architecture_id`) REFERENCES `architectures` (`id`),
  CONSTRAINT `flags_ibfk_4` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`),
  CONSTRAINT `flags_ibfk_5` FOREIGN KEY (`package_id`) REFERENCES `packages` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flags`
--

LOCK TABLES `flags` WRITE;
/*!40000 ALTER TABLE `flags` DISABLE KEYS */;
INSERT INTO `flags` VALUES (3,'enable','latest_armv7hl',4,NULL,12,1,'build','sb2-tools-armv7hl'),(4,'disable',NULL,4,NULL,NULL,2,'publish',NULL);
/*!40000 ALTER TABLE `flags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group_maintainers`
--

DROP TABLE IF EXISTS `group_maintainers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `group_maintainers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `group_id` (`group_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `group_maintainers_ibfk_1` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`),
  CONSTRAINT `group_maintainers_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group_maintainers`
--

LOCK TABLES `group_maintainers` WRITE;
/*!40000 ALTER TABLE `group_maintainers` DISABLE KEYS */;
/*!40000 ALTER TABLE `group_maintainers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group_request_requests`
--

DROP TABLE IF EXISTS `group_request_requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `group_request_requests` (
  `bs_request_action_group_id` int(11) DEFAULT NULL,
  `bs_request_id` int(11) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  KEY `index_group_request_requests_on_bs_request_id` (`bs_request_id`),
  KEY `index_group_request_requests_on_bs_request_action_group_id` (`bs_request_action_group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group_request_requests`
--

LOCK TABLES `group_request_requests` WRITE;
/*!40000 ALTER TABLE `group_request_requests` DISABLE KEYS */;
/*!40000 ALTER TABLE `group_request_requests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `groups`
--

DROP TABLE IF EXISTS `groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `title` varchar(200) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `parent_id` int(11) DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `groups_parent_id_index` (`parent_id`),
  KEY `index_groups_on_title` (`title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groups`
--

LOCK TABLES `groups` WRITE;
/*!40000 ALTER TABLE `groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `groups_roles`
--

DROP TABLE IF EXISTS `groups_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `groups_roles` (
  `group_id` int(11) NOT NULL DEFAULT '0',
  `role_id` int(11) NOT NULL DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  UNIQUE KEY `groups_roles_all_index` (`group_id`,`role_id`),
  KEY `role_id` (`role_id`),
  CONSTRAINT `groups_roles_ibfk_1` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`),
  CONSTRAINT `groups_roles_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groups_roles`
--

LOCK TABLES `groups_roles` WRITE;
/*!40000 ALTER TABLE `groups_roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `groups_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `groups_users`
--

DROP TABLE IF EXISTS `groups_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `groups_users` (
  `group_id` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `email` tinyint(1) DEFAULT '1',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  UNIQUE KEY `groups_users_all_index` (`group_id`,`user_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `groups_users_ibfk_1` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`),
  CONSTRAINT `groups_users_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groups_users`
--

LOCK TABLES `groups_users` WRITE;
/*!40000 ALTER TABLE `groups_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `groups_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `history_elements`
--

DROP TABLE IF EXISTS `history_elements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `history_elements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL,
  `op_object_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  `description_extension` varchar(255) DEFAULT NULL,
  `comment` text,
  PRIMARY KEY (`id`),
  KEY `index_history_elements_on_created_at` (`created_at`),
  KEY `index_history_elements_on_type` (`type`),
  KEY `index_search` (`op_object_id`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `history_elements`
--

LOCK TABLES `history_elements` WRITE;
/*!40000 ALTER TABLE `history_elements` DISABLE KEYS */;
/*!40000 ALTER TABLE `history_elements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `incident_counter`
--

DROP TABLE IF EXISTS `incident_counter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `incident_counter` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `maintenance_db_project_id` int(11) DEFAULT NULL,
  `counter` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `incident_counter`
--

LOCK TABLES `incident_counter` WRITE;
/*!40000 ALTER TABLE `incident_counter` DISABLE KEYS */;
/*!40000 ALTER TABLE `incident_counter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `incident_updateinfo_counter_values`
--

DROP TABLE IF EXISTS `incident_updateinfo_counter_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `incident_updateinfo_counter_values` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `updateinfo_counter_id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `value` int(11) NOT NULL,
  `released_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uniq_id_index` (`updateinfo_counter_id`,`project_id`),
  KEY `project_id` (`project_id`),
  CONSTRAINT `incident_updateinfo_counter_values_ibfk_1` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `incident_updateinfo_counter_values`
--

LOCK TABLES `incident_updateinfo_counter_values` WRITE;
/*!40000 ALTER TABLE `incident_updateinfo_counter_values` DISABLE KEYS */;
/*!40000 ALTER TABLE `incident_updateinfo_counter_values` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `issue_trackers`
--

DROP TABLE IF EXISTS `issue_trackers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `issue_trackers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 NOT NULL,
  `kind` enum('other','bugzilla','cve','fate','trac','launchpad','sourceforge','github') COLLATE utf8_bin NOT NULL,
  `description` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `url` varchar(255) CHARACTER SET utf8 NOT NULL,
  `show_url` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `regex` varchar(255) CHARACTER SET utf8 NOT NULL,
  `user` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `label` text CHARACTER SET utf8 NOT NULL,
  `issues_updated` datetime NOT NULL,
  `enable_fetch` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `issue_trackers`
--

LOCK TABLES `issue_trackers` WRITE;
/*!40000 ALTER TABLE `issue_trackers` DISABLE KEYS */;
INSERT INTO `issue_trackers` VALUES (1,'boost','trac','Boost Trac','https://svn.boost.org/trac/boost/','https://svn.boost.org/trac/boost/ticket/@@@','boost#(\\d+)',NULL,NULL,'boost#@@@','2019-01-08 07:34:32',0),(2,'bco','bugzilla','Clutter Project Bugzilla','http://bugzilla.clutter-project.org/','http://bugzilla.clutter-project.org/show_bug.cgi?id=@@@','bco#(\\d+)',NULL,NULL,'bco#@@@','2019-01-08 07:34:32',0),(3,'RT','other','CPAN Bugs','https://rt.cpan.org/','http://rt.cpan.org/Public/Bug/Display.html?id=@@@','RT#(\\d+)',NULL,NULL,'RT#@@@','2019-01-08 07:34:32',0),(4,'cve','cve','CVE Numbers','http://cve.mitre.org/','http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-@@@','(?:cve|CVE)-(\\d\\d\\d\\d-\\d+)',NULL,NULL,'CVE-@@@','2019-01-08 07:34:32',0),(5,'deb','bugzilla','Debian Bugzilla','http://bugs.debian.org/','http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=@@@','deb#(\\d+)',NULL,NULL,'deb#@@@','2019-01-08 07:34:32',0),(6,'fdo','bugzilla','Freedesktop.org Bugzilla','https://bugs.freedesktop.org/','https://bugs.freedesktop.org/show_bug.cgi?id=@@@','fdo#(\\d+)',NULL,NULL,'fdo#@@@','2019-01-08 07:34:32',0),(7,'GCC','bugzilla','GCC Bugzilla','http://gcc.gnu.org/bugzilla/','http://gcc.gnu.org/bugzilla/show_bug.cgi?id=@@@','GCC#(\\d+)',NULL,NULL,'GCC#@@@','2019-01-08 07:34:32',0),(8,'bgo','bugzilla','Gnome Bugzilla','https://bugzilla.gnome.org/','https://bugzilla.gnome.org/show_bug.cgi?id=@@@','bgo#(\\d+)',NULL,NULL,'bgo#@@@','2019-01-08 07:34:32',0),(9,'bio','bugzilla','Icculus.org Bugzilla','https://bugzilla.icculus.org/','https://bugzilla.icculus.org/show_bug.cgi?id=@@@','bio#(\\d+)',NULL,NULL,'bio#@@@','2019-01-08 07:34:32',0),(10,'bko','bugzilla','Kernel.org Bugzilla','https://bugzilla.kernel.org/','https://bugzilla.kernel.org/show_bug.cgi?id=@@@','(?:Kernel|K|bko)#(\\d+)',NULL,NULL,'bko#@@@','2019-01-08 07:34:32',0),(11,'kde','bugzilla','KDE Bugzilla','https://bugs.kde.org/','https://bugs.kde.org/show_bug.cgi?id=@@@','kde#(\\d+)',NULL,NULL,'kde#@@@','2019-01-08 07:34:32',0),(12,'lp','launchpad','Launchpad.net Bugtracker','https://bugs.launchpad.net/bugs/','https://bugs.launchpad.net/bugs/@@@','b?lp#(\\d+)',NULL,NULL,'lp#@@@','2019-01-08 07:34:32',0),(13,'Meego','bugzilla','Meego Bugs','https://bugs.meego.com/','https://bugs.meego.com/show_bug.cgi?id=@@@','Meego#(\\d+)',NULL,NULL,'Meego#@@@','2019-01-08 07:34:32',0),(14,'bmo','bugzilla','Mozilla Bugzilla','https://bugzilla.mozilla.org/','https://bugzilla.mozilla.org/show_bug.cgi?id=@@@','bmo#(\\d+)',NULL,NULL,'bmo#@@@','2019-01-08 07:34:32',0),(15,'bnc','bugzilla','Novell Bugzilla','https://bugzilla.novell.com/','https://bugzilla.novell.com/show_bug.cgi?id=@@@','(?:bnc|BNC)\\s*[#:]\\s*(\\d+)',NULL,NULL,'bnc#@@@','2019-01-08 12:33:34',1),(16,'ITS','other','OpenLDAP Issue Tracker','http://www.openldap.org/its/','http://www.openldap.org/its/index.cgi/Contrib?id=@@@','ITS#(\\d+)',NULL,NULL,'ITS#@@@','2019-01-08 07:34:32',0),(17,'i','bugzilla','OpenOffice.org Bugzilla','http://openoffice.org/bugzilla/','http://openoffice.org/bugzilla/show_bug.cgi?id=@@@','i#(\\d+)',NULL,NULL,'boost#@@@','2019-01-08 07:34:32',0),(18,'fate','fate','openSUSE Feature Database','https://features.opensuse.org/','https://features.opensuse.org/@@@','(?:fate|Fate|FATE)\\s*#\\s*(\\d+)',NULL,NULL,'fate#@@@','2019-01-08 07:34:32',0),(19,'rh','bugzilla','RedHat Bugzilla','https://bugzilla.redhat.com/','https://bugzilla.redhat.com/show_bug.cgi?id=@@@','rh#(\\d+)',NULL,NULL,'rh#@@@','2019-01-08 07:34:32',0),(20,'bso','bugzilla','Samba Bugzilla','https://bugzilla.samba.org/','https://bugzilla.samba.org/show_bug.cgi?id=@@@','bso#(\\d+)',NULL,NULL,'bso#@@@','2019-01-08 07:34:32',0),(21,'sf','sourceforge','SourceForge.net Tracker','http://sf.net/support/','http://sf.net/support/tracker.php?aid=@@@','sf#(\\d+)',NULL,NULL,'sf#@@@','2019-01-08 07:34:32',0),(22,'Xamarin','bugzilla','Xamarin Bugzilla','http://bugzilla.xamarin.com/index.cgi','http://bugzilla.xamarin.com/show_bug.cgi?id=@@@','(?:bxc|Xamarin)#(\\d+)',NULL,NULL,'Xamarin#@@@','2019-01-08 07:34:32',0),(23,'bxo','bugzilla','XFCE Bugzilla','https://bugzilla.xfce.org/','https://bugzilla.xfce.org/show_bug.cgi?id=@@@','bxo#(\\d+)',NULL,NULL,'bxo#@@@','2019-01-08 07:34:32',0),(24,'obs','github','OBS GitHub Issues','https://api.github.com/repos/openSUSE/open-build-service/issues','https://github.com/openSUSE/open-build-service/issues/@@@','obs#(\\d+)',NULL,NULL,'obs#@@@','2019-01-08 07:36:44',0),(25,'build','github','OBS build script Issues','https://api.github.com/repos/openSUSE/obs-build/issues','https://github.com/openSUSE/obs-build/issues/@@@','build#(\\d+)',NULL,NULL,'build#@@@','2019-01-08 07:36:45',0),(26,'osc','github','OBS CLI Issues','https://api.github.com/repos/openSUSE/osc/issues','https://github.com/openSUSE/osc/issues/@@@','osc#(\\d+)',NULL,NULL,'osc#@@@','2019-01-08 07:36:45',0),(27,'lf','bugzilla','Linux Foundation Bugzilla','https://developerbugs.linuxfoundation.org','https://developerbugs.linuxfoundation.org/show_bug.cgi?id=@@@','lf#(\\d+)',NULL,NULL,'lf#@@@','2019-01-08 07:36:58',0);
/*!40000 ALTER TABLE `issue_trackers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `issues`
--

DROP TABLE IF EXISTS `issues`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `issues` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 NOT NULL,
  `issue_tracker_id` int(11) NOT NULL,
  `summary` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `state` enum('OPEN','CLOSED','UNKNOWN') CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `owner_id` (`owner_id`),
  KEY `issue_tracker_id` (`issue_tracker_id`),
  KEY `index_issues_on_name_and_issue_tracker_id` (`name`,`issue_tracker_id`),
  CONSTRAINT `issues_ibfk_1` FOREIGN KEY (`owner_id`) REFERENCES `users` (`id`),
  CONSTRAINT `issues_ibfk_2` FOREIGN KEY (`issue_tracker_id`) REFERENCES `issue_trackers` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `issues`
--

LOCK TABLES `issues` WRITE;
/*!40000 ALTER TABLE `issues` DISABLE KEYS */;
/*!40000 ALTER TABLE `issues` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kiwi_descriptions`
--

DROP TABLE IF EXISTS `kiwi_descriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kiwi_descriptions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `image_id` int(11) DEFAULT NULL,
  `description_type` int(11) DEFAULT '0',
  `author` varchar(255) DEFAULT NULL,
  `contact` varchar(255) DEFAULT NULL,
  `specification` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_kiwi_descriptions_on_image_id` (`image_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kiwi_descriptions`
--

LOCK TABLES `kiwi_descriptions` WRITE;
/*!40000 ALTER TABLE `kiwi_descriptions` DISABLE KEYS */;
/*!40000 ALTER TABLE `kiwi_descriptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kiwi_images`
--

DROP TABLE IF EXISTS `kiwi_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kiwi_images` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `md5_last_revision` varchar(32) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `use_project_repositories` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kiwi_images`
--

LOCK TABLES `kiwi_images` WRITE;
/*!40000 ALTER TABLE `kiwi_images` DISABLE KEYS */;
/*!40000 ALTER TABLE `kiwi_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kiwi_package_groups`
--

DROP TABLE IF EXISTS `kiwi_package_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kiwi_package_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kiwi_type` int(11) NOT NULL,
  `profiles` varchar(255) DEFAULT NULL,
  `pattern_type` varchar(255) DEFAULT NULL,
  `image_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_kiwi_package_groups_on_image_id` (`image_id`),
  CONSTRAINT `fk_rails_c64a679086` FOREIGN KEY (`image_id`) REFERENCES `kiwi_images` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kiwi_package_groups`
--

LOCK TABLES `kiwi_package_groups` WRITE;
/*!40000 ALTER TABLE `kiwi_package_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `kiwi_package_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kiwi_packages`
--

DROP TABLE IF EXISTS `kiwi_packages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kiwi_packages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `arch` varchar(255) DEFAULT NULL,
  `replaces` varchar(255) DEFAULT NULL,
  `bootinclude` tinyint(1) DEFAULT NULL,
  `bootdelete` tinyint(1) DEFAULT NULL,
  `package_group_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_kiwi_packages_on_package_group_id` (`package_group_id`),
  CONSTRAINT `fk_rails_0ecab3b2cd` FOREIGN KEY (`package_group_id`) REFERENCES `kiwi_package_groups` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kiwi_packages`
--

LOCK TABLES `kiwi_packages` WRITE;
/*!40000 ALTER TABLE `kiwi_packages` DISABLE KEYS */;
/*!40000 ALTER TABLE `kiwi_packages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kiwi_preferences`
--

DROP TABLE IF EXISTS `kiwi_preferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kiwi_preferences` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `image_id` int(11) DEFAULT NULL,
  `type_image` int(11) DEFAULT NULL,
  `type_containerconfig_name` varchar(255) DEFAULT NULL,
  `type_containerconfig_tag` varchar(255) DEFAULT NULL,
  `version` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_kiwi_preferences_on_image_id` (`image_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kiwi_preferences`
--

LOCK TABLES `kiwi_preferences` WRITE;
/*!40000 ALTER TABLE `kiwi_preferences` DISABLE KEYS */;
/*!40000 ALTER TABLE `kiwi_preferences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kiwi_repositories`
--

DROP TABLE IF EXISTS `kiwi_repositories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kiwi_repositories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `image_id` int(11) DEFAULT NULL,
  `repo_type` varchar(255) DEFAULT NULL,
  `source_path` varchar(255) DEFAULT NULL,
  `order` int(11) DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `alias` varchar(255) DEFAULT NULL,
  `imageinclude` tinyint(1) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `prefer_license` tinyint(1) DEFAULT NULL,
  `replaceable` tinyint(1) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_kiwi_repositories_on_image_id_and_order` (`image_id`,`order`),
  KEY `index_kiwi_repositories_on_image_id` (`image_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kiwi_repositories`
--

LOCK TABLES `kiwi_repositories` WRITE;
/*!40000 ALTER TABLE `kiwi_repositories` DISABLE KEYS */;
/*!40000 ALTER TABLE `kiwi_repositories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `linked_projects`
--

DROP TABLE IF EXISTS `linked_projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `linked_projects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `db_project_id` int(11) NOT NULL,
  `linked_db_project_id` int(11) DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `linked_remote_project_name` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `linked_projects_index` (`db_project_id`,`linked_db_project_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `linked_projects`
--

LOCK TABLES `linked_projects` WRITE;
/*!40000 ALTER TABLE `linked_projects` DISABLE KEYS */;
/*!40000 ALTER TABLE `linked_projects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `maintained_projects`
--

DROP TABLE IF EXISTS `maintained_projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `maintained_projects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `maintenance_project_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_index` (`project_id`,`maintenance_project_id`),
  KEY `maintenance_project_id` (`maintenance_project_id`),
  CONSTRAINT `maintained_projects_ibfk_1` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`),
  CONSTRAINT `maintained_projects_ibfk_2` FOREIGN KEY (`maintenance_project_id`) REFERENCES `projects` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `maintained_projects`
--

LOCK TABLES `maintained_projects` WRITE;
/*!40000 ALTER TABLE `maintained_projects` DISABLE KEYS */;
/*!40000 ALTER TABLE `maintained_projects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `maintenance_incidents`
--

DROP TABLE IF EXISTS `maintenance_incidents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `maintenance_incidents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `db_project_id` int(11) DEFAULT NULL,
  `maintenance_db_project_id` int(11) DEFAULT NULL,
  `updateinfo_id` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `incident_id` int(11) DEFAULT NULL,
  `released_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_maintenance_incidents_on_db_project_id` (`db_project_id`),
  KEY `index_maintenance_incidents_on_maintenance_db_project_id` (`maintenance_db_project_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `maintenance_incidents`
--

LOCK TABLES `maintenance_incidents` WRITE;
/*!40000 ALTER TABLE `maintenance_incidents` DISABLE KEYS */;
/*!40000 ALTER TABLE `maintenance_incidents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `db_object_id` int(11) DEFAULT NULL,
  `db_object_type` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `send_mail` tinyint(1) DEFAULT NULL,
  `sent_at` datetime DEFAULT NULL,
  `private` tinyint(1) DEFAULT NULL,
  `severity` int(11) DEFAULT NULL,
  `text` text CHARACTER SET utf8,
  PRIMARY KEY (`id`),
  KEY `object` (`db_object_id`),
  KEY `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messages`
--

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notifications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL,
  `event_type` varchar(255) NOT NULL,
  `event_payload` text NOT NULL,
  `subscription_receiver_role` varchar(255) NOT NULL,
  `delivered` tinyint(1) DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `subscriber_type` varchar(255) DEFAULT NULL,
  `subscriber_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_notifications_on_subscriber_type_and_subscriber_id` (`subscriber_type`,`subscriber_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifications`
--

LOCK TABLES `notifications` WRITE;
/*!40000 ALTER TABLE `notifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `package_issues`
--

DROP TABLE IF EXISTS `package_issues`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `package_issues` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `package_id` int(11) NOT NULL,
  `issue_id` int(11) NOT NULL,
  `change` enum('added','deleted','changed','kept') DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_package_issues_on_package_id_and_issue_id` (`package_id`,`issue_id`),
  KEY `index_package_issues_on_issue_id` (`issue_id`),
  CONSTRAINT `package_issues_ibfk_1` FOREIGN KEY (`package_id`) REFERENCES `packages` (`id`),
  CONSTRAINT `package_issues_ibfk_2` FOREIGN KEY (`issue_id`) REFERENCES `issues` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `package_issues`
--

LOCK TABLES `package_issues` WRITE;
/*!40000 ALTER TABLE `package_issues` DISABLE KEYS */;
/*!40000 ALTER TABLE `package_issues` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `package_kinds`
--

DROP TABLE IF EXISTS `package_kinds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `package_kinds` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `package_id` int(11) DEFAULT NULL,
  `kind` enum('patchinfo','aggregate','link','channel','product') NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_package_kinds_on_package_id` (`package_id`),
  CONSTRAINT `package_kinds_ibfk_1` FOREIGN KEY (`package_id`) REFERENCES `packages` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `package_kinds`
--

LOCK TABLES `package_kinds` WRITE;
/*!40000 ALTER TABLE `package_kinds` DISABLE KEYS */;
INSERT INTO `package_kinds` VALUES (1,3,'aggregate');
/*!40000 ALTER TABLE `package_kinds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `packages`
--

DROP TABLE IF EXISTS `packages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `packages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `name` varchar(200) COLLATE utf8_bin NOT NULL,
  `title` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `description` text CHARACTER SET utf8,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `url` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `activity_index` float DEFAULT '100',
  `bcntsynctag` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `develpackage_id` int(11) DEFAULT NULL,
  `delta` tinyint(1) NOT NULL DEFAULT '1',
  `releasename` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `kiwi_image_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `packages_all_index` (`project_id`,`name`),
  KEY `devel_package_id_index` (`develpackage_id`),
  KEY `updated_at_index` (`updated_at`),
  KEY `index_packages_on_kiwi_image_id` (`kiwi_image_id`),
  CONSTRAINT `fk_rails_9a47aff19d` FOREIGN KEY (`kiwi_image_id`) REFERENCES `kiwi_images` (`id`),
  CONSTRAINT `packages_ibfk_3` FOREIGN KEY (`develpackage_id`) REFERENCES `packages` (`id`),
  CONSTRAINT `packages_ibfk_4` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `packages`
--

LOCK TABLES `packages` WRITE;
/*!40000 ALTER TABLE `packages` DISABLE KEYS */;
INSERT INTO `packages` VALUES (1,4,'sb2-tools-qt5-armv7hl','','','2019-01-08 07:44:48','2019-01-08 07:44:51.021685',NULL,19.9881,NULL,NULL,1,NULL,NULL),(2,4,'sb2-tools-armv7hl','sb2-tools-armv7hl','Description\n','2019-01-08 07:44:53','2019-01-08 07:44:55.349770','http://www.merproject.org',19.9881,NULL,NULL,1,NULL,NULL),(3,5,'aggre-test-arm','','','2019-01-08 12:44:56','2019-01-08 12:45:45.999984',NULL,19.9874,NULL,NULL,1,NULL,NULL);
/*!40000 ALTER TABLE `packages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `path_elements`
--

DROP TABLE IF EXISTS `path_elements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `path_elements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL,
  `repository_id` int(11) NOT NULL,
  `position` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `parent_repository_index` (`parent_id`,`repository_id`),
  KEY `repository_id` (`repository_id`),
  CONSTRAINT `path_elements_ibfk_1` FOREIGN KEY (`parent_id`) REFERENCES `repositories` (`id`),
  CONSTRAINT `path_elements_ibfk_2` FOREIGN KEY (`repository_id`) REFERENCES `repositories` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `path_elements`
--

LOCK TABLES `path_elements` WRITE;
/*!40000 ALTER TABLE `path_elements` DISABLE KEYS */;
INSERT INTO `path_elements` VALUES (3,4,5,1),(4,4,2,2),(5,5,3,1);
/*!40000 ALTER TABLE `path_elements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_channels`
--

DROP TABLE IF EXISTS `product_channels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_channels` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `channel_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_product_channels_on_channel_id_and_product_id` (`channel_id`,`product_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `product_channels_ibfk_1` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`),
  CONSTRAINT `product_channels_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_channels`
--

LOCK TABLES `product_channels` WRITE;
/*!40000 ALTER TABLE `product_channels` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_channels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_media`
--

DROP TABLE IF EXISTS `product_media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_media` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) DEFAULT NULL,
  `repository_id` int(11) DEFAULT NULL,
  `arch_filter_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_unique` (`product_id`,`repository_id`,`name`,`arch_filter_id`),
  KEY `index_product_media_on_product_id` (`product_id`),
  KEY `index_product_media_on_arch_filter_id` (`arch_filter_id`),
  KEY `index_product_media_on_name` (`name`),
  KEY `repository_id` (`repository_id`),
  CONSTRAINT `product_media_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  CONSTRAINT `product_media_ibfk_2` FOREIGN KEY (`repository_id`) REFERENCES `repositories` (`id`),
  CONSTRAINT `product_media_ibfk_3` FOREIGN KEY (`arch_filter_id`) REFERENCES `architectures` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_media`
--

LOCK TABLES `product_media` WRITE;
/*!40000 ALTER TABLE `product_media` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_media` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_update_repositories`
--

DROP TABLE IF EXISTS `product_update_repositories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_update_repositories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) DEFAULT NULL,
  `repository_id` int(11) DEFAULT NULL,
  `arch_filter_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_unique` (`product_id`,`repository_id`,`arch_filter_id`),
  KEY `index_product_update_repositories_on_product_id` (`product_id`),
  KEY `index_product_update_repositories_on_arch_filter_id` (`arch_filter_id`),
  KEY `repository_id` (`repository_id`),
  CONSTRAINT `product_update_repositories_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  CONSTRAINT `product_update_repositories_ibfk_2` FOREIGN KEY (`repository_id`) REFERENCES `repositories` (`id`),
  CONSTRAINT `product_update_repositories_ibfk_3` FOREIGN KEY (`arch_filter_id`) REFERENCES `architectures` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_update_repositories`
--

LOCK TABLES `product_update_repositories` WRITE;
/*!40000 ALTER TABLE `product_update_repositories` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_update_repositories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `package_id` int(11) NOT NULL,
  `cpe` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `version` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `baseversion` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `patchlevel` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `release` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_products_on_name_and_package_id` (`name`,`package_id`),
  KEY `package_id` (`package_id`),
  CONSTRAINT `products_ibfk_1` FOREIGN KEY (`package_id`) REFERENCES `packages` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_log_entries`
--

DROP TABLE IF EXISTS `project_log_entries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_log_entries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) DEFAULT NULL,
  `user_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `package_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bs_request_id` int(11) DEFAULT NULL,
  `datetime` datetime DEFAULT NULL,
  `event_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `additional_info` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `project_id` (`project_id`),
  KEY `index_project_log_entries_on_user_name` (`user_name`),
  KEY `index_project_log_entries_on_package_name` (`package_name`),
  KEY `index_project_log_entries_on_bs_request_id` (`bs_request_id`),
  KEY `index_project_log_entries_on_event_type` (`event_type`),
  KEY `index_project_log_entries_on_datetime` (`datetime`),
  CONSTRAINT `project_log_entries_ibfk_1` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_log_entries`
--

LOCK TABLES `project_log_entries` WRITE;
/*!40000 ALTER TABLE `project_log_entries` DISABLE KEYS */;
INSERT INTO `project_log_entries` VALUES (1,2,'Admin',NULL,NULL,'2019-01-08 07:44:42','create_project','--- {}\n'),(2,3,'Admin',NULL,NULL,'2019-01-08 07:44:54','create_project','--- {}\n'),(3,4,'Admin',NULL,NULL,'2019-01-08 07:44:54','create_project','--- {}\n'),(4,4,'Admin',NULL,NULL,'2019-01-08 07:44:54','update_project','--- {}\n'),(5,4,'Admin',NULL,NULL,'2019-01-08 07:44:54','update_project_config','--- {}\n'),(6,4,'Admin','sb2-tools-qt5-armv7hl',NULL,'2019-01-08 07:44:54','create_package','--- {}\n'),(7,4,'Admin','sb2-tools-qt5-armv7hl',NULL,'2019-01-08 07:44:54','update_package','--- {}\n'),(8,4,'Admin','sb2-tools-qt5-armv7hl',NULL,'2019-01-08 07:44:54','commit','---\ncomment: osc copypac from project:sailfishos:2.2.1.18 package:sb2-tools-qt5-armv7hl\n  revision:3, using expand, using client side copy\nfiles: |+\n  Added:\n    _service\n\nrev: \'1\'\n'),(9,4,'Admin','sb2-tools-qt5-armv7hl',NULL,'2019-01-08 07:44:54','update_package','--- {}\n'),(10,4,'Admin','sb2-tools-qt5-armv7hl',NULL,'2019-01-08 07:44:54','service_success','---\ncomment: osc copypac from project:sailfishos:2.2.1.18 package:sb2-tools-qt5-armv7hl\n  revision:3, using expand, using client side copy\nrev: \'1\'\n'),(11,4,'Admin','sb2-tools-armv7hl',NULL,'2019-01-08 07:44:54','create_package','--- {}\n'),(12,4,'Admin','sb2-tools-armv7hl',NULL,'2019-01-08 07:45:11','update_package','--- {}\n'),(13,4,'Admin','sb2-tools-armv7hl',NULL,'2019-01-08 07:45:11','commit','---\ncomment: osc copypac from project:sailfishos:2.2.1.18 package:sb2-tools-armv7hl revision:3,\n  using expand, using client side copy\nfiles: |+\n  Added:\n    _service\n\nrev: \'1\'\n'),(14,4,'Admin','sb2-tools-armv7hl',NULL,'2019-01-08 07:45:11','update_package','--- {}\n'),(15,4,'Admin','sb2-tools-armv7hl',NULL,'2019-01-08 07:45:11','service_success','---\ncomment: osc copypac from project:sailfishos:2.2.1.18 package:sb2-tools-armv7hl revision:3,\n  using expand, using client side copy\nrev: \'1\'\n');
/*!40000 ALTER TABLE `project_log_entries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projects`
--

DROP TABLE IF EXISTS `projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) COLLATE utf8_bin NOT NULL,
  `title` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `description` text CHARACTER SET utf8,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `remoteurl` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `remoteproject` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `develproject_id` int(11) DEFAULT NULL,
  `delta` tinyint(1) NOT NULL DEFAULT '1',
  `kind` enum('standard','maintenance','maintenance_incident','maintenance_release') COLLATE utf8_bin DEFAULT 'standard',
  `url` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `projects_name_index` (`name`),
  KEY `updated_at_index` (`updated_at`),
  KEY `devel_project_id_index` (`develproject_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projects`
--

LOCK TABLES `projects` WRITE;
/*!40000 ALTER TABLE `projects` DISABLE KEYS */;
INSERT INTO `projects` VALUES (1,'deleted',NULL,NULL,'2019-01-08 07:34:32','2019-01-08 07:34:32.000000',NULL,NULL,NULL,1,'standard',NULL),(2,'sailfishos:2.2.1.18:armv7hl','sailfishos 2.2.1.18 ( armv7hl dod )','This is the DoD repo - don\'t use it directly','2019-01-08 07:44:42','2019-01-08 07:44:42.576217',NULL,NULL,NULL,1,'standard',NULL),(3,'sailfishos:2.2.1.18:i486','sailfishos 2.2.1.18 ( i486 dod )','This is the DoD repo - don\'t use it directly','2019-01-08 07:44:43','2019-01-08 07:44:43.081462',NULL,NULL,NULL,1,'standard',NULL),(4,'sailfishos:2.2.1.18','2.2.1.18','','2019-01-08 07:44:43','2019-01-08 07:44:43.472323',NULL,NULL,NULL,1,'standard',NULL),(5,'aggregate-test','','','2019-01-08 12:43:51','2019-01-08 12:43:51.143685',NULL,NULL,NULL,1,'standard',NULL);
/*!40000 ALTER TABLE `projects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ratings`
--

DROP TABLE IF EXISTS `ratings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ratings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `score` int(11) DEFAULT NULL,
  `db_object_id` int(11) DEFAULT NULL,
  `db_object_type` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `object` (`db_object_id`),
  KEY `user` (`user_id`),
  CONSTRAINT `ratings_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ratings`
--

LOCK TABLES `ratings` WRITE;
/*!40000 ALTER TABLE `ratings` DISABLE KEYS */;
/*!40000 ALTER TABLE `ratings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `relationships`
--

DROP TABLE IF EXISTS `relationships`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `relationships` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `package_id` int(11) DEFAULT NULL,
  `project_id` int(11) DEFAULT NULL,
  `role_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `group_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_relationships_on_project_id_and_role_id_and_group_id` (`project_id`,`role_id`,`group_id`),
  UNIQUE KEY `index_relationships_on_project_id_and_role_id_and_user_id` (`project_id`,`role_id`,`user_id`),
  UNIQUE KEY `index_relationships_on_package_id_and_role_id_and_group_id` (`package_id`,`role_id`,`group_id`),
  UNIQUE KEY `index_relationships_on_package_id_and_role_id_and_user_id` (`package_id`,`role_id`,`user_id`),
  KEY `role_id` (`role_id`),
  KEY `user_id` (`user_id`),
  KEY `group_id` (`group_id`),
  CONSTRAINT `relationships_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`),
  CONSTRAINT `relationships_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `relationships_ibfk_3` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`),
  CONSTRAINT `relationships_ibfk_4` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`),
  CONSTRAINT `relationships_ibfk_5` FOREIGN KEY (`package_id`) REFERENCES `packages` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `relationships`
--

LOCK TABLES `relationships` WRITE;
/*!40000 ALTER TABLE `relationships` DISABLE KEYS */;
INSERT INTO `relationships` VALUES (1,NULL,2,2,1,NULL),(2,NULL,2,3,1,NULL),(3,NULL,3,2,1,NULL),(4,NULL,3,3,1,NULL),(5,NULL,4,2,1,NULL),(6,NULL,4,3,1,NULL),(7,NULL,5,2,1,NULL);
/*!40000 ALTER TABLE `relationships` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `release_targets`
--

DROP TABLE IF EXISTS `release_targets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `release_targets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `repository_id` int(11) NOT NULL,
  `target_repository_id` int(11) NOT NULL,
  `trigger` enum('manual','allsucceeded','maintenance') DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `repository_id_index` (`repository_id`),
  KEY `index_release_targets_on_target_repository_id` (`target_repository_id`),
  CONSTRAINT `release_targets_ibfk_1` FOREIGN KEY (`repository_id`) REFERENCES `repositories` (`id`),
  CONSTRAINT `release_targets_ibfk_2` FOREIGN KEY (`target_repository_id`) REFERENCES `repositories` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `release_targets`
--

LOCK TABLES `release_targets` WRITE;
/*!40000 ALTER TABLE `release_targets` DISABLE KEYS */;
/*!40000 ALTER TABLE `release_targets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `repositories`
--

DROP TABLE IF EXISTS `repositories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `repositories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `db_project_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_bin NOT NULL,
  `remote_project_name` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `rebuild` enum('transitive','direct','local') CHARACTER SET utf8 DEFAULT NULL,
  `block` enum('all','local','never') CHARACTER SET utf8 DEFAULT NULL,
  `linkedbuild` enum('off','localdep','all') CHARACTER SET utf8 DEFAULT NULL,
  `hostsystem_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `projects_name_index` (`db_project_id`,`name`,`remote_project_name`),
  KEY `remote_project_name_index` (`remote_project_name`),
  KEY `hostsystem_id` (`hostsystem_id`),
  CONSTRAINT `repositories_ibfk_1` FOREIGN KEY (`db_project_id`) REFERENCES `projects` (`id`),
  CONSTRAINT `repositories_ibfk_2` FOREIGN KEY (`hostsystem_id`) REFERENCES `repositories` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `repositories`
--

LOCK TABLES `repositories` WRITE;
/*!40000 ALTER TABLE `repositories` DISABLE KEYS */;
INSERT INTO `repositories` VALUES (1,1,'deleted','',NULL,NULL,NULL,NULL),(2,2,'latest','',NULL,NULL,NULL,NULL),(3,3,'latest','',NULL,NULL,NULL,NULL),(4,4,'latest_armv7hl','',NULL,NULL,NULL,NULL),(5,4,'latest_i486','',NULL,NULL,NULL,NULL),(6,5,'latest_armv7hl','',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `repositories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `repository_architectures`
--

DROP TABLE IF EXISTS `repository_architectures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `repository_architectures` (
  `repository_id` int(11) NOT NULL,
  `architecture_id` int(11) NOT NULL,
  `position` int(11) NOT NULL DEFAULT '0',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  UNIQUE KEY `arch_repo_index` (`repository_id`,`architecture_id`),
  KEY `architecture_id` (`architecture_id`),
  CONSTRAINT `repository_architectures_ibfk_1` FOREIGN KEY (`repository_id`) REFERENCES `repositories` (`id`),
  CONSTRAINT `repository_architectures_ibfk_2` FOREIGN KEY (`architecture_id`) REFERENCES `architectures` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `repository_architectures`
--

LOCK TABLES `repository_architectures` WRITE;
/*!40000 ALTER TABLE `repository_architectures` DISABLE KEYS */;
INSERT INTO `repository_architectures` VALUES (2,10,1,1),(3,12,1,2),(4,10,1,6),(5,12,1,7),(5,10,2,8),(6,10,1,9);
/*!40000 ALTER TABLE `repository_architectures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviews`
--

DROP TABLE IF EXISTS `reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reviews` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bs_request_id` int(11) DEFAULT NULL,
  `creator` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `reviewer` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `reason` text COLLATE utf8_unicode_ci,
  `state` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `by_user` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `by_group` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `by_project` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `by_package` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `review_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `group_id` int(11) DEFAULT NULL,
  `project_id` int(11) DEFAULT NULL,
  `package_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_reviews_on_creator` (`creator`),
  KEY `index_reviews_on_reviewer` (`reviewer`),
  KEY `index_reviews_on_by_user` (`by_user`),
  KEY `index_reviews_on_by_group` (`by_group`),
  KEY `index_reviews_on_by_project` (`by_project`),
  KEY `index_reviews_on_by_package_and_by_project` (`by_package`,`by_project`),
  KEY `bs_request_id` (`bs_request_id`),
  KEY `index_reviews_on_state_and_by_project` (`state`,`by_project`),
  KEY `index_reviews_on_state_and_by_user` (`state`,`by_user`),
  KEY `index_reviews_on_review_id` (`review_id`),
  KEY `index_reviews_on_user_id` (`user_id`),
  KEY `index_reviews_on_group_id` (`group_id`),
  KEY `index_reviews_on_project_id` (`project_id`),
  KEY `index_reviews_on_package_id` (`package_id`),
  CONSTRAINT `fk_rails_813a4fb24f` FOREIGN KEY (`review_id`) REFERENCES `reviews` (`id`),
  CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`bs_request_id`) REFERENCES `bs_requests` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews`
--

LOCK TABLES `reviews` WRITE;
/*!40000 ALTER TABLE `reviews` DISABLE KEYS */;
/*!40000 ALTER TABLE `reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `parent_id` int(11) DEFAULT NULL,
  `global` tinyint(1) DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `roles_parent_id_index` (`parent_id`),
  CONSTRAINT `roles_ibfk_1` FOREIGN KEY (`parent_id`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'Admin',NULL,1,'0000-00-00 00:00:00','0000-00-00 00:00:00.000000'),(2,'maintainer',NULL,0,'0000-00-00 00:00:00','0000-00-00 00:00:00.000000'),(3,'bugowner',NULL,0,'0000-00-00 00:00:00','0000-00-00 00:00:00.000000'),(4,'reviewer',NULL,0,'0000-00-00 00:00:00','0000-00-00 00:00:00.000000'),(5,'downloader',NULL,0,'0000-00-00 00:00:00','0000-00-00 00:00:00.000000'),(6,'reader',NULL,0,'0000-00-00 00:00:00','0000-00-00 00:00:00.000000');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles_static_permissions`
--

DROP TABLE IF EXISTS `roles_static_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles_static_permissions` (
  `role_id` int(11) NOT NULL DEFAULT '0',
  `static_permission_id` int(11) NOT NULL DEFAULT '0',
  UNIQUE KEY `roles_static_permissions_all_index` (`static_permission_id`,`role_id`),
  KEY `role_id` (`role_id`),
  CONSTRAINT `roles_static_permissions_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`),
  CONSTRAINT `roles_static_permissions_ibfk_2` FOREIGN KEY (`static_permission_id`) REFERENCES `static_permissions` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles_static_permissions`
--

LOCK TABLES `roles_static_permissions` WRITE;
/*!40000 ALTER TABLE `roles_static_permissions` DISABLE KEYS */;
INSERT INTO `roles_static_permissions` VALUES (1,1),(1,2),(1,3),(5,3),(1,4),(6,4),(1,5),(6,5),(1,6),(1,7),(1,8),(1,9),(1,10),(2,10),(1,11),(2,11),(1,12),(2,12),(1,13),(2,13);
/*!40000 ALTER TABLE `roles_static_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles_users`
--

DROP TABLE IF EXISTS `roles_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles_users` (
  `user_id` int(11) NOT NULL DEFAULT '0',
  `role_id` int(11) NOT NULL DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_users_all_index` (`user_id`,`role_id`),
  KEY `role_id` (`role_id`),
  CONSTRAINT `roles_users_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `roles_users_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles_users`
--

LOCK TABLES `roles_users` WRITE;
/*!40000 ALTER TABLE `roles_users` DISABLE KEYS */;
INSERT INTO `roles_users` VALUES (1,1,'2019-01-08 07:34:30',1);
/*!40000 ALTER TABLE `roles_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) CHARACTER SET utf8 NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schema_migrations`
--

LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;
INSERT INTO `schema_migrations` VALUES ('1'),('10'),('11'),('12'),('13'),('14'),('15'),('16'),('17'),('18'),('19'),('2'),('20'),('20090701125033'),('20090703100900'),('20090716174522'),('20090717114240'),('20091017210000'),('20091022210000'),('20091022310000'),('20091029100000'),('20091030060000'),('20091102060000'),('20091111191005'),('20091115101346'),('20091117144409'),('20091117152223'),('20091118000000'),('20091119000000'),('20091119090108'),('20091119090620'),('20091124194151'),('20091206194902'),('20091209193452'),('20091209211754'),('20091226112028'),('20091229115736'),('20100102150000'),('20100104170000'),('20100109145739'),('20100125100000'),('20100202132416'),('20100302100000'),('20100304100000'),('20100315100000'),('20100316100000'),('20100316100001'),('20100327100000'),('20100329191407'),('20100423144748'),('20100426144748'),('20100428144748'),('20100429144748'),('20100506115929'),('20100507115929'),('20100530180617'),('20100609100000'),('20100609200000'),('20100614121047'),('20100629095208'),('20100702082339'),('20100705124948'),('20100705133839'),('20100705141045'),('20100707061034'),('20100805100000'),('20100812100000'),('20100827100000'),('20100903100000'),('20100927110821'),('20100927132716'),('20100927133955'),('20100928081344'),('20101110100000'),('20110117000000'),('20110131100000'),('20110202100000'),('20110202110000'),('20110302100000'),('20110303100000'),('20110309100000'),('20110318112742'),('20110321000000'),('20110322000000'),('20110323000000'),('2011033000000'),('20110331001200'),('20110404085232'),('20110404085325'),('20110404090700'),('20110405151201'),('20110502100000'),('20110519000000'),('20110527000000'),('20110615083665'),('20110615083666'),('20110627001200'),('20110703001200'),('20110711001200'),('20110719142500'),('20110725105426'),('20110728072502'),('20111005000000'),('20111116100002'),('20111117162400'),('20111122000000'),('20111123000000'),('20111206000000'),('20111206151500'),('20111207000000'),('20111213000000'),('20111215094300'),('20111303000000'),('20120110094300'),('20120110104300'),('20120111094300'),('20120112094300'),('20120112194300'),('20120119194300'),('20120119204300'),('20120119204301'),('20120120104301'),('20120120114301'),('20120124114301'),('20120124114302'),('20120124114303'),('20120216114303'),('20120217114303'),('20120217114304'),('20120220114304'),('20120222105426'),('20120223105426'),('20120304205014'),('20120312204300'),('20120313113554'),('20120313131909'),('20120319104301'),('20120319133739'),('20120320134850'),('20120407173644'),('20120411112931'),('20120411121152'),('20120417115800'),('20120418121859'),('20120529150500'),('20120722192000'),('20120903122955'),('20120904122955'),('20120907114304'),('20121014124846'),('20121015121807'),('20121112104534'),('20121112110642'),('20121114093616'),('20121120110642'),('20121120124300'),('20121121142111'),('20121124032111'),('20121130103300'),('20121130143300'),('20121213140751'),('20121213144129'),('20121216151549'),('20121220151549'),('20130111085930'),('20130220160000'),('20130301100000'),('20130409123324'),('20130410124738'),('20130414061002'),('20130603100244'),('20130610100244'),('20130612151549'),('20130618083665'),('20130621083665'),('20130626160000'),('20130627193722'),('20130702083665'),('20130702203665'),('20130723055536'),('20130725123636'),('20130726144516'),('20130802183104'),('20130802183717'),('20130802190951'),('20130805073101'),('20130807071147'),('20130814071147'),('20130816183104'),('20130817082602'),('20130819114303'),('20130820151442'),('20130830043205'),('20130903114302'),('20130904071147'),('20130910162318'),('20130917124132'),('20130920090004'),('20130930130128'),('20131005225515'),('20131006000000'),('20131006162847'),('20131020151037'),('20131020165316'),('20131021063641'),('20131022114302'),('20131023063641'),('20131027122410'),('20131028085325'),('20131029112259'),('20131105112259'),('20131106112233'),('20131111090310'),('20131111193512'),('20131111194720'),('20131112140033'),('20131119195511'),('20131120193512'),('20131123113417'),('20131124071042'),('20131125071042'),('20131125101042'),('20131126074753'),('20131126205430'),('20131127091624'),('20131209095749'),('20131209103450'),('20131210182719'),('20131218071042'),('20140113110551'),('20140123063641'),('20140123071042'),('20140124071042'),('20140210114542'),('20140213101042'),('20140218174400'),('20140219185200'),('20140516182719'),('20140624101042'),('20140627071042'),('20140704101043'),('20140709071042'),('20140714112346'),('20140717101042'),('20140718112346'),('20140721112346'),('20140729101042'),('20140801071042'),('20140819071042'),('20140821105426'),('20140827105426'),('20140903105426'),('20140903125426'),('20140908125426'),('20140908135426'),('20140916135426'),('20140930135426'),('20141001135426'),('20141002231042'),('20141022105426'),('20141022205426'),('20141107135426'),('20141110105426'),('20141125105426'),('20141201135426'),('20141202135426'),('20141208135426'),('20141302101042'),('20150112135426'),('20150127135426'),('20150129135426'),('20150129135427'),('20150227063641'),('20150623063641'),('20150625105426'),('20150630135426'),('20150715112346'),('20150716112346'),('20150716124906'),('20150807105426'),('20150902130939'),('20150903084813'),('20150916084813'),('20151030130011'),('20160321085300'),('20160321104000'),('20160321105300'),('20160518105300'),('20160610105300'),('20160808135426'),('20160819105300'),('20160824132643'),('20161019231042'),('20161025231042'),('20161115094035'),('20161117135426'),('20161121162349'),('20161122121211'),('20161122123708'),('20161123124803'),('20161124133941'),('20161124135426'),('20161128115942'),('20170103132257'),('20170111114943'),('20170118091131'),('20170123115500'),('20170215231042'),('20170306084558'),('20170306105300'),('20170315190919'),('20170315200936'),('20170316090223'),('20170317094221'),('20170320151300'),('20170323123236'),('20170412121601'),('20170412121957'),('20170426153510'),('20170509123922'),('20170511120355'),('20170516140442'),('20170607110443'),('20170614083014'),('20170619111734'),('20170621083718'),('20170621100321'),('20170621103748'),('20170627111730'),('20170628115727'),('20170630121602'),('20170630144825'),('20170704125123'),('20170704133728'),('20170704212201'),('20170710133627'),('20170710134059'),('20170821110838'),('20170821110918'),('20170821110941'),('20170821110946'),('20170905081525'),('20170905101113'),('20170911142301'),('20170912140257'),('20170912140713'),('20170921100521'),('20170925060940'),('20171011125520'),('20171013103921'),('20171019151800'),('20171030143054'),('20171030150551'),('20171102110929'),('20171107125828'),('20171109095756'),('20171212083426'),('20171218160607'),('20171219122451'),('20180109115548'),('20180110074142'),('20180307074538'),('21'),('22'),('23'),('24'),('25'),('26'),('27'),('28'),('29'),('3'),('30'),('31'),('32'),('33'),('34'),('35'),('36'),('37'),('38'),('39'),('4'),('40'),('41'),('42'),('43'),('44'),('45'),('46'),('47'),('48'),('5'),('6'),('7'),('8'),('9');
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sessions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `session_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `data` text COLLATE utf8_unicode_ci,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_sessions_on_session_id` (`session_id`),
  KEY `index_sessions_on_updated_at` (`updated_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `static_permissions`
--

DROP TABLE IF EXISTS `static_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `static_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) CHARACTER SET utf8 NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `static_permissions_title_index` (`title`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `static_permissions`
--

LOCK TABLES `static_permissions` WRITE;
/*!40000 ALTER TABLE `static_permissions` DISABLE KEYS */;
INSERT INTO `static_permissions` VALUES (5,'access'),(12,'change_package'),(10,'change_project'),(13,'create_package'),(11,'create_project'),(3,'download_binaries'),(8,'global_change_package'),(6,'global_change_project'),(9,'global_create_package'),(7,'global_create_project'),(2,'set_download_counters'),(4,'source_access'),(1,'status_message_create');
/*!40000 ALTER TABLE `static_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `status_histories`
--

DROP TABLE IF EXISTS `status_histories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `status_histories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `time` int(11) DEFAULT NULL,
  `key` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `value` float NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_status_histories_on_time_and_key` (`time`,`key`),
  KEY `index_status_histories_on_key` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=745 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `status_histories`
--

LOCK TABLES `status_histories` WRITE;
/*!40000 ALTER TABLE `status_histories` DISABLE KEYS */;
INSERT INTO `status_histories` VALUES (1,1546933086,'blocked_armv7el',0),(2,1546933086,'blocked_armv8el',0),(3,1546933086,'blocked_i586',0),(4,1546933086,'blocked_x86_64',0),(5,1546933086,'waiting_armv7el',0),(6,1546933086,'waiting_armv8el',0),(7,1546933086,'waiting_i586',0),(8,1546933086,'waiting_x86_64',0),(9,1546933086,'squeue_high_armv7el',0),(10,1546933086,'squeue_next_armv7el',0),(11,1546933086,'squeue_med_armv7el',0),(12,1546933086,'squeue_low_armv7el',0),(13,1546933086,'squeue_high_armv8el',0),(14,1546933086,'squeue_next_armv8el',0),(15,1546933086,'squeue_med_armv8el',0),(16,1546933086,'squeue_low_armv8el',0),(17,1546933086,'squeue_high_i586',0),(18,1546933086,'squeue_next_i586',0),(19,1546933086,'squeue_med_i586',0),(20,1546933086,'squeue_low_i586',0),(21,1546933086,'squeue_high_x86_64',0),(22,1546933086,'squeue_next_x86_64',0),(23,1546933086,'squeue_med_x86_64',0),(24,1546933086,'squeue_low_x86_64',0),(25,1546933116,'blocked_armv7el',0),(26,1546933116,'blocked_armv8el',0),(27,1546933116,'blocked_i586',0),(28,1546933116,'blocked_x86_64',0),(29,1546933116,'waiting_armv7el',0),(30,1546933116,'waiting_armv8el',0),(31,1546933116,'waiting_i586',0),(32,1546933116,'waiting_x86_64',0),(33,1546933116,'building_x86_64',0),(34,1546933116,'idle_x86_64',1),(35,1546933116,'dead_x86_64',0),(36,1546933116,'down_x86_64',0),(37,1546933116,'away_x86_64',0),(38,1546933116,'squeue_high_armv7el',0),(39,1546933116,'squeue_next_armv7el',0),(40,1546933116,'squeue_med_armv7el',0),(41,1546933116,'squeue_low_armv7el',0),(42,1546933116,'squeue_high_armv8el',0),(43,1546933116,'squeue_next_armv8el',0),(44,1546933116,'squeue_med_armv8el',0),(45,1546933116,'squeue_low_armv8el',0),(46,1546933116,'squeue_high_i586',0),(47,1546933116,'squeue_next_i586',0),(48,1546933116,'squeue_med_i586',0),(49,1546933116,'squeue_low_i586',0),(50,1546933116,'squeue_high_x86_64',0),(51,1546933116,'squeue_next_x86_64',0),(52,1546933116,'squeue_med_x86_64',0),(53,1546933116,'squeue_low_x86_64',0),(54,1546933146,'blocked_armv7el',0),(55,1546933146,'blocked_armv8el',0),(56,1546933146,'blocked_i586',0),(57,1546933146,'blocked_x86_64',0),(58,1546933146,'waiting_armv7el',0),(59,1546933146,'waiting_armv8el',0),(60,1546933146,'waiting_i586',0),(61,1546933146,'waiting_x86_64',0),(62,1546933146,'building_x86_64',0),(63,1546933146,'idle_x86_64',1),(64,1546933146,'dead_x86_64',0),(65,1546933146,'down_x86_64',0),(66,1546933146,'away_x86_64',0),(67,1546933146,'squeue_high_armv7el',0),(68,1546933146,'squeue_next_armv7el',0),(69,1546933146,'squeue_med_armv7el',0),(70,1546933146,'squeue_low_armv7el',0),(71,1546933146,'squeue_high_armv8el',0),(72,1546933146,'squeue_next_armv8el',0),(73,1546933146,'squeue_med_armv8el',0),(74,1546933146,'squeue_low_armv8el',0),(75,1546933146,'squeue_high_i586',0),(76,1546933146,'squeue_next_i586',0),(77,1546933146,'squeue_med_i586',0),(78,1546933146,'squeue_low_i586',0),(79,1546933146,'squeue_high_x86_64',0),(80,1546933146,'squeue_next_x86_64',0),(81,1546933146,'squeue_med_x86_64',0),(82,1546933146,'squeue_low_x86_64',0),(83,1546933176,'blocked_armv7el',0),(84,1546933176,'blocked_armv8el',0),(85,1546933176,'blocked_i586',0),(86,1546933176,'blocked_x86_64',0),(87,1546933176,'waiting_armv7el',0),(88,1546933176,'waiting_armv8el',0),(89,1546933176,'waiting_i586',0),(90,1546933176,'waiting_x86_64',0),(91,1546933176,'building_x86_64',0),(92,1546933176,'idle_x86_64',1),(93,1546933176,'dead_x86_64',0),(94,1546933176,'down_x86_64',0),(95,1546933176,'away_x86_64',0),(96,1546933176,'squeue_high_armv7el',0),(97,1546933176,'squeue_next_armv7el',0),(98,1546933176,'squeue_med_armv7el',0),(99,1546933176,'squeue_low_armv7el',0),(100,1546933176,'squeue_high_armv8el',0),(101,1546933176,'squeue_next_armv8el',0),(102,1546933176,'squeue_med_armv8el',0),(103,1546933176,'squeue_low_armv8el',0),(104,1546933176,'squeue_high_i586',0),(105,1546933176,'squeue_next_i586',0),(106,1546933176,'squeue_med_i586',0),(107,1546933176,'squeue_low_i586',0),(108,1546933176,'squeue_high_x86_64',0),(109,1546933176,'squeue_next_x86_64',0),(110,1546933176,'squeue_med_x86_64',0),(111,1546933176,'squeue_low_x86_64',0),(112,1546933206,'blocked_armv7el',0),(113,1546933206,'blocked_armv8el',0),(114,1546933206,'blocked_i586',0),(115,1546933206,'blocked_x86_64',0),(116,1546933206,'waiting_armv7el',0),(117,1546933206,'waiting_armv8el',0),(118,1546933206,'waiting_i586',0),(119,1546933206,'waiting_x86_64',0),(120,1546933206,'building_x86_64',0),(121,1546933206,'idle_x86_64',1),(122,1546933206,'dead_x86_64',0),(123,1546933206,'down_x86_64',0),(124,1546933206,'away_x86_64',0),(125,1546933206,'squeue_high_armv7el',0),(126,1546933206,'squeue_next_armv7el',0),(127,1546933206,'squeue_med_armv7el',0),(128,1546933206,'squeue_low_armv7el',0),(129,1546933206,'squeue_high_armv8el',0),(130,1546933206,'squeue_next_armv8el',0),(131,1546933206,'squeue_med_armv8el',0),(132,1546933206,'squeue_low_armv8el',0),(133,1546933206,'squeue_high_i586',0),(134,1546933206,'squeue_next_i586',0),(135,1546933206,'squeue_med_i586',0),(136,1546933206,'squeue_low_i586',0),(137,1546933206,'squeue_high_x86_64',0),(138,1546933206,'squeue_next_x86_64',0),(139,1546933206,'squeue_med_x86_64',0),(140,1546933206,'squeue_low_x86_64',0),(141,1546933236,'blocked_armv7el',0),(142,1546933236,'blocked_armv8el',0),(143,1546933236,'blocked_i586',0),(144,1546933236,'blocked_x86_64',0),(145,1546933236,'waiting_armv7el',0),(146,1546933236,'waiting_armv8el',0),(147,1546933236,'waiting_i586',0),(148,1546933236,'waiting_x86_64',0),(149,1546933236,'building_x86_64',0),(150,1546933236,'idle_x86_64',1),(151,1546933236,'dead_x86_64',0),(152,1546933236,'down_x86_64',0),(153,1546933236,'away_x86_64',0),(154,1546933236,'squeue_high_armv7el',0),(155,1546933236,'squeue_next_armv7el',0),(156,1546933236,'squeue_med_armv7el',0),(157,1546933236,'squeue_low_armv7el',0),(158,1546933236,'squeue_high_armv8el',0),(159,1546933236,'squeue_next_armv8el',0),(160,1546933236,'squeue_med_armv8el',0),(161,1546933236,'squeue_low_armv8el',0),(162,1546933236,'squeue_high_i586',0),(163,1546933236,'squeue_next_i586',0),(164,1546933236,'squeue_med_i586',0),(165,1546933236,'squeue_low_i586',0),(166,1546933236,'squeue_high_x86_64',0),(167,1546933236,'squeue_next_x86_64',0),(168,1546933236,'squeue_med_x86_64',0),(169,1546933236,'squeue_low_x86_64',0),(170,1546933266,'blocked_armv7el',0),(171,1546933266,'blocked_armv8el',0),(172,1546933266,'blocked_i586',0),(173,1546933266,'blocked_x86_64',0),(174,1546933266,'waiting_armv7el',0),(175,1546933266,'waiting_armv8el',0),(176,1546933266,'waiting_i586',0),(177,1546933266,'waiting_x86_64',0),(178,1546933266,'building_x86_64',0),(179,1546933266,'idle_x86_64',1),(180,1546933266,'dead_x86_64',0),(181,1546933266,'down_x86_64',0),(182,1546933266,'away_x86_64',0),(183,1546933266,'squeue_high_armv7el',0),(184,1546933266,'squeue_next_armv7el',0),(185,1546933266,'squeue_med_armv7el',0),(186,1546933266,'squeue_low_armv7el',0),(187,1546933266,'squeue_high_armv8el',0),(188,1546933266,'squeue_next_armv8el',0),(189,1546933266,'squeue_med_armv8el',0),(190,1546933266,'squeue_low_armv8el',0),(191,1546933266,'squeue_high_i586',0),(192,1546933266,'squeue_next_i586',0),(193,1546933266,'squeue_med_i586',0),(194,1546933266,'squeue_low_i586',0),(195,1546933266,'squeue_high_x86_64',0),(196,1546933266,'squeue_next_x86_64',0),(197,1546933266,'squeue_med_x86_64',0),(198,1546933266,'squeue_low_x86_64',0),(199,1546933296,'blocked_armv7el',0),(200,1546933296,'blocked_armv8el',0),(201,1546933296,'blocked_i586',0),(202,1546933296,'blocked_x86_64',0),(203,1546933296,'waiting_armv7el',0),(204,1546933296,'waiting_armv8el',0),(205,1546933296,'waiting_i586',0),(206,1546933296,'waiting_x86_64',0),(207,1546933296,'building_x86_64',0),(208,1546933296,'idle_x86_64',1),(209,1546933296,'dead_x86_64',0),(210,1546933296,'down_x86_64',0),(211,1546933296,'away_x86_64',0),(212,1546933296,'squeue_high_armv7el',0),(213,1546933296,'squeue_next_armv7el',0),(214,1546933296,'squeue_med_armv7el',0),(215,1546933296,'squeue_low_armv7el',0),(216,1546933296,'squeue_high_armv8el',0),(217,1546933296,'squeue_next_armv8el',0),(218,1546933296,'squeue_med_armv8el',0),(219,1546933296,'squeue_low_armv8el',0),(220,1546933296,'squeue_high_i586',0),(221,1546933296,'squeue_next_i586',0),(222,1546933296,'squeue_med_i586',0),(223,1546933296,'squeue_low_i586',0),(224,1546933296,'squeue_high_x86_64',0),(225,1546933296,'squeue_next_x86_64',0),(226,1546933296,'squeue_med_x86_64',0),(227,1546933296,'squeue_low_x86_64',0),(228,1546933326,'blocked_armv7el',0),(229,1546933326,'blocked_armv8el',0),(230,1546933326,'blocked_i586',0),(231,1546933326,'blocked_x86_64',0),(232,1546933326,'waiting_armv7el',0),(233,1546933326,'waiting_armv8el',0),(234,1546933326,'waiting_i586',0),(235,1546933326,'waiting_x86_64',0),(236,1546933326,'building_x86_64',0),(237,1546933326,'idle_x86_64',1),(238,1546933326,'dead_x86_64',0),(239,1546933326,'down_x86_64',0),(240,1546933326,'away_x86_64',0),(241,1546933326,'squeue_high_armv7el',0),(242,1546933326,'squeue_next_armv7el',0),(243,1546933326,'squeue_med_armv7el',0),(244,1546933326,'squeue_low_armv7el',0),(245,1546933326,'squeue_high_armv8el',0),(246,1546933326,'squeue_next_armv8el',0),(247,1546933326,'squeue_med_armv8el',0),(248,1546933326,'squeue_low_armv8el',0),(249,1546933326,'squeue_high_i586',0),(250,1546933326,'squeue_next_i586',0),(251,1546933326,'squeue_med_i586',0),(252,1546933326,'squeue_low_i586',0),(253,1546933326,'squeue_high_x86_64',0),(254,1546933326,'squeue_next_x86_64',0),(255,1546933326,'squeue_med_x86_64',0),(256,1546933326,'squeue_low_x86_64',0),(257,1546933356,'blocked_armv7el',0),(258,1546933356,'blocked_armv8el',0),(259,1546933356,'blocked_i586',0),(260,1546933356,'blocked_x86_64',0),(261,1546933356,'waiting_armv7el',0),(262,1546933356,'waiting_armv8el',0),(263,1546933356,'waiting_i586',0),(264,1546933356,'waiting_x86_64',0),(265,1546933356,'building_x86_64',0),(266,1546933356,'idle_x86_64',1),(267,1546933356,'dead_x86_64',0),(268,1546933356,'down_x86_64',0),(269,1546933356,'away_x86_64',0),(270,1546933356,'squeue_high_armv7el',0),(271,1546933356,'squeue_next_armv7el',0),(272,1546933356,'squeue_med_armv7el',0),(273,1546933356,'squeue_low_armv7el',0),(274,1546933356,'squeue_high_armv8el',0),(275,1546933356,'squeue_next_armv8el',0),(276,1546933356,'squeue_med_armv8el',0),(277,1546933356,'squeue_low_armv8el',0),(278,1546933356,'squeue_high_i586',0),(279,1546933356,'squeue_next_i586',0),(280,1546933356,'squeue_med_i586',0),(281,1546933356,'squeue_low_i586',0),(282,1546933356,'squeue_high_x86_64',0),(283,1546933356,'squeue_next_x86_64',0),(284,1546933356,'squeue_med_x86_64',0),(285,1546933356,'squeue_low_x86_64',0),(286,1546933386,'blocked_armv7el',0),(287,1546933386,'blocked_armv8el',0),(288,1546933386,'blocked_i586',0),(289,1546933386,'blocked_x86_64',0),(290,1546933386,'waiting_armv7el',0),(291,1546933386,'waiting_armv8el',0),(292,1546933386,'waiting_i586',0),(293,1546933386,'waiting_x86_64',0),(294,1546933386,'building_x86_64',0),(295,1546933386,'idle_x86_64',1),(296,1546933386,'dead_x86_64',0),(297,1546933386,'down_x86_64',0),(298,1546933386,'away_x86_64',0),(299,1546933386,'squeue_high_armv7el',0),(300,1546933386,'squeue_next_armv7el',0),(301,1546933386,'squeue_med_armv7el',0),(302,1546933386,'squeue_low_armv7el',0),(303,1546933386,'squeue_high_armv8el',0),(304,1546933386,'squeue_next_armv8el',0),(305,1546933386,'squeue_med_armv8el',0),(306,1546933386,'squeue_low_armv8el',0),(307,1546933386,'squeue_high_i586',0),(308,1546933386,'squeue_next_i586',0),(309,1546933386,'squeue_med_i586',0),(310,1546933386,'squeue_low_i586',0),(311,1546933386,'squeue_high_x86_64',0),(312,1546933386,'squeue_next_x86_64',0),(313,1546933386,'squeue_med_x86_64',0),(314,1546933386,'squeue_low_x86_64',0),(315,1546933416,'blocked_armv7el',0),(316,1546933416,'blocked_armv8el',0),(317,1546933416,'blocked_i586',0),(318,1546933416,'blocked_x86_64',0),(319,1546933416,'waiting_armv7el',0),(320,1546933416,'waiting_armv8el',0),(321,1546933416,'waiting_i586',0),(322,1546933416,'waiting_x86_64',0),(323,1546933416,'building_x86_64',0),(324,1546933416,'idle_x86_64',1),(325,1546933416,'dead_x86_64',0),(326,1546933416,'down_x86_64',0),(327,1546933416,'away_x86_64',0),(328,1546933416,'squeue_high_armv7el',0),(329,1546933416,'squeue_next_armv7el',0),(330,1546933416,'squeue_med_armv7el',0),(331,1546933416,'squeue_low_armv7el',0),(332,1546933416,'squeue_high_armv8el',0),(333,1546933416,'squeue_next_armv8el',0),(334,1546933416,'squeue_med_armv8el',0),(335,1546933416,'squeue_low_armv8el',0),(336,1546933416,'squeue_high_i586',0),(337,1546933416,'squeue_next_i586',0),(338,1546933416,'squeue_med_i586',0),(339,1546933416,'squeue_low_i586',0),(340,1546933416,'squeue_high_x86_64',0),(341,1546933416,'squeue_next_x86_64',0),(342,1546933416,'squeue_med_x86_64',0),(343,1546933416,'squeue_low_x86_64',0),(344,1546933446,'blocked_armv7el',0),(345,1546933446,'blocked_armv8el',0),(346,1546933446,'blocked_i586',0),(347,1546933446,'blocked_x86_64',0),(348,1546933446,'waiting_armv7el',0),(349,1546933446,'waiting_armv8el',0),(350,1546933446,'waiting_i586',0),(351,1546933446,'waiting_x86_64',0),(352,1546933446,'building_x86_64',0),(353,1546933446,'idle_x86_64',1),(354,1546933446,'dead_x86_64',0),(355,1546933446,'down_x86_64',0),(356,1546933446,'away_x86_64',0),(357,1546933446,'squeue_high_armv7el',0),(358,1546933446,'squeue_next_armv7el',0),(359,1546933446,'squeue_med_armv7el',0),(360,1546933446,'squeue_low_armv7el',0),(361,1546933446,'squeue_high_armv8el',0),(362,1546933446,'squeue_next_armv8el',0),(363,1546933446,'squeue_med_armv8el',0),(364,1546933446,'squeue_low_armv8el',0),(365,1546933446,'squeue_high_i586',0),(366,1546933446,'squeue_next_i586',0),(367,1546933446,'squeue_med_i586',0),(368,1546933446,'squeue_low_i586',0),(369,1546933446,'squeue_high_x86_64',0),(370,1546933446,'squeue_next_x86_64',0),(371,1546933446,'squeue_med_x86_64',0),(372,1546933446,'squeue_low_x86_64',0),(373,1546933476,'blocked_armv7el',0),(374,1546933476,'blocked_armv8el',0),(375,1546933476,'blocked_i586',0),(376,1546933476,'blocked_x86_64',0),(377,1546933476,'waiting_armv7el',0),(378,1546933476,'waiting_armv8el',0),(379,1546933476,'waiting_i586',0),(380,1546933476,'waiting_x86_64',0),(381,1546933476,'building_x86_64',0),(382,1546933476,'idle_x86_64',1),(383,1546933476,'dead_x86_64',0),(384,1546933476,'down_x86_64',0),(385,1546933476,'away_x86_64',0),(386,1546933476,'squeue_high_armv7el',0),(387,1546933476,'squeue_next_armv7el',0),(388,1546933476,'squeue_med_armv7el',0),(389,1546933476,'squeue_low_armv7el',0),(390,1546933476,'squeue_high_armv8el',0),(391,1546933476,'squeue_next_armv8el',0),(392,1546933476,'squeue_med_armv8el',0),(393,1546933476,'squeue_low_armv8el',0),(394,1546933476,'squeue_high_i586',0),(395,1546933476,'squeue_next_i586',0),(396,1546933476,'squeue_med_i586',0),(397,1546933476,'squeue_low_i586',0),(398,1546933476,'squeue_high_x86_64',0),(399,1546933476,'squeue_next_x86_64',0),(400,1546933476,'squeue_med_x86_64',0),(401,1546933476,'squeue_low_x86_64',0),(402,1546933506,'blocked_armv7el',0),(403,1546933506,'blocked_armv8el',0),(404,1546933506,'blocked_i586',0),(405,1546933506,'blocked_x86_64',0),(406,1546933506,'waiting_armv7el',0),(407,1546933506,'waiting_armv8el',0),(408,1546933506,'waiting_i586',0),(409,1546933506,'waiting_x86_64',0),(410,1546933506,'building_x86_64',0),(411,1546933506,'idle_x86_64',1),(412,1546933506,'dead_x86_64',0),(413,1546933506,'down_x86_64',0),(414,1546933506,'away_x86_64',0),(415,1546933506,'squeue_high_armv7el',0),(416,1546933506,'squeue_next_armv7el',0),(417,1546933506,'squeue_med_armv7el',0),(418,1546933506,'squeue_low_armv7el',0),(419,1546933506,'squeue_high_armv8el',1),(420,1546933506,'squeue_next_armv8el',0),(421,1546933506,'squeue_med_armv8el',0),(422,1546933506,'squeue_low_armv8el',2),(423,1546933506,'squeue_high_i586',0),(424,1546933506,'squeue_next_i586',0),(425,1546933506,'squeue_med_i586',0),(426,1546933506,'squeue_low_i586',1),(427,1546933506,'squeue_high_x86_64',0),(428,1546933506,'squeue_next_x86_64',0),(429,1546933506,'squeue_med_x86_64',0),(430,1546933506,'squeue_low_x86_64',0),(431,1546933536,'blocked_armv7el',0),(432,1546933536,'blocked_armv8el',0),(433,1546933536,'blocked_i586',0),(434,1546933536,'blocked_x86_64',0),(435,1546933536,'waiting_armv7el',0),(436,1546933536,'waiting_armv8el',0),(437,1546933536,'waiting_i586',0),(438,1546933536,'waiting_x86_64',0),(439,1546933536,'building_x86_64',0),(440,1546933536,'idle_x86_64',1),(441,1546933536,'dead_x86_64',0),(442,1546933536,'down_x86_64',0),(443,1546933536,'away_x86_64',0),(444,1546933536,'squeue_high_armv7el',0),(445,1546933536,'squeue_next_armv7el',0),(446,1546933536,'squeue_med_armv7el',0),(447,1546933536,'squeue_low_armv7el',0),(448,1546933536,'squeue_high_armv8el',1),(449,1546933536,'squeue_next_armv8el',0),(450,1546933536,'squeue_med_armv8el',0),(451,1546933536,'squeue_low_armv8el',2),(452,1546933536,'squeue_high_i586',0),(453,1546933536,'squeue_next_i586',0),(454,1546933536,'squeue_med_i586',0),(455,1546933536,'squeue_low_i586',1),(456,1546933536,'squeue_high_x86_64',0),(457,1546933536,'squeue_next_x86_64',0),(458,1546933536,'squeue_med_x86_64',0),(459,1546933536,'squeue_low_x86_64',0),(460,1546933566,'blocked_armv7el',0),(461,1546933566,'blocked_armv8el',0),(462,1546933566,'blocked_i586',0),(463,1546933566,'blocked_x86_64',0),(464,1546933566,'waiting_armv7el',0),(465,1546933566,'waiting_armv8el',0),(466,1546933566,'waiting_i586',0),(467,1546933566,'waiting_x86_64',0),(468,1546933566,'building_x86_64',0),(469,1546933566,'idle_x86_64',1),(470,1546933566,'dead_x86_64',0),(471,1546933566,'down_x86_64',0),(472,1546933566,'away_x86_64',0),(473,1546933566,'squeue_high_armv7el',0),(474,1546933566,'squeue_next_armv7el',0),(475,1546933566,'squeue_med_armv7el',0),(476,1546933566,'squeue_low_armv7el',0),(477,1546933566,'squeue_high_armv8el',1),(478,1546933566,'squeue_next_armv8el',0),(479,1546933566,'squeue_med_armv8el',0),(480,1546933566,'squeue_low_armv8el',2),(481,1546933566,'squeue_high_i586',0),(482,1546933566,'squeue_next_i586',0),(483,1546933566,'squeue_med_i586',0),(484,1546933566,'squeue_low_i586',1),(485,1546933566,'squeue_high_x86_64',0),(486,1546933566,'squeue_next_x86_64',0),(487,1546933566,'squeue_med_x86_64',0),(488,1546933566,'squeue_low_x86_64',0),(489,1546933596,'blocked_armv7el',0),(490,1546933596,'blocked_armv8el',0),(491,1546933596,'blocked_i586',0),(492,1546933596,'blocked_x86_64',0),(493,1546933596,'waiting_armv7el',0),(494,1546933596,'waiting_armv8el',0),(495,1546933596,'waiting_i586',0),(496,1546933596,'waiting_x86_64',0),(497,1546933596,'building_x86_64',0),(498,1546933596,'idle_x86_64',1),(499,1546933596,'dead_x86_64',0),(500,1546933596,'down_x86_64',0),(501,1546933596,'away_x86_64',0),(502,1546933596,'squeue_high_armv7el',0),(503,1546933596,'squeue_next_armv7el',0),(504,1546933596,'squeue_med_armv7el',0),(505,1546933596,'squeue_low_armv7el',0),(506,1546933596,'squeue_high_armv8el',1),(507,1546933596,'squeue_next_armv8el',0),(508,1546933596,'squeue_med_armv8el',0),(509,1546933596,'squeue_low_armv8el',2),(510,1546933596,'squeue_high_i586',0),(511,1546933596,'squeue_next_i586',0),(512,1546933596,'squeue_med_i586',0),(513,1546933596,'squeue_low_i586',1),(514,1546933596,'squeue_high_x86_64',0),(515,1546933596,'squeue_next_x86_64',0),(516,1546933596,'squeue_med_x86_64',0),(517,1546933596,'squeue_low_x86_64',0),(518,1546933626,'blocked_armv7el',0),(519,1546933626,'blocked_armv8el',0),(520,1546933626,'blocked_i586',0),(521,1546933626,'blocked_x86_64',0),(522,1546933626,'waiting_armv7el',0),(523,1546933626,'waiting_armv8el',0),(524,1546933626,'waiting_i586',0),(525,1546933626,'waiting_x86_64',0),(526,1546933626,'building_x86_64',0),(527,1546933626,'idle_x86_64',1),(528,1546933626,'dead_x86_64',0),(529,1546933626,'down_x86_64',0),(530,1546933626,'away_x86_64',0),(531,1546933626,'squeue_high_armv7el',0),(532,1546933626,'squeue_next_armv7el',0),(533,1546933626,'squeue_med_armv7el',0),(534,1546933626,'squeue_low_armv7el',0),(535,1546933626,'squeue_high_armv8el',1),(536,1546933626,'squeue_next_armv8el',0),(537,1546933626,'squeue_med_armv8el',0),(538,1546933626,'squeue_low_armv8el',2),(539,1546933626,'squeue_high_i586',0),(540,1546933626,'squeue_next_i586',0),(541,1546933626,'squeue_med_i586',0),(542,1546933626,'squeue_low_i586',1),(543,1546933626,'squeue_high_x86_64',0),(544,1546933626,'squeue_next_x86_64',0),(545,1546933626,'squeue_med_x86_64',0),(546,1546933626,'squeue_low_x86_64',0),(547,1546933656,'blocked_armv7el',0),(548,1546933656,'blocked_armv8el',0),(549,1546933656,'blocked_i586',0),(550,1546933656,'blocked_x86_64',0),(551,1546933656,'waiting_armv7el',0),(552,1546933656,'waiting_armv8el',0),(553,1546933656,'waiting_i586',0),(554,1546933656,'waiting_x86_64',0),(555,1546933656,'building_x86_64',0),(556,1546933656,'idle_x86_64',1),(557,1546933656,'dead_x86_64',0),(558,1546933656,'down_x86_64',0),(559,1546933656,'away_x86_64',0),(560,1546933656,'squeue_high_armv7el',0),(561,1546933656,'squeue_next_armv7el',0),(562,1546933656,'squeue_med_armv7el',0),(563,1546933656,'squeue_low_armv7el',0),(564,1546933656,'squeue_high_armv8el',1),(565,1546933656,'squeue_next_armv8el',0),(566,1546933656,'squeue_med_armv8el',0),(567,1546933656,'squeue_low_armv8el',2),(568,1546933656,'squeue_high_i586',0),(569,1546933656,'squeue_next_i586',0),(570,1546933656,'squeue_med_i586',0),(571,1546933656,'squeue_low_i586',1),(572,1546933656,'squeue_high_x86_64',0),(573,1546933656,'squeue_next_x86_64',0),(574,1546933656,'squeue_med_x86_64',0),(575,1546933656,'squeue_low_x86_64',0),(576,1546933686,'blocked_armv7el',0),(577,1546933686,'blocked_armv8el',0),(578,1546933686,'blocked_i586',0),(579,1546933686,'blocked_x86_64',0),(580,1546933686,'waiting_armv7el',0),(581,1546933686,'waiting_armv8el',0),(582,1546933686,'waiting_i586',0),(583,1546933686,'waiting_x86_64',0),(584,1546933686,'building_x86_64',0),(585,1546933686,'idle_x86_64',1),(586,1546933686,'dead_x86_64',0),(587,1546933686,'down_x86_64',0),(588,1546933686,'away_x86_64',0),(589,1546933686,'squeue_high_armv7el',0),(590,1546933686,'squeue_next_armv7el',0),(591,1546933686,'squeue_med_armv7el',0),(592,1546933686,'squeue_low_armv7el',0),(593,1546933686,'squeue_high_armv8el',1),(594,1546933686,'squeue_next_armv8el',0),(595,1546933686,'squeue_med_armv8el',0),(596,1546933686,'squeue_low_armv8el',2),(597,1546933686,'squeue_high_i586',0),(598,1546933686,'squeue_next_i586',0),(599,1546933686,'squeue_med_i586',0),(600,1546933686,'squeue_low_i586',1),(601,1546933686,'squeue_high_x86_64',0),(602,1546933686,'squeue_next_x86_64',0),(603,1546933686,'squeue_med_x86_64',0),(604,1546933686,'squeue_low_x86_64',0),(605,1546950847,'building_x86_64',0),(606,1546950847,'idle_x86_64',1),(607,1546950847,'dead_x86_64',0),(608,1546950847,'down_x86_64',0),(609,1546950847,'away_x86_64',0),(610,1546950877,'building_x86_64',0),(611,1546950877,'idle_x86_64',1),(612,1546950877,'dead_x86_64',0),(613,1546950877,'down_x86_64',0),(614,1546950877,'away_x86_64',0),(615,1546950907,'building_x86_64',0),(616,1546950907,'idle_x86_64',1),(617,1546950907,'dead_x86_64',0),(618,1546950907,'down_x86_64',0),(619,1546950907,'away_x86_64',0),(620,1546950937,'building_x86_64',0),(621,1546950937,'idle_x86_64',1),(622,1546950937,'dead_x86_64',0),(623,1546950937,'down_x86_64',0),(624,1546950937,'away_x86_64',0),(625,1546950967,'building_x86_64',0),(626,1546950967,'idle_x86_64',1),(627,1546950967,'dead_x86_64',0),(628,1546950967,'down_x86_64',0),(629,1546950967,'away_x86_64',0),(630,1546950997,'building_x86_64',0),(631,1546950997,'idle_x86_64',1),(632,1546950997,'dead_x86_64',0),(633,1546950997,'down_x86_64',0),(634,1546950997,'away_x86_64',0),(635,1546951027,'building_x86_64',0),(636,1546951027,'idle_x86_64',1),(637,1546951027,'dead_x86_64',0),(638,1546951027,'down_x86_64',0),(639,1546951027,'away_x86_64',0),(640,1546951057,'building_x86_64',0),(641,1546951057,'idle_x86_64',1),(642,1546951057,'dead_x86_64',0),(643,1546951057,'down_x86_64',0),(644,1546951057,'away_x86_64',0),(645,1546951087,'building_x86_64',0),(646,1546951087,'idle_x86_64',1),(647,1546951087,'dead_x86_64',0),(648,1546951087,'down_x86_64',0),(649,1546951087,'away_x86_64',0),(650,1546951117,'building_x86_64',0),(651,1546951117,'idle_x86_64',1),(652,1546951117,'dead_x86_64',0),(653,1546951117,'down_x86_64',0),(654,1546951117,'away_x86_64',0),(655,1546951147,'building_x86_64',0),(656,1546951147,'idle_x86_64',1),(657,1546951147,'dead_x86_64',0),(658,1546951147,'down_x86_64',0),(659,1546951147,'away_x86_64',0),(660,1546951177,'building_x86_64',0),(661,1546951177,'idle_x86_64',1),(662,1546951177,'dead_x86_64',0),(663,1546951177,'down_x86_64',0),(664,1546951177,'away_x86_64',0),(665,1546951207,'building_x86_64',0),(666,1546951207,'idle_x86_64',1),(667,1546951207,'dead_x86_64',0),(668,1546951207,'down_x86_64',0),(669,1546951207,'away_x86_64',0),(670,1546951237,'building_x86_64',0),(671,1546951237,'idle_x86_64',1),(672,1546951237,'dead_x86_64',0),(673,1546951237,'down_x86_64',0),(674,1546951237,'away_x86_64',0),(675,1546951267,'building_x86_64',0),(676,1546951267,'idle_x86_64',1),(677,1546951267,'dead_x86_64',0),(678,1546951267,'down_x86_64',0),(679,1546951267,'away_x86_64',0),(680,1546951297,'building_x86_64',0),(681,1546951297,'idle_x86_64',1),(682,1546951297,'dead_x86_64',0),(683,1546951297,'down_x86_64',0),(684,1546951297,'away_x86_64',0),(685,1546951327,'building_x86_64',0),(686,1546951327,'idle_x86_64',1),(687,1546951327,'dead_x86_64',0),(688,1546951327,'down_x86_64',0),(689,1546951327,'away_x86_64',0),(690,1546951357,'building_x86_64',0),(691,1546951357,'idle_x86_64',1),(692,1546951357,'dead_x86_64',0),(693,1546951357,'down_x86_64',0),(694,1546951357,'away_x86_64',0),(695,1546951387,'building_x86_64',0),(696,1546951387,'idle_x86_64',1),(697,1546951387,'dead_x86_64',0),(698,1546951387,'down_x86_64',0),(699,1546951387,'away_x86_64',0),(700,1546951417,'building_x86_64',0),(701,1546951417,'idle_x86_64',1),(702,1546951417,'dead_x86_64',0),(703,1546951417,'down_x86_64',0),(704,1546951417,'away_x86_64',0),(705,1546951447,'building_x86_64',0),(706,1546951447,'idle_x86_64',1),(707,1546951447,'dead_x86_64',0),(708,1546951447,'down_x86_64',0),(709,1546951447,'away_x86_64',0),(710,1546951477,'building_x86_64',0),(711,1546951477,'idle_x86_64',1),(712,1546951477,'dead_x86_64',0),(713,1546951477,'down_x86_64',0),(714,1546951477,'away_x86_64',0),(715,1546951507,'building_x86_64',0),(716,1546951507,'idle_x86_64',1),(717,1546951507,'dead_x86_64',0),(718,1546951507,'down_x86_64',0),(719,1546951507,'away_x86_64',0),(720,1546951537,'building_x86_64',0),(721,1546951537,'idle_x86_64',1),(722,1546951537,'dead_x86_64',0),(723,1546951537,'down_x86_64',0),(724,1546951537,'away_x86_64',0),(725,1546951567,'building_x86_64',0),(726,1546951567,'idle_x86_64',1),(727,1546951567,'dead_x86_64',0),(728,1546951567,'down_x86_64',0),(729,1546951567,'away_x86_64',0),(730,1546951597,'building_x86_64',0),(731,1546951597,'idle_x86_64',1),(732,1546951597,'dead_x86_64',0),(733,1546951597,'down_x86_64',0),(734,1546951597,'away_x86_64',0),(735,1546951627,'building_x86_64',0),(736,1546951627,'idle_x86_64',1),(737,1546951627,'dead_x86_64',0),(738,1546951627,'down_x86_64',0),(739,1546951627,'away_x86_64',0),(740,1546951657,'building_x86_64',0),(741,1546951657,'idle_x86_64',1),(742,1546951657,'dead_x86_64',0),(743,1546951657,'down_x86_64',0),(744,1546951657,'away_x86_64',0);
/*!40000 ALTER TABLE `status_histories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `status_messages`
--

DROP TABLE IF EXISTS `status_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `status_messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `message` text CHARACTER SET utf8,
  `user_id` int(11) DEFAULT NULL,
  `severity` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user` (`user_id`),
  KEY `index_status_messages_on_deleted_at_and_created_at` (`deleted_at`,`created_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `status_messages`
--

LOCK TABLES `status_messages` WRITE;
/*!40000 ALTER TABLE `status_messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `status_messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taggings`
--

DROP TABLE IF EXISTS `taggings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `taggings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `taggable_id` int(11) DEFAULT NULL,
  `taggable_type` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `tag_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `taggings_taggable_id_index` (`taggable_id`,`taggable_type`,`tag_id`,`user_id`),
  KEY `index_taggings_on_taggable_type` (`taggable_type`),
  KEY `tag_id` (`tag_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `taggings_ibfk_1` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`),
  CONSTRAINT `taggings_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taggings`
--

LOCK TABLES `taggings` WRITE;
/*!40000 ALTER TABLE `taggings` DISABLE KEYS */;
/*!40000 ALTER TABLE `taggings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 NOT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tags_name_unique_index` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tokens`
--

DROP TABLE IF EXISTS `tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `string` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `package_id` int(11) DEFAULT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_tokens_on_string` (`string`),
  KEY `user_id` (`user_id`),
  KEY `package_id` (`package_id`),
  CONSTRAINT `tokens_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `tokens_ibfk_2` FOREIGN KEY (`package_id`) REFERENCES `packages` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tokens`
--

LOCK TABLES `tokens` WRITE;
/*!40000 ALTER TABLE `tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `updateinfo_counter`
--

DROP TABLE IF EXISTS `updateinfo_counter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `updateinfo_counter` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `maintenance_db_project_id` int(11) DEFAULT NULL,
  `day` int(11) DEFAULT NULL,
  `month` int(11) DEFAULT NULL,
  `year` int(11) DEFAULT NULL,
  `counter` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `updateinfo_counter`
--

LOCK TABLES `updateinfo_counter` WRITE;
/*!40000 ALTER TABLE `updateinfo_counter` DISABLE KEYS */;
/*!40000 ALTER TABLE `updateinfo_counter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `updateinfo_counters`
--

DROP TABLE IF EXISTS `updateinfo_counters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `updateinfo_counters` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `maintenance_db_project_id` int(11) DEFAULT NULL,
  `day` int(11) DEFAULT NULL,
  `month` int(11) DEFAULT NULL,
  `year` int(11) DEFAULT NULL,
  `counter` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `updateinfo_counters`
--

LOCK TABLES `updateinfo_counters` WRITE;
/*!40000 ALTER TABLE `updateinfo_counters` DISABLE KEYS */;
/*!40000 ALTER TABLE `updateinfo_counters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_registrations`
--

DROP TABLE IF EXISTS `user_registrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_registrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `token` text CHARACTER SET utf8 NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_registrations_user_id_index` (`user_id`),
  KEY `user_registrations_expires_at_index` (`expires_at`),
  CONSTRAINT `user_registrations_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_registrations`
--

LOCK TABLES `user_registrations` WRITE;
/*!40000 ALTER TABLE `user_registrations` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_registrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `last_logged_in_at` datetime DEFAULT NULL,
  `login_failure_count` int(11) NOT NULL DEFAULT '0',
  `login` text COLLATE utf8_bin,
  `email` varchar(200) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `realname` varchar(200) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `password_digest` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `deprecated_password` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `deprecated_password_hash_type` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `deprecated_password_salt` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `adminnote` text CHARACTER SET utf8,
  `state` enum('unconfirmed','confirmed','locked','deleted','subaccount') COLLATE utf8_bin DEFAULT 'unconfirmed',
  `owner_id` int(11) DEFAULT NULL,
  `ignore_auth_services` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_login_index` (`login`(255)),
  KEY `users_password_index` (`deprecated_password`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'2019-01-08 07:34:30','2019-01-08 12:47:24.770223','2019-01-08 12:47:24',0,'Admin','root@localhost','OBS Instance Superuser','$2a$10$Rrmfm9ym.erwM3AWA7k64uoNUzQCOBzpq6/yPWSNDeDG0BivcJtB2',NULL,NULL,NULL,NULL,'confirmed',NULL,0),(2,'2019-01-08 07:34:30','2019-01-08 07:34:30.000000',NULL,0,'_nobody_','nobody@localhost','Anonymous User',NULL,'416333d0da34b99107b6ca037caf13e9','md5','WyxsC9GKF5',NULL,'locked',NULL,0);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `watched_projects`
--

DROP TABLE IF EXISTS `watched_projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `watched_projects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `project_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `watched_projects_users_fk_1` (`user_id`),
  CONSTRAINT `watched_projects_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `watched_projects`
--

LOCK TABLES `watched_projects` WRITE;
/*!40000 ALTER TABLE `watched_projects` DISABLE KEYS */;
/*!40000 ALTER TABLE `watched_projects` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-01-08 13:48:02
