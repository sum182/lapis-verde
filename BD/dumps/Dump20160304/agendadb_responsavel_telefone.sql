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
-- Table structure for table `responsavel_telefone`
--

DROP TABLE IF EXISTS `responsavel_telefone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `responsavel_telefone` (
  `responsavel_telefone_id` int(11) NOT NULL AUTO_INCREMENT,
  `responsavel_id` int(11) DEFAULT NULL,
  `telefone_tipo_id` smallint(6) DEFAULT NULL,
  `numero` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`responsavel_telefone_id`),
  KEY `responsavel_telefone_responsavel_idx` (`responsavel_id`),
  KEY `fk_responsavel_telefone_x_telefone_tipo_idx` (`telefone_tipo_id`),
  KEY `idx_responsavel_telefone_numero` (`numero`),
  CONSTRAINT `fk_responsavel_telefone_x_responsavel` FOREIGN KEY (`responsavel_id`) REFERENCES `responsavel` (`responsavel_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_responsavel_telefone_x_telefone_tipo` FOREIGN KEY (`telefone_tipo_id`) REFERENCES `telefone_tipo` (`telefone_tipo_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `responsavel_telefone`
--

LOCK TABLES `responsavel_telefone` WRITE;
/*!40000 ALTER TABLE `responsavel_telefone` DISABLE KEYS */;
INSERT INTO `responsavel_telefone` VALUES (3,27,2,'82147819'),(4,28,2,'82147819'),(5,29,2,'982147819'),(6,30,2,'982147852'),(7,31,2,'222'),(8,32,2,'999'),(9,33,2,'11'),(10,34,2,'222'),(11,35,2,'211'),(12,36,2,'222'),(13,37,2,'11983777633'),(14,38,2,'011982147818'),(15,39,2,'982147819'),(16,40,2,'982147819'),(17,41,2,'66'),(18,42,2,'66'),(19,43,2,'99'),(20,44,2,'99'),(21,45,2,'5255'),(22,46,2,'555'),(23,47,2,'222'),(24,48,2,'4433'),(25,49,2,'5511982675316'),(26,50,2,'23421'),(27,51,2,'444'),(28,52,2,'9821777'),(29,53,2,''),(30,54,2,'222'),(31,55,2,''),(32,56,2,''),(33,57,2,''),(34,58,2,'3333'),(35,59,2,'28853'),(36,60,2,'221994'),(37,61,2,'119999675421'),(38,62,2,'23123'),(39,63,2,'555');
/*!40000 ALTER TABLE `responsavel_telefone` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-03-04 16:16:49
