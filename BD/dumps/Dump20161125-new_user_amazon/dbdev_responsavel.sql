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
  `responsavel_tipo_id` smallint(6) DEFAULT NULL,
  `senha` varchar(150) DEFAULT NULL,
  `data_atualizacao` datetime DEFAULT NULL,
  PRIMARY KEY (`responsavel_id`),
  KEY `idx_responsavel_nome` (`nome`),
  KEY `idx_responsavel_sobrenome` (`sobrenome`),
  KEY `idx_responsavel_sexo` (`sexo`),
  KEY `idx_responsavel_rg` (`rg`),
  KEY `idx_responsavel_cpf` (`cpf`),
  KEY `idx_responsavel_ativo` (`ativo`),
  KEY `idx_responsavel_email` (`email`),
  KEY `fk_responsavel_x_responsavel_tipo_idx` (`responsavel_tipo_id`),
  KEY `idx_responsavel_senha` (`senha`),
  CONSTRAINT `fk_responsavel_x_responsavel_tipo` FOREIGN KEY (`responsavel_tipo_id`) REFERENCES `responsavel_tipo` (`responsavel_tipo_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=89 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `responsavel`
--

LOCK TABLES `responsavel` WRITE;
/*!40000 ALTER TABLE `responsavel` DISABLE KEYS */;
INSERT INTO `responsavel` VALUES (9,'Alvaro','Esteves Bomconpagno Alves','M','427099705',32087213828,'S','a',NULL,NULL,'Zkh4SWFraExURS9EcDBCaFlRPT1h','2016-11-15 10:23:49'),(10,'Vanessa','Keiko Bomconpagno','F','44244574x',35103953870,'S','n',NULL,NULL,'Zkh4SWFraExURS9EcDBCaFlRPT1h','2016-11-15 10:23:49'),(16,'Resposanvel de Teste - ID Escola 2',NULL,NULL,NULL,NULL,'S',NULL,NULL,NULL,NULL,'2016-08-11 12:03:19'),(27,'Teste cel','Ffff','M','2',20872138282,'S','Teste@gmail.com',NULL,NULL,'Zkh4SWFraExURS9EcDBCaFlRPT1h','2016-08-19 16:52:55'),(28,'Joao','teste','M','27099705',2087213827,'S','Joao@gmail.com',NULL,NULL,'Zkh4SWFraExURS9EcDBCaFlRPT1h','2016-08-19 17:06:41'),(29,'Maria','do bairro','F','1',300,'S','Maria@gmail.com',NULL,NULL,'Zkh4SWFraExURS9EcDBCaFlRPT1h',NULL),(30,'Qq','q','M','22',300,'S','Qwer@gg.com',NULL,NULL,'Zkh4SWFraExURS9EcDBCaFlRPT1h',NULL),(31,'401','3','M','4',401,'S','401@gmail.com',NULL,NULL,'Zkh4SWFraExURS9EcDBCaFlRPT1h','2016-08-23 11:11:44'),(32,'402','G','M','402',402,'S','402@gmail.com',NULL,NULL,'Zkh4SWFraExURS9EcDBCaFlRPT1h',NULL),(33,'404','a','M','11',404,'S','aaa@adsafrad.com',NULL,NULL,'Zkh4SWFraExURS9EcDBCaFlRPT1h',NULL),(34,'403','\'','M','55',403,'S','Cg@dfg.com',NULL,NULL,'Zkh4SWFraExURS9EcDBCaFlRPT1h',NULL),(35,'404','4','M','4',404,'S','404adsa.com@fdsafas.com',NULL,NULL,'Zkh4SWFraExURS9EcDBCaFlRPT1h',NULL),(36,'405','405','M','22',405,'S','405@gmail.com',NULL,NULL,'Zkh4SWFraExURS9EcDBCaFlRPT1h','2016-08-19 16:12:22'),(37,'Wagner','Jeronimo','M','34',34,'S','wag182@gmail.com',NULL,NULL,'Zkh4SWFraExURS9EcDBCaFlRPT0xMjM=',NULL),(38,'Vanessa Keiko','Bomconpagno Alves','F','44244574',35103953870,'S','nessakb@gmail.com',NULL,NULL,'Zkh4SWFraExURS9EcDBCaFlRPT1hKnYyMDAz',NULL),(39,'Alvaro','Esteves','M','8888',32087213828,'S','Sum1822@gmail.com',NULL,NULL,'Zkh4SWFraExURS9EcDBCaFlRPT1h',NULL),(40,'Alvaro','Esteves','M','8888',32087213828,'S','Sum1822@gmail.com',NULL,NULL,'Zkh4SWFraExURS9EcDBCaFlRPT1h',NULL),(41,'405','Ftt','M','9',406,'S','406@gmail.com',NULL,NULL,'Zkh4SWFraExURS9EcDBCaFlRPT1h','2016-08-19 16:12:11'),(42,'407','Gg','M','1',407,'S','407@gmail.vgg',NULL,NULL,'Zkh4SWFraExURS9EcDBCaFlRPT1E',NULL),(43,'408','408','M','9',408,'S','A@drf.com',NULL,NULL,'Zkh4SWFraExURS9EcDBCaFlRPT1h',NULL),(44,'410','Y','M','1',410,'S','Ttt@rftt.com',NULL,NULL,'Zkh4SWFraExURS9EcDBCaFlRPT1h',NULL),(45,'411','@','M','2',411,'S','Dgf@fg.com',NULL,NULL,'Zkh4SWFraExURS9EcDBCaFlRPT1h','2016-08-23 11:11:47'),(46,'412','A','M','4',412,'S','Hdudsut@hjfjfid.com',NULL,NULL,'Zkh4SWFraExURS9EcDBCaFlRPT1h',NULL),(47,'413','X','M','4',414,'S','Frf@sdf.com',NULL,NULL,'Zkh4SWFraExURS9EcDBCaFlRPT1h','2016-08-23 11:11:51'),(48,'415','a','M','222',400,'S','DeYfg@dtuh.com',NULL,NULL,'Zkh4SWFraExURS9EcDBCaFlRPT1h',NULL),(49,'Alexandre','Alves','M','469956227',32741376859,'S','Alestalves@gmail.com',NULL,NULL,'Zkh4SWFraExURS9EcDBCaFlRPT10ZXN0ZQ==',NULL),(50,'416','416','M','416',416,'S','416@gmail.com',NULL,NULL,'Zkh4SWFraExURS9EcDBCaFlRPT1h',NULL),(51,'417','417','F','417',416,'S','417@gmail.com',NULL,NULL,'Zkh4SWFraExURS9EcDBCaFlRPT1h',NULL),(52,'418','a','M','',417,'S','418@gmail.com',NULL,NULL,'Zkh4SWFraExURS9EcDBCaFlRPT1h','2016-08-19 16:42:03'),(53,'417','a','M','111',419,'S','419@gmail.com',NULL,NULL,'Zkh4SWFraExURS9EcDBCaFlRPT1h','2016-08-19 16:38:12'),(54,'420','444','M','22',420,'S','420@gmail.com',NULL,NULL,'Zkh4SWFraExURS9EcDBCaFlRPT1h',NULL),(55,'teste','','','',NULL,'S','',NULL,NULL,'',NULL),(56,'teste','','','',NULL,'S','',NULL,NULL,'',NULL),(57,'teste','','','',NULL,'S','',NULL,NULL,'',NULL),(58,'A','a','M','65',2585272434342425,'S','Rft@rft.vom',NULL,NULL,'Zkh4SWFraExURS9EcDBCaFlRPT1h',NULL),(59,'Teyeye','ywyw','F','225568',255524486,'S','Xnjeie@hduc.com',NULL,NULL,'Zkh4SWFraExURS9EcDBCaFlRPT1h',NULL),(60,'Teste tablet','trff','F','11',430,'S','Sum18eee2@GmaIl.com',NULL,NULL,'Zkh4SWFraExURS9EcDBCaFlRPT1h',NULL),(61,'Dio','Dorete','M','296335214',25541236548,'S','Diogenesdorete@gmail.com',NULL,NULL,'Zkh4SWFraExURS9EcDBCaFlRPT0xMjM0NQ==',NULL),(62,'dsaf','fdas','M','12',32087213828,'S','sum18232@gmail.com',NULL,NULL,'Zkh4SWFraExURS9EcDBCaFlRPT1h',NULL),(63,'Aa','ffg','M','55',435,'S','Fgf@gfgh.mjj',NULL,NULL,'Zkh4SWFraExURS9EcDBCaFlRPT1h',NULL),(64,'Dd','ffg','M','222',999,'S','Ffgvv@rgg.com',NULL,NULL,'Zkh4SWFraExURS9EcDBCaFlRPT1hYQ==',NULL),(65,'A','a','M','52',23,'S','Sdg@fhui.com',NULL,NULL,'Zkh4SWFraExURS9EcDBCaFlRPT1h',NULL),(66,'Leonardo','Lima da Silva','M','370463754',29163653893,'S','leolima80rj@gmail.com',NULL,1,NULL,NULL),(69,'29/04/2016','aaa','M','427099705',29042016,'S','2904@ggfa.com',NULL,NULL,'Zkh4SWFraExURS9EcDBCaFlRPT1h','2016-08-23 11:11:54'),(70,'a','a','M','1',320,'S','sum18sad2@gmail.com',NULL,NULL,'Zkh4SWFraExURS9EcDBCaFlRPT1hYQ==','2016-04-29 07:03:13'),(71,'D','f','M','22',22,'S','Dr@dff.com',NULL,NULL,'Zkh4SWFraExURS9EcDBCaFlRPT1h','2016-05-01 15:39:15'),(72,'Rr','ff\n','M','427099705',3287213828,'S','Ggg@ttg.com\n',NULL,NULL,'Zkh4SWFraExURS9EcDBCaFlRPT1h','2016-05-30 12:29:31'),(73,'G','f','M','22',320872138289,'S','Ff@df@rf.com\n',NULL,NULL,'Zkh4SWFraExURS9EcDBCaFlRPT1h','2016-05-30 14:23:41'),(74,'a','a','M','33',66,'S','adfa@fdas.com',NULL,NULL,'Zkh4SWFraExURS9EcDBCaFlRPT1h','2016-06-05 20:57:59'),(75,'Responsavel de Teste','Sobrenome ','M','222222',1111111,'S','r','zzz',NULL,'Zkh4SWFraExURS9EcDBCaFlRPT1y','2016-10-06 03:13:24'),(76,'aaaaaasddsxc','aaa','M','1111',111111111,'S','b2@b2.com',NULL,NULL,'Zkh4SWFraExURS9EcDBCaFlRPT1iMkBiMi5jb20=','2016-08-22 12:47:30'),(77,'teste1608','a','M','111',1111,'S','teste1608@email.com',NULL,NULL,'Zkh4SWFraExURS9EcDBCaFlRPT1h','2016-08-16 14:50:26'),(78,'Aws','aqs\n','M','11',111111,'S','Aaaa@asgy.com\n',NULL,NULL,'Zkh4SWFraExURS9EcDBCaFlRPT1h','2016-10-06 17:25:41'),(79,'Teste','teste','M','11',11111111111,'S','Teste@teste.com',NULL,NULL,'Zkh4SWFraExURS9EcDBCaFlRPT1h','2016-11-23 12:56:51'),(80,'Teste2','teste2','M','11',11,'S','Teste2@email.com',NULL,NULL,'Zkh4SWFraExURS9EcDBCaFlRPT1h','2016-11-23 13:02:54'),(81,'700','700','M','1',1,'S','700@email.com',NULL,NULL,'Zkh4SWFraExURS9EcDBCaFlRPT1h','2016-11-23 13:14:45'),(82,'702','7','M','111',111,'S','702@email.com',NULL,NULL,'Zkh4SWFraExURS9EcDBCaFlRPT1h','2016-11-23 13:20:31'),(83,'704','704','M','704',704,'S','704@email.com',NULL,NULL,'Zkh4SWFraExURS9EcDBCaFlRPT1h','2016-11-23 13:24:51'),(84,'705','705','M','705',705,'S','705@email.com',NULL,NULL,'Zkh4SWFraExURS9EcDBCaFlRPT1h','2016-11-23 13:28:09'),(85,'706','706','M','706',706,'S','706@email.com',NULL,NULL,'Zkh4SWFraExURS9EcDBCaFlRPT1h','2016-11-23 13:32:44'),(86,'707','7','M','707',707,'S','707@email.com',NULL,NULL,'Zkh4SWFraExURS9EcDBCaFlRPT1h','2016-11-23 13:37:53'),(87,'708','708','M','708',708,'S','708@emailg.mcom',NULL,NULL,'Zkh4SWFraExURS9EcDBCaFlRPT1h','2016-11-23 13:45:45'),(88,'Cvvv','cgg','M','5555',888,'S','Fvg&@ennb.com',NULL,NULL,'Zkh4SWFraExURS9EcDBCaFlRPT1h','2016-11-23 14:11:28');
/*!40000 ALTER TABLE `responsavel` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`admin`@`%`*/ /*!50003 TRIGGER `dbdev`.`responsavel_BEFORE_INSERT` BEFORE INSERT ON `responsavel` FOR EACH ROW
BEGIN
  /*if (new.data_atualizacao is null) or (new.data_atualizacao = '0000-00-00 00:00:00')then
    SET new.data_atualizacao = now();
  end if; '*/  
  
  SET new.data_atualizacao = now();
  
  CALL  sp_tabela_atualizacao_set('responsavel',0);
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
/*!50003 CREATE*/ /*!50017 DEFINER=`admin`@`%`*/ /*!50003 TRIGGER `dbdev`.`responsavel_BEFORE_UPDATE` BEFORE UPDATE ON `responsavel` FOR EACH ROW
BEGIN
  /*if (new.data_atualizacao is null) or (new.data_atualizacao = '0000-00-00 00:00:00')then
    SET new.data_atualizacao = now();
  end if; '*/  
  
  SET new.data_atualizacao = now();
  
  CALL  sp_tabela_atualizacao_set('responsavel',0);
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
/*!50003 CREATE*/ /*!50017 DEFINER=`admin`@`%`*/ /*!50003 TRIGGER `dbdev`.`responsavel_BEFORE_DELETE` BEFORE DELETE ON `responsavel` FOR EACH ROW
BEGIN
CALL  sp_tabela_atualizacao_set('responsavel',0);
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

-- Dump completed on 2016-11-25 15:53:08
