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
-- Table structure for table `device_usuario`
--

DROP TABLE IF EXISTS `device_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `device_usuario` (
  `device_usuario_id` varchar(100) NOT NULL,
  `device_id` varchar(150) DEFAULT NULL,
  `device_token` varchar(150) DEFAULT NULL,
  `funcionario_id` int(11) DEFAULT NULL,
  `responsavel_id` int(11) DEFAULT NULL,
  `data_atualizacao` datetime DEFAULT NULL,
  `data_insert_server` datetime DEFAULT NULL,
  `sistema_operacional_tipo_id` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`device_usuario_id`),
  KEY `fk_device_usuario_x_funcionario_idx` (`funcionario_id`),
  KEY `fk_device_usuario_x_responsavel_idx` (`responsavel_id`),
  KEY `fk_device_usuario_x_sistema_operacional_tipo_idx` (`sistema_operacional_tipo_id`),
  CONSTRAINT `fk_device_usuario_x_funcionario` FOREIGN KEY (`funcionario_id`) REFERENCES `funcionario` (`funcionario_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_device_usuario_x_responsavel` FOREIGN KEY (`responsavel_id`) REFERENCES `responsavel` (`responsavel_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_device_usuario_x_sistema_operacional_tipo` FOREIGN KEY (`sistema_operacional_tipo_id`) REFERENCES `sistema_operacional_tipo` (`sistema_operacional_tipo_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-10-26 23:38:28
