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
-- Table structure for table `escola_endereco`
--

DROP TABLE IF EXISTS `escola_endereco`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `escola_endereco` (
  `escola_endereco_id` int(11) NOT NULL AUTO_INCREMENT,
  `cep` varchar(20) DEFAULT NULL,
  `logradouro` varchar(200) DEFAULT NULL,
  `numero` smallint(6) DEFAULT NULL,
  `complemento` varchar(50) DEFAULT NULL,
  `cidade` varchar(50) DEFAULT NULL,
  `bairro` varchar(50) DEFAULT NULL,
  `uf` varchar(10) DEFAULT NULL,
  `escola_id` int(11) NOT NULL,
  PRIMARY KEY (`escola_endereco_id`),
  KEY `fk_escola_endereco_idx` (`escola_id`),
  KEY `idx_escola_escola_endereco_cep` (`cep`),
  KEY `idx_escola_escola_endereco_logradouro` (`logradouro`),
  KEY `idx_escola_escola_endereco_numero` (`numero`),
  KEY `idx_escola_escola_endereco_cidade` (`cidade`),
  KEY `idx_escola_escola_endereco_bairro` (`bairro`),
  KEY `idx_escola_escola_endereco_uf` (`uf`),
  CONSTRAINT `fk_escola_endereco_x_escola` FOREIGN KEY (`escola_id`) REFERENCES `escola` (`escola_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `escola_endereco`
--

LOCK TABLES `escola_endereco` WRITE;
/*!40000 ALTER TABLE `escola_endereco` DISABLE KEYS */;
INSERT INTO `escola_endereco` VALUES (1,'07020240','Rua Aruja',72,'apto 122A','Guarulhos','Gopouva','SP',2);
/*!40000 ALTER TABLE `escola_endereco` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-01-08 16:30:29
