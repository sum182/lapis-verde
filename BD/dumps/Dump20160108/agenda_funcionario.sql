-- MySQL dump 10.13  Distrib 5.6.24, for Win32 (x86)
--
-- Host: localhost    Database: agenda
-- ------------------------------------------------------
-- Server version	5.6.26-log

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
-- Table structure for table `funcionario`
--

DROP TABLE IF EXISTS `funcionario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `funcionario` (
  `funcionario_id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(150) DEFAULT NULL,
  `sobrenome` varchar(150) DEFAULT NULL,
  `sexo` char(1) DEFAULT NULL,
  `rg` varchar(50) DEFAULT NULL,
  `cpf` bigint(20) DEFAULT NULL,
  `ativo` char(1) DEFAULT 'S',
  `email` varchar(150) DEFAULT NULL,
  `senha` varchar(150) DEFAULT NULL,
  `informacoes_gerais` text,
  `funcionario_tipo_id` smallint(6) DEFAULT NULL,
  `escola_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`funcionario_id`),
  KEY `fk_funcionario_tp_func_idx` (`funcionario_tipo_id`),
  KEY `fk_funcionario_escola_idx` (`escola_id`),
  KEY `idx_funcionario_nome` (`nome`),
  KEY `idx_funcionario_sobrenome` (`sobrenome`),
  KEY `idx_funcionario_ativo` (`ativo`),
  KEY `idx_funcionario_senha` (`senha`),
  KEY `idx_funcionario_email` (`email`),
  CONSTRAINT `fk_funcionario_x_escola` FOREIGN KEY (`escola_id`) REFERENCES `escola` (`escola_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_funcionario_x_funcionario_tipo` FOREIGN KEY (`funcionario_tipo_id`) REFERENCES `funcionario_tipo` (`funcionario_tipo_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `funcionario`
--

LOCK TABLES `funcionario` WRITE;
/*!40000 ALTER TABLE `funcionario` DISABLE KEYS */;
INSERT INTO `funcionario` VALUES (6,'Professora - Maria',NULL,'M',NULL,11111111111,'S','xxx','MTY4NTRAIypzdW0xODJAIyo5OTg3ZmRhcw==',NULL,4,1),(9,'Funcionario de Teste - ID Escola 2',NULL,NULL,NULL,NULL,'S',NULL,NULL,NULL,NULL,2),(11,'Coordenadora - Josinalda',NULL,NULL,NULL,11111111111,'S','ss','MTY4NTRAIypzdW0xODJAIyo5OTg3c2VuaGEgZGUgY29vcmRl',NULL,7,1),(16,'Login',NULL,NULL,NULL,11111111111,'S','a','MTY4NTRAIypzdW0xODJAIyo5OTg3YQ==','login e senha = a',NULL,1),(17,'eu',NULL,NULL,NULL,32087213828,'S','email@email.com','MTY4NTRAIypzdW0xODJAIyo5OTg3YQ==',NULL,NULL,1);
/*!40000 ALTER TABLE `funcionario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-01-08 14:43:10
