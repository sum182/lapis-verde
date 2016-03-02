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
-- Table structure for table turma
--

DROP TABLE IF EXISTS turma;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE turma (
  turma_id integer NOT NULL ,
  nome varchar(150) ,
  informacoes_gerais blob,
  periodo_tipo_id smallint(6) ,
  escola_id integer ,
  funcionario_id integer ,
  PRIMARY KEY (turma_id),
  KEY fk_turma_x_periodo_tipo_idx (periodo_tipo_id),
  KEY fk_turma_x_escola_idx (escola_id),
  KEY fk_turma_x_funcionario_idx (funcionario_id),
  KEY idx_turma_nome (nome),
  CONSTRAINT fk_turma_x_escola FOREIGN KEY (escola_id) REFERENCES escola (escola_id) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT fk_turma_x_funcionario FOREIGN KEY (funcionario_id) REFERENCES funcionario (funcionario_id) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT fk_turma_x_periodo_tipo FOREIGN KEY (periodo_tipo_id) REFERENCES periodo_tipo (periodo_tipo_id) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB =20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table turma
--

LOCK TABLES turma WRITE;
/*!40000 ALTER TABLE turma DISABLE KEYS */;
INSERT INTO turma VALUES (8,'Sala 1',NULL,3,1,6),(9,'Sala 2','fdasda',4,1,11),(14,'Turma de Teste - ID Escola 2',NULL,NULL,2,NULL),(18,'Todos Alunos',NULL,6,1,11),(19,'Sala 3',NULL,6,1,16);
/*!40000 ALTER TABLE turma ENABLE KEYS */;
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
