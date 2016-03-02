--
-- File generated with SQLiteStudio v3.0.7 on qua mar 2 17:21:46 2016
--
-- Text encoding used: windows-1252
--
PRAGMA foreign_keys = off;
BEGIN TRANSACTION;

-- Table: escola
CREATE TABLE escola (
  escola_id integer NOT NULL ,
  nome_fantasia varchar(150) ,
  razao_social varchar(150) ,
  cnpj bigint(20) ,
  ativo char(1) ,
  data_cadastro date ,
  email varchar(200) ,
  informacoes_gerais blob,
  PRIMARY KEY (escola_id));

-- Table: escola_telefone
CREATE TABLE escola_telefone (
  escola_telefone_id integer NOT NULL ,
  escola_id integer ,
  telefone_tipo_id smallint(6) ,
  numero varchar(50) ,
  PRIMARY KEY (escola_telefone_id));

-- Table: responsavel_tipo
CREATE TABLE responsavel_tipo (
  responsavel_tipo_id smallint(6) NOT NULL ,
  descricao varchar(150) ,
  informacoes_gerais blob,
  PRIMARY KEY (responsavel_tipo_id));

-- Table: agenda
CREATE TABLE agenda (
  agenda_id integer NOT NULL,
  titulo varchar(50),
  descricao blob,
  data datetime,
  agenda_tipo_id smallint(6),
  funcionario_id integer,
  escola_id integer ,
  PRIMARY KEY (agenda_id)
  );

-- Table: turma_aluno
CREATE TABLE turma_aluno (
  turma_id integer NOT NULL,
  aluno_id integer NOT NULL,
  PRIMARY KEY (turma_id,aluno_id));

-- Table: telefone_tipo
CREATE TABLE telefone_tipo (
  telefone_tipo_id smallint(6) NOT NULL ,
  descricao varchar(150) ,
  informacoes_gerais blob,
  PRIMARY KEY (telefone_tipo_id));

-- Table: funcionario
CREATE TABLE funcionario (
  funcionario_id integer NOT NULL ,
  nome varchar(150) ,
  sobrenome varchar(150) ,
  sexo char(1) ,
  rg varchar(50) ,
  cpf bigint(20) ,
  ativo char(1) DEFAULT 'S',
  email varchar(150) ,
  senha varchar(150) ,
  informacoes_gerais blob,
  funcionario_tipo_id smallint(6) ,
  escola_id integer ,
  PRIMARY KEY (funcionario_id));

-- Table: aluno
CREATE TABLE aluno (
  aluno_id integer NOT NULL ,
  nome varchar(150) ,
  sobrenome varchar(150) ,
  data_nascimento date ,
  sexo char(1) ,
  rg varchar(50) ,
  cpf bigint(20) ,
  ativo char(1) ,
  informacoes_gerais blob,
  escola_id integer ,
  PRIMARY KEY (aluno_id));

-- Table: aluno_foto
CREATE TABLE aluno_foto (
  aluno_foto_id integer NOT NULL ,
  aluno_id integer NOT NULL,
  foto blob,
  PRIMARY KEY (aluno_foto_id));

-- Table: responsavel
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
  PRIMARY KEY (responsavel_id));

-- Table: mensagem
CREATE TABLE mensagem (
  mensagem_id integer NOT NULL ,
  msg blob,
  data datetime ,
  mensagem_tipo_id smallint(6) ,
  funcionario_id integer ,
  aluno_id integer ,
  escola_id integer ,
  responsavel_id integer ,
  PRIMARY KEY (mensagem_id));

-- Table: agenda_aluno
CREATE TABLE agenda_aluno (
  agenda_id integer NOT NULL,
  aluno_id integer NOT NULL,
  PRIMARY KEY (agenda_id,aluno_id));

-- Table: escola_endereco
CREATE TABLE escola_endereco (
  escola_endereco_id integer NOT NULL ,
  cep varchar(20) ,
  logradouro varchar(200) ,
  numero smallint(6) ,
  complemento varchar(50) ,
  cidade varchar(50) ,
  bairro varchar(50) ,
  uf varchar(10) ,
  escola_id integer NOT NULL,
  PRIMARY KEY (escola_endereco_id));

-- Table: turma
CREATE TABLE turma (
  turma_id integer NOT NULL ,
  nome varchar(150) ,
  informacoes_gerais blob,
  periodo_tipo_id smallint(6) ,
  escola_id integer ,
  funcionario_id integer ,
  PRIMARY KEY (turma_id));

-- Table: funcionario_foto
CREATE TABLE funcionario_foto (
  funcionario_foto_id integer NOT NULL ,
  funcionario_id integer ,
  foto blob,
  PRIMARY KEY (funcionario_foto_id));

-- Table: responsavel_foto
CREATE TABLE responsavel_foto (
  responsavel_foto_id integer NOT NULL ,
  responsavel_id integer ,
  foto blob,
  PRIMARY KEY (responsavel_foto_id));

-- Table: responsavel_telefone
CREATE TABLE responsavel_telefone (
  responsavel_telefone_id integer NOT NULL ,
  responsavel_id integer ,
  telefone_tipo_id smallint(6) ,
  numero varchar(50) ,
  PRIMARY KEY (responsavel_telefone_id));

-- Table: funcionario_tipo
CREATE TABLE funcionario_tipo (
  funcionario_tipo_id smallint(6) NOT NULL ,
  descricao varchar(150) ,
  informacoes_gerais blob,
  PRIMARY KEY (funcionario_tipo_id));

-- Table: mensagem_tipo
CREATE TABLE mensagem_tipo (
  mensagem_tipo_id smallint(6) NOT NULL,
  descricao varchar(150) ,
  informacoes_gerais blob,
  PRIMARY KEY (mensagem_tipo_id));

-- Table: responsavel_aluno
CREATE TABLE responsavel_aluno (
  responsavel_id integer NOT NULL,
  aluno_id integer NOT NULL,
  PRIMARY KEY (responsavel_id,aluno_id));

-- Table: periodo_tipo
CREATE TABLE periodo_tipo (
  periodo_tipo_id smallint(6) NOT NULL ,
  descricao varchar(150) ,
  informacoes_gerais blob,
  PRIMARY KEY (periodo_tipo_id));

-- Table: agenda_tipo
CREATE TABLE agenda_tipo (
  agenda_tipo_id smallint(6) NOT NULL,
  descricao varchar(150) DEFAULT NULL,
  informacoes_gerais text,
  PRIMARY KEY (agenda_tipo_id));

COMMIT TRANSACTION;
PRAGMA foreign_keys = on;
