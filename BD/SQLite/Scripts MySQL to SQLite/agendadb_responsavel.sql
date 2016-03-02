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
-- Table structure for table responsavel
--

DROP TABLE IF EXISTS responsavel;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE responsavel (
  responsavel_id integer NOT NULL ,
  nome varchar(150) ,
  sobrenome varchar(150) ,
  sexo char(1) ,
  rg varchar(50) ,
  cpf bigint(20) ,
  ativo char(1) ,
  email varchar(150) ,
  informacoes_gerais blob,
  escola_id integer ,
  responsavel_tipo_id smallint(6) ,
  senha varchar(150) ,
  PRIMARY KEY (responsavel_id),
  KEY fk_responsavel_escola_idx (escola_id),
  KEY idx_responsavel_nome (nome),
  KEY idx_responsavel_sobrenome (sobrenome),
  KEY idx_responsavel_sexo (sexo),
  KEY idx_responsavel_rg (rg),
  KEY idx_responsavel_cpf (cpf),
  KEY idx_responsavel_ativo (ativo),
  KEY idx_responsavel_email (email),
  KEY fk_responsavel_x_responsavel_tipo_idx (responsavel_tipo_id),
  KEY idx_responsavel_senha (senha),
  CONSTRAINT fk_responsavel_x_escola FOREIGN KEY (escola_id) REFERENCES escola (escola_id) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT fk_responsavel_x_responsavel_tipo FOREIGN KEY (responsavel_tipo_id) REFERENCES responsavel_tipo (responsavel_tipo_id) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB =64 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table responsavel
--

LOCK TABLES responsavel WRITE;
/*!40000 ALTER TABLE responsavel DISABLE KEYS */;
INSERT INTO responsavel VALUES (9,'Alvaro','Esteves Bomconpagno Alves',NULL,'427099705',32087213828,'S','sum182@gmail.com',NULL,1,NULL,'Zkh4SWFraExURS9EcDBCaFlRPT1h'),(10,'Vanessa','Keiko Bomconpagno Alves',NULL,NULL,NULL,'S',NULL,NULL,1,NULL,NULL),(16,'Resposanvel de Teste - ID Escola 2',NULL,NULL,NULL,NULL,'S',NULL,NULL,2,NULL,NULL),(17,'b','b',NULL,NULL,NULL,'S','b',NULL,1,NULL,'Zkh4SWFraExURS9EcDBCaFlRPT1i'),(27,'Teste cel','Ffff','M','2',20872138282,'S','Teste@gmail.com',NULL,NULL,NULL,'Zkh4SWFraExURS9EcDBCaFlRPT1h'),(28,'Joao','teste','M','27099705',2087213827,'S','Joao@gmail.com',NULL,NULL,NULL,'Zkh4SWFraExURS9EcDBCaFlRPT1h'),(29,'Maria','do bairro','F','1',300,'S','Maria@gmail.com',NULL,NULL,NULL,'Zkh4SWFraExURS9EcDBCaFlRPT1h'),(30,'Qq','q','M','22',300,'S','Qwer@gg.com',NULL,NULL,NULL,'Zkh4SWFraExURS9EcDBCaFlRPT1h'),(31,'401','3','M','4',401,'S','401@gmail.com',NULL,NULL,NULL,'Zkh4SWFraExURS9EcDBCaFlRPT1h'),(32,'402','G','M','402',402,'S','402@gmail.com',NULL,NULL,NULL,'Zkh4SWFraExURS9EcDBCaFlRPT1h'),(33,'404','a','M','11',404,'S','aaa@adsafrad.com',NULL,NULL,NULL,'Zkh4SWFraExURS9EcDBCaFlRPT1h'),(34,'403','\'','M','55',403,'S','Cg@dfg.com',NULL,NULL,NULL,'Zkh4SWFraExURS9EcDBCaFlRPT1h'),(35,'404','4','M','4',404,'S','404adsa.com@fdsafas.com',NULL,NULL,NULL,'Zkh4SWFraExURS9EcDBCaFlRPT1h'),(36,'405','405','M','22',405,'S','405@gmail.com',NULL,NULL,NULL,'Zkh4SWFraExURS9EcDBCaFlRPT1h'),(37,'Wagner','Jeronimo','M','34',34,'S','wag182@gmail.com',NULL,NULL,NULL,'Zkh4SWFraExURS9EcDBCaFlRPT0xMjM='),(38,'Vanessa Keiko','Bomconpagno Alves','F','44244574',35103953870,'S','nessakb@gmail.com',NULL,NULL,NULL,'Zkh4SWFraExURS9EcDBCaFlRPT1hKnYyMDAz'),(39,'Alvaro','Esteves','M','8888',32087213828,'S','Sum1822@gmail.com',NULL,NULL,NULL,'Zkh4SWFraExURS9EcDBCaFlRPT1h'),(40,'Alvaro','Esteves','M','8888',32087213828,'S','Sum1822@gmail.com',NULL,NULL,NULL,'Zkh4SWFraExURS9EcDBCaFlRPT1h'),(41,'405','Ftt','M','9',406,'S','406@gmail.com',NULL,NULL,NULL,'Zkh4SWFraExURS9EcDBCaFlRPT1h'),(42,'407','Gg','M','1',407,'S','407@gmail.vgg',NULL,NULL,NULL,'Zkh4SWFraExURS9EcDBCaFlRPT1E'),(43,'408','408','M','9',408,'S','A@drf.com',NULL,NULL,NULL,'Zkh4SWFraExURS9EcDBCaFlRPT1h'),(44,'410','Y','M','1',410,'S','Ttt@rftt.com',NULL,NULL,NULL,'Zkh4SWFraExURS9EcDBCaFlRPT1h'),(45,'411','@','M','2',411,'S','Dgf@fg.com',NULL,NULL,NULL,'Zkh4SWFraExURS9EcDBCaFlRPT1h'),(46,'412','A','M','4',412,'S','Hdudsut@hjfjfid.com',NULL,NULL,NULL,'Zkh4SWFraExURS9EcDBCaFlRPT1h'),(47,'413','X','M','4',414,'S','Frf@sdf.com',NULL,NULL,NULL,'Zkh4SWFraExURS9EcDBCaFlRPT1h'),(48,'415','a','M','222',400,'S','DeYfg@dtuh.com',NULL,NULL,NULL,'Zkh4SWFraExURS9EcDBCaFlRPT1h'),(49,'Alexandre','Alves','M','469956227',32741376859,'S','Alestalves@gmail.com',NULL,NULL,NULL,'Zkh4SWFraExURS9EcDBCaFlRPT10ZXN0ZQ=='),(50,'416','416','M','416',416,'S','416@gmail.com',NULL,NULL,NULL,'Zkh4SWFraExURS9EcDBCaFlRPT1h'),(51,'417','417','F','417',416,'S','417@gmail.com',NULL,NULL,NULL,'Zkh4SWFraExURS9EcDBCaFlRPT1h'),(52,'418','a','M','',417,'S','418@gmail.com',NULL,NULL,NULL,'Zkh4SWFraExURS9EcDBCaFlRPT1h'),(53,'417','a','M','111',419,'S','419@gmail.com',NULL,NULL,NULL,'Zkh4SWFraExURS9EcDBCaFlRPT1h'),(54,'420','444','M','22',420,'S','420@gmail.com',NULL,NULL,NULL,'Zkh4SWFraExURS9EcDBCaFlRPT1h'),(55,'teste','','','',NULL,'S','',NULL,NULL,NULL,''),(56,'teste','','','',NULL,'S','',NULL,NULL,NULL,''),(57,'teste','','','',NULL,'S','',NULL,NULL,NULL,''),(58,'A','a','M','65',2585272434342425,'S','Rft@rft.vom',NULL,NULL,NULL,'Zkh4SWFraExURS9EcDBCaFlRPT1h'),(59,'Teyeye','ywyw','F','225568',255524486,'S','Xnjeie@hduc.com',NULL,NULL,NULL,'Zkh4SWFraExURS9EcDBCaFlRPT1h'),(60,'Teste tablet','trff','F','11',430,'S','Sum18eee2@GmaIl.com',NULL,NULL,NULL,'Zkh4SWFraExURS9EcDBCaFlRPT1h'),(61,'Dio','Dorete','M','296335214',25541236548,'S','Diogenesdorete@gmail.com',NULL,NULL,NULL,'Zkh4SWFraExURS9EcDBCaFlRPT0xMjM0NQ=='),(62,'dsaf','fdas','M','12',32087213828,'S','sum18232@gmail.com',NULL,NULL,NULL,'Zkh4SWFraExURS9EcDBCaFlRPT1h'),(63,'Aa','ffg','M','55',435,'S','Fgf@gfgh.mjj',NULL,NULL,NULL,'Zkh4SWFraExURS9EcDBCaFlRPT1h');
/*!40000 ALTER TABLE responsavel ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-03-02 17:01:11
