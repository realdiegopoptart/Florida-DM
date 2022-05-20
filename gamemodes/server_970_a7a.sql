-- MySQL dump 10.16  Distrib 10.1.44-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: server_970_a7a
-- ------------------------------------------------------
-- Server version	10.1.44-MariaDB-1~jessie

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
-- Table structure for table `fdm_accounts`
--

DROP TABLE IF EXISTS `fdm_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fdm_accounts` (
  `acc_dbid` int(11) NOT NULL AUTO_INCREMENT,
  `acc_name` varchar(32) NOT NULL DEFAULT '0',
  `acc_pass` varchar(128) NOT NULL DEFAULT '0',
  `register_ip` varchar(60) NOT NULL DEFAULT '0',
  `groupid` varchar(60) NOT NULL DEFAULT '0',
  `grouprank` varchar(32) NOT NULL DEFAULT 'None',
  `Last_Ip` varchar(50) DEFAULT NULL,
  `register_date` varchar(90) NOT NULL DEFAULT '0',
  `acc_score` int(225) DEFAULT '0',
  `acc_deaths` int(225) DEFAULT '0',
  `acc_kills` int(225) DEFAULT '0',
  `Arena_kills` int(20) DEFAULT '0',
  `Duel_kills` int(20) DEFAULT '0',
  `Gwar_kills` int(20) NOT NULL DEFAULT '0',
  `acc_money` int(10) DEFAULT '0',
  `acc_color` int(2) DEFAULT '0',
  `Handled_Tickets` int(100) DEFAULT '0',
  `Abans` int(16) NOT NULL DEFAULT '0',
  `Ajails` int(11) NOT NULL DEFAULT '0',
  `Awarns` int(11) NOT NULL DEFAULT '0',
  `pAdmin` int(2) DEFAULT '0',
  `AdminCode` int(4) DEFAULT '0',
  `pMute` varchar(1) DEFAULT '0',
  `pMuteReason` varchar(64) NOT NULL DEFAULT '0',
  `pBan` int(11) DEFAULT '0',
  `pBanReason` varchar(150) NOT NULL DEFAULT '0',
  `pBanAdmin` varchar(32) NOT NULL DEFAULT '0',
  `pDonator` int(11) NOT NULL DEFAULT '0',
  `pWarns` int(100) NOT NULL DEFAULT '0',
  `pJails` int(100) NOT NULL DEFAULT '0',
  PRIMARY KEY (`acc_dbid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fdm_accounts`
--

LOCK TABLES `fdm_accounts` WRITE;
/*!40000 ALTER TABLE `fdm_accounts` DISABLE KEYS */;
INSERT INTO `fdm_accounts` VALUES (66,'Ahmed','f71a1eff14938acd05baa4be54ff70383d693b90','102.156.9.150','0','None','','September 3, 2021 01:07:53',0,0,0,0,0,0,0,0,0,0,0,0,5,9992,'0','0',0,'0','0',0,0,0),(67,'glass_','4ab1108ce6284ad7e517314bb7290c48a3a97ef9','105.66.129.43','0','None','105.66.129.43','September 7, 2021 20:55:55',0,0,0,0,0,0,0,0,0,0,0,0,0,0,'0','0',0,'0','0',0,0,0),(68,'Loul','736f086b4c04fac97e6d221b457a518ea2aed2fe','197.1.11.201','0','None','','September 7, 2021 21:26:10',0,0,0,0,0,0,0,0,0,0,0,0,0,0,'0','0',0,'0','0',0,0,0);
/*!40000 ALTER TABLE `fdm_accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fdm_groups`
--

DROP TABLE IF EXISTS `fdm_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fdm_groups` (
  `gID` int(11) NOT NULL AUTO_INCREMENT,
  `gName` varchar(128) NOT NULL DEFAULT 'none',
  `gOwnerName` varchar(32) NOT NULL DEFAULT 'no_leader',
  `gChat` int(2) NOT NULL DEFAULT '0',
  `gTag` varchar(5) NOT NULL DEFAULT 'TAG',
  PRIMARY KEY (`gID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fdm_groups`
--

LOCK TABLES `fdm_groups` WRITE;
/*!40000 ALTER TABLE `fdm_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `fdm_groups` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-09-08  1:37:45
