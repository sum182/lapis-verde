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
-- Table structure for table `responsavel`
--

DROP TABLE IF EXISTS `responsavel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `responsavel` (
  `responsavel_id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(150) DEFAULT NULL,
  `sobrenome` varchar(150) DEFAULT NULL,
  `sexo` char(1) DEFAULT NULL,
  `rg` varchar(50) DEFAULT NULL,
  `cpf` bigint(20) DEFAULT NULL,
  `ativo` char(1) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `informacoes_gerais` text,
  `escola_id` int(11) DEFAULT NULL,
  `responsavel_tipo_id` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`responsavel_id`),
  KEY `fk_responsavel_escola_idx` (`escola_id`),
  KEY `idx_responsavel_nome` (`nome`),
  KEY `idx_responsavel_sobrenome` (`sobrenome`),
  KEY `idx_responsavel_sexo` (`sexo`),
  KEY `idx_responsavel_rg` (`rg`),
  KEY `idx_responsavel_cpf` (`cpf`),
  KEY `idx_responsavel_ativo` (`ativo`),
  KEY `idx_responsavel_email` (`email`),
  KEY `fk_responsavel_x_responsavel_tipo_idx` (`responsavel_tipo_id`),
  CONSTRAINT `fk_responsavel_x_escola` FOREIGN KEY (`escola_id`) REFERENCES `escola` (`escola_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_responsavel_x_responsavel_tipo` FOREIGN KEY (`responsavel_tipo_id`) REFERENCES `responsavel_tipo` (`responsavel_tipo_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `responsavel`
--

LOCK TABLES `responsavel` WRITE;
/*!40000 ALTER TABLE `responsavel` DISABLE KEYS */;
INSERT INTO `responsavel` VALUES (9,'Alvaro','Esteves Bomconpagno Alves',NULL,'427099705',32087213828,'S','sum182@gmail.com',NULL,1,NULL),(10,'Vanessa','Keiko Bomconpagno Alves',NULL,NULL,NULL,'S',NULL,NULL,1,NULL),(16,'Resposanvel de Teste - ID Escola 2',NULL,NULL,NULL,NULL,'S',NULL,NULL,2,NULL);
/*!40000 ALTER TABLE `responsavel` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-02-01 16:53:24
