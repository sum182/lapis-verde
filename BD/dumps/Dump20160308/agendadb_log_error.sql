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
  PRIMARY KEY (`log_error_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_error`
--

LOCK TABLES `log_error` WRITE;
/*!40000 ALTER TABLE `log_error` DISABLE KEYS */;
INSERT INTO `log_error` VALUES ('2A679327-6EE5-E511-9C5B-0DC11C74FC64','[FireDAC][Phys][SQLite] ERROR: no such column: a.enviado_server','Agenda Bee','untDmEscola','TDmEscola','SalvarAgenda',1,NULL,16,'2016-03-08 17:41:37','2016-03-08 17:42:02'),('2B7A203C-9711-47C5-B1E0-9A01B853254D','[FireDAC][Phys][MySQL] Duplicate entry \'56F62F85-5EE5-E511-A57D-D7F4C0BDCB8B\' for key \'PRIMARY\'','AgendaServer.exe','untSmMain','TSmMain','SalvarLogError',1,NULL,16,'2016-03-08 15:50:59','2016-03-08 15:50:59'),('4C782657-F823-4E8D-A221-862834CECFE8','[FireDAC][Phys][MySQL] Duplicate entry \'6E39B54E-7373-44F0-ACB2-941FC51BE977\' for key \'PRIMARY\'[FireDAC][Phys][MySQL] Duplicate entry \'669C45B3-3A37-4EEA-95E0-DBFB024951A7\' for key \'PRIMARY\'[FireDAC][Phys][MySQL] Duplicate entry \'006886B2-7F9C-4226-B452-5CCA44C6E4CE\' for key \'PRIMARY\'[FireDAC][Phys][MySQL] Duplicate entry \'6E39B54E-7373-44F0-ACB2-941FC51BE977-19\' for key \'PRIMARY\'[FireDAC][Phys][MySQL] Duplicate entry \'669C45B3-3A37-4EEA-95E0-DBFB024951A7-19\' for key \'PRIMARY\'[FireDAC][Phys][MySQL] Duplicate entry \'006886B2-7F9C-4226-B452-5CCA44C6E4CE-19\' for key \'PRIMARY\'','AgendaServer.exe','untSmEscola','TSmEscola','SalvarAgenda',1,NULL,16,'2016-03-08 16:20:41','2016-03-08 16:20:41'),('4C85643F-FA01-4AE2-855D-08A203435CD6','[FireDAC][Phys][MySQL] Duplicate entry \'F489628A-5EE5-E511-A57D-D7F4C0BDCB8B\' for key \'PRIMARY\'','AgendaServer.exe','untSmEscola','TSmEscola','SalvarAgenda',1,NULL,16,'2016-03-08 15:50:54','2016-03-08 15:50:55'),('56F62F85-5EE5-E511-A57D-D7F4C0BDCB8B','[FireDAC][Phys][SQLite] ERROR: UNIQUE constraint failed: agenda_aluno.agenda_id, agenda_aluno.aluno_id','Agenda Bee','untDmEscola','TDmEscola','GetAgenda',1,NULL,16,'2016-03-08 15:49:42','2016-03-08 15:50:32'),('58EBB146-29D5-404F-A2B6-374C3C9BF7CB','[FireDAC][Phys][MySQL] Duplicate entry \'6E39B54E-7373-44F0-ACB2-941FC51BE977\' for key \'PRIMARY\'[FireDAC][Phys][MySQL] Duplicate entry \'669C45B3-3A37-4EEA-95E0-DBFB024951A7\' for key \'PRIMARY\'[FireDAC][Phys][MySQL] Duplicate entry \'006886B2-7F9C-4226-B452-5CCA44C6E4CE\' for key \'PRIMARY\'[FireDAC][Phys][MySQL] Duplicate entry \'6E39B54E-7373-44F0-ACB2-941FC51BE977-19\' for key \'PRIMARY\'[FireDAC][Phys][MySQL] Duplicate entry \'669C45B3-3A37-4EEA-95E0-DBFB024951A7-19\' for key \'PRIMARY\'[FireDAC][Phys][MySQL] Duplicate entry \'006886B2-7F9C-4226-B452-5CCA44C6E4CE-19\' for key \'PRIMARY\'','AgendaServer.exe','untSmEscola','TSmEscola','SalvarAgenda',1,NULL,16,'2016-03-08 16:21:05','2016-03-08 16:21:05'),('5BE1B067-D4F1-42D1-BCF5-EBB9C8AFBA1F','[FireDAC][Phys][MySQL] Duplicate entry \'DEE2D41A-6EE5-E511-9C5B-0DC11C74FC64\' for key \'PRIMARY\'','AgendaServer.exe','untSmMain','TSmMain','SalvarLogError',1,NULL,16,'2016-03-08 17:42:03','2016-03-08 17:42:03'),('6517BB8D-CB0E-4167-811A-1DD7B95D4A2A','[FireDAC][Phys][MySQL] Duplicate entry \'56F62F85-5EE5-E511-A57D-D7F4C0BDCB8B\' for key \'PRIMARY\'[FireDAC][Phys][MySQL] Duplicate entry \'DEE81B97-5EE5-E511-A57D-D7F4C0BDCB8B\' for key \'PRIMARY\'','AgendaServer.exe','untSmMain','TSmMain','SalvarLogError',1,NULL,16,'2016-03-08 15:55:42','2016-03-08 15:55:43'),('66C6C486-6FE5-E511-896A-21F2E0D17F80','Erro ao salvar agenda\r[FireDAC][Phys][MySQL] Duplicate entry \'B4A069AB-6EE5-E511-B38F-FDC87DDF9FD9\' for key \'PRIMARY\'[FireDAC][Phys][MySQL] Duplicate entry \'B4A069AB-6EE5-E511-B38F-FDC87DDF9FD9-19\' for key \'PRIMARY\'','Agenda Bee','untDmEscola','TDmEscola','SalvarAgenda',1,NULL,16,'2016-03-08 17:51:26','2016-03-08 17:51:52'),('D0628AED-33FD-4EC3-9149-C0CBBD987B2C','[FireDAC][Phys][MySQL] Duplicate entry \'06AA7E39-A2F8-4C50-9854-1D693B620DBC\' for key \'PRIMARY\'[FireDAC][Phys][MySQL] Duplicate entry \'06AA7E39-A2F8-4C50-9854-1D693B620DBC-19\' for key \'PRIMARY\'','AgendaServer.exe','untSmEscola','TSmEscola','SalvarAgenda',1,NULL,16,'2016-03-08 16:19:07','2016-03-08 16:19:07'),('DEE2D41A-6EE5-E511-9C5B-0DC11C74FC64','[FireDAC][Phys][SQLite] ERROR: no such column: a.enviado_server','Agenda Bee','untDmEscola','TDmEscola','SalvarAgenda',1,NULL,16,'2016-03-08 17:41:16','2016-03-08 17:41:46'),('DEE81B97-5EE5-E511-A57D-D7F4C0BDCB8B','fdqLogErrorSaveServer: Field \'fdadfa\' not found','Agenda Bee','untDM','TDM','SalvarLogError',1,NULL,16,'2016-03-08 15:50:12','2016-03-08 15:50:58'),('EB8CD8AF-8A8D-4D10-B324-D68D28448D2B','[FireDAC][Phys][MySQL] Duplicate entry \'1E1996F1-5FE5-E511-BB20-6D4D3AA1F181\' for key \'PRIMARY\'[FireDAC][Phys][MySQL] Duplicate entry \'1E1996F1-5FE5-E511-BB20-6D4D3AA1F181-19\' for key \'PRIMARY\'','AgendaServer.exe','untSmEscola','TSmEscola','SalvarAgenda',1,NULL,16,'2016-03-08 16:02:34','2016-03-08 16:02:35'),('EE12155B-06E6-4FC0-A51F-D04508FFE5AE','[FireDAC][Phys][MySQL] Duplicate entry \'B4A069AB-6EE5-E511-B38F-FDC87DDF9FD9\' for key \'PRIMARY\'[FireDAC][Phys][MySQL] Duplicate entry \'B4A069AB-6EE5-E511-B38F-FDC87DDF9FD9-19\' for key \'PRIMARY\'','AgendaServer.exe','untSmEscola','TSmEscola','SalvarAgenda',1,NULL,16,'2016-03-08 17:51:45','2016-03-08 17:51:45'),('F71BEBCD-00BD-4B59-9E81-D8479AAF6B84','[FireDAC][Phys][MySQL] Duplicate entry \'06AA7E39-A2F8-4C50-9854-1D693B620DBC\' for key \'PRIMARY\'[FireDAC][Phys][MySQL] Duplicate entry \'06AA7E39-A2F8-4C50-9854-1D693B620DBC-19\' for key \'PRIMARY\'','AgendaServer.exe','untSmEscola','TSmEscola','SalvarAgenda',1,NULL,16,'2016-03-08 16:17:31','2016-03-08 16:17:31'),('F840F8A7-5EE5-E511-A57D-D7F4C0BDCB8B','Erro ao Salvar logs\r[FireDAC][Phys][MySQL] Duplicate entry \'56F62F85-5EE5-E511-A57D-D7F4C0BDCB8B\' for key \'PRIMARY\'fdqLogErrorSaveServer: Field \'fdadfa\' not found','Agenda Bee','untDM','TDM','SalvarLogError',1,NULL,16,'2016-03-08 15:50:41','2016-03-08 15:55:42');
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

-- Dump completed on 2016-03-08 17:59:20
