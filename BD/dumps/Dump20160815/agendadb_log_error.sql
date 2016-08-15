-- MySQL dump 10.13  Distrib 5.6.24, for Win32 (x86)
--
-- Host: agendadb.cfmlnopzuyrp.sa-east-1.rds.amazonaws.com    Database: agendadb
-- ------------------------------------------------------
-- Server version	5.6.23-log

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
-- Table structure for table `log_error`
--

DROP TABLE IF EXISTS `log_error`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log_error` (
  `log_error_id` varchar(100) NOT NULL,
  `msg_error` varchar(5000) DEFAULT NULL,
  `aplicacao` varchar(100) DEFAULT NULL,
  `unit` varchar(100) DEFAULT NULL,
  `class` varchar(100) DEFAULT NULL,
  `metodo` varchar(100) DEFAULT NULL,
  `escola_id` int(11) DEFAULT NULL,
  `responsavel_id` int(11) DEFAULT NULL,
  `funcionario_id` int(11) DEFAULT NULL,
  `data` datetime DEFAULT NULL,
  `data_insert_server` datetime DEFAULT NULL,
  `enviado_server` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`log_error_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_error`
--

LOCK TABLES `log_error` WRITE;
/*!40000 ALTER TABLE `log_error` DISABLE KEYS */;
INSERT INTO `log_error` VALUES ('0BB431F9-5110-40F3-B50E-83CE85234EA3','[FireDAC][Phys][SQLite] ERROR: near \"\' || coalesce(a.sobrenome,\'\": syntax error','Lápis Verde','untDmGetServer','TDmGetServer','GetAlunos',0,75,NULL,'2016-08-15 15:39:29','2016-08-15 15:39:35','S'),('38B040B4-2763-E611-804F-A52EEE7876AA','java.io.EOFException','Lápis Verde','untDmGetServer','TDmGetServer','GetTurmas',1,NULL,18,'2016-08-15 17:34:46','2016-08-15 17:36:13','S'),('DA8E3BAC-2763-E611-804F-A52EEE7876AA','java.io.EOFException','Lápis Verde','untDmGetServer','TDmGetServer','GetTabelaAtualizacao',1,NULL,18,'2016-08-15 17:34:32','2016-08-15 17:36:13','S');
/*!40000 ALTER TABLE `log_error` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-08-15 17:42:51
