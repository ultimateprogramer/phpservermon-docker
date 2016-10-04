-- MySQL dump 10.13  Distrib 5.7.15, for Linux (x86_64)
--
-- Host: localhost    Database: phpmon
-- ------------------------------------------------------
-- Server version	5.7.15

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
-- Table structure for table `psm_config`
--

USE server_monitor;

DROP TABLE IF EXISTS `psm_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `psm_config` (
  `key` varchar(255) NOT NULL,
  `value` varchar(255) NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `psm_config`
--

LOCK TABLES `psm_config` WRITE;
/*!40000 ALTER TABLE `psm_config` DISABLE KEYS */;
INSERT INTO `psm_config` VALUES ('language','en_US'),('email_status','1'),('email_from_email','monitor@example.org'),('email_from_name','Server Monitor'),('email_smtp',''),('email_smtp_host',''),('email_smtp_port',''),('email_smtp_security',''),('email_smtp_username',''),('email_smtp_password',''),('sms_status','0'),('sms_gateway','mollie'),('sms_gateway_username','username'),('sms_gateway_password','password'),('sms_from','1234567890'),('pushover_status','0'),('pushover_api_token',''),('alert_type','status'),('log_status','1'),('log_email','1'),('log_sms','1'),('log_pushover','1'),('log_retention_period','365'),('version','3.1.1'),('version_update_check','3.1.1'),('auto_refresh_servers','0'),('show_update','1'),('last_update_check','1475470137'),('cron_running','0'),('cron_running_time','0');
/*!40000 ALTER TABLE `psm_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `psm_log`
--

DROP TABLE IF EXISTS `psm_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `psm_log` (
  `log_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `server_id` int(11) unsigned NOT NULL,
  `type` enum('status','email','sms','pushover') NOT NULL,
  `message` varchar(255) NOT NULL,
  `datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_id` varchar(255) NOT NULL,
  PRIMARY KEY (`log_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `psm_log`
--

LOCK TABLES `psm_log` WRITE;
/*!40000 ALTER TABLE `psm_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `psm_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `psm_servers`
--

DROP TABLE IF EXISTS `psm_servers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `psm_servers` (
  `server_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ip` varchar(100) NOT NULL,
  `port` int(5) unsigned NOT NULL,
  `label` varchar(255) NOT NULL,
  `type` enum('service','website') NOT NULL DEFAULT 'service',
  `pattern` varchar(255) NOT NULL,
  `status` enum('on','off') NOT NULL DEFAULT 'on',
  `error` varchar(255) DEFAULT NULL,
  `rtime` float(9,7) DEFAULT NULL,
  `last_online` datetime DEFAULT NULL,
  `last_check` datetime DEFAULT NULL,
  `active` enum('yes','no') NOT NULL DEFAULT 'yes',
  `email` enum('yes','no') NOT NULL DEFAULT 'yes',
  `sms` enum('yes','no') NOT NULL DEFAULT 'no',
  `pushover` enum('yes','no') NOT NULL DEFAULT 'yes',
  `warning_threshold` mediumint(1) unsigned NOT NULL DEFAULT '1',
  `warning_threshold_counter` mediumint(1) unsigned NOT NULL DEFAULT '0',
  `timeout` smallint(1) unsigned DEFAULT NULL,
  PRIMARY KEY (`server_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `psm_servers`
--

LOCK TABLES `psm_servers` WRITE;
/*!40000 ALTER TABLE `psm_servers` DISABLE KEYS */;
/*!40000 ALTER TABLE `psm_servers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `psm_servers_history`
--

DROP TABLE IF EXISTS `psm_servers_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `psm_servers_history` (
  `servers_history_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `server_id` int(11) unsigned NOT NULL,
  `date` date NOT NULL,
  `latency_min` float(9,7) NOT NULL,
  `latency_avg` float(9,7) NOT NULL,
  `latency_max` float(9,7) NOT NULL,
  `checks_total` int(11) unsigned NOT NULL,
  `checks_failed` int(11) unsigned NOT NULL,
  PRIMARY KEY (`servers_history_id`),
  UNIQUE KEY `server_id_date` (`server_id`,`date`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `psm_servers_history`
--

LOCK TABLES `psm_servers_history` WRITE;
/*!40000 ALTER TABLE `psm_servers_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `psm_servers_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `psm_servers_uptime`
--

DROP TABLE IF EXISTS `psm_servers_uptime`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `psm_servers_uptime` (
  `servers_uptime_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `server_id` int(11) unsigned NOT NULL,
  `date` datetime NOT NULL,
  `status` tinyint(1) unsigned NOT NULL,
  `latency` float(9,7) DEFAULT NULL,
  PRIMARY KEY (`servers_uptime_id`),
  KEY `server_id` (`server_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `psm_servers_uptime`
--

LOCK TABLES `psm_servers_uptime` WRITE;
/*!40000 ALTER TABLE `psm_servers_uptime` DISABLE KEYS */;
/*!40000 ALTER TABLE `psm_servers_uptime` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `psm_users`
--

DROP TABLE IF EXISTS `psm_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `psm_users` (
  `user_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_name` varchar(64) NOT NULL COMMENT 'user''s name, unique',
  `password` varchar(255) NOT NULL COMMENT 'user''s password in salted and hashed format',
  `password_reset_hash` char(40) DEFAULT NULL COMMENT 'user''s password reset code',
  `password_reset_timestamp` bigint(20) DEFAULT NULL COMMENT 'timestamp of the password reset request',
  `rememberme_token` varchar(64) DEFAULT NULL COMMENT 'user''s remember-me cookie token',
  `level` tinyint(2) unsigned NOT NULL DEFAULT '20',
  `name` varchar(255) NOT NULL,
  `mobile` varchar(15) NOT NULL,
  `pushover_key` varchar(255) NOT NULL,
  `pushover_device` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `unique_username` (`user_name`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `psm_users`
--

LOCK TABLES `psm_users` WRITE;
/*!40000 ALTER TABLE `psm_users` DISABLE KEYS */;
INSERT INTO `psm_users` VALUES (1,'admin','$2y$10$.1z0KhoG6d9vpk/AHg1UG.fzGdC5DJydD0IljJmN3o2TTITZmXNCK',NULL,NULL,'a6db67efa1ae715db5d3edcdb395d81645e7c72cbeda5a6b9d6d7a7c1e09b804',10,'admin','','','','admin@email.com');
/*!40000 ALTER TABLE `psm_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `psm_users_preferences`
--

DROP TABLE IF EXISTS `psm_users_preferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `psm_users_preferences` (
  `user_id` int(11) unsigned NOT NULL,
  `key` varchar(255) NOT NULL,
  `value` varchar(255) NOT NULL,
  PRIMARY KEY (`user_id`,`key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `psm_users_preferences`
--

LOCK TABLES `psm_users_preferences` WRITE;
/*!40000 ALTER TABLE `psm_users_preferences` DISABLE KEYS */;
/*!40000 ALTER TABLE `psm_users_preferences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `psm_users_servers`
--

DROP TABLE IF EXISTS `psm_users_servers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `psm_users_servers` (
  `user_id` int(11) unsigned NOT NULL,
  `server_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`server_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `psm_users_servers`
--

LOCK TABLES `psm_users_servers` WRITE;
/*!40000 ALTER TABLE `psm_users_servers` DISABLE KEYS */;
/*!40000 ALTER TABLE `psm_users_servers` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-10-04  4:44:07
