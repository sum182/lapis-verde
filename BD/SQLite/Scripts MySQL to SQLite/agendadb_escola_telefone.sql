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
-- Table structure for table escola_telefone
--

DROP TABLE IF EXISTS escola_telefone;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE escola_telefone (
  escola_telefone_id integer NOT NULL ,
  escola_id integer ,
  telefone_tipo_id smallint(6) ,
  numero varchar(50) ,
  PRIMARY KEY (escola_telefone_id),
  KEY fk_escola_telefone_escola_idx (escola_id),
  KEY fk_escola_telefone_telefone_tipo_idx (telefone_tipo_id),
  KEY idx_escola_telefone_numero (numero),
  CONSTRAINT fk_escola_telefone_x_escola FOREIGN KEY (escola_id) REFERENCES escola (escola_id) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT fk_escola_telefone_x_telefone_tipo FOREIGN KEY (telefone_tipo_id) REFERENCES telefone_tipo (telefone_tipo_id) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB =77 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table escola_telefone
--

LOCK TABLES escola_telefone WRITE;
/*!40000 ALTER TABLE escola_telefone DISABLE KEYS */;
INSERT INTO escola_telefone VALUES (4,2,3,'11-2382-2003'),(5,2,2,'98214-7819'),(76,NULL,NULL,'s');
/*!40000 ALTER TABLE escola_telefone ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-03-02 17:01:08
