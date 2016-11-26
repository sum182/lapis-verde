-- MySQL dump 10.13  Distrib 5.6.24, for Win32 (x86)
--
-- Host: dbdev.c8jh4twad1hp.sa-east-1.rds.amazonaws.com    Database: dbdev
-- ------------------------------------------------------
-- Server version	5.6.27-log

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
  `sistema_operacional_tipo_id` smallint(6) DEFAULT NULL,
  `data_atualizacao` datetime DEFAULT NULL,
  `data_insert_server` datetime DEFAULT NULL,
  PRIMARY KEY (`device_usuario_id`),
  KEY `fk_device_usuario_x_funcionario_idx` (`funcionario_id`),
  KEY `fk_device_usuario_x_responsavel_idx` (`responsavel_id`),
  KEY `fk_device_usuario_x_sistema_operacional_tipo_idx` (`sistema_operacional_tipo_id`),
  CONSTRAINT `fk_device_usuario_x_funcionario` FOREIGN KEY (`funcionario_id`) REFERENCES `funcionario` (`funcionario_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_device_usuario_x_responsavel` FOREIGN KEY (`responsavel_id`) REFERENCES `responsavel` (`responsavel_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_device_usuario_x_sistema_operacional_tipo` FOREIGN KEY (`sistema_operacional_tipo_id`) REFERENCES `sistema_operacional_tipo` (`sistema_operacional_tipo_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `device_usuario`
--

LOCK TABLES `device_usuario` WRITE;
/*!40000 ALTER TABLE `device_usuario` DISABLE KEYS */;
INSERT INTO `device_usuario` VALUES ('42F58CD3-0681-48C2-A0C8-AA53F8D087BD','DeviceId-Teste-Windows','DeviceToken-Teste-Windows',18,NULL,1,'2016-11-22 14:19:57','2016-11-22 14:19:59'),('5471CF8B-D7B0-E611-B25D-5FE39E8E27C6','A5CE8569BB4F980722ADE6C0C1761AC1','APA91bEv6j2RvKZwsZmXeKSIl4vuEOtcXcW8soDT2N1UVjjkLhGvH7ahUcV7zIE9smvkXOtflKRWdCrih3D-t7lyYDzHcB08InJuE_jHSjHQgUtq4leC3q8jLuenCu6wBjRgkEfOltE4',NULL,75,2,'2016-11-22 15:17:29','2016-11-22 15:17:07'),('76F00C7D-89B1-E611-A120-83FD555D7B0F','1EA6461CF836D971BD9850BA6B51ED40','APA91bG6Au5XhjYG5HNhbOgC1fyn2fC3NxGoKAXYld1TueEo4d4Vpkd2XAdrwYcopEAaz59kzV8tUVIYHi-gGx3qTKoIaCA-4idoBrr_ldQuBZjl3QZhqUqvjfvAOgG7KcDctLCubs9t',18,NULL,2,'2016-11-23 12:31:14','2016-11-23 12:31:09'),('FEBD3DF8-87B1-E611-B581-450BF7E46262','8F370FA19DB12EAC2C6D84C15D9A1849','APA91bFjgNap24nMn6iPbh91jEG0VqJfsr-C8wSqxprazTdXyMmrNtts5M69abBrm7HJAn3HWqbZtgyCGEzr3DvnJ9oYdC_Z5rmIRpPhbnaceUE07l4HhCwIwSksZQj3lJeSSlU47UCS',NULL,10,2,'2016-11-23 12:20:22','2016-11-23 12:20:01');
/*!40000 ALTER TABLE `device_usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`admin`@`%`*/ /*!50003 TRIGGER `dbdev`.`device_usuario_BEFORE_INSERT` BEFORE INSERT ON `device_usuario` FOR EACH ROW
BEGIN
  if (new.data_atualizacao is null) or (new.data_atualizacao = '0000-00-00 00:00:00')then
    SET new.data_atualizacao = now();
  end if;
  
  CALL  sp_tabela_atualizacao_set_by_user('device_usuario',new.responsavel_id,new.funcionario_id);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`admin`@`%`*/ /*!50003 TRIGGER `dbdev`.`device_usuario_BEFORE_UPDATE` BEFORE UPDATE ON `device_usuario` FOR EACH ROW
BEGIN
  if (new.data_atualizacao is null) or (new.data_atualizacao = '0000-00-00 00:00:00')then
    SET new.data_atualizacao = now();
  end if;
  
  CALL  sp_tabela_atualizacao_set_by_user('device_usuario',new.responsavel_id,new.funcionario_id);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`admin`@`%`*/ /*!50003 TRIGGER `dbdev`.`device_usuario_BEFORE_DELETE` BEFORE DELETE ON `device_usuario` FOR EACH ROW
BEGIN
  CALL  sp_tabela_atualizacao_set_by_user('device_usuario',old.responsavel_id,old.funcionario_id);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-11-25 15:53:26
