-- MySQL dump 10.16  Distrib 10.1.44-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: server_948_palestine
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


CREATE TABLE `fdm_accounts` (
  `acc_dbid` INT(11) NOT NULL AUTO_INCREMENT,
  `acc_name` VARCHAR(32) NOT NULL DEFAULT '0' COLLATE 'latin1_swedish_ci',
  `acc_pass` VARCHAR(128) NOT NULL DEFAULT '0' COLLATE 'latin1_swedish_ci',
  `register_ip` VARCHAR(60) NOT NULL DEFAULT '0' COLLATE 'latin1_swedish_ci',
  `groupid` VARCHAR(60) NOT NULL DEFAULT '0' COLLATE 'latin1_swedish_ci',
  `grouprank` VARCHAR(32) NOT NULL DEFAULT 'None' COLLATE 'latin1_swedish_ci',
  `Last_Ip` VARCHAR(50) NULL DEFAULT NULL COLLATE 'latin1_swedish_ci',
  `register_date` VARCHAR(90) NOT NULL DEFAULT '0' COLLATE 'latin1_swedish_ci',
  `acc_score` INT(225) NULL DEFAULT '0',
  `acc_deaths` INT(225) NULL DEFAULT '0',
  `acc_kills` INT(225) NULL DEFAULT '0',
  `Arena_kills` INT(20) NULL DEFAULT '0',
  `Duel_kills` INT(20) NULL DEFAULT '0',
  `Gwar_kills` INT(20) NOT NULL DEFAULT '0',
  `acc_money` INT(10) NULL DEFAULT '0',
  `acc_color` INT(2) NULL DEFAULT '0',
  `Handled_Tickets` INT(100) NULL DEFAULT '0',
  `pAdmin` INT(2) NULL DEFAULT '0',
  `pMute` VARCHAR(1) NULL DEFAULT '0' COLLATE 'latin1_swedish_ci',
  `pMuteReason` VARCHAR(64) NOT NULL DEFAULT '0' COLLATE 'latin1_swedish_ci',
  `pBan` INT(11) NULL DEFAULT '0',
  `pBanReason` VARCHAR(150) NOT NULL DEFAULT '0' COLLATE 'latin1_swedish_ci',
  `pBanAdmin` VARCHAR(32) NOT NULL DEFAULT '0' COLLATE 'latin1_swedish_ci',
  `pDonator` INT(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`acc_dbid`) USING BTREE
)
COLLATE='latin1_swedish_ci'
ENGINE=InnoDB
AUTO_INCREMENT=66
;




--
-- Table structure for table `fdm_groups`
--

DROP TABLE IF EXISTS `fdm_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fdm_groups` (
  `gID` INT(11) NOT NULL AUTO_INCREMENT,
  `gName` VARCHAR(128) NOT NULL DEFAULT 'none' COLLATE 'latin1_swedish_ci',
  `gOwnerName` VARCHAR(32) NOT NULL DEFAULT 'no_leader' COLLATE 'latin1_swedish_ci',
  `gChat` INT(2) NOT NULL DEFAULT '0',
  `gTag` VARCHAR(5) NOT NULL DEFAULT 'TAG' COLLATE 'latin1_swedish_ci',
  PRIMARY KEY (`gID`) USING BTREE
)
COLLATE='latin1_swedish_ci'
ENGINE=InnoDB
AUTO_INCREMENT=63
;
