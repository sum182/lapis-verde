--
-- File generated with SQLiteStudio v3.0.7 on sex abr 22 11:01:20 2016
--
-- Text encoding used: windows-1252
--
PRAGMA foreign_keys = off;
BEGIN TRANSACTION;

-- Table: responsavel_foto
CREATE TABLE responsavel_foto (
  responsavel_foto_id integer NOT NULL ,
  responsavel_id integer ,
  foto blob,
  PRIMARY KEY (responsavel_foto_id));

-- Table: aluno_foto
CREATE TABLE aluno_foto (
  aluno_foto_id integer NOT NULL ,
  aluno_id integer NOT NULL,
  foto blob,
  PRIMARY KEY (aluno_foto_id));

-- Table: agenda_turma
CREATE TABLE agenda_turma (agenda_id VARCHAR (100) NOT NULL, turma_id INTEGER NOT NULL, PRIMARY KEY (agenda_id, turma_id));
INSERT INTO agenda_turma (agenda_id, turma_id) VALUES ('0243139E-0DD9-475A-BEE2-661605E949FC', 8);
INSERT INTO agenda_turma (agenda_id, turma_id) VALUES ('105B31A5-76F1-E511-9D2C-BFAA5ABE92A6', 8);
INSERT INTO agenda_turma (agenda_id, turma_id) VALUES ('14C80B48-59C5-49D5-B921-D7A4FBA01B30', 19);
INSERT INTO agenda_turma (agenda_id, turma_id) VALUES ('24BA4C46-00F2-E511-A0EC-DFDD7E6CC69A', 8);
INSERT INTO agenda_turma (agenda_id, turma_id) VALUES ('3414279C-75F1-E511-9A20-83ED1096D911', 8);
INSERT INTO agenda_turma (agenda_id, turma_id) VALUES ('34FA7956-95E4-4B47-8311-9BB62A3A0D34', 19);
INSERT INTO agenda_turma (agenda_id, turma_id) VALUES ('425958A4-75F1-E511-9A20-83ED1096D911', 8);
INSERT INTO agenda_turma (agenda_id, turma_id) VALUES ('46DD9489-76F1-E511-9D2C-BFAA5ABE92A6', 8);
INSERT INTO agenda_turma (agenda_id, turma_id) VALUES ('52FB87B0-122C-447F-AD1F-2D92CB629F5B', 19);
INSERT INTO agenda_turma (agenda_id, turma_id) VALUES ('56FA719C-03F2-E511-8B14-B58D92F1BF2C', 8);
INSERT INTO agenda_turma (agenda_id, turma_id) VALUES ('5CD074BC-2C67-442E-A0D5-7E1D3924CB82', 19);
INSERT INTO agenda_turma (agenda_id, turma_id) VALUES ('6082257A-77F1-E511-9A48-4F933D0C0C0C', 8);
INSERT INTO agenda_turma (agenda_id, turma_id) VALUES ('648819A1-75F1-E511-9A20-83ED1096D911', 8);
INSERT INTO agenda_turma (agenda_id, turma_id) VALUES ('6C966A45-C053-473E-92D8-2FE3CDB7F6A6', 8);
INSERT INTO agenda_turma (agenda_id, turma_id) VALUES ('6EA1854A-00F2-E511-A0EC-DFDD7E6CC69A', 8);
INSERT INTO agenda_turma (agenda_id, turma_id) VALUES ('71223782-B154-459C-9906-3C4E0E4896E5', 8);
INSERT INTO agenda_turma (agenda_id, turma_id) VALUES ('7EC4B8A6-75F1-E511-9A20-83ED1096D911', 8);
INSERT INTO agenda_turma (agenda_id, turma_id) VALUES ('802AF803-38E9-E511-9C9E-079E9E66E5FD', 8);
INSERT INTO agenda_turma (agenda_id, turma_id) VALUES ('90C9563A-C800-49AD-B05E-9F5D5A55A237', 8);
INSERT INTO agenda_turma (agenda_id, turma_id) VALUES ('B2B88785-77F1-E511-9A48-4F933D0C0C0C', 8);
INSERT INTO agenda_turma (agenda_id, turma_id) VALUES ('E2CC7A24-79F1-E511-A912-2FAC4FACF13D', 8);
INSERT INTO agenda_turma (agenda_id, turma_id) VALUES ('F470305A-09F2-E511-8B14-B58D92F1BF2C', 8);
INSERT INTO agenda_turma (agenda_id, turma_id) VALUES ('F6EA7410-FCF1-E511-BE8B-F93CF97D72C4', 8);
INSERT INTO agenda_turma (agenda_id, turma_id) VALUES ('FF17DC9E-55D1-4E56-9394-C4BA78DB63B9', 8);
INSERT INTO agenda_turma (agenda_id, turma_id) VALUES ('C8640AB0-1A32-4C16-9F0C-4CCFCB6BE497', 8);
INSERT INTO agenda_turma (agenda_id, turma_id) VALUES ('DBAB7DED-B476-4F18-AD43-BA1A3046915F', 8);
INSERT INTO agenda_turma (agenda_id, turma_id) VALUES ('7A698253-BCF7-E511-AAE4-656DC5BB4E40', 8);
INSERT INTO agenda_turma (agenda_id, turma_id) VALUES ('CAEB5F62-BCF7-E511-AAE4-656DC5BB4E40', 8);
INSERT INTO agenda_turma (agenda_id, turma_id) VALUES ('DC0115B2-B7F7-E511-A916-752D12D84D64', 8);
INSERT INTO agenda_turma (agenda_id, turma_id) VALUES ('5B30626B-C42B-4E48-A1C1-D334389505B5', 18);
INSERT INTO agenda_turma (agenda_id, turma_id) VALUES ('3C0A5C0B-7224-4AB5-94AC-5ED5C3934A9B', 18);
INSERT INTO agenda_turma (agenda_id, turma_id) VALUES ('047085B4-8FF8-E511-A6B1-D5F2F9F43A47', 8);
INSERT INTO agenda_turma (agenda_id, turma_id) VALUES ('1269B4DE-CAF8-E511-8B67-ED0C876E1A06', 8);
INSERT INTO agenda_turma (agenda_id, turma_id) VALUES ('5CF114FF-E5F8-E511-B6B8-BB4E86202B2C', 8);
INSERT INTO agenda_turma (agenda_id, turma_id) VALUES ('688A74CF-CEF9-E511-8033-2924041FBC02', 8);
INSERT INTO agenda_turma (agenda_id, turma_id) VALUES ('0268438D-D72D-451E-B4DB-1E50FA62B022', 9);
INSERT INTO agenda_turma (agenda_id, turma_id) VALUES ('083446B1-BFF7-E511-9D08-E7CF64EF3E6C', 9);
INSERT INTO agenda_turma (agenda_id, turma_id) VALUES ('348B70DE-CEF9-E511-8033-2924041FBC02', 18);
INSERT INTO agenda_turma (agenda_id, turma_id) VALUES ('429BEAD7-D6F1-E511-95D6-ED0C771B834D', 18);
INSERT INTO agenda_turma (agenda_id, turma_id) VALUES ('44EC2E07-79F2-E511-93E7-CD1EF0971951', 18);
INSERT INTO agenda_turma (agenda_id, turma_id) VALUES ('6E12FA0B-CBF8-E511-8B67-ED0C876E1A06', 18);
INSERT INTO agenda_turma (agenda_id, turma_id) VALUES ('8C2BE199-E2E9-E511-93A3-9BBD45DA2183', 18);
INSERT INTO agenda_turma (agenda_id, turma_id) VALUES ('8C549714-D4E9-E511-86AD-C7D047446A4F', 9);
INSERT INTO agenda_turma (agenda_id, turma_id) VALUES ('96F173D4-D1E9-E511-86AD-C7D047446A4F', 18);
INSERT INTO agenda_turma (agenda_id, turma_id) VALUES ('B4EA36DC-E5F8-E511-B6B8-BB4E86202B2C', 18);
INSERT INTO agenda_turma (agenda_id, turma_id) VALUES ('BAD09CBC-E5F8-E511-B6B8-BB4E86202B2C', 18);
INSERT INTO agenda_turma (agenda_id, turma_id) VALUES ('C2720283-76F1-E511-9D2C-BFAA5ABE92A6', 9);
INSERT INTO agenda_turma (agenda_id, turma_id) VALUES ('E87EE1E2-17EE-E511-B239-61AEFDC2B20D', 18);
INSERT INTO agenda_turma (agenda_id, turma_id) VALUES ('EC24B471-3FF2-E511-8DB5-BFDA8E1A0887', 18);
INSERT INTO agenda_turma (agenda_id, turma_id) VALUES ('F25582B9-CCF9-E511-95ED-9B2B2E6DEA1B', 18);
INSERT INTO agenda_turma (agenda_id, turma_id) VALUES ('FC57A61A-38E9-E511-9C9E-079E9E66E5FD', 9);
INSERT INTO agenda_turma (agenda_id, turma_id) VALUES ('502ECC61-BFFC-E511-89D7-9FE9209CD86E', 18);
INSERT INTO agenda_turma (agenda_id, turma_id) VALUES ('3237C1F9-AAFD-E511-B2FB-A7E5479B5631', 18);
INSERT INTO agenda_turma (agenda_id, turma_id) VALUES ('E8C12F00-AFFD-E511-A6BD-356C5CF369D0', 18);
INSERT INTO agenda_turma (agenda_id, turma_id) VALUES ('7B059C29-9A24-4DE6-AB46-478BC358E6FA', 8);
INSERT INTO agenda_turma (agenda_id, turma_id) VALUES ('381113D4-C1FD-E511-993D-6F66979B405B', 8);
INSERT INTO agenda_turma (agenda_id, turma_id) VALUES ('CE7BA0FA-C1FD-E511-993D-6F66979B405B', 8);
INSERT INTO agenda_turma (agenda_id, turma_id) VALUES ('2E64DE99-69FE-E511-B29E-3B11B4DE5010', 18);
INSERT INTO agenda_turma (agenda_id, turma_id) VALUES ('30B0BB1A-68FE-E511-9F51-E3DCED4CD399', 8);
INSERT INTO agenda_turma (agenda_id, turma_id) VALUES ('5ACA438E-69FE-E511-9F51-E3DCED4CD399', 18);
INSERT INTO agenda_turma (agenda_id, turma_id) VALUES ('5E394813-68FE-E511-9F51-E3DCED4CD399', 8);
INSERT INTO agenda_turma (agenda_id, turma_id) VALUES ('64C4B0C7-69FE-E511-9F51-E3DCED4CD399', 18);
INSERT INTO agenda_turma (agenda_id, turma_id) VALUES ('66A4E489-69FE-E511-9F51-E3DCED4CD399', 18);
INSERT INTO agenda_turma (agenda_id, turma_id) VALUES ('7A4E3B17-68FE-E511-9F51-E3DCED4CD399', 8);
INSERT INTO agenda_turma (agenda_id, turma_id) VALUES ('7ED68428-68FE-E511-B29E-3B11B4DE5010', 8);
INSERT INTO agenda_turma (agenda_id, turma_id) VALUES ('9613182C-68FE-E511-B29E-3B11B4DE5010', 8);
INSERT INTO agenda_turma (agenda_id, turma_id) VALUES ('B8628696-69FE-E511-B29E-3B11B4DE5010', 18);
INSERT INTO agenda_turma (agenda_id, turma_id) VALUES ('BAA6F2B5-C5FD-E511-993D-6F66979B405B', 18);
INSERT INTO agenda_turma (agenda_id, turma_id) VALUES ('C007B025-68FE-E511-B29E-3B11B4DE5010', 8);
INSERT INTO agenda_turma (agenda_id, turma_id) VALUES ('C4308103-8CFE-E511-828F-17BD0DCF5281', 18);
INSERT INTO agenda_turma (agenda_id, turma_id) VALUES ('D2A07FFB-67FE-E511-9F51-E3DCED4CD399', 8);
INSERT INTO agenda_turma (agenda_id, turma_id) VALUES ('D4B770B8-69FE-E511-B29E-3B11B4DE5010', 18);
INSERT INTO agenda_turma (agenda_id, turma_id) VALUES ('E0BD9DFD-67FE-E511-B29E-3B11B4DE5010', 8);
INSERT INTO agenda_turma (agenda_id, turma_id) VALUES ('E6B06C93-69FE-E511-B29E-3B11B4DE5010', 18);
INSERT INTO agenda_turma (agenda_id, turma_id) VALUES ('EA28F390-69FE-E511-9F51-E3DCED4CD399', 18);
INSERT INTO agenda_turma (agenda_id, turma_id) VALUES ('2EFA817D-CF39-483D-AFBE-9F0F4FFA1E87', 18);
INSERT INTO agenda_turma (agenda_id, turma_id) VALUES ('DA25D229-BF02-E611-B386-9B9DC61E13FF', 18);
INSERT INTO agenda_turma (agenda_id, turma_id) VALUES ('EE428FD4-C102-E611-B386-9B9DC61E13FF', 18);
INSERT INTO agenda_turma (agenda_id, turma_id) VALUES ('72737524-3B03-E611-8E20-D7A0B26D3688', 18);
INSERT INTO agenda_turma (agenda_id, turma_id) VALUES ('8A201035-5DC4-423A-9EB1-ED47D344E1FE', 18);
INSERT INTO agenda_turma (agenda_id, turma_id) VALUES ('E2F64C61-7903-E611-B7E8-C3CBDA7D8EA5', 18);
INSERT INTO agenda_turma (agenda_id, turma_id) VALUES ('A6A2CD01-7A03-E611-B7E8-C3CBDA7D8EA5', 18);
INSERT INTO agenda_turma (agenda_id, turma_id) VALUES ('7E02662B-7B03-E611-B7E8-C3CBDA7D8EA5', 18);
INSERT INTO agenda_turma (agenda_id, turma_id) VALUES ('B49A57B1-7B03-E611-B7E8-C3CBDA7D8EA5', 18);
INSERT INTO agenda_turma (agenda_id, turma_id) VALUES ('6AA1BFC7-7C03-E611-B7E8-C3CBDA7D8EA5', 18);
INSERT INTO agenda_turma (agenda_id, turma_id) VALUES ('32B35FDE-7D03-E611-B7E8-C3CBDA7D8EA5', 18);
INSERT INTO agenda_turma (agenda_id, turma_id) VALUES ('5C43AB51-8203-E611-B7E8-C3CBDA7D8EA5', 18);
INSERT INTO agenda_turma (agenda_id, turma_id) VALUES ('7E34AF06-8403-E611-B7E8-C3CBDA7D8EA5', 18);
INSERT INTO agenda_turma (agenda_id, turma_id) VALUES ('5A608CE4-8403-E611-B7E8-C3CBDA7D8EA5', 18);
INSERT INTO agenda_turma (agenda_id, turma_id) VALUES ('23A918EC-D862-4A12-A85B-A3DA66690664', 18);
INSERT INTO agenda_turma (agenda_id, turma_id) VALUES ('C894BD3C-8603-E611-A389-6FC309BEBE03', 18);
INSERT INTO agenda_turma (agenda_id, turma_id) VALUES ('4A126BA8-8603-E611-A389-6FC309BEBE03', 18);
INSERT INTO agenda_turma (agenda_id, turma_id) VALUES ('4C7FA5AE-8603-E611-A389-6FC309BEBE03', 18);
INSERT INTO agenda_turma (agenda_id, turma_id) VALUES ('62EC26A5-8603-E611-A389-6FC309BEBE03', 18);
INSERT INTO agenda_turma (agenda_id, turma_id) VALUES ('72C7A29D-8603-E611-A389-6FC309BEBE03', 18);
INSERT INTO agenda_turma (agenda_id, turma_id) VALUES ('92A941A2-8603-E611-A389-6FC309BEBE03', 18);
INSERT INTO agenda_turma (agenda_id, turma_id) VALUES ('F4A548AB-8603-E611-A389-6FC309BEBE03', 18);
INSERT INTO agenda_turma (agenda_id, turma_id) VALUES ('8523C3C2-FD82-4D9F-81D6-A863008D391D', 18);
INSERT INTO agenda_turma (agenda_id, turma_id) VALUES ('E3E0B696-571E-4A92-A49C-D8E5BCBE8B04', 18);
INSERT INTO agenda_turma (agenda_id, turma_id) VALUES ('57B78C41-C868-4DDC-AAE0-4557E7A8C5CD', 18);
INSERT INTO agenda_turma (agenda_id, turma_id) VALUES ('D0DAFDA9-6D40-4502-87F8-EA7623E41C43', 18);
INSERT INTO agenda_turma (agenda_id, turma_id) VALUES ('4A3DF88F-DC03-E611-8781-433F18671722', 18);
INSERT INTO agenda_turma (agenda_id, turma_id) VALUES ('4C8601BF-1C04-E611-BA5B-7DEE08DCF7DA', 9);
INSERT INTO agenda_turma (agenda_id, turma_id) VALUES ('B618FF01-1C04-E611-9C3C-7B519E66CC6D', 8);
INSERT INTO agenda_turma (agenda_id, turma_id) VALUES ('B6C4A257-C703-E611-9CB4-2DFE21AAB730', 18);
INSERT INTO agenda_turma (agenda_id, turma_id) VALUES ('09BF8309-2F87-4567-AB1D-BAACB125027C', 18);
INSERT INTO agenda_turma (agenda_id, turma_id) VALUES ('3802CFAC-9D05-E611-8F63-07BF91831A8A', 18);
INSERT INTO agenda_turma (agenda_id, turma_id) VALUES ('C66A9477-9E05-E611-8F63-07BF91831A8A', 18);
INSERT INTO agenda_turma (agenda_id, turma_id) VALUES ('DC11FCE1-A005-E611-88BD-E739B9B3E782', 18);
INSERT INTO agenda_turma (agenda_id, turma_id) VALUES ('30F6E748-ACE8-4786-9949-813C31C62025', 18);

-- Table: responsavel_aluno
CREATE TABLE responsavel_aluno (
  responsavel_id integer NOT NULL,
  aluno_id integer NOT NULL,
  PRIMARY KEY (responsavel_id,aluno_id));
INSERT INTO responsavel_aluno (responsavel_id, aluno_id) VALUES (9, 19);
INSERT INTO responsavel_aluno (responsavel_id, aluno_id) VALUES (10, 19);
INSERT INTO responsavel_aluno (responsavel_id, aluno_id) VALUES (66, 40);

-- Table: responsavel_tipo
CREATE TABLE responsavel_tipo (
  responsavel_tipo_id smallint(6) NOT NULL ,
  descricao varchar(150) ,
  informacoes_gerais blob,
  PRIMARY KEY (responsavel_tipo_id));
INSERT INTO responsavel_tipo (responsavel_tipo_id, descricao, informacoes_gerais) VALUES (1, 'Pai', NULL);
INSERT INTO responsavel_tipo (responsavel_tipo_id, descricao, informacoes_gerais) VALUES (2, 'Mãe', NULL);
INSERT INTO responsavel_tipo (responsavel_tipo_id, descricao, informacoes_gerais) VALUES (3, 'Outros', NULL);
INSERT INTO responsavel_tipo (responsavel_tipo_id, descricao, informacoes_gerais) VALUES (5, 'Parente', NULL);
INSERT INTO responsavel_tipo (responsavel_tipo_id, descricao, informacoes_gerais) VALUES (6, 'Amigo', NULL);
INSERT INTO responsavel_tipo (responsavel_tipo_id, descricao, informacoes_gerais) VALUES (7, 'Amiga', NULL);

-- Table: agenda
CREATE TABLE agenda (agenda_id varchar (100) NOT NULL PRIMARY KEY, data DATE, descricao VARCHAR (5000), data_insert_local DATETIME, data_insert_server DATETIME, agenda_tipo_id SMALLINT (6), funcionario_id INTEGER, responsavel_id INTEGER, escola_id INTEGER, enviado_server VARCHAR (1));
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('00F72BB4-83D8-416B-A5A9-73EA75B8D6B9', '2016-03-11', 'teste aaa', '2016-03-11 16:37:15.000', '2016-03-11 16:37:15.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('0139453C-B09B-4E78-B023-D85E2201D060', '2016-03-13', 'aaa', '2016-03-13 12:42:01.000', '2016-03-13 12:42:02.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('04E1C486-F9ED-E511-88D2-397382DB5C5F', '2016-03-19', 'Ffffgggggggvvv', '2016-03-19 14:39:26.000', '2016-03-19 14:40:16.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('060CE52A-1EE7-E511-B16F-6B22681073A8', '2016-03-10', 'Ggggg', '2016-03-10 21:14:05.000', '2016-03-10 21:14:35.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('0623645C-C8ED-E511-8D1B-659B0D14E900', '2016-03-19', 'Dddddf', '2016-03-19 08:47:30.000', '2016-03-19 09:47:01.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('06D8C8BD-76F1-E511-9D2C-BFAA5ABE92A6', '2016-03-24', 'Não sei como é o', '2016-03-24 01:13:19.000', '2016-03-24 01:25:00.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('0835629A-E6ED-E511-B59C-7B4C71CC39C1', '2016-03-19', '1 linha', '2016-03-19 12:23:59.000', '2016-03-19 12:24:55.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('087C9FD6-1BBA-46C6-A356-51C8CEE99CC3', '2016-03-13', 'aaa', '2016-03-13 20:13:41.000', '2016-03-13 20:13:41.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('0AC2126B-F8E9-E511-BBA9-0F35890F6941', '2016-03-14', 'Oi meu amor', '2016-03-14 12:21:26.000', '2016-03-14 12:22:02.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('0AF262BC-03EA-E511-9C51-B1942C375D0E', '2016-03-14', 'Legal momo', '2016-03-14 13:42:27.000', '2016-03-14 13:43:03.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('0C092C7B-15E7-E511-BAD2-CD3CEDB7ADDB', '2016-03-10', 'Maria sevsye', '2016-03-10 20:11:55.000', '2016-03-10 20:12:25.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('0C1B9276-94EA-E511-9F9D-05E983943C19', '2016-03-15', 'Vvv', '2016-03-15 06:58:27.000', '2016-03-15 06:59:06.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('0C901F33-D45F-4B43-9C6A-F47820874299', '2016-03-14', 'zzz', '2016-03-14 00:07:47.000', '2016-03-14 00:07:47.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('0CCB6244-38E9-E511-9C9E-079E9E66E5FD', '2016-03-13', 'Chorao', '2016-03-13 13:25:58.000', '2016-03-13 13:26:32.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('10A45BB8-06EA-E511-BC14-B5F01C29D507', '2016-03-14', 'E o Lulu?', '2016-03-14 14:03:49.000', '2016-03-14 14:04:27.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('12A34F43-5EEF-E511-98A6-3B861F558613', '2016-03-21', 'Hoje eu não sei como é que....', '2016-03-21 09:13:03.000', '2016-03-21 09:13:59.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('13BBD8DA-49A9-4317-9275-953B83CE4FAE', '2016-03-19', 'A
B
C
FIM', '2016-03-19 11:34:47.000', '2016-03-19 11:34:49.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('14C80B48-59C5-49D5-B921-D7A4FBA01B30', '2016-03-10', '1', '2016-03-10 15:34:48.000', '2016-03-10 15:34:50.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('15813DCD-A161-4D9E-B933-8DEF8B48F75B', '2016-03-19', 'FIM
FIM', '2016-03-19 11:35:01.000', '2016-03-19 11:35:02.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('166D6CCB-7EED-E511-9008-634C2714DC4C', '2016-03-19', 'Ddd', '2016-03-19 00:00:54.000', '2016-03-19 00:02:59.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('16DF183E-FBE9-E511-B097-6130CA434A82', '2016-03-14', 'Oi meu amor. Ja vi o limite do espaco', '2016-03-14 12:41:39.000', '2016-03-14 12:42:25.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('1882DF67-C0EE-E511-AE96-B968E6CE3145', '2016-03-20', 'Dghfyt
F
G
G
G
F
G
F
??????', '2016-03-20 14:23:04.000', '2016-03-20 14:24:01.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('18DF27CB-78F1-E511-A912-2FAC4FACF13D', '2016-03-24', 'Gertrudes que nome autêntico', '2016-03-24 01:28:01.000', '2016-03-24 01:30:00.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('18FB1197-F9E9-E511-BBA9-0F35890F6941', '2016-03-14', 'A terceira mensagem que mandei', '2016-03-14 12:29:49.000', '2016-03-14 12:30:26.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('1A20E961-C1EA-E511-9F80-D94B51BC7D0A', '2016-03-15', 'Eu tb meu amor, que sono', '2016-03-15 12:19:59.000', '2016-03-15 12:20:39.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('1C7A94AB-EFED-E511-A50E-6902D9D99B7D', '2016-03-19', 'Ghg
I
H
U
U
Y
U
U
Hgg', '2016-03-19 13:28:53.000', '2016-03-19 13:29:42.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('1C86CB5B-02ED-E511-90C3-59926C786A96', '2016-03-18', 'Hhhhh', '2016-03-18 09:10:09.000', '2016-03-18 09:10:57.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('1C9522E4-78F1-E511-A912-2FAC4FACF13D', '2016-03-24', 'O meu iPhone usando o seu contato com o que eu tenho um compromisso com os', '2016-03-24 01:28:43.000', '2016-03-24 01:30:01.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('1F886975-8E76-42C7-95B2-2BF15B0D0586', '2016-03-13', 'sssssss', '2016-03-13 20:06:54.000', '2016-03-13 20:06:55.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('2047E0C8-01F2-E511-8360-0B716C3C39A7', '2016-03-24', 'Fft', '2016-03-24 17:48:38.000', '2016-03-24 23:33:41.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('209232CE-31F2-E511-A49B-8B8F8255DC4E', '2016-03-24', 'Tem como me enviar o comprovante', '2016-03-24 23:32:23.000', '2016-03-24 23:33:42.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('20A72A0A-71F1-E511-A8E5-AD3B93F4DDCE', '2016-03-24', 'O histórico de mensagens de erro a mesma não deverá usar distribuir ou copiar este link para o', '2016-03-24 00:32:30.000', '2016-03-24 00:56:00.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('20BBF9D2-03EA-E511-9C51-B1942C375D0E', '2016-03-14', 'Um aplicativo nosso <3', '2016-03-14 13:43:05.000', '2016-03-14 13:43:40.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('221F7516-5500-4ACC-8E1A-23CFB7A2FA74', '2016-03-11', 'carlos aaaaa', '2016-03-11 16:05:27.000', '2016-03-11 16:05:28.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('240ED9A2-12EE-E511-9963-9FF14FB2683B', '2016-03-19', 'Asa', '2016-03-19 17:39:11.000', '2016-03-19 17:40:00.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('24C8D3F1-125E-4915-8F0D-7AF010AE530C', '2016-03-18', 'ssss', '2016-03-18 15:29:15.000', '2016-03-18 15:29:17.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('24ECE674-F9E9-E511-BBA9-0F35890F6941', '2016-03-14', 'Momo tem que aumentar o', '2016-03-14 12:28:52.000', '2016-03-14 12:29:28.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('259A4D50-1577-4DE6-A0E5-852AF038CA84', '2016-03-24', 'qq', '2016-03-24 00:36:33.000', '2016-03-24 23:25:50.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('28A32BF1-D89B-414C-8151-9EC45EBB674E', '2016-03-19', '1
2
3
4
5
6
7
8
9
0
11
12
13
14
15
16
17
18
19
20
21
22', '2016-03-19 17:07:04.000', '2016-03-19 17:29:46.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('2A70978A-94EA-E511-9F9D-05E983943C19', '2016-03-15', 'Q sono....', '2016-03-15 06:59:00.000', '2016-03-15 06:59:40.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('2A861ED4-78BC-4D6F-BA26-290990381270', '2016-03-23', 'a
b', '2016-03-23 00:07:08.000', '2016-03-23 00:07:09.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('2A9F93C5-D6F1-E511-95D6-ED0C771B834D', '2016-03-24', 'O que você está com o', '2016-03-24 12:40:44.000', '2016-03-24 14:23:15.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('2C78EA28-74F1-E511-A548-9B85799E059C', '2016-03-24', 'Rytfuyy', '2016-03-24 00:54:50.000', '2016-03-24 00:56:01.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('2E190BFC-D7F1-E511-95D6-ED0C771B834D', '2016-03-24', 'O histórico do ensino médio e vestibular álgebra elementar', '2016-03-24 12:49:25.000', '2016-03-24 14:23:15.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('2EA0DBBB-8F3A-4180-89A4-B663A0A2C8FD', '2016-03-18', 'eeee', '2016-03-18 16:09:09.000', '2016-03-18 16:09:10.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('302CDCF9-50EF-E511-B9B1-5D6569C1F09A', '2016-03-21', 'Teste de envio 1 linha', '2016-03-21 07:37:57.000', '2016-03-21 07:38:54.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('340679DF-70F1-E511-A8E5-AD3B93F4DDCE', '2016-03-24', 'Bbb', '2016-03-24 00:31:19.000', '2016-03-24 00:32:33.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('34834D61-38ED-E511-ADE4-4950D4A7ED29', '2016-03-18', 'Bbbb', '2016-03-18 15:36:51.000', '2016-03-18 15:37:55.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('34D61A36-5A85-4B20-94BE-B93499EE01DE', '2016-03-19', '1', '2016-03-19 11:33:07.000', '2016-03-19 11:33:09.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('34FA7956-95E4-4B47-8311-9BB62A3A0D34', '2016-03-10', '4', '2016-03-10 15:35:19.000', '2016-03-10 15:35:22.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('365B05BD-E3EF-E511-8C33-2FC081FC7D2D', '2016-03-22', '12345678999999998999999999999 a b c d e f g h i j k l m n o p q r s t u v x z @ b c d e f g h i j k l m n o p q r sct u v x z c v b n m j', '2016-03-22 01:08:31.000', '2016-03-22 01:09:24.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('3825E129-4F25-4D1F-A72D-B67C709E37ED', '2016-03-11', 'carlos 2', '2016-03-11 16:17:07.000', '2016-03-11 16:17:08.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('38ED299B-E5ED-E511-BC5F-8FB5C9FC6A74', '2016-03-19', 'Ghhhhuuju fyyuij tuyduu tyydiysyu gduuff gg', '2016-03-19 12:16:51.000', '2016-03-19 12:17:40.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('38F59CED-8006-4D74-8B25-21DDCD24DCFE', '2016-03-24', 'rrrrrrrrrrrrrr', '2016-03-24 00:43:32.000', '2016-03-24 23:25:50.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('39B2A5B4-4984-47C8-B57F-4710C9CEA03F', '2016-03-10', '6', '2016-03-10 17:55:42.000', '2016-03-10 17:55:43.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('39FA9FD7-7D60-49EA-8A2D-C0D2E071160D', '2016-03-19', '1
2', '2016-03-19 11:33:17.000', '2016-03-19 11:33:18.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('3B3361AD-A204-4278-AAA1-BA2AD6D9FD43', '2016-03-24', 'vvv', '2016-03-24 00:35:25.000', '2016-03-24 23:25:50.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('3E13E34F-01ED-E511-AE01-B1E93180EB1F', '2016-03-18', 'Ttttfv', '2016-03-18 09:02:39.000', '2016-03-18 09:03:29.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('4266F274-EDED-E511-A52C-0F183443EFDA', '2016-03-19', 'Fggchchh
Ghh
H
G
G
G
G
H
Hgh


Vhh
H
H
H
Fff
Ggh
G
G', '2016-03-19 13:13:02.000', '2016-03-19 13:14:01.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('44BF2EBD-40ED-E511-9115-E7A23F34D537', '2016-03-18', '1
2', '2016-03-18 16:36:41.000', '2016-03-18 16:37:34.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('44EC9ED9-17EE-E511-B239-61AEFDC2B20D', '2016-03-19', 'Eww', '2016-03-19 18:16:30.000', '2016-03-19 18:17:19.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('4629234A-641F-4D0F-98C6-0B28C080B61A', '2016-03-24', 'sss', '2016-03-24 00:28:13.000', '2016-03-24 23:25:50.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('482089C1-EAED-E511-99D3-5F6156D125FE', '2016-03-19', 'Ini
A
G
G
H
Y
H
U
U
Y
Y
F
F
G
Ggh

V
H


Hr

Hhdir
G
G
G
F
F
Fim', '2016-03-19 12:53:42.000', '2016-03-19 12:54:39.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('4A732CB1-06EA-E511-BC14-B5F01C29D507', '2016-03-14', 'E o Léo?', '2016-03-14 14:03:37.000', '2016-03-14 14:04:16.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('4AADCBF1-5F16-4A7C-876E-B6BAA28B77F3', '2016-03-19', 'xxxx', '2016-03-19 09:20:39.000', '2016-03-19 11:19:58.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('4CE05463-F9E9-E511-BBA9-0F35890F6941', '2016-03-14', 'Adorei o final de semana!!! Obrigada pelo passeio no shopping.', '2016-03-14 12:28:22.000', '2016-03-14 12:28:59.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('4E2A3F6C-FBE9-E511-B097-6130CA434A82', '2016-03-14', 'Vou corrigir', '2016-03-14 12:42:56.000', '2016-03-14 12:44:08.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('4E3625B1-76F1-E511-9D2C-BFAA5ABE92A6', '2016-03-24', 'Não sei como é a mesma coisa e não é', '2016-03-24 01:12:58.000', '2016-03-24 01:25:00.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('4EBC45DB-27ED-E511-8071-A5DE27E1987A', '2016-03-18', 'Fdds', '2016-03-18 13:38:34.000', '2016-03-18 13:39:23.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('4FBB3472-2AAB-43A3-AE55-79848AA44569', '2016-03-24', 'cv', '2016-03-24 00:41:07.000', '2016-03-24 23:25:50.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('5092B02A-1EE7-E511-B16F-6B22681073A8', '2016-03-10', 'Ggggg', '2016-03-10 21:14:05.000', '2016-03-10 21:14:34.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('516B054E-FE80-4F78-A15E-0BB4966618F5', '2016-03-17', 'aaaaa', '2016-03-17 08:28:40.000', '2016-03-17 12:29:11.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('52AB7C77-02ED-E511-90C3-59926C786A96', '2016-03-18', 'Ggcfff', '2016-03-18 09:10:55.000', '2016-03-18 09:11:42.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('52BAB01C-21F0-E511-9564-675435EA8EFC', '2016-03-22', 'O histórico de mensagens de todos que estão estão as coisas que não é o que eu possa fazer o pagamento do', '2016-03-22 08:27:51.000', '2016-03-23 00:31:21.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('52FB87B0-122C-447F-AD1F-2D92CB629F5B', '2016-03-10', '2', '2016-03-10 15:35:15.000', '2016-03-10 15:35:22.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('560FAE9E-F9E9-E511-BBA9-0F35890F6941', '2016-03-14', 'Não apareceu inteira.', '2016-03-14 12:30:02.000', '2016-03-14 12:30:40.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('56388370-2E49-44FE-9495-ECA1B676E99B', '2016-03-18', 'cccc', '2016-03-18 15:33:03.000', '2016-03-18 15:33:04.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('566B63B3-02ED-E511-90C3-59926C786A96', '2016-03-18', 'Sssdsd', '2016-03-18 09:12:36.000', '2016-03-18 09:13:24.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('56F38CDD-21ED-E511-B52F-81345032B31A', '2016-03-18', 'Gghh', '2016-03-18 12:55:41.000', '2016-03-18 12:56:32.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('58F4286D-DEED-E511-BF94-4DE2C052D8BB', '2016-03-19', '1
77 
3', '2016-03-19 11:25:27.000', '2016-03-19 11:26:16.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('5A79A66B-11DC-4D79-A57B-A015B8D25E80', '2016-03-24', 'dffdf', '2016-03-24 00:42:24.000', '2016-03-24 23:25:50.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('5A8C4182-EEED-E511-A016-D1FC74B840CB', '2016-03-19', 'Dhsfklhdjajjdhdhd
Gdhdhd
Hfjdjgg ghhd
Hd
F
F
f
f
V
Gg
G', '2016-03-19 13:20:34.000', '2016-03-19 13:21:24.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('5AD29710-ADF0-E511-BA63-D954EB2A751C', '2016-03-23', 'E o meu currículo em casa de um dos E o meu currículo', '2016-03-23 01:09:40.000', '2016-03-23 01:10:38.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('5CCE0294-D1E9-E511-86AD-C7D047446A4F', '2016-03-14', '3', '2016-03-14 07:43:24.000', '2016-03-14 07:44:33.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('5CD074BC-2C67-442E-A0D5-7E1D3924CB82', '2016-03-10', '3', '2016-03-10 15:35:17.000', '2016-03-10 15:35:22.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('60B7769E-44ED-E511-98A9-F36E60552720', '2016-03-18', 'A', '2016-03-18 17:04:28.000', '2016-03-18 17:05:16.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('60D0F7A5-29EE-E511-B239-61AEFDC2B20D', '2016-03-19', 'Hoje tivemos uma aula muito legal. 
Aprendemos a vogal a.
Aprendemos também a zoar o coleguinha.', '2016-03-19 20:23:55.000', '2016-03-19 22:52:54.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('60D72AB9-D1E9-E511-86AD-C7D047446A4F', '2016-03-14', 'Bom dia meu amor....', '2016-03-14 07:44:27.000', '2016-03-14 07:45:04.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('64C5619B-D9EF-E511-B24B-8D91412203BE', '2016-03-21', 'A partir de amanhã e não um direito que é um dos maiores informações entre em casa', '2016-03-21 23:55:59.000', '2016-03-22 00:55:14.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('664D0B3F-E1ED-E511-A07F-C96D7F2B33C3', '2016-03-19', 'Gggg', '2016-03-19 11:45:38.000', '2016-03-19 11:46:34.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('66A928D0-27ED-E511-8071-A5DE27E1987A', '2016-03-18', 'Yyyuu', '2016-03-18 13:38:16.000', '2016-03-18 13:39:04.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('682978CB-03EA-E511-9C51-B1942C375D0E', '2016-03-14', 'Que da hora, a gente tem', '2016-03-14 13:42:52.000', '2016-03-14 13:43:28.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('68425A31-E0ED-E511-B771-0193DF59CCBE', '2016-03-19', 'Frase pequena', '2016-03-19 11:38:06.000', '2016-03-19 11:38:54.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('696D0F0D-E338-4D94-B267-36B881BB2E4C', '2016-03-18', 'aaaaa', '2016-03-18 08:59:05.000', '2016-03-18 08:59:07.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('6A965F90-E9ED-E511-8E0F-D1910FD62DE0', '2016-03-19', 'Fyfutsyyddjtdjooyydlfjjuf', '2016-03-19 12:45:11.000', '2016-03-19 12:46:00.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('6C5A289E-43ED-E511-98A9-F36E60552720', '2016-03-18', 'Mmm', '2016-03-18 16:57:18.000', '2016-03-18 16:58:08.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('6E0487E1-AE7D-4AE4-B5FF-A428F762C86E', '2016-03-11', 'maria 3', '2016-03-11 16:16:50.000', '2016-03-11 16:16:51.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('7046715C-0FEE-E511-8B44-1DDA313EBBAF', '2016-03-19', 'Ffff', '2016-03-19 17:15:44.000', '2016-03-19 17:16:34.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('70558B06-ADF0-E511-BA63-D954EB2A751C', '2016-03-23', 'Aa', '2016-03-23 01:09:23.000', '2016-03-23 01:10:21.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('7077C219-53ED-E511-9008-634C2714DC4C', '2016-03-18', 'A
B', '2016-03-18 18:48:08.000', '2016-03-19 00:02:58.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('70EE8476-06EA-E511-BC14-B5F01C29D507', '2016-03-14', 'Haaaa', '2016-03-14 14:01:58.000', '2016-03-14 14:02:36.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('712D46F3-7382-4A79-9271-AF4E2622B6B7', '2016-03-20', 'vv', '2016-03-20 23:21:55.000', '2016-03-20 23:26:12.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('7201129C-D0E9-E511-841D-F795266FF71E', '2016-03-14', 'Teste 3g leo', '2016-03-14 07:36:28.000', '2016-03-14 07:43:37.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('740A1950-DEED-E511-BF94-4DE2C052D8BB', '2016-03-19', 'Fgcgfggxgfgxftf', '2016-03-19 11:24:38.000', '2016-03-19 11:25:28.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('74A40495-144A-42E0-A35E-39E747B5BF4A', '2016-03-13', 'mmmm', '2016-03-13 20:06:23.000', '2016-03-13 20:06:55.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('74AFC447-1CEA-E511-BBEB-8BF0FF965147', '2016-03-14', 'Estão bem, Léo ta com sono', '2016-03-14 16:38:09.000', '2016-03-14 16:39:02.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('76C83481-F8E9-E511-BBA9-0F35890F6941', '2016-03-14', 'Tudo bem?', '2016-03-14 12:22:03.000', '2016-03-14 12:22:41.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('7A2F3493-A7F0-E511-AACB-F9E8DC6F5A1D', '2016-03-23', 'A
B
C', '2016-03-23 00:30:22.000', '2016-03-23 00:31:21.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('7A7CD73C-F0EA-E511-AD58-13379BC99297', '2016-03-15', 'Nnnnnn', '2016-03-15 17:55:24.000', '2016-03-15 17:56:06.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('801A0086-D1E9-E511-86AD-C7D047446A4F', '2016-03-14', 'Teste 2', '2016-03-14 07:43:01.000', '2016-03-14 07:43:37.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('81E26644-0533-40D4-AAEB-65324024BB96', '2016-03-24', '333', '2016-03-24 16:52:39.000', '2016-03-24 23:25:50.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('883CA038-E5EF-E511-9876-B1FBC1C0A6B9', '2016-03-22', 'O histórico de mensagens de erro no
Sistema operacional Windows XP para
O histórico de mensagens', '2016-03-22 01:19:08.000', '2016-03-22 01:20:01.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('885D7734-EDD6-475A-848B-169B99B0938F', '2016-03-18', 'dddd', '2016-03-18 15:33:08.000', '2016-03-18 15:33:09.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('88AED3C9-37E9-E511-9C9E-079E9E66E5FD', '2016-03-13', 'Fghh', '2016-03-13 13:22:32.000', '2016-03-13 13:23:07.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('8C7F9DAA-2BEE-E511-B239-61AEFDC2B20D', '2016-03-19', 'A
M
M
M
M
M
M
M
K
M
M
M
M
M
M

M

K.
.
.
.
.
.t
Tmtmt
Frase ytggggg
Hugo e não gostei muito grato pela atenção dispensada e
Aguardo a vossa empresa para que o que é a mesma não deverá fazer uso
De resto tudo bem contigo sobre o recebimento deste boleto e NF de

.
.
.
Fim', '2016-03-19 20:38:21.000', '2016-03-19 22:52:55.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('8E38CB4A-6CD5-4D57-AC40-472C24A59EE7', '2016-03-19', 'TESTE FRASE 2 LINHAS
SEGUNDA LINHA', '2016-03-19 11:42:30.000', '2016-03-19 11:42:32.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('8EABC0C6-291C-40A6-92F9-A7765F67DEA1', '2016-03-23', 'teste de uma frase inteira haaaaa fdasfas dfasfas fim do texto quebrado', '2016-03-23 00:07:40.000', '2016-03-23 00:07:41.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('8FA141F2-22A3-4180-9768-013D131A5677', '2016-03-23', 'aaa', '2016-03-23 00:06:39.000', '2016-03-23 00:07:09.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('8FF79FE9-5CD2-4CDE-B3A9-CEB12C089079', '2016-03-19', 'aaa', '2016-03-19 17:34:11.000', '2016-03-19 17:34:12.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('906437D9-A95F-47CE-863E-AA5F5CE245D2', '2016-03-24', 'bbb', '2016-03-24 00:28:24.000', '2016-03-24 23:25:50.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('9306E005-A3EC-4591-B388-812C3377B9E2', '2016-03-24', 'xxx', '2016-03-24 00:35:03.000', '2016-03-24 23:25:50.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('93EB008C-1375-485E-89F3-6A3659020EF1', '2016-03-19', '111', '2016-03-19 17:29:45.000', '2016-03-19 17:29:46.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('94D4235B-4DED-E511-9008-634C2714DC4C', '2016-03-18', 'O tcfg Judas uhd', '2016-03-18 18:07:00.000', '2016-03-18 18:07:48.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('96709FAE-2B18-419F-AF8D-841501C1F2B0', '2016-03-24', 'nn', '2016-03-24 00:36:58.000', '2016-03-24 23:25:50.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('9806A24A-E0ED-E511-B771-0193DF59CCBE', '2016-03-19', 'Frase. 2 linhas
2 linha', '2016-03-19 11:38:48.000', '2016-03-19 11:39:37.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('986E8BAC-E6ED-E511-B59C-7B4C71CC39C1', '2016-03-19', '1
2', '2016-03-19 12:24:29.000', '2016-03-19 12:25:18.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('98FA5BC1-02ED-E511-90C3-59926C786A96', '2016-03-18', 'Dddff', '2016-03-18 09:12:59.000', '2016-03-18 09:13:45.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('99140175-094E-4804-9697-1516A39C7C47', '2016-03-10', '5', '2016-03-10 15:49:35.000', '2016-03-10 15:49:38.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('9E15FD45-02ED-E511-90C3-59926C786A96', '2016-03-18', 'Hhhh', '2016-03-18 09:09:32.000', '2016-03-18 09:10:20.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('9E814BBA-E6ED-E511-B59C-7B4C71CC39C1', '2016-03-19', '18. Goygffdfyhufguttb htthsr
2 turqggdkyutgftduf gyygd', '2016-03-19 12:24:52.000', '2016-03-19 12:25:41.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('9FCF433D-4CAA-4716-B428-C9754217BFA0', '2016-03-18', 'a
b
c
d', '2016-03-18 16:24:58.000', '2016-03-18 16:25:00.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('A08F16EC-50EF-E511-B9B1-5D6569C1F09A', '2016-03-21', 'Teste', '2016-03-21 07:37:34.000', '2016-03-21 07:38:27.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('A0A3A4D7-70F1-E511-A8E5-AD3B93F4DDCE', '2016-03-24', 'Aaa', '2016-03-24 00:31:06.000', '2016-03-24 00:32:32.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('A2E3493D-C9E7-E511-9BD6-91CBC80B2F52', '2016-03-11', 'Hfggtgg
Ghdg
Ggtt
Gffg', '2016-03-11 17:38:40.000', '2016-03-11 18:04:57.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('A3BC68FF-BADE-4823-8CC4-0F9CBDE79012', '2016-03-11', 'leo 1', '2016-03-11 16:16:30.000', '2016-03-11 16:16:31.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('A8F17E7D-3EEE-E511-8B8F-8121B0A88547', '2016-03-19', 'Ha', '2016-03-19 22:53:06.000', '2016-03-19 22:53:56.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('AA0D8B44-3EEE-E511-B239-61AEFDC2B20D', '2016-03-19', 'Ccccc', '2016-03-19 22:51:31.000', '2016-03-19 22:52:55.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('AB55E774-54C2-4B62-964E-678941057F36', '2016-03-18', 'aaaa', '2016-03-18 08:27:50.000', '2016-03-18 08:59:07.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('AC8A7B21-FDEC-E511-BC4A-3F5C7018CABC', '2016-03-18', 'Ffffdd', '2016-03-18 08:32:43.000', '2016-03-18 09:03:29.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('AD43A7E3-DB2C-4D45-8FCF-E7BA1550365C', '2016-03-19', 'sss', '2016-03-19 12:33:25.000', '2016-03-19 12:33:27.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('AE5D7A84-3B0C-420F-B4ED-63336C775E3B', '2016-03-14', '1
2
3
4
5
6
7
8
9
0', '2016-03-14 00:22:10.000', '2016-03-14 00:22:10.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('AF3805F9-D339-4915-A551-7DC1AE2AB161', '2016-03-19', '1', '2016-03-19 12:32:05.000', '2016-03-19 12:32:06.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('B0316500-71F1-E511-A8E5-AD3B93F4DDCE', '2016-03-24', 'O histórico de mensagens de erro no sistema de gestão e desenvolvimento de jogos e brincadeiras', '2016-03-24 00:32:14.000', '2016-03-24 00:56:00.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('B09C9C7C-0EEF-E511-ACEC-CB47B028C572', '2016-03-20', 'A', '2016-03-20 23:42:00.000', '2016-03-20 23:47:31.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('B0A569F6-37E9-E511-9C9E-079E9E66E5FD', '2016-03-13', 'Carlos 4', '2016-03-13 13:23:47.000', '2016-03-13 13:24:21.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('B26A2B98-94E9-E511-841D-F795266FF71E', '2016-03-14', 'Ghh', '2016-03-14 00:26:52.000', '2016-03-14 00:27:32.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('B43B26E2-D1E9-E511-86AD-C7D047446A4F', '2016-03-14', 'Nome bonito', '2016-03-14 07:45:35.000', '2016-03-14 07:46:12.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('B4B9FE7D-C3E7-E511-9BD6-91CBC80B2F52', '2016-03-11', 'Ggggy', '2016-03-11 16:57:32.000', '2016-03-11 16:58:22.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('B613CD0F-7FED-E511-8D1B-659B0D14E900', '2016-03-19', 'Tte', '2016-03-19 00:02:49.000', '2016-03-19 00:03:37.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('B668881E-DDED-E511-8107-259A9514FD4B', '2016-03-19', 'Gggfygffhdhfhg', '2016-03-19 11:16:06.000', '2016-03-19 11:16:54.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('B88FA7A9-E065-482F-B802-1EE2C355E1FA', '2016-03-10', 'teste maria', '2016-03-10 17:28:30.000', '2016-03-10 17:28:44.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('B8A18A89-5F33-4150-951D-4CFA1548613B', '2016-03-14', 'teste 1jfddsifisa', '2016-03-14 00:00:41.000', '2016-03-14 00:00:48.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('B8DD01E7-37E9-E511-9C9E-079E9E66E5FD', '2016-03-13', 'Carlos3', '2016-03-13 13:23:21.000', '2016-03-13 13:23:58.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('BA5BD36A-E5ED-E511-BC5F-8FB5C9FC6A74', '2016-03-19', '1 linha', '2016-03-19 12:15:30.000', '2016-03-19 12:16:19.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('BA67037F-E5ED-E511-BC5F-8FB5C9FC6A74', '2016-03-19', 'Teste  2 linhaslinhas 
1
2
Fim', '2016-03-19 12:16:03.000', '2016-03-19 12:16:53.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('BC2E172A-1EE7-E511-B16F-6B22681073A8', '2016-03-10', 'Ggggg', '2016-03-10 21:14:04.000', '2016-03-10 21:14:34.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('BCBF947E-F9E9-E511-BBA9-0F35890F6941', '2016-03-14', 'Campo de espaço pra ver', '2016-03-14 12:29:08.000', '2016-03-14 12:29:44.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('BEC35B84-F9E9-E511-BBA9-0F35890F6941', '2016-03-14', 'A mensagem completa', '2016-03-14 12:29:18.000', '2016-03-14 12:29:54.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('C2A62B11-51EF-E511-B9B1-5D6569C1F09A', '2016-03-21', 'Teste de envio de 2 linhas
2 linha', '2016-03-21 07:38:36.000', '2016-03-21 07:39:47.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('C4348D53-682A-41B8-A4CF-216C0F860ED0', '2016-03-22', 'a
b
c', '2016-03-22 00:20:38.000', '2016-03-22 00:20:39.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('C4D74A0E-73F1-E511-8D08-E9691A5E7DA0', '2016-03-24', 'Fffghh', '2016-03-24 00:46:56.000', '2016-03-24 00:56:01.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('C6BDA500-C0E7-E511-8EBC-956342952D56', '2016-03-11', 'Vbbv', '2016-03-11 16:32:33.000', '2016-03-11 16:33:05.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('C884F621-0FEF-E511-ACEC-CB47B028C572', '2016-03-20', 'Aff q eu possa fazer uma visita ao loção o que eu possa fazer uma visita ao nosso trabalho é que não é o seguinte arquivo ou seja se a mensagem reencaminhada para que o que eu não tenho o meu iPhone início da mensagem encaminhada de um ano de fórum nenhum usuário registrado e conectado para ver se consigo fazer o pagamento do boleto para pagamento do boleto para pagamento do boleto para pagamento do boleto para', '2016-03-20 23:46:37.000', '2016-03-20 23:47:31.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('CC30182B-1EE7-E511-B16F-6B22681073A8', '2016-03-10', 'Ggggg', '2016-03-10 21:14:06.000', '2016-03-10 21:14:35.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('CCCA98E9-E4F1-E511-992E-5F60D64A2BC1', '2016-03-24', 'Gostaria de solicitar a alteração do endereço de cobrança', '2016-03-24 14:21:57.000', '2016-03-24 14:23:15.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('D2BD0859-DEED-E511-BF94-4DE2C052D8BB', '2016-03-19', '2', '2016-03-19 11:24:53.000', '2016-03-19 11:25:42.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('D4424224-2AEE-E511-B239-61AEFDC2B20D', '2016-03-19', 'Senhores pais a escola não aumentar a mensalidade apartir de meses que vem.', '2016-03-19 20:27:26.000', '2016-03-19 22:52:54.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('D8093327-D64B-4DEA-8E4F-500885F9DE49', '2016-03-11', 'aaaaaaaa', '2016-03-11 16:28:05.000', '2016-03-11 16:28:06.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('D8CBF6D0-3CE4-40C9-A4B5-DEE9A14881F6', '2016-03-24', 'bb', '2016-03-24 00:38:51.000', '2016-03-24 23:25:50.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('DA0CF7DF-04E7-E511-AA1B-E3F601447A38', '2016-03-10', 'Teste leo', '2016-03-10 18:13:02.000', '2016-03-10 18:13:36.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('DAECA131-78F1-E511-B5F5-1D4BED58ECB6', '2016-03-24', 'Ftgfgdfg', '2016-03-24 01:23:43.000', '2016-03-24 01:25:01.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('DC8B71EA-27C3-4A3C-8D8D-88A719FD021C', '2016-03-19', 'A
B
C
D
WWWWWWWWWWWW', '2016-03-19 11:33:34.000', '2016-03-19 11:33:36.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('DCB2D65B-7E42-4ACA-B4CF-4421A57B7544', '2016-03-22', 'teste de 1 linha do texto aaaa ddd fff ee aa erre fd aa chegou no fim do texto aqui', '2016-03-22 00:20:01.000', '2016-03-22 00:20:03.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('DE8CE218-09EA-E511-B393-11984B9C4A91', '2016-03-14', 'Vhhh', '2016-03-14 14:20:50.000', '2016-03-14 14:22:01.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('DF0A8B1E-65A3-42E8-8E66-1A6A9F4E8181', '2016-03-24', 'xxx', '2016-03-24 23:25:31.000', '2016-03-24 23:25:50.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('E028068A-A7F0-E511-AACB-F9E8DC6F5A1D', '2016-03-23', 'Aaaa', '2016-03-23 00:30:07.000', '2016-03-23 00:31:21.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('E03D67CD-E6ED-E511-B59C-7B4C71CC39C1', '2016-03-19', '1
2
3
4
5
6
7
8
9', '2016-03-19 12:25:24.000', '2016-03-19 12:26:13.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('E0692697-BAF1-E511-A912-2FAC4FACF13D', '2016-03-24', 'Gghh', '2016-03-24 09:19:00.000', '2016-03-24 12:27:09.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('E21AE1BC-FEF1-E511-B1EB-03B6E0BB5982', '2016-03-24', 'Yh', '2016-03-24 17:26:49.000', '2016-03-24 23:33:41.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('E2A6C2F2-B7B2-4A89-ACCF-8A21995BFC25', '2016-03-13', 'cccccccccc', '2016-03-13 20:17:27.000', '2016-03-13 20:17:27.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('E44A0D37-F43B-46D0-AFAF-116899286DC0', '2016-03-14', 'a
b
c
d
e
f
g', '2016-03-14 00:01:29.000', '2016-03-14 00:01:31.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('E466B7C1-E1EF-E511-9F07-FB3B8E6C25A9', '2016-03-22', 'O histórico de testar o sistema operacional Windows e Windows não é necessário ter o seu contato e me envie o comprovante do depósito do valor do aluguel de un saludo', '2016-03-22 00:54:20.000', '2016-03-22 00:55:14.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('E4F8A4D1-78F1-E511-A912-2FAC4FACF13D', '2016-03-24', 'Não sei o que você está', '2016-03-24 01:28:12.000', '2016-03-24 01:30:01.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('E6236DEE-5EEA-E511-A708-CB7F28C9220A', '2016-03-15', 'Fff', '2016-03-15 00:35:15.000', '2016-03-15 00:35:53.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('E67F0445-92E1-44D7-9EF6-65F3D78E1F42', '2016-03-13', 'bbbbbbbb', '2016-03-13 20:17:19.000', '2016-03-13 20:17:20.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('E6F5A07A-5203-4066-BA2C-CE5439E77B23', '2016-03-18', '1
2
3
4
5
6
7
aasdadads', '2016-03-18 16:31:15.000', '2016-03-18 16:31:16.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('E8361284-F2AB-4AFA-8DD4-70E730512778', '2016-03-24', 'zzz', '2016-03-24 23:24:14.000', '2016-03-24 23:25:50.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('E8D52662-DEED-E511-BF94-4DE2C052D8BB', '2016-03-19', '1
2', '2016-03-19 11:25:08.000', '2016-03-19 11:25:57.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('EA12E473-3EEE-E511-8B8F-8121B0A88547', '2016-03-19', 'PppppTeste de texto', '2016-03-19 22:52:50.000', '2016-03-19 22:53:40.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('EC87A8F5-EAED-E511-99D3-5F6156D125FE', '2016-03-19', 'Ini
A
B
C
D
E
F
G
H
Ij
J
K
L
L
Fim', '2016-03-19 12:55:10.000', '2016-03-19 12:55:59.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('ECE33B3E-E0ED-E511-B771-0193DF59CCBE', '2016-03-19', 'Frase muito grandeeeeee heeee vvhjd hhh', '2016-03-19 11:38:27.000', '2016-03-19 11:39:16.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('EE5DEBA7-ACF0-E511-A162-DF7E7BBB065E', '2016-03-23', 'Bom fim de que o seu contato com o meu iPhone usando o que eu tenho um amigo meu que é o que eu possa fazer o pagamento do boleto para pagamento do boleto para', '2016-03-23 01:06:44.000', '2016-03-23 01:07:42.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('F022B32C-E2ED-E511-AF57-1550EA63D0D4', '2016-03-19', '1 linha', '2016-03-19 11:52:17.000', '2016-03-19 11:53:06.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('F24816D1-06EA-E511-BC14-B5F01C29D507', '2016-03-14', 'Que chato temos nosso watsapp', '2016-03-14 14:04:30.000', '2016-03-14 14:05:09.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('F49B1CB4-78E9-E511-82CF-3167C4537C08', '2016-03-13', 'Potecaiu', '2016-03-13 21:07:13.000', '2016-03-13 21:07:49.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('F4C73309-95E9-E511-841D-F795266FF71E', '2016-03-14', 'Ftyh', '2016-03-14 00:30:01.000', '2016-03-14 00:30:39.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('F69A3D2B-1EE7-E511-B16F-6B22681073A8', '2016-03-10', 'Ggggg', '2016-03-10 21:14:06.000', '2016-03-10 21:14:35.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('F80AF52C-0FEE-E511-8B44-1DDA313EBBAF', '2016-03-19', 'Fhhcbghg', '2016-03-19 17:14:25.000', '2016-03-19 17:15:14.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('F8353C69-0FD7-4603-9A23-EA240A25C426', '2016-03-21', 'a b v fdasf fda fas  fdas fda dfas fdas fads ff ff dsaf fdsa fim fdas', '2016-03-21 23:51:33.000', '2016-03-22 00:20:03.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('F8D3FBA5-9384-4433-8864-98716FE440D9', '2016-03-18', 'aaa', '2016-03-18 08:43:23.000', '2016-03-18 08:59:07.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('FA39CB3D-38E9-E511-9C9E-079E9E66E5FD', '2016-03-13', 'Chorei', '2016-03-13 13:25:46.000', '2016-03-13 13:26:24.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('FC2CF06F-A9B4-4A39-87F7-F9CEFA59075F', '2016-03-20', '1
2', '2016-03-20 23:26:11.000', '2016-03-20 23:26:12.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('FC316C14-73F1-E511-8D08-E9691A5E7DA0', '2016-03-24', 'Não sei o trabalho do corretor para que', '2016-03-24 00:47:07.000', '2016-03-24 00:56:01.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('FE4F0FF3-29EE-E511-B239-61AEFDC2B20D', '2016-03-19', 'Hoje a aula não foi muito boa.
Tivemos aula de português.', '2016-03-19 20:26:04.000', '2016-03-19 22:52:54.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('FEAA28F9-344C-43C8-BD2B-98DB837AB5B5', '2016-03-20', 'gggg ggggg hhhhh hhhhh gfds gfds gsdgs gfsdg fdsgsdgsdg gfsdgsdg sdgsd', '2016-03-20 23:21:45.000', '2016-03-20 23:26:12.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('0C42F0F9-3DF2-E511-A7AE-ADEC4D982038', '2016-03-25', 'Teste cel', '2016-03-25 00:59:30.000', '2016-03-25 01:00:42.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('16D0E5E1-C82B-4EC8-8F73-CC8C7C0F1AE1', '2016-03-25', 'teste pc', '2016-03-25 01:00:22.000', '2016-03-25 01:00:30.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('1395A61C-718F-4F86-A159-82089BB8FD7D', '2016-03-25', 'pc 1', '2016-03-25 01:01:55.000', '2016-03-25 01:02:34.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('45F6484A-6553-41B2-AAED-8B2F6E4758AE', '2016-03-25', 'pc 2', '2016-03-25 01:02:00.000', '2016-03-25 01:02:34.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('FC0FDCF6-D0C3-4B6B-9E0C-0D666BA39705', '2016-03-25', 'pc 3', '2016-03-25 01:02:05.000', '2016-03-25 01:02:34.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('9C0DE0D6-FEC6-4431-911E-CE7ED81B6FF8', '2016-03-25', 'pc 4', '2016-03-25 01:02:12.000', '2016-03-25 01:02:34.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('3729C205-7AEF-43A3-A084-153BFB5FE0AD', '2016-03-25', 'pc 5
dfasfas
fdas
fas
f
asf
as
fa
sf
a fim pc5', '2016-03-25 01:02:24.000', '2016-03-25 01:02:34.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('10D39640-3EF2-E511-A7AE-ADEC4D982038', '2016-03-25', 'UH', '2016-03-25 01:01:29.000', '2016-03-25 01:03:48.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('42740D3D-3EF2-E511-A7AE-ADEC4D982038', '2016-03-25', 'Yfgc', '2016-03-25 01:01:23.000', '2016-03-25 01:03:48.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('5AB56739-3EF2-E511-A7AE-ADEC4D982038', '2016-03-25', 'A', '2016-03-25 01:01:16.000', '2016-03-25 01:03:47.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('5E0E4149-3EF2-E511-A7AE-ADEC4D982038', '2016-03-25', 'O histórico de um ano passado para o meu CV para análise de crédito e débito e crédito e débito e crédito e débito e limpar os contatos da pessoa ou entidade para a vaga para', '2016-03-25 01:01:43.000', '2016-03-25 01:03:48.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('330F0A68-8443-454D-A1CD-9F30A1E52F2F', '2016-03-26', 'msg 1', '2016-03-26 19:40:22.000', '2016-03-26 19:41:07.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('463E575C-724F-4FA5-A22C-A9B1BE58EEE2', '2016-03-26', 'msg 2', '2016-03-26 19:40:28.000', '2016-03-26 19:41:07.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('E58A3BFD-F5D3-4926-B475-D462907ABF93', '2016-03-26', 'msg 3', '2016-03-26 19:40:35.000', '2016-03-26 19:41:07.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('D2F92E62-E9B7-4804-9256-1F64EFB789C0', '2016-03-26', 'msg 4', '2016-03-26 19:40:42.000', '2016-03-26 19:41:07.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('14E6F080-78F2-E511-93E7-CD1EF0971951', '2016-03-25', 'Dar luftal 6 gotas', '2016-03-25 07:58:27.000', '2016-03-25 07:58:59.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('4457DCA0-D5F2-E511-8204-DF81E45463A5', '2016-03-25', 'Zzzzzxxzzz', '2016-03-25 19:05:04.000', '2016-03-25 19:05:30.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('46000F61-7EF2-E511-93E7-CD1EF0971951', '2016-03-25', 'Jfdxxcfgnnj', '2016-03-25 08:40:31.000', '2016-03-25 14:20:22.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('50DDFDF1-ADF2-E511-9AC2-E3EAD5D6446A', '2016-03-25', 'Teste Álvaro', '2016-03-25 14:21:00.000', '2016-03-25 14:21:21.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('66D99DA1-7EF2-E511-93E7-CD1EF0971951', '2016-03-25', 'Cfdf gddrgvcddg Grassmann brainstorming usou UFSJ gugu drag UFG Fred TV HDTV UFG curti', '2016-03-25 08:42:19.000', '2016-03-25 14:20:22.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('B21278EA-ADF2-E511-8FBB-1D8556D2F8BE', '2016-03-25', 'Teste vanessa', '2016-03-25 14:20:48.000', '2016-03-25 14:27:43.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('D8E92089-78F2-E511-93E7-CD1EF0971951', '2016-03-25', 'Neném tá dodoi', '2016-03-25 07:58:41.000', '2016-03-25 07:58:59.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('FC2E40BC-ADF2-E511-9AC2-E3EAD5D6446A', '2016-03-25', 'Hoje comemos bacalhau', '2016-03-25 14:19:30.000', '2016-03-25 14:19:53.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('C8640AB0-1A32-4C16-9F0C-4CCFCB6BE497', NULL, 'aaa', '2016-03-27 13:04:43.238', NULL, NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('CCCA3372-995A-41F5-9823-2DD5F9CA395C', '2016-03-30', 'teste 30/03', '2016-03-30 23:43:17.000', '2016-03-30 23:43:29.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('0023DF09-17F5-E511-8A1F-6F1AA27661BD', '2016-03-28', 'Ytyyy', '2016-03-28 15:58:20.000', '2016-03-28 23:47:10.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('0417CA15-0AF5-E511-9535-E7FB0288A500', '2016-03-28', 'Não sei como funciona o processo de seleção para a sua atenção e aguardo retorno att Ana Paula de um ano de fórum nenhum usuário registrado e conectado para ver se consigo fazer o pagamento do boleto para pagamento do boleto para pagar as taxas do que eu tenho que pagar o boleto de cobrança de taxa', '2016-03-28 14:25:36.000', '2016-03-28 14:26:13.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('08588F2A-FFF4-E511-9535-E7FB0288A500', '2016-03-28', 'Ggh', '2016-03-28 13:07:27.000', '2016-03-28 14:26:12.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('1AF9EE84-AAF5-E511-BD1D-55B772B3FA93', '2016-03-29', 'Trgy', '2016-03-29 09:34:02.000', '2016-03-30 07:39:08.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('30FBD00F-36F4-E511-9061-5B7EA26D5ACB', '2016-03-27', 'Xcxc', '2016-03-27 13:07:53.000', '2016-03-27 20:58:06.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('4844DFEC-34F4-E511-9141-4BCC46F122A8', '2016-03-27', 'Eee', '2016-03-27 12:59:45.000', '2016-03-27 20:58:05.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('50F82AEA-34F4-E511-9141-4BCC46F122A8', '2016-03-27', 'Zzzz', '2016-03-27 12:59:40.000', '2016-03-27 20:58:05.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('560341BC-58F5-E511-BB9E-81820C935D27', '2016-03-28', 'Não sei como funciona o processo de seleção para a sua atenção e aguardo retorno att Ana Paula de um ano de fórum nenhum usuário registrado e conectado para ver se consigo fazer o pagamento do boleto para pagamento do boleto para pagamento do boleto para pagamento do boleto para o seu pedido de orçamento de uma forma mais rápida e fácil de fazer um orçamento de uma oportunidade de fazer o que eu possa ser feito o cadastro e emissão de nota eletrônica como um dos melhores do mundo em que a minha conta no banco e o meu currículo em casa de um dos mais variados e se não me lembro que a gente se fala em anexo o arquivo XML da nota fiscal eletrônica que deve ser enviado para o dia todo na minha casa para que o que eu possa me instruir de Janeiro', '2016-03-28 23:48:36.000', '2016-03-30 07:39:08.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('865F99B7-E1F5-E511-BD1D-55B772B3FA93', '2016-03-29', 'Não há respostas a este assunto já que o meu curriculum vitae para vossa apreciação e avaliação de desempenho para servidores web do utilizador MSN Messenger no meu caso eu não tenho o meu iPhone início da mensagem encaminhada de um ano de fórum nenhum usuário registrado e conectado para ver se consigo fazer o pagamento do boleto para pagamento do boleto para pagamentoy ghhh hhhhyhb mais um ano passado', '2016-03-29 16:09:10.000', '2016-03-30 07:39:08.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('96F9CBF0-F9F4-E511-B0BA-4DBCD287E01D', '2016-03-28', 'Fffg', '2016-03-28 12:30:02.000', '2016-03-28 12:31:03.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('9AF5D7D0-03F5-E511-9535-E7FB0288A500', '2016-03-28', 'Rhfjfifif', '2016-03-28 13:40:44.000', '2016-03-28 14:26:13.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('A4F8D381-A5F3-E511-BC1A-21A686CFF5FE', '2016-03-26', 'C', '2016-03-26 19:53:07.000', '2016-03-27 20:58:05.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('B0A64E5A-0AF5-E511-ABCA-C71DAB58DA41', '2016-03-28', 'Não sei se é o que é o que é a mesma coisa mas não é o seguinte arquivo XML da uma ajuda de todos e um ótimo domingo pra você também poderá consultar a autenticidade da sua tarefa em tarefa enviada do que o seu tempo para a', '2016-03-28 14:27:31.000', '2016-03-28 23:47:10.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('B4514854-77F4-E511-A6DA-EBA534522572', '2016-03-27', 'Jô tudo bem com você para editar o seguinte arquivo ou link anexo o boleto para pagamento do boleto para pagamento do boleto para pagamento do boleto para pagamento do boleto para pagamento do mês passado não foi possível a entrega da', '2016-03-27 20:55:05.000', '2016-03-27 20:58:06.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('B45CE467-A4F3-E511-BC1A-21A686CFF5FE', '2016-03-26', 'Msg 5', '2016-03-26 19:45:14.000', '2016-03-27 20:58:05.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('CA731C52-36F4-E511-8CBD-E10BAF3C9853', '2016-03-27', 'Cvc', '2016-03-27 13:09:44.000', '2016-03-27 20:58:06.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('CE5BA72C-35F4-E511-9061-5B7EA26D5ACB', '2016-03-27', '111', '2016-03-27 13:01:32.000', '2016-03-27 20:58:05.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('D05EEEC0-58F5-E511-BB9E-81820C935D27', '2016-03-28', 'Gg', '2016-03-28 23:48:44.000', '2016-03-30 07:39:08.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('D292E341-76F4-E511-A6DA-EBA534522572', '2016-03-27', 'Ffdd', '2016-03-27 20:47:25.000', '2016-03-27 20:58:06.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('F8D047EB-F9F4-E511-B0BA-4DBCD287E01D', '2016-03-28', 'Oooo', '2016-03-28 12:29:53.000', '2016-03-28 12:31:03.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('F8E4E5E3-A3F5-E511-BD1D-55B772B3FA93', '2016-03-29', 'DF CEP para cálculo do', '2016-03-29 08:46:35.000', '2016-03-30 07:39:08.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('FE0D8FED-F9F4-E511-B0BA-4DBCD287E01D', '2016-03-28', 'Hhh', '2016-03-28 12:29:57.000', '2016-03-28 12:31:03.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('5111E80D-294F-4C68-B208-251D7B37424A', '2016-03-30', 'teste 2', '2016-03-30 23:46:18.000', '2016-03-30 23:46:30.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('E36B955B-3A31-4CBE-8052-DF795A3CF51B', '2016-03-30', 'teste 3', '2016-03-30 23:48:59.000', '2016-03-30 23:49:08.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('A621A8CD-26B3-4E46-AF8F-7970CD657E59', '2016-03-30', 'teste 4', '2016-03-30 23:50:01.000', '2016-03-30 23:50:10.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('F32A8C43-BAF2-46A0-81E7-B628EF12FCDD', '2016-03-31', 'teste 5', '2016-03-31 00:03:22.000', '2016-03-31 00:03:35.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('75A95FAE-3CCE-4AA2-AFFB-63349B167339', '2016-03-31', 'teste 6', '2016-03-31 00:07:14.000', '2016-03-31 00:07:22.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('605B5E5C-5EFB-4ECE-9BB9-C47BA92A47DA', '2016-03-31', 'teste 7', '2016-03-31 00:17:04.000', '2016-03-31 00:17:13.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('F80B950D-A82B-46AB-9A6A-30FD3EC3B41E', '2016-03-31', 'teste 8', '2016-03-31 00:21:24.000', '2016-03-31 00:21:32.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('8522F737-27F2-4255-A401-5BEC93282969', '2016-03-31', 'teset 9', '2016-03-31 00:24:22.000', '2016-03-31 00:24:31.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('DBAB7DED-B476-4F18-AD43-BA1A3046915F', '2016-03-31', '1', '2016-03-31 00:27:53.666', NULL, NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('139097CA-4FA5-4B74-B224-2E9A2DE5ADC3', '2016-03-31', '10', '2016-03-31 00:28:13.000', '2016-03-31 00:28:23.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('8A88738D-4E1F-4969-8870-D80CA843DD9F', '2016-03-31', 'fdsfsfs', '2016-03-31 23:37:59.000', '2016-04-02 00:09:01.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('0019F372-F2F6-E511-B4E5-FD32255F5042', '2016-03-31', '11', '2016-03-31 00:41:27.000', '2016-03-31 00:42:03.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('06014790-F2F6-E511-B4E5-FD32255F5042', '2016-03-31', 'Dia da mentira', '2016-03-31 00:42:16.000', '2016-03-31 00:57:36.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('0C98190C-3EF7-E511-97E1-41399A3C2E7A', '2016-03-31', 'Fhg
G
G
G

g
g
g
g
g
g.g
y
Veja como está o processo da Sra Maria de Jesus Cristo e se for o seu nome completo e telefone para o dia', '2016-03-31 09:42:36.000', '2016-03-31 16:29:07.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('0EA3F0CE-F6F6-E511-8240-31F3AF499C46', '2016-03-31', 'Boa noite gostaria de saber se você não for possível gostaria de fazer o que depósito do sinal aluguel da loja do imóvel para a vaga de estágio na área da administrativa', '2016-03-31 01:12:39.000', '2016-03-31 07:50:32.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('1A7D8EB3-F2F6-E511-B4E5-FD32255F5042', '2016-03-31', 'Não sei como é a mesma que a sua atenção para o seu nome completo do aluno que se trata da questão do pagamento de um ano de vida e que não é necessário que a gente se encontra em anexo os dados da empresa para que ele faça a transferência do valor da diária para um novo pedido para o seu nome completo e CPF do titular da linha de apoio para a próxima semana que vem e vão até o final do dia de hoje é que o que eu possa fazer uma visita para conhecer o empreendimento e de integridade e pela sua ajuda para o meu iPhone início da mensagem encaminhada de um ano de fórum nenhum usuário registrado e conectado para ver se consigo fazer o depósito da primeira vez em quando para o dia todo o processo de seleção para a sua atenção e um abraço Tiago e ele disse que não tem como você pode cancelar o pedido de ajuda para o meu iPhone início de junho e gostaria de saber o preço vai ficar muito tempo para a vaga para o dia todo. Fim', '2016-03-31 00:43:15.000', '2016-03-31 00:57:36.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('1EFC366B-B4F7-E511-B5DE-8D566A3BC97E', '2016-03-31', 'Dhhdhfhfh', '2016-03-31 23:49:56.000', '2016-04-01 01:11:12.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('2468A0C1-B9F7-E511-A33C-711AC14AA70C', '2016-04-01', 'Tgg', '2016-04-01 00:28:09.000', '2016-04-01 01:11:13.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('3207554B-2EF7-E511-97E1-41399A3C2E7A', '2016-03-31', 'Hhdjhrjfjfjbrj
Rhr
F
f
ggg', '2016-03-31 07:49:50.000', '2016-03-31 07:50:33.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('387A439F-F5F6-E511-8240-31F3AF499C46', '2016-04-02', 'Hhh', '2016-03-31 01:04:10.000', '2016-03-31 07:50:32.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('404CAF21-C3F7-E511-9D08-E7CF64EF3E6C', '2016-04-02', 'Não', '2016-04-01 01:35:16.000', '2016-04-01 07:22:10.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('40BD4DE6-76F7-E511-B4AC-35C5731861CB', '2016-03-31', 'Dentista agendado', '2016-03-31 16:29:34.000', '2016-03-31 16:30:00.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('4AB12DC9-3DF7-E511-97E1-41399A3C2E7A', '2016-03-31', 'Não sei como é que o que eu possa fazer o pagamento do boleto para pagamento do boleto bancário referente a compra de um', '2016-03-31 09:40:44.000', '2016-03-31 16:29:07.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('5CAF4655-BFF7-E511-9D08-E7CF64EF3E6C', '2016-04-01', 'Não sei o', '2016-04-01 01:08:04.000', '2016-04-01 01:11:13.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('6C631B4C-BCF7-E511-AAE4-656DC5BB4E40', '2016-04-01', ' Hghj', '2016-04-01 00:46:20.000', '2016-04-01 01:11:13.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('8E0C4A73-B4F7-E511-B5DE-8D566A3BC97E', '2016-03-31', 'Gjgj', '2016-03-31 23:50:10.000', '2016-04-01 01:11:12.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('A6227654-2EF7-E511-97E1-41399A3C2E7A', '2016-03-31', 'Não sei como funciona', '2016-03-31 07:50:06.000', '2016-03-31 07:50:33.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('B2EBE8B6-F2F6-E511-B4E5-FD32255F5042', '2016-03-31', 'F', '2016-03-31 00:43:21.000', '2016-03-31 00:57:36.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('DA37BABD-3CF7-E511-97E1-41399A3C2E7A', '2016-04-03', 'Yh', '2016-03-31 09:33:15.000', '2016-03-31 16:29:06.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('DE90323F-F5F6-E511-8240-31F3AF499C46', '2016-04-01', 'Fffgg', '2016-03-31 01:01:29.000', '2016-03-31 01:03:27.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('E457D0A7-F4F6-E511-B077-A185A5CB7AA3', '2016-03-31', 'Tyg', '2016-03-31 00:57:15.000', '2016-03-31 00:57:36.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('E8470077-F2F6-E511-B4E5-FD32255F5042', '2016-03-31', '1', '2016-03-31 00:41:34.000', '2016-03-31 00:42:04.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('F249EFA1-B7F7-E511-A916-752D12D84D64', '2016-04-01', 'Tyyfgff', '2016-04-01 00:12:57.000', '2016-04-01 01:11:12.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('FCBC677C-F2F6-E511-B4E5-FD32255F5042', '2016-03-31', '1', '2016-03-31 00:41:43.000', '2016-03-31 00:42:04.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('1698420F-8EF8-E511-9BD4-3945D1D768BE', '2016-12-22', 'Aaaa', '2016-04-02 01:47:52.000', '2016-04-02 01:51:58.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('1AF4A009-8AF8-E511-B564-6DA8349F072D', '2016-04-02', 'Fgghh', '2016-04-02 01:19:05.000', '2016-04-02 01:51:58.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('1EF109C4-F7F7-E511-83DA-DDDB305398E7', '2016-04-01', 'Hoje tivemos uma reunião no sábado dia segue em casa de banho é que o meu iPhone usando o YY. Por isso que o meu currículo em casa de um dos mais variados e se não me lembro E a é a mesma não será .', '2016-04-01 07:52:02.000', '2016-04-02 01:51:58.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('BC11BEBE-84F8-E511-A349-9304E4812A44', '2016-04-02', 'Fgghy', '2016-04-02 00:41:12.000', '2016-04-02 01:51:58.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('5B30626B-C42B-4E48-A1C1-D334389505B5', '2016-04-02', 'teste todos', '2016-04-02 10:14:54.000', '2016-04-02 11:15:49.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('3C0A5C0B-7224-4AB5-94AC-5ED5C3934A9B', '2016-04-02', 'teste todos 2', '2016-04-02 10:20:44.000', '2016-04-02 11:15:49.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('7121E3CB-86D7-4081-B5F1-86BA549F8329', '2016-04-04', 'teste pc', '2016-04-04 23:11:16.000', '2016-04-04 23:11:36.000', NULL, NULL, 9, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('02D377A7-20F9-E511-823A-27C355AE21D6', '2016-04-04', 'Hjghfifgkfh', '2016-04-02 19:17:14.000', '2016-04-02 20:02:21.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('28DB64C9-8EF8-E511-8F57-E9ADF71CB1A1', '2016-04-29', 'Teste de data', '2016-04-02 01:53:05.000', '2016-04-02 12:14:56.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('2CCECDBF-1EF9-E511-8F5E-95F7A7C37770', '2016-04-02', 'Leonardo acordou. Dormiu bem.', '2016-04-02 19:03:36.000', '2016-04-02 19:04:07.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('348B70DE-CEF9-E511-8033-2924041FBC02', '2016-04-03', 'Oi', '2016-04-03 16:04:19.000', '2016-04-03 19:28:38.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('42613821-E6F8-E511-B6B8-BB4E86202B2C', '2016-04-02', 'So maria', '2016-04-02 12:18:18.000', '2016-04-02 12:19:11.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('4A092824-CBF8-E511-8B67-ED0C876E1A06', '2016-04-02', 'Oi mamãe do Leonardo', '2016-04-02 09:05:07.000', '2016-04-02 12:14:58.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('5CF114FF-E5F8-E511-B6B8-BB4E86202B2C', '2016-04-02', 'Teste sala 1', '2016-04-02 12:17:21.000', '2016-04-02 12:19:11.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('5E95E3F0-15F9-E511-B6B8-BB4E86202B2C', '2016-04-02', 'Estou indo comprar pão.', '2016-04-02 18:00:33.000', '2016-04-02 18:05:58.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('688A74CF-CEF9-E511-8033-2924041FBC02', '2016-04-03', 'Olá turma, a prova de matemática será dia 10/04', '2016-04-03 16:03:54.000', '2016-04-03 19:28:38.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('8AF934E1-8FF8-E511-A6B1-D5F2F9F43A47', '2016-06-10', 'Aniversário', '2016-04-02 02:00:54.000', '2016-04-02 12:14:57.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('B06EA6CA-8FF8-E511-A6B1-D5F2F9F43A47', '2016-04-02', 'O que você me passou', '2016-04-02 02:00:16.000', '2016-04-02 12:14:57.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('B4EA36DC-E5F8-E511-B6B8-BB4E86202B2C', '2016-04-02', 'Segunda dv trazer fraldas', '2016-04-02 12:16:23.000', '2016-04-02 12:19:11.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('BAD09CBC-E5F8-E511-B6B8-BB4E86202B2C', '2016-04-02', 'Teste todos 3', '2016-04-02 12:15:30.000', '2016-04-02 12:19:11.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('C2A4A903-CAF8-E511-8E3C-5DA9EDA55930', '2016-04-02', 'Fyfyt', '2016-04-02 08:57:03.000', '2016-04-02 12:14:57.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('E4AF75E3-CCF9-E511-95ED-9B2B2E6DEA1B', '2016-04-03', 'Lindo da tia', '2016-04-03 15:50:08.000', '2016-04-03 19:31:56.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('F25582B9-CCF9-E511-95ED-9B2B2E6DEA1B', '2016-04-03', 'All', '2016-04-03 15:48:58.000', '2016-04-03 19:31:55.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('CCE0EDC1-20D2-4D2E-AF1C-5BEB9AE78CA1', '2016-04-05', 'teste', '2016-04-05 00:25:13.000', '2016-04-05 12:25:18.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('A8B2F41B-E3A1-4F9D-B049-476C97689424', '2016-04-05', 'aaaa', '2016-04-05 00:25:19.000', '2016-04-05 12:25:18.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('6A63C58B-0C9A-4B85-ACBE-7E8C3CF5C623', '2016-04-06', 'dormi Leo!!!!!', '2016-04-06 00:16:17.000', '2016-04-06 00:16:25.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('0C702B28-CCF9-E511-95ED-9B2B2E6DEA1B', '2016-04-03', 'A gi aprendeu os ditongos.', '2016-04-03 15:44:54.000', '2016-04-03 15:45:39.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('0C9BE8FC-D3E9-E511-86AD-C7D047446A4F', '2016-03-14', 'Hjvjjvvj', '2016-03-14 08:00:39.000', '2016-03-14 08:01:15.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('2AD440BA-8FF8-E511-A6B1-D5F2F9F43A47', '2016-04-02', 'Não sei o nome', '2016-04-02 01:59:49.000', '2016-04-02 12:14:57.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('32A9F7BE-C1E7-E511-A726-D5493EF686E7', '2016-03-11', 'Pedro 1', '2016-03-11 16:45:02.000', '2016-03-11 16:45:36.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('36CB2C68-51EF-E511-B9B1-5D6569C1F09A', '2016-03-21', 'O pedro nao comeu salada', '2016-03-21 07:41:02.000', '2016-03-21 07:41:55.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('3815E5CD-C1E7-E511-A726-D5493EF686E7', '2016-03-11', 'Rrrr', '2016-03-11 16:45:27.000', '2016-03-11 16:46:15.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('464E69DB-CCF9-E511-95ED-9B2B2E6DEA1B', '2016-04-03', 'Linda', '2016-04-03 15:49:55.000', '2016-04-03 19:31:56.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('641C0387-0FEF-E511-ACEC-CB47B028C572', '2016-03-20', 'Hoje o Pedrinho foi para a escola com a fantasia do homem aranha', '2016-03-20 23:49:27.000', '2016-03-20 23:50:19.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('74853DF6-D3E9-E511-86AD-C7D047446A4F', '2016-03-14', 'Fff', '2016-03-14 08:00:28.000', '2016-03-14 08:01:04.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('987BB5B9-0FEF-E511-ACEC-CB47B028C572', '2016-03-20', 'Hoje fomos no outback comer a costela 
com barbecue.', '2016-03-20 23:50:52.000', '2016-03-20 23:51:44.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('B8B4EDA0-0FEF-E511-ACEC-CB47B028C572', '2016-03-20', 'homem aranha', '2016-03-20 23:50:10.000', '2016-03-20 23:51:03.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('DE2858D7-CCE7-E511-8296-F7AC69348C9A', '2016-03-11', 'Tudrrwter
Fter', '2016-03-11 18:04:27.000', '2016-03-11 18:04:58.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('A61C2729-0EFC-E511-8ACE-6F33B838D6AB', '2016-04-06', 'teste', '2016-04-06 12:42:25.000', '2016-04-06 12:43:02.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('980748CE-DCA3-4D13-B6A7-E1E7D0207326', '2016-04-08', 'aaa', '2016-04-08 11:22:48.000', '2016-04-08 11:25:27.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('7AE535FA-45CE-4D48-B458-3118FCCC0226', '2016-04-08', 'bb', '2016-04-08 11:23:14.000', '2016-04-08 11:25:27.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('86B66C9E-5268-4A86-91F0-3DE6AF7D909C', '2016-04-08', 'c', '2016-04-08 11:23:53.000', '2016-04-08 11:25:27.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('8BBAFA14-7DE7-4C09-AD7D-587C09088218', '2016-04-08', 'd', '2016-04-08 11:24:11.000', '2016-04-08 11:25:27.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('E484F283-CA6B-4944-A9B0-08D099952CC5', '2016-04-08', 'e', '2016-04-08 11:25:13.000', '2016-04-08 11:25:27.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('4A931F05-A8C0-4803-838A-3F61C8398200', '2016-04-08', 'w', '2016-04-08 12:09:40.000', '2016-04-08 12:09:41.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('A74F2394-0C77-484C-85C9-95D33D0D842B', '2016-04-08', 'v', '2016-04-08 12:09:47.000', '2016-04-08 12:09:48.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('E433A6B4-4C04-47B2-9A64-9EA05DC0B325', '2016-04-08', 'x', '2016-04-08 12:09:54.000', '2016-04-08 12:09:54.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('B3E11EDC-1ACB-4578-99B7-DA1DE0A3B6A3', '2016-04-08', 'cxv', '2016-04-08 12:09:59.000', '2016-04-08 12:09:59.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('7C717B11-8135-4218-AF6D-541D90F8EB54', '2016-04-08', 'ss', '2016-04-08 12:10:05.000', '2016-04-08 12:10:05.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('0AAEB94F-9AFD-E511-A721-3B932FF033AC', '2016-04-08', 'Cel', '2016-04-08 11:58:10.000', '2016-04-08 11:58:48.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('5E74435B-6DFD-E511-B9BC-A3FB50C36DB6', '2016-04-08', 'Jjjnhn', '2016-04-08 06:36:22.000', '2016-04-08 11:57:20.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('946C5524-9BFD-E511-8248-37B634BDD9D8', '2016-04-08', 'Cel 3', '2016-04-08 12:04:07.000', '2016-04-08 12:04:42.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('AA4DB801-9BFD-E511-8248-37B634BDD9D8', '2016-04-08', 'Cel 2', '2016-04-08 12:03:09.000', '2016-04-08 12:03:42.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('D46A182D-9BFD-E511-8248-37B634BDD9D8', '2016-04-08', 'Cel 4', '2016-04-08 12:04:22.000', '2016-04-08 12:04:57.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('EA009946-1EFD-E511-B9BC-A3FB50C36DB6', '2016-04-08', 'Llll', '2016-04-07 21:10:17.000', '2016-04-08 11:57:20.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('F8B4B83C-9BFD-E511-8248-37B634BDD9D8', '2016-04-08', 'Cel 5', '2016-04-08 12:04:48.000', '2016-04-08 12:05:23.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('81D21CB5-CAD0-464C-B00E-99C55FF159A9', '2016-04-08', ' vcb', '2016-04-08 12:10:48.000', '2016-04-08 12:10:48.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('C36A4803-E24C-4F86-9FEE-F986850C8E7D', '2016-04-08', 'ccvc', '2016-04-08 12:11:47.000', '2016-04-08 12:11:47.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('FE576D42-9CFD-E511-B1C2-D5F14616F2A7', '2016-04-08', 'Hhh', '2016-04-08 12:12:07.000', '2016-04-08 12:12:53.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('691E301E-CCFE-419D-BEDF-6BB9CB6369C8', '2016-04-08', 'xxx', '2016-04-08 12:17:04.000', '2016-04-08 12:17:04.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('5F844908-918A-4EDD-B6DB-26E5F49D8419', '2016-04-08', 'bbb', '2016-04-08 12:17:52.000', '2016-04-08 12:17:52.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('AA40E04C-E7A9-467A-BA0C-9C05ACD4271B', '2016-04-08', 's', '2016-04-08 12:21:37.000', '2016-04-08 12:21:37.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('1A5B2CDD-0EF8-4F68-B5E2-90C2B82A91AE', '2016-04-08', 'sds', '2016-04-08 12:21:42.000', '2016-04-08 12:21:42.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('D27B27B3-3051-471F-964E-A114DF31B5CB', '2016-04-08', 'gfds', '2016-04-08 12:21:50.000', '2016-04-08 12:21:50.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('04F98101-50FC-E511-AE92-15101811952B', '2016-04-06', 'O histórico de conversas foi anexado como conversa do meu iPhone início da mensagem particular para o dia todo o processo de seleção para a sua atenção e um abraço e até agora não me parece ter um bom dia segue anexo o boleto de pagamento da mensalidade de Janeiro e não é um dos melhores do que o que eu possa fazer o pagamento do boleto para pagamento do boleto de cobrança da multa de rescisão da mesma coisa e se for possível eu gostaria que me envie o seu bom gosto e me coloco à disposição att Ana Paula de saber o que eu possa fazer o att completo e RG dos sócios e não tem como me enviar o comprovante de pagamento do boleto para o meu currículo em casa de um pouco de dificuldade em anexo a nota. Hoje eu não tenho o meu iPhone início da mensagem encaminhada de um ano. Fim!!', '2016-04-06 20:33:45.000', '2016-04-06 20:34:18.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('140532DB-4FFC-E511-AE92-15101811952B', '2016-04-06', 'B', '2016-04-06 20:32:41.000', '2016-04-06 20:34:18.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('1660C93B-50FC-E511-AE92-15101811952B', '2016-04-06', 'Jju', '2016-04-06 20:35:23.000', '2016-04-06 20:36:04.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('16CAD221-1EFD-E511-B9BC-A3FB50C36DB6', '2016-04-07', 'Yyy', '2016-04-07 21:09:16.000', '2016-04-07 21:10:10.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('224F481B-1EFD-E511-B9BC-A3FB50C36DB6', '2016-04-07', 'Hjj', '2016-04-07 21:09:05.000', '2016-04-07 21:10:10.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('286017E1-4FFC-E511-AE92-15101811952B', '2016-04-06', 'D', '2016-04-06 20:32:51.000', '2016-04-06 20:34:18.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('36B63734-50FC-E511-AE92-15101811952B', '2016-04-06', 'Hhfjf', '2016-04-06 20:35:10.000', '2016-04-06 20:36:03.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('3C95E4E3-4FFC-E511-AE92-15101811952B', '2016-04-06', 'E', '2016-04-06 20:32:56.000', '2016-04-06 20:34:18.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('465426E9-4EFC-E511-8CC9-A9F9F6FC7021', '2016-04-06', 'Oi papai e mamãe do Léo.', '2016-04-06 20:25:55.000', '2016-04-06 20:28:51.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('46B2B406-78FB-E511-A904-09AD22D677A9', '2016-04-05', 'Vamos aprender a contar', '2016-04-05 18:47:43.000', '2016-04-06 20:19:44.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('502ECC61-BFFC-E511-89D7-9FE9209CD86E', '2016-04-07', 'Teste', '2016-04-07 09:51:01.000', '2016-04-07 09:52:37.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('84D3FE50-65FC-E511-977F-17D9B11D4C0E', '2016-04-06', 'Palmeiras está ganhando 2 x 1', '2016-04-06 23:06:18.000', '2016-04-07 09:45:34.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('8C375B24-1EFD-E511-B9BC-A3FB50C36DB6', '2016-04-07', 'Ghh', '2016-04-07 21:09:20.000', '2016-04-07 21:10:10.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('901DB739-50FC-E511-AE92-15101811952B', '2016-04-06', 'E se', '2016-04-06 20:35:20.000', '2016-04-06 20:36:04.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('907416D9-4FFC-E511-AE92-15101811952B', '2016-04-06', 'A', '2016-04-06 20:32:37.000', '2016-04-06 20:34:17.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('94DC1C3E-50FC-E511-AE92-15101811952B', '2016-04-06', '36#7', '2016-04-06 20:35:27.000', '2016-04-06 20:36:04.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('A26FBC1F-1EFD-E511-B9BC-A3FB50C36DB6', '2016-04-07', 'Ggg', '2016-04-07 21:09:12.000', '2016-04-07 21:10:10.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('A4EF71DC-52FC-E511-AE92-15101811952B', '2016-04-06', 'Rd', '2016-04-06 20:54:12.000', '2016-04-06 23:06:10.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('A631DD43-50FC-E511-AE92-15101811952B', '2016-04-06', 'Mmmnb', '2016-04-06 20:35:37.000', '2016-04-06 20:36:04.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('B6FA5BDD-4FFC-E511-AE92-15101811952B', '2016-04-06', 'C', '2016-04-06 20:32:45.000', '2016-04-06 20:34:18.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('BA298D1D-1EFD-E511-B9BC-A3FB50C36DB6', '2016-04-07', 'Gyi', '2016-04-07 21:09:09.000', '2016-04-07 21:10:10.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('BEB00C32-50FC-E511-AE92-15101811952B', '2016-04-06', 'Hf', '2016-04-06 20:35:07.000', '2016-04-06 20:36:03.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('CC15682B-1EFD-E511-B9BC-A3FB50C36DB6', '2016-04-07', 'Bhhh', '2016-04-07 21:09:32.000', '2016-04-07 21:10:11.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('D092D736-50FC-E511-AE92-15101811952B', '2016-04-06', 'Hjd', '2016-04-06 20:35:15.000', '2016-04-06 20:36:04.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('DAD29FF8-77FB-E511-A904-09AD22D677A9', '2016-04-05', 'Vamos aprender a letra C', '2016-04-05 18:47:19.000', '2016-04-06 20:19:44.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('F2AEFBE9-77FB-E511-A904-09AD22D677A9', '2016-04-05', 'Vamos aprender a letra A', '2016-04-05 18:46:54.000', '2016-04-06 20:19:43.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('FE171428-1EFD-E511-B9BC-A3FB50C36DB6', '2016-04-07', 'Hhu', '2016-04-07 21:09:26.000', '2016-04-07 21:10:10.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('C209C71F-7062-4B44-92D5-3409D19808E4', '2016-04-08', 'ssss', '2016-04-08 12:22:42.000', '2016-04-08 12:22:42.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('45683E53-FBA2-4A95-A20D-E18CF4D2BC15', '2016-04-08', ' cc', '2016-04-08 12:24:23.000', '2016-04-08 12:24:23.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('FE48542B-4FC5-4B5B-8F3C-03E270415DF4', '2016-04-08', 'xxx', '2016-04-08 12:24:31.000', '2016-04-08 12:24:31.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('85254D83-FF44-4703-9B4D-640AC02E72E6', '2016-04-08', 'pc10', '2016-04-08 12:37:52.000', '2016-04-08 12:37:53.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('1C15C882-9EFD-E511-9AD9-A7361E29241D', '2016-04-08', 'Fff', '2016-04-08 12:28:14.000', '2016-04-08 12:29:05.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('9A672DB1-9EFD-E511-8128-77607294CE42', '2016-04-08', 'B', '2016-04-08 12:29:32.000', '2016-04-08 12:31:43.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('A64549F1-9EFD-E511-82E3-2D597A11743D', '2016-04-09', 'Tt', '2016-04-08 12:31:19.000', '2016-04-08 12:31:51.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('AA8B77F6-9EFD-E511-82E3-2D597A11743D', '2016-04-08', 'Gh', '2016-04-08 12:31:28.000', '2016-04-08 12:32:57.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('E6FBC09C-9EFD-E511-9AD9-A7361E29241D', '2016-04-08', 'F', '2016-04-08 12:28:58.000', '2016-04-08 12:29:31.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('0ED646EB-9FFD-E511-ABEA-8F98CD362A7A', '2016-04-08', 'Cel 10', '2016-04-08 12:38:19.000', '2016-04-08 12:39:01.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('FAFCB6F1-5447-4D70-B675-15C2CA0FFC78', '2016-04-08', 'zz', '2016-04-08 12:40:50.000', '2016-04-08 12:40:50.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('78E2A8F6-ADB1-4C28-8888-D54C777ED069', '2016-04-08', 'pc11', '2016-04-08 12:40:57.000', '2016-04-08 12:40:57.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('4B01471C-569B-4533-93AD-4F16128C2CC5', '2016-04-08', 'gggg', '2016-04-08 12:51:46.000', '2016-04-08 12:51:46.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('36528DF5-A0FD-E511-B4B2-39C4C41077D8', '2016-04-08', 'Fff', '2016-04-08 12:45:46.000', '2016-04-08 12:46:23.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('760AF364-A1FD-E511-8AF9-8123F88FEB6E', '2016-04-08', 'Vbb', '2016-04-08 12:48:52.000', '2016-04-08 12:49:26.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('2BB7FBBE-093A-4242-B794-6C060BEBE7C0', '2016-04-08', 'ss', '2016-04-08 12:58:12.000', '2016-04-08 12:58:13.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('AB3150AD-A810-478D-B063-715F4A2BD8A7', '2016-04-08', 'ss', '2016-04-08 12:58:20.000', '2016-04-08 12:58:20.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('0850E218-A9FD-E511-B2FB-A7E5479B5631', '2016-04-10', 'If', '2016-04-08 13:44:01.000', '2016-04-08 13:44:31.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('22DC1180-A8FD-E511-A662-31564680D376', '2016-04-08', 'Fgg', '2016-04-08 13:39:44.000', '2016-04-08 13:40:20.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('285A8619-A3FD-E511-AA46-3D4AB85DC71C', '2016-04-08', 'Tyy', '2016-04-08 13:01:05.000', '2016-04-08 13:01:43.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('2A7EF61D-A9FD-E511-B2FB-A7E5479B5631', '2016-04-10', 'Uuug', '2016-04-08 13:44:09.000', '2016-04-08 13:44:41.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('2E783C67-A3FD-E511-AA46-3D4AB85DC71C', '2016-04-08', 'Ggy', '2016-04-08 13:03:15.000', NULL, NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('3237C1F9-AAFD-E511-B2FB-A7E5479B5631', '2016-04-08', 'Msg tfd', '2016-04-08 13:57:28.000', NULL, NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('3E3593C9-A9FD-E511-B2FB-A7E5479B5631', '2016-04-08', 'Hhh', '2016-04-08 13:48:57.000', '2016-04-08 13:49:28.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('4AC6006B-A3FD-E511-AA46-3D4AB85DC71C', '2016-04-08', 'G', '2016-04-08 13:03:22.000', '2016-04-08 13:04:53.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('5A36D1D1-AAFD-E511-B2FB-A7E5479B5631', '2016-04-08', 'Gdjd', '2016-04-08 13:56:21.000', '2016-04-08 13:56:53.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('5E0358BB-AAFD-E511-B2FB-A7E5479B5631', '2016-04-08', 'Tyhh', '2016-04-08 13:55:43.000', '2016-04-08 13:56:14.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('6098C120-A9FD-E511-B2FB-A7E5479B5631', '2016-04-10', 'Hhf', '2016-04-08 13:44:14.000', '2016-04-08 13:45:18.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('68A9391C-A9FD-E511-B2FB-A7E5479B5631', '2016-04-10', 'Uhf', '2016-04-08 13:44:06.000', NULL, NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('6E8023BA-A8FD-E511-B2FB-A7E5479B5631', '2016-04-08', 'Vgh', '2016-04-08 13:41:22.000', '2016-04-08 13:41:52.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('6EDF5570-ACFD-E511-A6BD-356C5CF369D0', '2016-04-08', 'Teste de texto da pracinha. Cachorro quente e frio e chuva que caiu no chão e não tem como me enviar o comprovante de pagamento de um pouco mais tarde e noite é sábado das pessoas que não está no nome da pessoa jurídica e não tem problema de temperatura do ar condicionado e direção de arte e cultura de paz e bem estar e jantar cozinha e área técnica de enfermagem da mensagem encaminhada de um ano de fórum nenhum usuário registrado e não sei se


Uma bebé linda que a gente se fala em anexo o boleto para pagamento do boleto.



Hehehe hoje e não sei se o seu nome na recepção e atendimento a de.', '2016-04-08 14:07:56.000', '2016-04-08 14:08:28.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('70E08EC4-A8FD-E511-B2FB-A7E5479B5631', '2016-04-08', 'Hhjj', '2016-04-08 13:41:39.000', NULL, NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('787C8F93-A8FD-E511-B2FB-A7E5479B5631', '2016-04-08', 'Fgg', '2016-04-08 13:40:17.000', '2016-04-08 13:40:49.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('78FEE93D-A4FD-E511-AA46-3D4AB85DC71C', '2016-04-08', 'Gvgbv', '2016-04-08 13:09:15.000', '2016-04-08 13:09:50.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('7C9030AD-A3FD-E511-AA46-3D4AB85DC71C', '2016-04-08', 'Vgdjfjrlf', '2016-04-08 13:05:13.000', NULL, NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('82DD1BBF-A8FD-E511-B2FB-A7E5479B5631', '2016-04-08', 'Gh', '2016-04-08 13:41:30.000', '2016-04-08 13:42:01.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('8463179B-A8FD-E511-B2FB-A7E5479B5631', '2016-04-08', 'Vgg', '2016-04-08 13:40:30.000', '2016-04-08 13:41:00.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('90671105-A3FD-E511-AA46-3D4AB85DC71C', '2016-04-08', 'X', '2016-04-08 13:00:31.000', '2016-04-08 13:01:05.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('B28A1416-A9FD-E511-B2FB-A7E5479B5631', '2016-04-09', 'Gf', '2016-04-08 13:43:56.000', '2016-04-08 13:44:29.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('C2971342-A2FD-E511-AE04-5BCE13FE1ADB', '2016-04-08', 'Ttt', '2016-04-08 12:55:03.000', '2016-04-08 12:55:44.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('E84E4D38-A9FD-E511-B2FB-A7E5479B5631', '2016-04-10', 'Uuf', '2016-04-08 13:44:54.000', '2016-04-08 13:45:25.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('E8C12F00-AFFD-E511-A6BD-356C5CF369D0', '2016-04-08', 'All', '2016-04-08 14:26:16.000', '2016-04-08 14:26:49.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('E8E38A1A-A9FD-E511-B2FB-A7E5479B5631', '2016-04-10', 'Hf', '2016-04-08 13:44:04.000', NULL, NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('EABB8149-A4FD-E511-AA46-3D4AB85DC71C', '2016-04-08', 'Hhhvb', '2016-04-08 13:09:35.000', '2016-04-08 13:10:10.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('EE491635-ABFD-E511-B2FB-A7E5479B5631', '2016-04-15', 'Ghjhu', '2016-04-08 13:59:07.000', '2016-04-08 13:59:38.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('EED1EFCC-ACFD-E511-A6BD-356C5CF369D0', '2016-04-08', 'Vc não tem nada a', '2016-04-08 14:10:31.000', NULL, NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('FC7B11F6-AEFD-E511-A6BD-356C5CF369D0', '2016-04-08', 'Qq', '2016-04-08 14:25:59.000', '2016-04-08 14:26:30.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('D8303529-F39D-4DEC-933A-40512A0B5E91', '2016-04-08', 'dsfas', '2016-04-08 15:55:39.000', '2016-04-08 15:55:40.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('56D1A165-CF44-4A9D-A2FE-D23A58F88B40', '2016-04-08', 'fdas', '2016-04-08 15:55:46.000', '2016-04-08 15:55:46.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('1C1892E7-BCFD-E511-9FC3-F163C1B5278F', '2016-04-08', 'O que eu', '2016-04-08 16:05:48.000', '2016-04-08 16:06:19.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('42F004E0-BCFD-E511-9FC3-F163C1B5278F', '2016-04-08', 'Ujj', '2016-04-08 16:05:35.000', NULL, NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('4A2CC2CA-BCFD-E511-9FC3-F163C1B5278F', '2016-04-08', 'Iij', '2016-04-08 16:05:00.000', '2016-04-08 16:05:29.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('4C9E06C7-BCFD-E511-9FC3-F163C1B5278F', '2016-04-08', 'Ju', '2016-04-08 16:04:53.000', '2016-04-08 16:05:26.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('70A5C2A8-BCFD-E511-9FC3-F163C1B5278F', '2016-04-08', 'Hhu', '2016-04-08 16:04:03.000', NULL, NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('86B0AECD-BCFD-E511-9FC3-F163C1B5278F', '2016-04-08', 'Hu', '2016-04-08 16:05:05.000', NULL, NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('8A3E51D5-BCFD-E511-9FC3-F163C1B5278F', '2016-04-08', 'Hjh', '2016-04-08 16:05:17.000', NULL, NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('8A7352D1-BCFD-E511-9FC3-F163C1B5278F', '2016-04-08', 'Jh', '2016-04-08 16:05:11.000', '2016-04-08 16:06:12.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('9442A8D9-BCFD-E511-9FC3-F163C1B5278F', '2016-04-08', 'Jjj', '2016-04-08 16:05:25.000', NULL, NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('D0AA90B1-BCFD-E511-9FC3-F163C1B5278F', '2016-04-08', 'Uh', '2016-04-08 16:04:17.000', '2016-04-08 16:04:48.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('D24775AB-BCFD-E511-9FC3-F163C1B5278F', '2016-04-08', 'Uhh', '2016-04-08 16:04:07.000', '2016-04-08 16:04:37.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('0CC6C31F-9963-45E5-A5EB-3C140BB1871D', '2016-04-08', 'aaaaa', '2016-04-08 16:31:58.000', '2016-04-08 16:31:59.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('B6140DDA-074C-44EA-A866-EFBC51FEBE2E', '2016-04-08', 'aaaa', '2016-04-08 16:34:04.000', '2016-04-08 16:34:04.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('7B059C29-9A24-4DE6-AB46-478BC358E6FA', '2016-04-08', 'pc1', '2016-04-08 16:40:30.000', '2016-04-08 16:40:30.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('381113D4-C1FD-E511-993D-6F66979B405B', '2016-04-08', 'Cel 1', '2016-04-08 16:41:03.000', '2016-04-08 16:41:33.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('CE7BA0FA-C1FD-E511-993D-6F66979B405B', '2016-04-08', 'Cel 2', '2016-04-08 16:42:08.000', '2016-04-08 16:42:38.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('26BD0B02-F524-4A2E-995B-78C51C9769A3', '2016-04-15', 'sss', '2016-04-15 00:19:09.000', '2016-04-15 00:19:13.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('C866D125-921F-4688-A0EB-AB43ED4D26F7', '2016-04-15', 'zz', '2016-04-15 00:19:26.000', '2016-04-15 00:19:29.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('0C9FC6D3-D9FD-E511-BE7F-C3C9DC71EB16', '2016-04-08', 'Estou saindo', '2016-04-08 19:32:50.000', '2016-04-08 19:33:22.000', NULL, 16, NULL, 1, NULL);
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('12434662-7AFF-E511-B05E-FFE366A6AD17', '2016-04-10', 'Bb', '2016-04-10 21:14:40.000', '2016-04-10 21:15:14.000', NULL, 16, NULL, 1, NULL);
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('2E64DE99-69FE-E511-B29E-3B11B4DE5010', '2016-04-09', 'A3', '2016-04-09 12:42:01.000', '2016-04-09 12:42:18.000', NULL, 16, NULL, 1, NULL);
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('30B0BB1A-68FE-E511-9F51-E3DCED4CD399', '2016-04-09', 'N3', '2016-04-09 12:31:18.000', '2016-04-09 12:31:48.000', NULL, 16, NULL, 1, NULL);
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('36410CE5-D4FD-E511-BE7F-C3C9DC71EB16', '2016-04-08', 'Cheguei', '2016-04-08 18:57:32.000', '2016-04-08 18:58:40.000', NULL, 16, NULL, 1, NULL);
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('3C679654-D2FD-E511-BE7F-C3C9DC71EB16', '2016-04-08', 'Estou na Tiradentes', '2016-04-08 18:39:10.000', NULL, NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('5ACA438E-69FE-E511-9F51-E3DCED4CD399', '2016-04-09', 'N2', '2016-04-09 12:41:41.000', '2016-04-09 12:42:11.000', NULL, 16, NULL, 1, NULL);
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('5E394813-68FE-E511-9F51-E3DCED4CD399', '2016-04-09', 'N1', '2016-04-09 12:31:05.000', '2016-04-09 12:31:35.000', NULL, 16, NULL, 1, NULL);
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('5E3C4258-7AFF-E511-B05E-FFE366A6AD17', '2016-04-10', 'Gggf', '2016-04-10 21:14:23.000', '2016-04-10 21:15:14.000', NULL, 16, NULL, 1, NULL);
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('64C4B0C7-69FE-E511-9F51-E3DCED4CD399', '2016-04-09', 'Lulu esta de olho na meia do Léo', '2016-04-09 12:43:17.000', '2016-04-09 12:43:47.000', NULL, 16, NULL, 1, NULL);
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('66A4E489-69FE-E511-9F51-E3DCED4CD399', '2016-04-09', 'N1', '2016-04-09 12:41:34.000', '2016-04-09 12:42:04.000', NULL, 16, NULL, 1, NULL);
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('6EDD4DFC-D4FD-E511-BE7F-C3C9DC71EB16', '2016-04-08', 'Não tem ninguém na frente', '2016-04-08 18:58:11.000', '2016-04-08 18:58:40.000', NULL, 16, NULL, 1, NULL);
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('7A4E3B17-68FE-E511-9F51-E3DCED4CD399', '2016-04-09', 'N2', '2016-04-09 12:31:12.000', '2016-04-09 12:31:42.000', NULL, 16, NULL, 1, NULL);
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('7CBA8033-66FE-E511-9ACE-B1CD8512145E', '2016-04-09', 'Ppp', '2016-04-09 12:17:40.000', '2016-04-09 12:17:58.000', NULL, 16, NULL, 1, NULL);
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('7ED68428-68FE-E511-B29E-3B11B4DE5010', '2016-04-09', 'A2', '2016-04-09 12:31:41.000', '2016-04-09 12:31:59.000', NULL, 16, NULL, 1, NULL);
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('82374A23-66FE-E511-9ACE-B1CD8512145E', '2016-04-09', 'Ttt', '2016-04-09 12:17:13.000', '2016-04-09 12:17:32.000', NULL, 16, NULL, 1, NULL);
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('8278C9EB-DDFD-E511-B99E-E581D299CEFE', '2016-04-08', 'Teste momo', '2016-04-08 20:02:09.000', '2016-04-08 20:02:36.000', NULL, 16, NULL, 1, NULL);
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('9613182C-68FE-E511-B29E-3B11B4DE5010', '2016-04-09', 'A3', '2016-04-09 12:31:47.000', '2016-04-09 12:32:05.000', NULL, 16, NULL, 1, NULL);
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('96A8DD2E-C5FD-E511-993D-6F66979B405B', '2016-04-08', 'Guf', '2016-04-08 17:05:04.000', '2016-04-08 17:06:33.000', NULL, 16, NULL, 1, NULL);
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('B8628696-69FE-E511-B29E-3B11B4DE5010', '2016-04-09', 'A2', '2016-04-09 12:41:55.000', '2016-04-09 12:42:13.000', NULL, 16, NULL, 1, NULL);
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('BAA6F2B5-C5FD-E511-993D-6F66979B405B', '2016-04-08', 'All 666', '2016-04-08 17:08:50.000', '2016-04-08 17:09:20.000', NULL, 16, NULL, 1, NULL);
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('C007B025-68FE-E511-B29E-3B11B4DE5010', '2016-04-09', 'A1', '2016-04-09 12:31:36.000', '2016-04-09 12:31:54.000', NULL, 16, NULL, 1, NULL);
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('C4308103-8CFE-E511-828F-17BD0DCF5281', '2016-04-09', 'Tbyhjunju', '2016-04-09 16:48:21.000', '2016-04-09 16:48:55.000', NULL, 16, NULL, 1, NULL);
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('C49E6466-AC01-E611-8CF3-770F43536E75', '2016-04-13', 'Rer', '2016-04-13 16:17:44.000', '2016-04-13 16:18:34.000', NULL, 16, NULL, 1, NULL);
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('D2A07FFB-67FE-E511-9F51-E3DCED4CD399', '2016-04-09', 'Nessa', '2016-04-09 12:30:25.000', '2016-04-09 12:30:56.000', NULL, 16, NULL, 1, NULL);
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('D4B770B8-69FE-E511-B29E-3B11B4DE5010', '2016-04-09', 'O almoço está uma delícia', '2016-04-09 12:42:52.000', '2016-04-09 12:43:10.000', NULL, 16, NULL, 1, NULL);
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('D6511695-D3FD-E511-BE7F-C3C9DC71EB16', '2016-04-08', 'Q trânsito', '2016-04-08 18:48:08.000', NULL, NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('E0BD9DFD-67FE-E511-B29E-3B11B4DE5010', '2016-04-09', 'Alv', '2016-04-09 12:30:29.000', '2016-04-09 12:30:47.000', NULL, 16, NULL, 1, NULL);
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('E6B06C93-69FE-E511-B29E-3B11B4DE5010', '2016-04-09', 'A1', '2016-04-09 12:41:50.000', '2016-04-09 12:42:08.000', NULL, 16, NULL, 1, NULL);
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('EA28F390-69FE-E511-9F51-E3DCED4CD399', '2016-04-09', 'N3', '2016-04-09 12:41:46.000', '2016-04-09 12:42:16.000', NULL, 16, NULL, 1, NULL);
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('FCB8C1BB-DDFD-E511-9630-ADCB6E689999', '2016-04-08', 'Hgdghfdy', '2016-04-08 20:00:48.000', '2016-04-08 20:01:15.000', NULL, 16, NULL, 1, NULL);
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('250F6E34-229A-4BC0-B3CA-F5B0BC34F363', '2016-04-15', 'xxx', '2016-04-15 00:35:35.000', NULL, NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('7FE2F966-9587-48AC-9CD9-D2D11F81F30A', '2016-04-15', 'pc 1', '2016-04-15 00:41:56.000', NULL, NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('AA8E5FE9-BB02-E611-964D-774F358C893D', '2016-04-15', 'Cel 1', '2016-04-15 00:41:17.000', '2016-04-15 00:42:26.000', NULL, 16, NULL, 1, NULL);
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('EA49350E-BC02-E611-964D-774F358C893D', '2016-04-15', 'Cel 2', '2016-04-15 00:42:19.000', '2016-04-15 00:42:26.000', NULL, 16, NULL, 1, NULL);
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('1001F29A-7C57-433F-A293-40F8D401FBA3', '2016-04-15', 'pc2', '2016-04-15 00:52:15.000', '2016-04-15 00:52:15.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('C7F2C419-30B5-421E-859F-13B4F0DF5DB9', '2016-04-15', 'pc3', '2016-04-15 00:54:58.000', '2016-04-15 00:54:58.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('A9659625-C912-456D-B670-70F849D044BF', '2016-04-15', 'p1', '2016-04-15 01:00:22.000', '2016-04-15 01:00:23.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('82F53E91-BE02-E611-B386-9B9DC61E13FF', '2016-04-15', 'C1', '2016-04-15 01:00:18.000', '2016-04-15 01:00:33.000', NULL, 16, NULL, 1, NULL);
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('A47965BA-BE02-E611-B386-9B9DC61E13FF', '2016-04-15', 'C2', '2016-04-15 01:01:27.000', '2016-04-15 01:01:33.000', NULL, 16, NULL, 1, NULL);
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('A4E76CBD-BE02-E611-B386-9B9DC61E13FF', '2016-04-15', 'C3', '2016-04-15 01:01:32.000', '2016-04-15 01:01:38.000', NULL, 16, NULL, 1, NULL);
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('EC0BB7C0-BE02-E611-B386-9B9DC61E13FF', '2016-04-15', 'C4', '2016-04-15 01:01:38.000', '2016-04-15 01:01:44.000', NULL, 16, NULL, 1, NULL);
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('FFEE3F93-DDDE-427A-8FCD-75232CCA90A6', '2016-04-15', 'p2', '2016-04-15 01:02:23.000', '2016-04-15 01:02:23.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('E6AB29CD-2455-447D-8F7A-EAD575CF6CFE', '2016-04-15', 'p3', '2016-04-15 01:02:56.000', '2016-04-15 01:02:56.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('17C0000C-8655-46E7-A917-6EBF115CC7AD', '2016-04-15', 'p4', '2016-04-15 01:03:11.000', '2016-04-15 01:03:11.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('2EFA817D-CF39-483D-AFBE-9F0F4FFA1E87', '2016-04-15', 'all pc 1', '2016-04-15 01:04:18.000', '2016-04-15 01:04:18.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('DA25D229-BF02-E611-B386-9B9DC61E13FF', '2016-04-15', 'All cel 1', '2016-04-15 01:04:34.000', '2016-04-15 01:04:40.000', NULL, 16, NULL, 1, NULL);
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('EE428FD4-C102-E611-B386-9B9DC61E13FF', '2016-04-15', 'All cel 2', '2016-04-15 01:23:39.000', '2016-04-15 01:23:45.000', NULL, 16, NULL, 1, NULL);
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('72737524-3B03-E611-8E20-D7A0B26D3688', '2016-04-15', 'Gff', '2016-04-15 15:52:03.000', '2016-04-15 15:52:19.000', NULL, 16, NULL, 1, NULL);
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('76BDC931-3B03-E611-8E20-D7A0B26D3688', '2016-04-15', 'Dgh de novo e disse que o senhor me, mas não é o que é bom para o smartphone do paciente em forma de aviso na parte superior do aparelho. . .', '2016-04-15 15:52:25.000', '2016-04-15 15:52:39.000', NULL, 16, NULL, 1, NULL);
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('901F3D17-5203-E611-BD0F-2F63B7E16357', '2016-04-15', 'Teste', '2016-04-15 18:36:19.000', '2016-04-15 18:36:30.000', NULL, 16, NULL, 1, NULL);
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('9E375830-5203-E611-BD0F-2F63B7E16357', '2016-04-15', 'Hello world', '2016-04-15 18:37:01.000', '2016-04-15 18:37:22.000', NULL, 16, NULL, 1, NULL);
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('B2B1282C-F802-E611-9AF9-CFD04AB4444A', '2016-04-15', 'Gufi', '2016-04-15 07:52:39.000', '2016-04-15 07:53:23.000', NULL, 16, NULL, 1, NULL);
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('DE378804-3B03-E611-8E20-D7A0B26D3688', '2016-04-15', 'Sorvete', '2016-04-15 15:51:09.000', '2016-04-15 15:51:19.000', NULL, 16, NULL, 1, NULL);
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('8A201035-5DC4-423A-9EB1-ED47D344E1FE', '2016-04-15', 'teste pc1', '2016-04-15 23:16:03.000', '2016-04-15 23:16:03.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('E2F64C61-7903-E611-B7E8-C3CBDA7D8EA5', '2016-04-15', 'Teste cel 1', '2016-04-15 23:17:33.000', '2016-04-15 23:17:27.000', NULL, 16, NULL, 1, NULL);
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('A6A2CD01-7A03-E611-B7E8-C3CBDA7D8EA5', '2016-04-15', 'Teste cel 2', '2016-04-15 23:22:03.000', '2016-04-15 23:21:56.000', NULL, 16, NULL, 1, NULL);
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('7E02662B-7B03-E611-B7E8-C3CBDA7D8EA5', '2016-04-15', 'Teste cel 3', '2016-04-15 23:30:22.000', '2016-04-15 23:30:16.000', NULL, 16, NULL, 1, NULL);
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('B49A57B1-7B03-E611-B7E8-C3CBDA7D8EA5', '2016-04-15', 'Testecel 4', '2016-04-15 23:34:07.000', '2016-04-15 23:34:00.000', NULL, 16, NULL, 1, NULL);
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('6AA1BFC7-7C03-E611-B7E8-C3CBDA7D8EA5', '2016-04-15', 'Teste cel 5', '2016-04-15 23:41:54.000', '2016-04-15 23:41:47.000', NULL, 16, NULL, 1, NULL);
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('32B35FDE-7D03-E611-B7E8-C3CBDA7D8EA5', '2016-04-15', 'Teste cel 6', '2016-04-15 23:49:41.000', '2016-04-15 23:50:23.000', NULL, 16, NULL, 1, NULL);
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('5C43AB51-8203-E611-B7E8-C3CBDA7D8EA5', '2016-04-16', 'C 1', '2016-04-16 00:21:33.000', '2016-04-16 00:22:35.000', NULL, 16, NULL, 1, NULL);
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('7E34AF06-8403-E611-B7E8-C3CBDA7D8EA5', '2016-04-16', 'C2', '2016-04-16 00:33:46.000', '2016-04-16 00:33:40.000', NULL, 16, NULL, 1, NULL);
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('D81414C2-DCFF-E511-8045-C5CF6B9AE6E9', '2016-04-11', 'Aaa', '2016-04-11 08:58:51.000', '2016-04-11 09:00:19.000', NULL, 16, NULL, 1, NULL);
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('DF271620-86B0-42A8-9235-C968B1842213', '2016-04-05', 'teste pc', '2016-04-05 12:23:31.000', '2016-04-05 12:25:18.000', NULL, 16, NULL, 1, NULL);
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('5A608CE4-8403-E611-B7E8-C3CBDA7D8EA5', '2016-04-16', 'C3', '2016-04-16 00:39:58.000', '2016-04-16 00:39:52.000', NULL, 16, NULL, 1, NULL);
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('23A918EC-D862-4A12-A85B-A3DA66690664', '2016-04-16', 'p1', '2016-04-16 00:49:34.000', '2016-04-16 00:50:58.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('C894BD3C-8603-E611-A389-6FC309BEBE03', '2016-04-16', 'C4', '2016-04-16 00:49:36.000', '2016-04-16 00:49:30.000', NULL, 16, NULL, 1, NULL);
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('4A126BA8-8603-E611-A389-6FC309BEBE03', '2016-04-16', 'C8', '2016-04-16 00:52:36.000', '2016-04-16 00:52:30.000', NULL, 16, NULL, 1, NULL);
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('4C7FA5AE-8603-E611-A389-6FC309BEBE03', '2016-04-16', 'C10', '2016-04-16 00:52:47.000', '2016-04-16 00:52:41.000', NULL, 16, NULL, 1, NULL);
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('62EC26A5-8603-E611-A389-6FC309BEBE03', '2016-04-16', 'C7', '2016-04-16 00:52:31.000', '2016-04-16 00:52:25.000', NULL, 16, NULL, 1, NULL);
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('72C7A29D-8603-E611-A389-6FC309BEBE03', '2016-04-16', 'C5', '2016-04-16 00:52:18.000', '2016-04-16 00:52:12.000', NULL, 16, NULL, 1, NULL);
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('92A941A2-8603-E611-A389-6FC309BEBE03', '2016-04-16', 'C6', '2016-04-16 00:52:26.000', '2016-04-16 00:52:20.000', NULL, 16, NULL, 1, NULL);
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('F4A548AB-8603-E611-A389-6FC309BEBE03', '2016-04-16', 'C9', '2016-04-16 00:52:41.000', '2016-04-16 00:52:35.000', NULL, 16, NULL, 1, NULL);
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('8523C3C2-FD82-4D9F-81D6-A863008D391D', '2016-04-16', 'p2', '2016-04-16 00:52:49.000', '2016-04-16 00:52:49.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('E3E0B696-571E-4A92-A49C-D8E5BCBE8B04', '2016-04-16', 'p3', '2016-04-16 00:52:59.000', '2016-04-16 00:52:59.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('57B78C41-C868-4DDC-AAE0-4557E7A8C5CD', '2016-04-16', 'p4', '2016-04-16 00:53:16.000', '2016-04-16 00:53:16.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('D0DAFDA9-6D40-4502-87F8-EA7623E41C43', '2016-04-16', 'p5', '2016-04-16 00:53:22.000', '2016-04-16 00:53:23.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('4A3DF88F-DC03-E611-8781-433F18671722', '2016-04-16', 'Hoje tem festa!!!!', '2016-04-16 11:07:32.000', '2016-04-16 11:08:34.000', NULL, 16, NULL, 1, NULL);
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('62FA7187-DC03-E611-8781-433F18671722', '2016-04-16', 'Léo vai comer picanha kkkkkk', '2016-04-16 11:07:18.000', '2016-04-16 11:08:18.000', NULL, 16, NULL, 1, NULL);
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('B618FF01-1C04-E611-9C3C-7B519E66CC6D', '2016-04-17', 'Amanha senhores pais 
Por favor trazer as crianças fantasiadas de festa junina.', '2016-04-16 18:41:42.000', '2016-04-16 18:41:48.000', NULL, 16, NULL, 1, NULL);
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('B6C4A257-C703-E611-9CB4-2DFE21AAB730', '2016-04-16', 'Hoje tem picanha', '2016-04-16 08:35:38.000', '2016-04-16 08:35:35.000', NULL, 16, NULL, 1, NULL);
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('E0942694-1B04-E611-B209-1D412AEFADEB', '2016-04-16', 'Queri
 Bolo', '2016-04-16 18:38:37.000', '2016-04-16 18:38:44.000', NULL, 16, NULL, 1, NULL);
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('0DFC4DBF-1DBB-42CB-80B5-FBE8AE766B4F', '2016-04-18', 'aaa', '2016-04-18 12:55:24.000', '2016-04-18 12:55:25.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('1035FF76-9D05-E611-8F63-07BF91831A8A', '2016-04-18', 'B', '2016-04-18 16:40:54.000', '2016-04-18 16:40:56.000', NULL, 16, NULL, 1, NULL);
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('3802CFAC-9D05-E611-8F63-07BF91831A8A', '2016-04-18', 'All cel1', '2016-04-18 16:42:24.000', NULL, NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('09BF8309-2F87-4567-AB1D-BAACB125027C', '2016-04-18', 'pc all 1', '2016-04-18 16:44:03.000', '2016-04-18 16:44:03.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('C66A9477-9E05-E611-8F63-07BF91831A8A', '2016-04-18', 'All cel 2', '2016-04-18 16:48:05.000', '2016-04-18 16:48:10.000', NULL, 16, NULL, 1, NULL);
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('D284EB68-9E05-E611-8F63-07BF91831A8A', '2016-04-18', 'C', '2016-04-18 16:47:40.000', '2016-04-18 16:47:42.000', NULL, 16, NULL, 1, NULL);
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('DC11FCE1-A005-E611-88BD-E739B9B3E782', '2016-04-18', 'Cel all 3', '2016-04-18 17:05:22.000', '2016-04-18 17:05:27.000', NULL, 16, NULL, 1, NULL);
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('491B700F-BF39-419E-84CA-3B855DD35CA1', '2016-04-18', 'deasd', '2016-04-18 17:48:44.000', '2016-04-18 17:48:44.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('30F6E748-ACE8-4786-9949-813C31C62025', '2016-04-18', 'aaaa', '2016-04-18 17:53:03.000', '2016-04-18 17:53:03.000', NULL, 16, NULL, 1, 'S');
INSERT INTO agenda (agenda_id, data, descricao, data_insert_local, data_insert_server, agenda_tipo_id, funcionario_id, responsavel_id, escola_id, enviado_server) VALUES ('830A7DE8-868D-4809-8B7D-1641E67F8342', '2016-04-18', '54', '2016-04-18 17:53:50.000', '2016-04-18 17:53:50.000', NULL, 16, NULL, 1, 'S');

-- Table: funcionario_foto
CREATE TABLE funcionario_foto (
  funcionario_foto_id integer NOT NULL ,
  funcionario_id integer ,
  foto blob,
  PRIMARY KEY (funcionario_foto_id));

-- Table: turma_aluno
CREATE TABLE turma_aluno (
  turma_id integer NOT NULL,
  aluno_id integer NOT NULL,
  PRIMARY KEY (turma_id,aluno_id));
INSERT INTO turma_aluno (turma_id, aluno_id) VALUES (8, 19);
INSERT INTO turma_aluno (turma_id, aluno_id) VALUES (8, 25);
INSERT INTO turma_aluno (turma_id, aluno_id) VALUES (8, 27);
INSERT INTO turma_aluno (turma_id, aluno_id) VALUES (8, 28);
INSERT INTO turma_aluno (turma_id, aluno_id) VALUES (8, 40);
INSERT INTO turma_aluno (turma_id, aluno_id) VALUES (18, 19);
INSERT INTO turma_aluno (turma_id, aluno_id) VALUES (18, 25);
INSERT INTO turma_aluno (turma_id, aluno_id) VALUES (18, 27);
INSERT INTO turma_aluno (turma_id, aluno_id) VALUES (18, 28);
INSERT INTO turma_aluno (turma_id, aluno_id) VALUES (18, 36);
INSERT INTO turma_aluno (turma_id, aluno_id) VALUES (18, 38);
INSERT INTO turma_aluno (turma_id, aluno_id) VALUES (18, 39);
INSERT INTO turma_aluno (turma_id, aluno_id) VALUES (18, 40);
INSERT INTO turma_aluno (turma_id, aluno_id) VALUES (19, 19);
INSERT INTO turma_aluno (turma_id, aluno_id) VALUES (19, 25);
INSERT INTO turma_aluno (turma_id, aluno_id) VALUES (19, 28);

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
INSERT INTO funcionario (funcionario_id, nome, sobrenome, sexo, rg, cpf, ativo, email, senha, informacoes_gerais, funcionario_tipo_id, escola_id) VALUES (6, 'Professora - Maria', 'da Silva', 'M', '427099705', 32087213828, 'S', 'maria@proff', 'Zkh4SWFraExURS9EcDBCaFlRPT0xNjg1NEAjKnN1bTE4MkAjKjk5ODdmZGFz', NULL, 4, 1);
INSERT INTO funcionario (funcionario_id, nome, sobrenome, sexo, rg, cpf, ativo, email, senha, informacoes_gerais, funcionario_tipo_id, escola_id) VALUES (11, 'Coordenadora - Josinalda', NULL, NULL, NULL, 11111111111, 'S', 'ss', 'MTY4NTRAIypzdW0xODJAIyo5OTg3c2VuaGEgZGUgY29vcmRl', NULL, 7, 1);
INSERT INTO funcionario (funcionario_id, nome, sobrenome, sexo, rg, cpf, ativo, email, senha, informacoes_gerais, funcionario_tipo_id, escola_id) VALUES (16, 'Login', NULL, NULL, NULL, 11111111111, 'S', 'a', 'Zkh4SWFraExURS9EcDBCaFlRPT1h', X'6C6F67696E20652073656E6861203D2061', 9, 1);

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

-- Table: log_error
CREATE TABLE log_error (
    log_error_id       VARCHAR (100)  NOT NULL,
    msg_error          VARCHAR (5000) DEFAULT NULL,
    aplicacao          VARCHAR (100)  DEFAULT NULL,
    unit               VARCHAR (100)  DEFAULT NULL,
    class              VARCHAR (100)  DEFAULT NULL,
    metodo             VARCHAR (100)  DEFAULT NULL,
    escola_id          INT (11)       DEFAULT NULL,
    responsavel_id     INT (11)       DEFAULT NULL,
    funcionario_id     INT (11)       DEFAULT NULL,
    data               DATETIME       DEFAULT NULL,
    data_insert_server DATETIME       DEFAULT NULL,
    enviado_server     VARCHAR (1),
    PRIMARY KEY (
        log_error_id
    )
);
INSERT INTO log_error (log_error_id, msg_error, aplicacao, unit, class, metodo, escola_id, responsavel_id, funcionario_id, data, data_insert_server, enviado_server) VALUES ('59DA2FB1-78D2-4188-B16B-A7EA8808C1AF', 'Execution of request terminated with unknown error', 'Agenda Bee', 'untDmEscola', 'TDmEscola', 'GetAgenda', 1, NULL, 16, '2016-04-18 17:55:07.073', NULL, NULL);
INSERT INTO log_error (log_error_id, msg_error, aplicacao, unit, class, metodo, escola_id, responsavel_id, funcionario_id, data, data_insert_server, enviado_server) VALUES ('5C4F0806-7E58-409F-92B5-F7C9FC344481', 'Execution of request terminated with unknown error', 'Agenda Bee', 'untDmEscola', 'TDmEscola', 'GetAgenda', 1, NULL, 16, '2016-04-18 17:56:07.086', NULL, NULL);
INSERT INTO log_error (log_error_id, msg_error, aplicacao, unit, class, metodo, escola_id, responsavel_id, funcionario_id, data, data_insert_server, enviado_server) VALUES ('992CD600-E31F-4280-BD53-36A3255603CB', 'Execution of request terminated with unknown error', 'Agenda Bee', 'untDmEscola', 'TDmEscola', 'GetAgenda', 1, NULL, 16, '2016-04-18 17:57:07.100', NULL, NULL);

-- Table: funcionario_tipo
CREATE TABLE funcionario_tipo (
  funcionario_tipo_id smallint(6) NOT NULL ,
  descricao varchar(150) ,
  informacoes_gerais blob,
  PRIMARY KEY (funcionario_tipo_id));
INSERT INTO funcionario_tipo (funcionario_tipo_id, descricao, informacoes_gerais) VALUES (3, 'Diretora', NULL);
INSERT INTO funcionario_tipo (funcionario_tipo_id, descricao, informacoes_gerais) VALUES (4, 'Professora', NULL);
INSERT INTO funcionario_tipo (funcionario_tipo_id, descricao, informacoes_gerais) VALUES (7, 'Coordenadora', NULL);
INSERT INTO funcionario_tipo (funcionario_tipo_id, descricao, informacoes_gerais) VALUES (9, 'Professor', NULL);
INSERT INTO funcionario_tipo (funcionario_tipo_id, descricao, informacoes_gerais) VALUES (10, 'Diretor', NULL);
INSERT INTO funcionario_tipo (funcionario_tipo_id, descricao, informacoes_gerais) VALUES (11, 'Coordenador', NULL);

-- Table: turma
CREATE TABLE turma (
  turma_id integer NOT NULL ,
  nome varchar(150) ,
  informacoes_gerais blob,
  periodo_tipo_id smallint(6) ,
  escola_id integer ,
  funcionario_id integer ,
  PRIMARY KEY (turma_id));
INSERT INTO turma (turma_id, nome, informacoes_gerais, periodo_tipo_id, escola_id, funcionario_id) VALUES (8, 'Sala 1', NULL, 3, 1, 16);
INSERT INTO turma (turma_id, nome, informacoes_gerais, periodo_tipo_id, escola_id, funcionario_id) VALUES (9, 'Sala 2', X'666461736461', 4, 1, 11);
INSERT INTO turma (turma_id, nome, informacoes_gerais, periodo_tipo_id, escola_id, funcionario_id) VALUES (18, 'Todos Alunos', NULL, 6, 1, 11);
INSERT INTO turma (turma_id, nome, informacoes_gerais, periodo_tipo_id, escola_id, funcionario_id) VALUES (19, 'Sala 3', NULL, 6, 1, 16);

-- Table: tabela_atualizacao
CREATE TABLE tabela_atualizacao (
    tabela_atualizacao_id INTEGER   NOT NULL,
    tabela                VARCHAR (200),
    data                  DATETIME,
    data_local            DATETIME,
    escola_id             INTEGER ,
    PRIMARY KEY (
        tabela_atualizacao_id
    )
);

-- Table: telefone_tipo
CREATE TABLE telefone_tipo (
  telefone_tipo_id smallint(6) NOT NULL ,
  descricao varchar(150) ,
  informacoes_gerais blob,
  PRIMARY KEY (telefone_tipo_id));

-- Table: responsavel_telefone
CREATE TABLE responsavel_telefone (
  responsavel_telefone_id integer NOT NULL ,
  responsavel_id integer ,
  telefone_tipo_id smallint(6) ,
  numero varchar(50) ,
  PRIMARY KEY (responsavel_telefone_id));
INSERT INTO responsavel_telefone (responsavel_telefone_id, responsavel_id, telefone_tipo_id, numero) VALUES (42, 66, 2, '(11) 99532-0167');

-- Table: agenda_aluno
CREATE TABLE agenda_aluno (agenda_id VARCHAR (100) NOT NULL, aluno_id integer NOT NULL, PRIMARY KEY (agenda_id, aluno_id));
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('5C43AB51-8203-E611-B7E8-C3CBDA7D8EA5', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('5C43AB51-8203-E611-B7E8-C3CBDA7D8EA5', 25);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('5C43AB51-8203-E611-B7E8-C3CBDA7D8EA5', 27);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('5C43AB51-8203-E611-B7E8-C3CBDA7D8EA5', 28);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('5C43AB51-8203-E611-B7E8-C3CBDA7D8EA5', 36);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('5C43AB51-8203-E611-B7E8-C3CBDA7D8EA5', 38);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('5C43AB51-8203-E611-B7E8-C3CBDA7D8EA5', 39);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('5C43AB51-8203-E611-B7E8-C3CBDA7D8EA5', 40);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('7E34AF06-8403-E611-B7E8-C3CBDA7D8EA5', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('7E34AF06-8403-E611-B7E8-C3CBDA7D8EA5', 25);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('7E34AF06-8403-E611-B7E8-C3CBDA7D8EA5', 27);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('7E34AF06-8403-E611-B7E8-C3CBDA7D8EA5', 28);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('7E34AF06-8403-E611-B7E8-C3CBDA7D8EA5', 36);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('7E34AF06-8403-E611-B7E8-C3CBDA7D8EA5', 38);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('7E34AF06-8403-E611-B7E8-C3CBDA7D8EA5', 39);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('7E34AF06-8403-E611-B7E8-C3CBDA7D8EA5', 40);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('0019F372-F2F6-E511-B4E5-FD32255F5042', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('0023DF09-17F5-E511-8A1F-6F1AA27661BD', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('02D377A7-20F9-E511-823A-27C355AE21D6', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('0417CA15-0AF5-E511-9535-E7FB0288A500', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('04E1C486-F9ED-E511-88D2-397382DB5C5F', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('04F98101-50FC-E511-AE92-15101811952B', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('06014790-F2F6-E511-B4E5-FD32255F5042', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('0623645C-C8ED-E511-8D1B-659B0D14E900', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('06D8C8BD-76F1-E511-9D2C-BFAA5ABE92A6', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('0835629A-E6ED-E511-B59C-7B4C71CC39C1', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('0850E218-A9FD-E511-B2FB-A7E5479B5631', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('08588F2A-FFF4-E511-9535-E7FB0288A500', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('0AAEB94F-9AFD-E511-A721-3B932FF033AC', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('0C42F0F9-3DF2-E511-A7AE-ADEC4D982038', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('0C702B28-CCF9-E511-95ED-9B2B2E6DEA1B', 38);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('0C98190C-3EF7-E511-97E1-41399A3C2E7A', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('0C9FC6D3-D9FD-E511-BE7F-C3C9DC71EB16', 38);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('0CC6C31F-9963-45E5-A5EB-3C140BB1871D', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('0EA3F0CE-F6F6-E511-8240-31F3AF499C46', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('0ED646EB-9FFD-E511-ABEA-8F98CD362A7A', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('1001F29A-7C57-433F-A293-40F8D401FBA3', 27);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('10D39640-3EF2-E511-A7AE-ADEC4D982038', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('12434662-7AFF-E511-B05E-FFE366A6AD17', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('12A34F43-5EEF-E511-98A6-3B861F558613', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('139097CA-4FA5-4B74-B224-2E9A2DE5ADC3', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('1395A61C-718F-4F86-A159-82089BB8FD7D', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('13BBD8DA-49A9-4317-9275-953B83CE4FAE', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('140532DB-4FFC-E511-AE92-15101811952B', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('14E6F080-78F2-E511-93E7-CD1EF0971951', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('15813DCD-A161-4D9E-B933-8DEF8B48F75B', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('1660C93B-50FC-E511-AE92-15101811952B', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('166D6CCB-7EED-E511-9008-634C2714DC4C', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('16CAD221-1EFD-E511-B9BC-A3FB50C36DB6', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('16D0E5E1-C82B-4EC8-8F73-CC8C7C0F1AE1', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('17C0000C-8655-46E7-A917-6EBF115CC7AD', 28);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('1882DF67-C0EE-E511-AE96-B968E6CE3145', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('18DF27CB-78F1-E511-A912-2FAC4FACF13D', 28);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('1A5B2CDD-0EF8-4F68-B5E2-90C2B82A91AE', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('1A7D8EB3-F2F6-E511-B4E5-FD32255F5042', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('1AF4A009-8AF8-E511-B564-6DA8349F072D', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('1AF9EE84-AAF5-E511-BD1D-55B772B3FA93', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('1C15C882-9EFD-E511-9AD9-A7361E29241D', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('1C1892E7-BCFD-E511-9FC3-F163C1B5278F', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('1C7A94AB-EFED-E511-A50E-6902D9D99B7D', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('1C86CB5B-02ED-E511-90C3-59926C786A96', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('1C9522E4-78F1-E511-A912-2FAC4FACF13D', 28);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('1EF109C4-F7F7-E511-83DA-DDDB305398E7', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('1EFC366B-B4F7-E511-B5DE-8D566A3BC97E', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('2047E0C8-01F2-E511-8360-0B716C3C39A7', 27);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('209232CE-31F2-E511-A49B-8B8F8255DC4E', 27);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('20A72A0A-71F1-E511-A8E5-AD3B93F4DDCE', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('224F481B-1EFD-E511-B9BC-A3FB50C36DB6', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('22DC1180-A8FD-E511-A662-31564680D376', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('240ED9A2-12EE-E511-9963-9FF14FB2683B', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('2468A0C1-B9F7-E511-A33C-711AC14AA70C', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('24C8D3F1-125E-4915-8F0D-7AF010AE530C', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('250F6E34-229A-4BC0-B3CA-F5B0BC34F363', 27);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('259A4D50-1577-4DE6-A0E5-852AF038CA84', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('26BD0B02-F524-4A2E-995B-78C51C9769A3', 27);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('285A8619-A3FD-E511-AA46-3D4AB85DC71C', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('286017E1-4FFC-E511-AE92-15101811952B', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('28A32BF1-D89B-414C-8151-9EC45EBB674E', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('2A7EF61D-A9FD-E511-B2FB-A7E5479B5631', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('2A861ED4-78BC-4D6F-BA26-290990381270', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('2A9F93C5-D6F1-E511-95D6-ED0C771B834D', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('2AD440BA-8FF8-E511-A6B1-D5F2F9F43A47', 39);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('2BB7FBBE-093A-4242-B794-6C060BEBE7C0', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('2C78EA28-74F1-E511-A548-9B85799E059C', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('2CCECDBF-1EF9-E511-8F5E-95F7A7C37770', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('2E190BFC-D7F1-E511-95D6-ED0C771B834D', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('2E64DE99-69FE-E511-B29E-3B11B4DE5010', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('2E64DE99-69FE-E511-B29E-3B11B4DE5010', 25);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('2E64DE99-69FE-E511-B29E-3B11B4DE5010', 27);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('2E64DE99-69FE-E511-B29E-3B11B4DE5010', 28);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('2E64DE99-69FE-E511-B29E-3B11B4DE5010', 36);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('2E64DE99-69FE-E511-B29E-3B11B4DE5010', 38);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('2E64DE99-69FE-E511-B29E-3B11B4DE5010', 39);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('2E783C67-A3FD-E511-AA46-3D4AB85DC71C', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('2EA0DBBB-8F3A-4180-89A4-B663A0A2C8FD', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('2EFA817D-CF39-483D-AFBE-9F0F4FFA1E87', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('2EFA817D-CF39-483D-AFBE-9F0F4FFA1E87', 25);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('2EFA817D-CF39-483D-AFBE-9F0F4FFA1E87', 27);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('2EFA817D-CF39-483D-AFBE-9F0F4FFA1E87', 28);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('2EFA817D-CF39-483D-AFBE-9F0F4FFA1E87', 36);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('2EFA817D-CF39-483D-AFBE-9F0F4FFA1E87', 38);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('2EFA817D-CF39-483D-AFBE-9F0F4FFA1E87', 39);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('302CDCF9-50EF-E511-B9B1-5D6569C1F09A', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('30B0BB1A-68FE-E511-9F51-E3DCED4CD399', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('30B0BB1A-68FE-E511-9F51-E3DCED4CD399', 25);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('30B0BB1A-68FE-E511-9F51-E3DCED4CD399', 27);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('30B0BB1A-68FE-E511-9F51-E3DCED4CD399', 28);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('30FBD00F-36F4-E511-9061-5B7EA26D5ACB', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('3207554B-2EF7-E511-97E1-41399A3C2E7A', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('3237C1F9-AAFD-E511-B2FB-A7E5479B5631', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('3237C1F9-AAFD-E511-B2FB-A7E5479B5631', 25);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('3237C1F9-AAFD-E511-B2FB-A7E5479B5631', 27);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('3237C1F9-AAFD-E511-B2FB-A7E5479B5631', 28);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('3237C1F9-AAFD-E511-B2FB-A7E5479B5631', 36);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('3237C1F9-AAFD-E511-B2FB-A7E5479B5631', 38);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('3237C1F9-AAFD-E511-B2FB-A7E5479B5631', 39);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('32B35FDE-7D03-E611-B7E8-C3CBDA7D8EA5', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('32B35FDE-7D03-E611-B7E8-C3CBDA7D8EA5', 25);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('32B35FDE-7D03-E611-B7E8-C3CBDA7D8EA5', 27);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('32B35FDE-7D03-E611-B7E8-C3CBDA7D8EA5', 28);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('32B35FDE-7D03-E611-B7E8-C3CBDA7D8EA5', 36);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('32B35FDE-7D03-E611-B7E8-C3CBDA7D8EA5', 38);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('32B35FDE-7D03-E611-B7E8-C3CBDA7D8EA5', 39);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('32B35FDE-7D03-E611-B7E8-C3CBDA7D8EA5', 40);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('330F0A68-8443-454D-A1CD-9F30A1E52F2F', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('340679DF-70F1-E511-A8E5-AD3B93F4DDCE', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('34834D61-38ED-E511-ADE4-4950D4A7ED29', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('348B70DE-CEF9-E511-8033-2924041FBC02', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('348B70DE-CEF9-E511-8033-2924041FBC02', 25);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('348B70DE-CEF9-E511-8033-2924041FBC02', 27);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('348B70DE-CEF9-E511-8033-2924041FBC02', 28);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('348B70DE-CEF9-E511-8033-2924041FBC02', 36);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('348B70DE-CEF9-E511-8033-2924041FBC02', 38);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('348B70DE-CEF9-E511-8033-2924041FBC02', 39);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('34D61A36-5A85-4B20-94BE-B93499EE01DE', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('36410CE5-D4FD-E511-BE7F-C3C9DC71EB16', 38);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('36528DF5-A0FD-E511-B4B2-39C4C41077D8', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('365B05BD-E3EF-E511-8C33-2FC081FC7D2D', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('36B63734-50FC-E511-AE92-15101811952B', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('36CB2C68-51EF-E511-B9B1-5D6569C1F09A', 36);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('3729C205-7AEF-43A3-A084-153BFB5FE0AD', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('381113D4-C1FD-E511-993D-6F66979B405B', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('381113D4-C1FD-E511-993D-6F66979B405B', 25);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('381113D4-C1FD-E511-993D-6F66979B405B', 27);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('381113D4-C1FD-E511-993D-6F66979B405B', 28);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('387A439F-F5F6-E511-8240-31F3AF499C46', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('38ED299B-E5ED-E511-BC5F-8FB5C9FC6A74', 25);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('38F59CED-8006-4D74-8B25-21DDCD24DCFE', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('39FA9FD7-7D60-49EA-8A2D-C0D2E071160D', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('3B3361AD-A204-4278-AAA1-BA2AD6D9FD43', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('3C0A5C0B-7224-4AB5-94AC-5ED5C3934A9B', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('3C0A5C0B-7224-4AB5-94AC-5ED5C3934A9B', 25);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('3C0A5C0B-7224-4AB5-94AC-5ED5C3934A9B', 27);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('3C0A5C0B-7224-4AB5-94AC-5ED5C3934A9B', 28);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('3C679654-D2FD-E511-BE7F-C3C9DC71EB16', 38);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('3C95E4E3-4FFC-E511-AE92-15101811952B', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('3E13E34F-01ED-E511-AE01-B1E93180EB1F', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('3E3593C9-A9FD-E511-B2FB-A7E5479B5631', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('404CAF21-C3F7-E511-9D08-E7CF64EF3E6C', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('40BD4DE6-76F7-E511-B4AC-35C5731861CB', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('42613821-E6F8-E511-B6B8-BB4E86202B2C', 25);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('4266F274-EDED-E511-A52C-0F183443EFDA', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('42740D3D-3EF2-E511-A7AE-ADEC4D982038', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('42F004E0-BCFD-E511-9FC3-F163C1B5278F', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('4457DCA0-D5F2-E511-8204-DF81E45463A5', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('44BF2EBD-40ED-E511-9115-E7A23F34D537', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('44EC9ED9-17EE-E511-B239-61AEFDC2B20D', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('45683E53-FBA2-4A95-A20D-E18CF4D2BC15', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('45F6484A-6553-41B2-AAED-8B2F6E4758AE', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('46000F61-7EF2-E511-93E7-CD1EF0971951', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('4629234A-641F-4D0F-98C6-0B28C080B61A', 27);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('463E575C-724F-4FA5-A22C-A9B1BE58EEE2', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('464E69DB-CCF9-E511-95ED-9B2B2E6DEA1B', 39);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('465426E9-4EFC-E511-8CC9-A9F9F6FC7021', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('46B2B406-78FB-E511-A904-09AD22D677A9', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('46B2B406-78FB-E511-A904-09AD22D677A9', 25);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('46B2B406-78FB-E511-A904-09AD22D677A9', 27);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('46B2B406-78FB-E511-A904-09AD22D677A9', 28);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('46B2B406-78FB-E511-A904-09AD22D677A9', 36);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('482089C1-EAED-E511-99D3-5F6156D125FE', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('4844DFEC-34F4-E511-9141-4BCC46F122A8', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('4A092824-CBF8-E511-8B67-ED0C876E1A06', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('4A2CC2CA-BCFD-E511-9FC3-F163C1B5278F', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('4A931F05-A8C0-4803-838A-3F61C8398200', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('4AADCBF1-5F16-4A7C-876E-B6BAA28B77F3', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('4AB12DC9-3DF7-E511-97E1-41399A3C2E7A', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('4AC6006B-A3FD-E511-AA46-3D4AB85DC71C', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('4B01471C-569B-4533-93AD-4F16128C2CC5', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('4C9E06C7-BCFD-E511-9FC3-F163C1B5278F', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('4E3625B1-76F1-E511-9D2C-BFAA5ABE92A6', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('4EBC45DB-27ED-E511-8071-A5DE27E1987A', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('4FBB3472-2AAB-43A3-AE55-79848AA44569', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('502ECC61-BFFC-E511-89D7-9FE9209CD86E', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('502ECC61-BFFC-E511-89D7-9FE9209CD86E', 25);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('502ECC61-BFFC-E511-89D7-9FE9209CD86E', 27);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('502ECC61-BFFC-E511-89D7-9FE9209CD86E', 28);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('502ECC61-BFFC-E511-89D7-9FE9209CD86E', 36);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('502ECC61-BFFC-E511-89D7-9FE9209CD86E', 38);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('502ECC61-BFFC-E511-89D7-9FE9209CD86E', 39);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('50DDFDF1-ADF2-E511-9AC2-E3EAD5D6446A', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('50F82AEA-34F4-E511-9141-4BCC46F122A8', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('5111E80D-294F-4C68-B208-251D7B37424A', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('52AB7C77-02ED-E511-90C3-59926C786A96', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('52BAB01C-21F0-E511-9564-675435EA8EFC', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('560341BC-58F5-E511-BB9E-81820C935D27', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('56388370-2E49-44FE-9495-ECA1B676E99B', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('566B63B3-02ED-E511-90C3-59926C786A96', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('56D1A165-CF44-4A9D-A2FE-D23A58F88B40', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('56F38CDD-21ED-E511-B52F-81345032B31A', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('58F4286D-DEED-E511-BF94-4DE2C052D8BB', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('5A36D1D1-AAFD-E511-B2FB-A7E5479B5631', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('5A79A66B-11DC-4D79-A57B-A015B8D25E80', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('5A8C4182-EEED-E511-A016-D1FC74B840CB', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('5AB56739-3EF2-E511-A7AE-ADEC4D982038', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('5ACA438E-69FE-E511-9F51-E3DCED4CD399', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('5ACA438E-69FE-E511-9F51-E3DCED4CD399', 25);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('5ACA438E-69FE-E511-9F51-E3DCED4CD399', 27);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('5ACA438E-69FE-E511-9F51-E3DCED4CD399', 28);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('5ACA438E-69FE-E511-9F51-E3DCED4CD399', 36);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('5ACA438E-69FE-E511-9F51-E3DCED4CD399', 38);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('5ACA438E-69FE-E511-9F51-E3DCED4CD399', 39);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('5AD29710-ADF0-E511-BA63-D954EB2A751C', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('5B30626B-C42B-4E48-A1C1-D334389505B5', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('5B30626B-C42B-4E48-A1C1-D334389505B5', 25);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('5B30626B-C42B-4E48-A1C1-D334389505B5', 27);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('5B30626B-C42B-4E48-A1C1-D334389505B5', 28);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('5CAF4655-BFF7-E511-9D08-E7CF64EF3E6C', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('5CF114FF-E5F8-E511-B6B8-BB4E86202B2C', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('5CF114FF-E5F8-E511-B6B8-BB4E86202B2C', 25);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('5CF114FF-E5F8-E511-B6B8-BB4E86202B2C', 27);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('5CF114FF-E5F8-E511-B6B8-BB4E86202B2C', 28);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('5E0358BB-AAFD-E511-B2FB-A7E5479B5631', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('5E0E4149-3EF2-E511-A7AE-ADEC4D982038', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('5E394813-68FE-E511-9F51-E3DCED4CD399', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('5E394813-68FE-E511-9F51-E3DCED4CD399', 25);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('5E394813-68FE-E511-9F51-E3DCED4CD399', 27);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('5E394813-68FE-E511-9F51-E3DCED4CD399', 28);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('5E3C4258-7AFF-E511-B05E-FFE366A6AD17', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('5E74435B-6DFD-E511-B9BC-A3FB50C36DB6', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('5E95E3F0-15F9-E511-B6B8-BB4E86202B2C', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('5F844908-918A-4EDD-B6DB-26E5F49D8419', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('605B5E5C-5EFB-4ECE-9BB9-C47BA92A47DA', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('6098C120-A9FD-E511-B2FB-A7E5479B5631', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('60B7769E-44ED-E511-98A9-F36E60552720', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('60D0F7A5-29EE-E511-B239-61AEFDC2B20D', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('641C0387-0FEF-E511-ACEC-CB47B028C572', 36);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('64C4B0C7-69FE-E511-9F51-E3DCED4CD399', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('64C4B0C7-69FE-E511-9F51-E3DCED4CD399', 25);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('64C4B0C7-69FE-E511-9F51-E3DCED4CD399', 27);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('64C4B0C7-69FE-E511-9F51-E3DCED4CD399', 28);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('64C4B0C7-69FE-E511-9F51-E3DCED4CD399', 36);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('64C4B0C7-69FE-E511-9F51-E3DCED4CD399', 38);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('64C4B0C7-69FE-E511-9F51-E3DCED4CD399', 39);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('64C5619B-D9EF-E511-B24B-8D91412203BE', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('664D0B3F-E1ED-E511-A07F-C96D7F2B33C3', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('66A4E489-69FE-E511-9F51-E3DCED4CD399', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('66A4E489-69FE-E511-9F51-E3DCED4CD399', 25);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('66A4E489-69FE-E511-9F51-E3DCED4CD399', 27);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('66A4E489-69FE-E511-9F51-E3DCED4CD399', 28);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('66A4E489-69FE-E511-9F51-E3DCED4CD399', 36);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('66A4E489-69FE-E511-9F51-E3DCED4CD399', 38);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('66A4E489-69FE-E511-9F51-E3DCED4CD399', 39);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('66A928D0-27ED-E511-8071-A5DE27E1987A', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('66D99DA1-7EF2-E511-93E7-CD1EF0971951', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('68425A31-E0ED-E511-B771-0193DF59CCBE', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('688A74CF-CEF9-E511-8033-2924041FBC02', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('688A74CF-CEF9-E511-8033-2924041FBC02', 25);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('688A74CF-CEF9-E511-8033-2924041FBC02', 27);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('688A74CF-CEF9-E511-8033-2924041FBC02', 28);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('68A9391C-A9FD-E511-B2FB-A7E5479B5631', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('691E301E-CCFE-419D-BEDF-6BB9CB6369C8', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('696D0F0D-E338-4D94-B267-36B881BB2E4C', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('6A63C58B-0C9A-4B85-ACBE-7E8C3CF5C623', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('6A965F90-E9ED-E511-8E0F-D1910FD62DE0', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('6AA1BFC7-7C03-E611-B7E8-C3CBDA7D8EA5', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('6AA1BFC7-7C03-E611-B7E8-C3CBDA7D8EA5', 25);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('6AA1BFC7-7C03-E611-B7E8-C3CBDA7D8EA5', 27);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('6AA1BFC7-7C03-E611-B7E8-C3CBDA7D8EA5', 28);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('6AA1BFC7-7C03-E611-B7E8-C3CBDA7D8EA5', 36);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('6AA1BFC7-7C03-E611-B7E8-C3CBDA7D8EA5', 38);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('6AA1BFC7-7C03-E611-B7E8-C3CBDA7D8EA5', 39);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('6C5A289E-43ED-E511-98A9-F36E60552720', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('6C631B4C-BCF7-E511-AAE4-656DC5BB4E40', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('6E8023BA-A8FD-E511-B2FB-A7E5479B5631', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('6EDD4DFC-D4FD-E511-BE7F-C3C9DC71EB16', 38);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('6EDF5570-ACFD-E511-A6BD-356C5CF369D0', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('7046715C-0FEE-E511-8B44-1DDA313EBBAF', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('70558B06-ADF0-E511-BA63-D954EB2A751C', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('7077C219-53ED-E511-9008-634C2714DC4C', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('70A5C2A8-BCFD-E511-9FC3-F163C1B5278F', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('70E08EC4-A8FD-E511-B2FB-A7E5479B5631', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('7121E3CB-86D7-4081-B5F1-86BA549F8329', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('712D46F3-7382-4A79-9271-AF4E2622B6B7', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('72737524-3B03-E611-8E20-D7A0B26D3688', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('72737524-3B03-E611-8E20-D7A0B26D3688', 25);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('72737524-3B03-E611-8E20-D7A0B26D3688', 27);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('72737524-3B03-E611-8E20-D7A0B26D3688', 28);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('72737524-3B03-E611-8E20-D7A0B26D3688', 36);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('72737524-3B03-E611-8E20-D7A0B26D3688', 38);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('72737524-3B03-E611-8E20-D7A0B26D3688', 39);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('740A1950-DEED-E511-BF94-4DE2C052D8BB', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('75A95FAE-3CCE-4AA2-AFFB-63349B167339', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('760AF364-A1FD-E511-8AF9-8123F88FEB6E', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('76BDC931-3B03-E611-8E20-D7A0B26D3688', 28);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('787C8F93-A8FD-E511-B2FB-A7E5479B5631', 39);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('78E2A8F6-ADB1-4C28-8888-D54C777ED069', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('78FEE93D-A4FD-E511-AA46-3D4AB85DC71C', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('7A2F3493-A7F0-E511-AACB-F9E8DC6F5A1D', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('7A4E3B17-68FE-E511-9F51-E3DCED4CD399', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('7A4E3B17-68FE-E511-9F51-E3DCED4CD399', 25);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('7A4E3B17-68FE-E511-9F51-E3DCED4CD399', 27);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('7A4E3B17-68FE-E511-9F51-E3DCED4CD399', 28);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('7AE535FA-45CE-4D48-B458-3118FCCC0226', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('7B059C29-9A24-4DE6-AB46-478BC358E6FA', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('7B059C29-9A24-4DE6-AB46-478BC358E6FA', 25);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('7B059C29-9A24-4DE6-AB46-478BC358E6FA', 27);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('7B059C29-9A24-4DE6-AB46-478BC358E6FA', 28);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('7C717B11-8135-4218-AF6D-541D90F8EB54', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('7C9030AD-A3FD-E511-AA46-3D4AB85DC71C', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('7CBA8033-66FE-E511-9ACE-B1CD8512145E', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('7E02662B-7B03-E611-B7E8-C3CBDA7D8EA5', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('7E02662B-7B03-E611-B7E8-C3CBDA7D8EA5', 25);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('7E02662B-7B03-E611-B7E8-C3CBDA7D8EA5', 27);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('7E02662B-7B03-E611-B7E8-C3CBDA7D8EA5', 28);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('7E02662B-7B03-E611-B7E8-C3CBDA7D8EA5', 36);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('7E02662B-7B03-E611-B7E8-C3CBDA7D8EA5', 38);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('7E02662B-7B03-E611-B7E8-C3CBDA7D8EA5', 39);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('7ED68428-68FE-E511-B29E-3B11B4DE5010', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('7ED68428-68FE-E511-B29E-3B11B4DE5010', 25);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('7ED68428-68FE-E511-B29E-3B11B4DE5010', 27);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('7ED68428-68FE-E511-B29E-3B11B4DE5010', 28);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('7FE2F966-9587-48AC-9CD9-D2D11F81F30A', 27);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('81D21CB5-CAD0-464C-B00E-99C55FF159A9', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('81E26644-0533-40D4-AAEB-65324024BB96', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('82374A23-66FE-E511-9ACE-B1CD8512145E', 38);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('8278C9EB-DDFD-E511-B99E-E581D299CEFE', 28);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('82DD1BBF-A8FD-E511-B2FB-A7E5479B5631', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('82F53E91-BE02-E611-B386-9B9DC61E13FF', 28);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('8463179B-A8FD-E511-B2FB-A7E5479B5631', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('84D3FE50-65FC-E511-977F-17D9B11D4C0E', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('8522F737-27F2-4255-A401-5BEC93282969', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('85254D83-FF44-4703-9B4D-640AC02E72E6', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('865F99B7-E1F5-E511-BD1D-55B772B3FA93', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('86B0AECD-BCFD-E511-9FC3-F163C1B5278F', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('86B66C9E-5268-4A86-91F0-3DE6AF7D909C', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('883CA038-E5EF-E511-9876-B1FBC1C0A6B9', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('885D7734-EDD6-475A-848B-169B99B0938F', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('8A201035-5DC4-423A-9EB1-ED47D344E1FE', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('8A201035-5DC4-423A-9EB1-ED47D344E1FE', 25);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('8A201035-5DC4-423A-9EB1-ED47D344E1FE', 27);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('8A201035-5DC4-423A-9EB1-ED47D344E1FE', 28);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('8A201035-5DC4-423A-9EB1-ED47D344E1FE', 36);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('8A201035-5DC4-423A-9EB1-ED47D344E1FE', 38);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('8A201035-5DC4-423A-9EB1-ED47D344E1FE', 39);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('8A3E51D5-BCFD-E511-9FC3-F163C1B5278F', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('8A7352D1-BCFD-E511-9FC3-F163C1B5278F', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('8A88738D-4E1F-4969-8870-D80CA843DD9F', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('8BBAFA14-7DE7-4C09-AD7D-587C09088218', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('8C375B24-1EFD-E511-B9BC-A3FB50C36DB6', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('8C7F9DAA-2BEE-E511-B239-61AEFDC2B20D', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('8E0C4A73-B4F7-E511-B5DE-8D566A3BC97E', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('8E38CB4A-6CD5-4D57-AC40-472C24A59EE7', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('8EABC0C6-291C-40A6-92F9-A7765F67DEA1', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('8FA141F2-22A3-4180-9768-013D131A5677', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('8FF79FE9-5CD2-4CDE-B3A9-CEB12C089079', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('901DB739-50FC-E511-AE92-15101811952B', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('901F3D17-5203-E611-BD0F-2F63B7E16357', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('906437D9-A95F-47CE-863E-AA5F5CE245D2', 27);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('90671105-A3FD-E511-AA46-3D4AB85DC71C', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('907416D9-4FFC-E511-AE92-15101811952B', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('9306E005-A3EC-4591-B388-812C3377B9E2', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('93EB008C-1375-485E-89F3-6A3659020EF1', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('9442A8D9-BCFD-E511-9FC3-F163C1B5278F', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('946C5524-9BFD-E511-8248-37B634BDD9D8', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('94D4235B-4DED-E511-9008-634C2714DC4C', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('94DC1C3E-50FC-E511-AE92-15101811952B', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('9613182C-68FE-E511-B29E-3B11B4DE5010', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('9613182C-68FE-E511-B29E-3B11B4DE5010', 25);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('9613182C-68FE-E511-B29E-3B11B4DE5010', 27);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('9613182C-68FE-E511-B29E-3B11B4DE5010', 28);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('96709FAE-2B18-419F-AF8D-841501C1F2B0', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('96A8DD2E-C5FD-E511-993D-6F66979B405B', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('96F9CBF0-F9F4-E511-B0BA-4DBCD287E01D', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('9806A24A-E0ED-E511-B771-0193DF59CCBE', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('980748CE-DCA3-4D13-B6A7-E1E7D0207326', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('986E8BAC-E6ED-E511-B59C-7B4C71CC39C1', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('987BB5B9-0FEF-E511-ACEC-CB47B028C572', 36);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('98FA5BC1-02ED-E511-90C3-59926C786A96', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('9A672DB1-9EFD-E511-8128-77607294CE42', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('9AF5D7D0-03F5-E511-9535-E7FB0288A500', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('9C0DE0D6-FEC6-4431-911E-CE7ED81B6FF8', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('9E15FD45-02ED-E511-90C3-59926C786A96', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('9E375830-5203-E611-BD0F-2F63B7E16357', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('9E814BBA-E6ED-E511-B59C-7B4C71CC39C1', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('9FCF433D-4CAA-4716-B428-C9754217BFA0', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('A08F16EC-50EF-E511-B9B1-5D6569C1F09A', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('A0A3A4D7-70F1-E511-A8E5-AD3B93F4DDCE', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('A26FBC1F-1EFD-E511-B9BC-A3FB50C36DB6', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('A47965BA-BE02-E611-B386-9B9DC61E13FF', 28);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('A4E76CBD-BE02-E611-B386-9B9DC61E13FF', 28);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('A4EF71DC-52FC-E511-AE92-15101811952B', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('A4F8D381-A5F3-E511-BC1A-21A686CFF5FE', 28);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('A61C2729-0EFC-E511-8ACE-6F33B838D6AB', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('A621A8CD-26B3-4E46-AF8F-7970CD657E59', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('A6227654-2EF7-E511-97E1-41399A3C2E7A', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('A631DD43-50FC-E511-AE92-15101811952B', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('A64549F1-9EFD-E511-82E3-2D597A11743D', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('A6A2CD01-7A03-E611-B7E8-C3CBDA7D8EA5', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('A6A2CD01-7A03-E611-B7E8-C3CBDA7D8EA5', 25);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('A6A2CD01-7A03-E611-B7E8-C3CBDA7D8EA5', 27);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('A6A2CD01-7A03-E611-B7E8-C3CBDA7D8EA5', 28);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('A6A2CD01-7A03-E611-B7E8-C3CBDA7D8EA5', 36);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('A6A2CD01-7A03-E611-B7E8-C3CBDA7D8EA5', 38);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('A6A2CD01-7A03-E611-B7E8-C3CBDA7D8EA5', 39);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('A74F2394-0C77-484C-85C9-95D33D0D842B', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('A8B2F41B-E3A1-4F9D-B049-476C97689424', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('A8F17E7D-3EEE-E511-8B8F-8121B0A88547', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('A9659625-C912-456D-B670-70F849D044BF', 28);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('AA0D8B44-3EEE-E511-B239-61AEFDC2B20D', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('AA40E04C-E7A9-467A-BA0C-9C05ACD4271B', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('AA4DB801-9BFD-E511-8248-37B634BDD9D8', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('AA8B77F6-9EFD-E511-82E3-2D597A11743D', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('AA8E5FE9-BB02-E611-964D-774F358C893D', 27);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('AB3150AD-A810-478D-B063-715F4A2BD8A7', 39);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('AB55E774-54C2-4B62-964E-678941057F36', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('AC8A7B21-FDEC-E511-BC4A-3F5C7018CABC', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('AD43A7E3-DB2C-4D45-8FCF-E7BA1550365C', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('AF3805F9-D339-4915-A551-7DC1AE2AB161', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('B0316500-71F1-E511-A8E5-AD3B93F4DDCE', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('B06EA6CA-8FF8-E511-A6B1-D5F2F9F43A47', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('B09C9C7C-0EEF-E511-ACEC-CB47B028C572', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('B0A64E5A-0AF5-E511-ABCA-C71DAB58DA41', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('B21278EA-ADF2-E511-8FBB-1D8556D2F8BE', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('B28A1416-A9FD-E511-B2FB-A7E5479B5631', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('B2B1282C-F802-E611-9AF9-CFD04AB4444A', 27);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('B2EBE8B6-F2F6-E511-B4E5-FD32255F5042', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('B3E11EDC-1ACB-4578-99B7-DA1DE0A3B6A3', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('B4514854-77F4-E511-A6DA-EBA534522572', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('B45CE467-A4F3-E511-BC1A-21A686CFF5FE', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('B49A57B1-7B03-E611-B7E8-C3CBDA7D8EA5', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('B49A57B1-7B03-E611-B7E8-C3CBDA7D8EA5', 25);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('B49A57B1-7B03-E611-B7E8-C3CBDA7D8EA5', 27);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('B49A57B1-7B03-E611-B7E8-C3CBDA7D8EA5', 28);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('B49A57B1-7B03-E611-B7E8-C3CBDA7D8EA5', 36);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('B49A57B1-7B03-E611-B7E8-C3CBDA7D8EA5', 38);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('B49A57B1-7B03-E611-B7E8-C3CBDA7D8EA5', 39);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('B4EA36DC-E5F8-E511-B6B8-BB4E86202B2C', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('B4EA36DC-E5F8-E511-B6B8-BB4E86202B2C', 25);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('B4EA36DC-E5F8-E511-B6B8-BB4E86202B2C', 27);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('B4EA36DC-E5F8-E511-B6B8-BB4E86202B2C', 28);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('B4EA36DC-E5F8-E511-B6B8-BB4E86202B2C', 36);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('B4EA36DC-E5F8-E511-B6B8-BB4E86202B2C', 38);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('B4EA36DC-E5F8-E511-B6B8-BB4E86202B2C', 39);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('B613CD0F-7FED-E511-8D1B-659B0D14E900', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('B6140DDA-074C-44EA-A866-EFBC51FEBE2E', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('B668881E-DDED-E511-8107-259A9514FD4B', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('B6FA5BDD-4FFC-E511-AE92-15101811952B', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('B8628696-69FE-E511-B29E-3B11B4DE5010', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('B8628696-69FE-E511-B29E-3B11B4DE5010', 25);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('B8628696-69FE-E511-B29E-3B11B4DE5010', 27);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('B8628696-69FE-E511-B29E-3B11B4DE5010', 28);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('B8628696-69FE-E511-B29E-3B11B4DE5010', 36);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('B8628696-69FE-E511-B29E-3B11B4DE5010', 38);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('B8628696-69FE-E511-B29E-3B11B4DE5010', 39);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('B8B4EDA0-0FEF-E511-ACEC-CB47B028C572', 36);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('BA298D1D-1EFD-E511-B9BC-A3FB50C36DB6', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('BA5BD36A-E5ED-E511-BC5F-8FB5C9FC6A74', 25);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('BA67037F-E5ED-E511-BC5F-8FB5C9FC6A74', 25);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('BAA6F2B5-C5FD-E511-993D-6F66979B405B', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('BAA6F2B5-C5FD-E511-993D-6F66979B405B', 25);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('BAA6F2B5-C5FD-E511-993D-6F66979B405B', 27);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('BAA6F2B5-C5FD-E511-993D-6F66979B405B', 28);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('BAA6F2B5-C5FD-E511-993D-6F66979B405B', 36);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('BAA6F2B5-C5FD-E511-993D-6F66979B405B', 38);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('BAA6F2B5-C5FD-E511-993D-6F66979B405B', 39);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('BAD09CBC-E5F8-E511-B6B8-BB4E86202B2C', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('BAD09CBC-E5F8-E511-B6B8-BB4E86202B2C', 25);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('BAD09CBC-E5F8-E511-B6B8-BB4E86202B2C', 27);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('BAD09CBC-E5F8-E511-B6B8-BB4E86202B2C', 28);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('BAD09CBC-E5F8-E511-B6B8-BB4E86202B2C', 36);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('BAD09CBC-E5F8-E511-B6B8-BB4E86202B2C', 38);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('BAD09CBC-E5F8-E511-B6B8-BB4E86202B2C', 39);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('BC11BEBE-84F8-E511-A349-9304E4812A44', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('BEB00C32-50FC-E511-AE92-15101811952B', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('C007B025-68FE-E511-B29E-3B11B4DE5010', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('C007B025-68FE-E511-B29E-3B11B4DE5010', 25);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('C007B025-68FE-E511-B29E-3B11B4DE5010', 27);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('C007B025-68FE-E511-B29E-3B11B4DE5010', 28);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('C209C71F-7062-4B44-92D5-3409D19808E4', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('C2971342-A2FD-E511-AE04-5BCE13FE1ADB', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('C2A4A903-CAF8-E511-8E3C-5DA9EDA55930', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('C2A62B11-51EF-E511-B9B1-5D6569C1F09A', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('C36A4803-E24C-4F86-9FEE-F986850C8E7D', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('C4308103-8CFE-E511-828F-17BD0DCF5281', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('C4308103-8CFE-E511-828F-17BD0DCF5281', 25);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('C4308103-8CFE-E511-828F-17BD0DCF5281', 27);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('C4308103-8CFE-E511-828F-17BD0DCF5281', 28);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('C4308103-8CFE-E511-828F-17BD0DCF5281', 36);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('C4308103-8CFE-E511-828F-17BD0DCF5281', 38);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('C4308103-8CFE-E511-828F-17BD0DCF5281', 39);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('C4348D53-682A-41B8-A4CF-216C0F860ED0', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('C49E6466-AC01-E611-8CF3-770F43536E75', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('C4D74A0E-73F1-E511-8D08-E9691A5E7DA0', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('C7F2C419-30B5-421E-859F-13B4F0DF5DB9', 27);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('C866D125-921F-4688-A0EB-AB43ED4D26F7', 27);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('C884F621-0FEF-E511-ACEC-CB47B028C572', 27);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('CA731C52-36F4-E511-8CBD-E10BAF3C9853', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('CC15682B-1EFD-E511-B9BC-A3FB50C36DB6', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('CCCA3372-995A-41F5-9823-2DD5F9CA395C', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('CCCA98E9-E4F1-E511-992E-5F60D64A2BC1', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('CCE0EDC1-20D2-4D2E-AF1C-5BEB9AE78CA1', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('CE5BA72C-35F4-E511-9061-5B7EA26D5ACB', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('CE7BA0FA-C1FD-E511-993D-6F66979B405B', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('CE7BA0FA-C1FD-E511-993D-6F66979B405B', 25);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('CE7BA0FA-C1FD-E511-993D-6F66979B405B', 27);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('CE7BA0FA-C1FD-E511-993D-6F66979B405B', 28);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('D05EEEC0-58F5-E511-BB9E-81820C935D27', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('D092D736-50FC-E511-AE92-15101811952B', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('D0AA90B1-BCFD-E511-9FC3-F163C1B5278F', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('D24775AB-BCFD-E511-9FC3-F163C1B5278F', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('D27B27B3-3051-471F-964E-A114DF31B5CB', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('D292E341-76F4-E511-A6DA-EBA534522572', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('D2A07FFB-67FE-E511-9F51-E3DCED4CD399', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('D2A07FFB-67FE-E511-9F51-E3DCED4CD399', 25);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('D2A07FFB-67FE-E511-9F51-E3DCED4CD399', 27);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('D2A07FFB-67FE-E511-9F51-E3DCED4CD399', 28);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('D2BD0859-DEED-E511-BF94-4DE2C052D8BB', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('D2F92E62-E9B7-4804-9256-1F64EFB789C0', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('D4424224-2AEE-E511-B239-61AEFDC2B20D', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('D46A182D-9BFD-E511-8248-37B634BDD9D8', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('D4B770B8-69FE-E511-B29E-3B11B4DE5010', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('D4B770B8-69FE-E511-B29E-3B11B4DE5010', 25);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('D4B770B8-69FE-E511-B29E-3B11B4DE5010', 27);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('D4B770B8-69FE-E511-B29E-3B11B4DE5010', 28);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('D4B770B8-69FE-E511-B29E-3B11B4DE5010', 36);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('D4B770B8-69FE-E511-B29E-3B11B4DE5010', 38);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('D4B770B8-69FE-E511-B29E-3B11B4DE5010', 39);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('D6511695-D3FD-E511-BE7F-C3C9DC71EB16', 38);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('D81414C2-DCFF-E511-8045-C5CF6B9AE6E9', 40);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('D8303529-F39D-4DEC-933A-40512A0B5E91', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('D8CBF6D0-3CE4-40C9-A4B5-DEE9A14881F6', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('D8E92089-78F2-E511-93E7-CD1EF0971951', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('DA25D229-BF02-E611-B386-9B9DC61E13FF', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('DA25D229-BF02-E611-B386-9B9DC61E13FF', 25);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('DA25D229-BF02-E611-B386-9B9DC61E13FF', 27);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('DA25D229-BF02-E611-B386-9B9DC61E13FF', 28);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('DA25D229-BF02-E611-B386-9B9DC61E13FF', 36);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('DA25D229-BF02-E611-B386-9B9DC61E13FF', 38);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('DA25D229-BF02-E611-B386-9B9DC61E13FF', 39);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('DA37BABD-3CF7-E511-97E1-41399A3C2E7A', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('DAD29FF8-77FB-E511-A904-09AD22D677A9', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('DAD29FF8-77FB-E511-A904-09AD22D677A9', 25);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('DAD29FF8-77FB-E511-A904-09AD22D677A9', 28);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('DAECA131-78F1-E511-B5F5-1D4BED58ECB6', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('DC8B71EA-27C3-4A3C-8D8D-88A719FD021C', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('DCB2D65B-7E42-4ACA-B4CF-4421A57B7544', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('DE378804-3B03-E611-8E20-D7A0B26D3688', 28);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('DE90323F-F5F6-E511-8240-31F3AF499C46', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('DF0A8B1E-65A3-42E8-8E66-1A6A9F4E8181', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('DF271620-86B0-42A8-9235-C968B1842213', 40);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('E028068A-A7F0-E511-AACB-F9E8DC6F5A1D', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('E03D67CD-E6ED-E511-B59C-7B4C71CC39C1', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('E0692697-BAF1-E511-A912-2FAC4FACF13D', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('E0BD9DFD-67FE-E511-B29E-3B11B4DE5010', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('E0BD9DFD-67FE-E511-B29E-3B11B4DE5010', 25);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('E0BD9DFD-67FE-E511-B29E-3B11B4DE5010', 27);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('E0BD9DFD-67FE-E511-B29E-3B11B4DE5010', 28);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('E21AE1BC-FEF1-E511-B1EB-03B6E0BB5982', 27);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('E2F64C61-7903-E611-B7E8-C3CBDA7D8EA5', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('E2F64C61-7903-E611-B7E8-C3CBDA7D8EA5', 25);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('E2F64C61-7903-E611-B7E8-C3CBDA7D8EA5', 27);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('E2F64C61-7903-E611-B7E8-C3CBDA7D8EA5', 28);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('E2F64C61-7903-E611-B7E8-C3CBDA7D8EA5', 36);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('E2F64C61-7903-E611-B7E8-C3CBDA7D8EA5', 38);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('E2F64C61-7903-E611-B7E8-C3CBDA7D8EA5', 39);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('E36B955B-3A31-4CBE-8052-DF795A3CF51B', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('E433A6B4-4C04-47B2-9A64-9EA05DC0B325', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('E457D0A7-F4F6-E511-B077-A185A5CB7AA3', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('E466B7C1-E1EF-E511-9F07-FB3B8E6C25A9', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('E484F283-CA6B-4944-A9B0-08D099952CC5', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('E4AF75E3-CCF9-E511-95ED-9B2B2E6DEA1B', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('E4F8A4D1-78F1-E511-A912-2FAC4FACF13D', 28);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('E58A3BFD-F5D3-4926-B475-D462907ABF93', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('E6AB29CD-2455-447D-8F7A-EAD575CF6CFE', 28);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('E6B06C93-69FE-E511-B29E-3B11B4DE5010', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('E6B06C93-69FE-E511-B29E-3B11B4DE5010', 25);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('E6B06C93-69FE-E511-B29E-3B11B4DE5010', 27);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('E6B06C93-69FE-E511-B29E-3B11B4DE5010', 28);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('E6B06C93-69FE-E511-B29E-3B11B4DE5010', 36);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('E6B06C93-69FE-E511-B29E-3B11B4DE5010', 38);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('E6B06C93-69FE-E511-B29E-3B11B4DE5010', 39);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('E6F5A07A-5203-4066-BA2C-CE5439E77B23', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('E6FBC09C-9EFD-E511-9AD9-A7361E29241D', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('E8361284-F2AB-4AFA-8DD4-70E730512778', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('E8470077-F2F6-E511-B4E5-FD32255F5042', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('E84E4D38-A9FD-E511-B2FB-A7E5479B5631', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('E8C12F00-AFFD-E511-A6BD-356C5CF369D0', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('E8C12F00-AFFD-E511-A6BD-356C5CF369D0', 25);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('E8C12F00-AFFD-E511-A6BD-356C5CF369D0', 27);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('E8C12F00-AFFD-E511-A6BD-356C5CF369D0', 28);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('E8C12F00-AFFD-E511-A6BD-356C5CF369D0', 36);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('E8C12F00-AFFD-E511-A6BD-356C5CF369D0', 38);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('E8C12F00-AFFD-E511-A6BD-356C5CF369D0', 39);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('E8D52662-DEED-E511-BF94-4DE2C052D8BB', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('E8E38A1A-A9FD-E511-B2FB-A7E5479B5631', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('EA009946-1EFD-E511-B9BC-A3FB50C36DB6', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('EA12E473-3EEE-E511-8B8F-8121B0A88547', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('EA28F390-69FE-E511-9F51-E3DCED4CD399', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('EA28F390-69FE-E511-9F51-E3DCED4CD399', 25);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('EA28F390-69FE-E511-9F51-E3DCED4CD399', 27);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('EA28F390-69FE-E511-9F51-E3DCED4CD399', 28);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('EA28F390-69FE-E511-9F51-E3DCED4CD399', 36);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('EA28F390-69FE-E511-9F51-E3DCED4CD399', 38);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('EA28F390-69FE-E511-9F51-E3DCED4CD399', 39);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('EA49350E-BC02-E611-964D-774F358C893D', 27);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('EABB8149-A4FD-E511-AA46-3D4AB85DC71C', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('EC0BB7C0-BE02-E611-B386-9B9DC61E13FF', 28);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('EC87A8F5-EAED-E511-99D3-5F6156D125FE', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('ECE33B3E-E0ED-E511-B771-0193DF59CCBE', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('EE428FD4-C102-E611-B386-9B9DC61E13FF', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('EE428FD4-C102-E611-B386-9B9DC61E13FF', 25);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('EE428FD4-C102-E611-B386-9B9DC61E13FF', 27);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('EE428FD4-C102-E611-B386-9B9DC61E13FF', 28);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('EE428FD4-C102-E611-B386-9B9DC61E13FF', 36);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('EE428FD4-C102-E611-B386-9B9DC61E13FF', 38);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('EE428FD4-C102-E611-B386-9B9DC61E13FF', 39);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('EE491635-ABFD-E511-B2FB-A7E5479B5631', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('EE5DEBA7-ACF0-E511-A162-DF7E7BBB065E', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('EED1EFCC-ACFD-E511-A6BD-356C5CF369D0', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('F022B32C-E2ED-E511-AF57-1550EA63D0D4', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('F249EFA1-B7F7-E511-A916-752D12D84D64', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('F25582B9-CCF9-E511-95ED-9B2B2E6DEA1B', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('F25582B9-CCF9-E511-95ED-9B2B2E6DEA1B', 25);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('F25582B9-CCF9-E511-95ED-9B2B2E6DEA1B', 27);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('F25582B9-CCF9-E511-95ED-9B2B2E6DEA1B', 28);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('F25582B9-CCF9-E511-95ED-9B2B2E6DEA1B', 36);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('F25582B9-CCF9-E511-95ED-9B2B2E6DEA1B', 38);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('F25582B9-CCF9-E511-95ED-9B2B2E6DEA1B', 39);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('F2AEFBE9-77FB-E511-A904-09AD22D677A9', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('F2AEFBE9-77FB-E511-A904-09AD22D677A9', 25);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('F2AEFBE9-77FB-E511-A904-09AD22D677A9', 27);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('F2AEFBE9-77FB-E511-A904-09AD22D677A9', 28);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('F32A8C43-BAF2-46A0-81E7-B628EF12FCDD', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('F80AF52C-0FEE-E511-8B44-1DDA313EBBAF', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('F80B950D-A82B-46AB-9A6A-30FD3EC3B41E', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('F8353C69-0FD7-4603-9A23-EA240A25C426', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('F8B4B83C-9BFD-E511-8248-37B634BDD9D8', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('F8D047EB-F9F4-E511-B0BA-4DBCD287E01D', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('F8D3FBA5-9384-4433-8864-98716FE440D9', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('F8E4E5E3-A3F5-E511-BD1D-55B772B3FA93', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('FAFCB6F1-5447-4D70-B675-15C2CA0FFC78', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('FC0FDCF6-D0C3-4B6B-9E0C-0D666BA39705', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('FC2CF06F-A9B4-4A39-87F7-F9CEFA59075F', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('FC2E40BC-ADF2-E511-9AC2-E3EAD5D6446A', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('FC316C14-73F1-E511-8D08-E9691A5E7DA0', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('FC7B11F6-AEFD-E511-A6BD-356C5CF369D0', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('FCB8C1BB-DDFD-E511-9630-ADCB6E689999', 28);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('FCBC677C-F2F6-E511-B4E5-FD32255F5042', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('FE0D8FED-F9F4-E511-B0BA-4DBCD287E01D', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('FE171428-1EFD-E511-B9BC-A3FB50C36DB6', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('FE48542B-4FC5-4B5B-8F3C-03E270415DF4', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('FE4F0FF3-29EE-E511-B239-61AEFDC2B20D', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('FE576D42-9CFD-E511-B1C2-D5F14616F2A7', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('FEAA28F9-344C-43C8-BD2B-98DB837AB5B5', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('FFEE3F93-DDDE-427A-8FCD-75232CCA90A6', 28);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('5A608CE4-8403-E611-B7E8-C3CBDA7D8EA5', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('5A608CE4-8403-E611-B7E8-C3CBDA7D8EA5', 25);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('5A608CE4-8403-E611-B7E8-C3CBDA7D8EA5', 27);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('5A608CE4-8403-E611-B7E8-C3CBDA7D8EA5', 28);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('5A608CE4-8403-E611-B7E8-C3CBDA7D8EA5', 36);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('5A608CE4-8403-E611-B7E8-C3CBDA7D8EA5', 38);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('5A608CE4-8403-E611-B7E8-C3CBDA7D8EA5', 39);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('5A608CE4-8403-E611-B7E8-C3CBDA7D8EA5', 40);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('23A918EC-D862-4A12-A85B-A3DA66690664', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('23A918EC-D862-4A12-A85B-A3DA66690664', 25);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('23A918EC-D862-4A12-A85B-A3DA66690664', 27);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('23A918EC-D862-4A12-A85B-A3DA66690664', 28);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('23A918EC-D862-4A12-A85B-A3DA66690664', 36);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('23A918EC-D862-4A12-A85B-A3DA66690664', 38);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('23A918EC-D862-4A12-A85B-A3DA66690664', 39);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('23A918EC-D862-4A12-A85B-A3DA66690664', 40);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('C894BD3C-8603-E611-A389-6FC309BEBE03', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('C894BD3C-8603-E611-A389-6FC309BEBE03', 25);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('C894BD3C-8603-E611-A389-6FC309BEBE03', 27);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('C894BD3C-8603-E611-A389-6FC309BEBE03', 28);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('C894BD3C-8603-E611-A389-6FC309BEBE03', 36);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('C894BD3C-8603-E611-A389-6FC309BEBE03', 38);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('C894BD3C-8603-E611-A389-6FC309BEBE03', 39);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('C894BD3C-8603-E611-A389-6FC309BEBE03', 40);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('4A126BA8-8603-E611-A389-6FC309BEBE03', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('4A126BA8-8603-E611-A389-6FC309BEBE03', 25);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('4A126BA8-8603-E611-A389-6FC309BEBE03', 27);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('4A126BA8-8603-E611-A389-6FC309BEBE03', 28);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('4A126BA8-8603-E611-A389-6FC309BEBE03', 36);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('4A126BA8-8603-E611-A389-6FC309BEBE03', 38);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('4A126BA8-8603-E611-A389-6FC309BEBE03', 39);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('4A126BA8-8603-E611-A389-6FC309BEBE03', 40);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('4C7FA5AE-8603-E611-A389-6FC309BEBE03', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('4C7FA5AE-8603-E611-A389-6FC309BEBE03', 25);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('4C7FA5AE-8603-E611-A389-6FC309BEBE03', 27);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('4C7FA5AE-8603-E611-A389-6FC309BEBE03', 28);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('4C7FA5AE-8603-E611-A389-6FC309BEBE03', 36);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('4C7FA5AE-8603-E611-A389-6FC309BEBE03', 38);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('4C7FA5AE-8603-E611-A389-6FC309BEBE03', 39);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('4C7FA5AE-8603-E611-A389-6FC309BEBE03', 40);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('62EC26A5-8603-E611-A389-6FC309BEBE03', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('62EC26A5-8603-E611-A389-6FC309BEBE03', 25);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('62EC26A5-8603-E611-A389-6FC309BEBE03', 27);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('62EC26A5-8603-E611-A389-6FC309BEBE03', 28);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('62EC26A5-8603-E611-A389-6FC309BEBE03', 36);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('62EC26A5-8603-E611-A389-6FC309BEBE03', 38);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('62EC26A5-8603-E611-A389-6FC309BEBE03', 39);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('62EC26A5-8603-E611-A389-6FC309BEBE03', 40);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('72C7A29D-8603-E611-A389-6FC309BEBE03', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('72C7A29D-8603-E611-A389-6FC309BEBE03', 25);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('72C7A29D-8603-E611-A389-6FC309BEBE03', 27);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('72C7A29D-8603-E611-A389-6FC309BEBE03', 28);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('72C7A29D-8603-E611-A389-6FC309BEBE03', 36);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('72C7A29D-8603-E611-A389-6FC309BEBE03', 38);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('72C7A29D-8603-E611-A389-6FC309BEBE03', 39);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('72C7A29D-8603-E611-A389-6FC309BEBE03', 40);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('92A941A2-8603-E611-A389-6FC309BEBE03', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('92A941A2-8603-E611-A389-6FC309BEBE03', 25);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('92A941A2-8603-E611-A389-6FC309BEBE03', 27);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('92A941A2-8603-E611-A389-6FC309BEBE03', 28);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('92A941A2-8603-E611-A389-6FC309BEBE03', 36);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('92A941A2-8603-E611-A389-6FC309BEBE03', 38);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('92A941A2-8603-E611-A389-6FC309BEBE03', 39);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('92A941A2-8603-E611-A389-6FC309BEBE03', 40);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('F4A548AB-8603-E611-A389-6FC309BEBE03', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('F4A548AB-8603-E611-A389-6FC309BEBE03', 25);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('F4A548AB-8603-E611-A389-6FC309BEBE03', 27);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('F4A548AB-8603-E611-A389-6FC309BEBE03', 28);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('F4A548AB-8603-E611-A389-6FC309BEBE03', 36);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('F4A548AB-8603-E611-A389-6FC309BEBE03', 38);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('F4A548AB-8603-E611-A389-6FC309BEBE03', 39);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('F4A548AB-8603-E611-A389-6FC309BEBE03', 40);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('8523C3C2-FD82-4D9F-81D6-A863008D391D', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('8523C3C2-FD82-4D9F-81D6-A863008D391D', 25);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('8523C3C2-FD82-4D9F-81D6-A863008D391D', 27);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('8523C3C2-FD82-4D9F-81D6-A863008D391D', 28);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('8523C3C2-FD82-4D9F-81D6-A863008D391D', 36);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('8523C3C2-FD82-4D9F-81D6-A863008D391D', 38);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('8523C3C2-FD82-4D9F-81D6-A863008D391D', 39);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('8523C3C2-FD82-4D9F-81D6-A863008D391D', 40);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('E3E0B696-571E-4A92-A49C-D8E5BCBE8B04', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('E3E0B696-571E-4A92-A49C-D8E5BCBE8B04', 25);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('E3E0B696-571E-4A92-A49C-D8E5BCBE8B04', 27);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('E3E0B696-571E-4A92-A49C-D8E5BCBE8B04', 28);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('E3E0B696-571E-4A92-A49C-D8E5BCBE8B04', 36);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('E3E0B696-571E-4A92-A49C-D8E5BCBE8B04', 38);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('E3E0B696-571E-4A92-A49C-D8E5BCBE8B04', 39);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('E3E0B696-571E-4A92-A49C-D8E5BCBE8B04', 40);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('57B78C41-C868-4DDC-AAE0-4557E7A8C5CD', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('57B78C41-C868-4DDC-AAE0-4557E7A8C5CD', 25);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('57B78C41-C868-4DDC-AAE0-4557E7A8C5CD', 27);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('57B78C41-C868-4DDC-AAE0-4557E7A8C5CD', 28);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('57B78C41-C868-4DDC-AAE0-4557E7A8C5CD', 36);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('57B78C41-C868-4DDC-AAE0-4557E7A8C5CD', 38);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('57B78C41-C868-4DDC-AAE0-4557E7A8C5CD', 39);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('57B78C41-C868-4DDC-AAE0-4557E7A8C5CD', 40);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('D0DAFDA9-6D40-4502-87F8-EA7623E41C43', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('D0DAFDA9-6D40-4502-87F8-EA7623E41C43', 25);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('D0DAFDA9-6D40-4502-87F8-EA7623E41C43', 27);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('D0DAFDA9-6D40-4502-87F8-EA7623E41C43', 28);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('D0DAFDA9-6D40-4502-87F8-EA7623E41C43', 36);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('D0DAFDA9-6D40-4502-87F8-EA7623E41C43', 38);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('D0DAFDA9-6D40-4502-87F8-EA7623E41C43', 39);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('D0DAFDA9-6D40-4502-87F8-EA7623E41C43', 40);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('4A3DF88F-DC03-E611-8781-433F18671722', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('4A3DF88F-DC03-E611-8781-433F18671722', 25);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('4A3DF88F-DC03-E611-8781-433F18671722', 27);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('4A3DF88F-DC03-E611-8781-433F18671722', 28);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('4A3DF88F-DC03-E611-8781-433F18671722', 36);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('4A3DF88F-DC03-E611-8781-433F18671722', 38);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('4A3DF88F-DC03-E611-8781-433F18671722', 39);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('4A3DF88F-DC03-E611-8781-433F18671722', 40);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('62FA7187-DC03-E611-8781-433F18671722', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('B618FF01-1C04-E611-9C3C-7B519E66CC6D', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('B618FF01-1C04-E611-9C3C-7B519E66CC6D', 25);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('B618FF01-1C04-E611-9C3C-7B519E66CC6D', 27);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('B618FF01-1C04-E611-9C3C-7B519E66CC6D', 28);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('B618FF01-1C04-E611-9C3C-7B519E66CC6D', 40);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('B6C4A257-C703-E611-9CB4-2DFE21AAB730', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('B6C4A257-C703-E611-9CB4-2DFE21AAB730', 25);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('B6C4A257-C703-E611-9CB4-2DFE21AAB730', 27);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('B6C4A257-C703-E611-9CB4-2DFE21AAB730', 28);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('B6C4A257-C703-E611-9CB4-2DFE21AAB730', 36);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('B6C4A257-C703-E611-9CB4-2DFE21AAB730', 38);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('B6C4A257-C703-E611-9CB4-2DFE21AAB730', 39);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('B6C4A257-C703-E611-9CB4-2DFE21AAB730', 40);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('E0942694-1B04-E611-B209-1D412AEFADEB', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('0DFC4DBF-1DBB-42CB-80B5-FBE8AE766B4F', 27);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('09BF8309-2F87-4567-AB1D-BAACB125027C', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('09BF8309-2F87-4567-AB1D-BAACB125027C', 25);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('09BF8309-2F87-4567-AB1D-BAACB125027C', 27);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('09BF8309-2F87-4567-AB1D-BAACB125027C', 28);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('09BF8309-2F87-4567-AB1D-BAACB125027C', 36);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('09BF8309-2F87-4567-AB1D-BAACB125027C', 38);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('09BF8309-2F87-4567-AB1D-BAACB125027C', 39);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('09BF8309-2F87-4567-AB1D-BAACB125027C', 40);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('1035FF76-9D05-E611-8F63-07BF91831A8A', 27);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('3802CFAC-9D05-E611-8F63-07BF91831A8A', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('3802CFAC-9D05-E611-8F63-07BF91831A8A', 25);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('3802CFAC-9D05-E611-8F63-07BF91831A8A', 27);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('3802CFAC-9D05-E611-8F63-07BF91831A8A', 28);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('3802CFAC-9D05-E611-8F63-07BF91831A8A', 36);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('3802CFAC-9D05-E611-8F63-07BF91831A8A', 38);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('3802CFAC-9D05-E611-8F63-07BF91831A8A', 39);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('3802CFAC-9D05-E611-8F63-07BF91831A8A', 40);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('C66A9477-9E05-E611-8F63-07BF91831A8A', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('C66A9477-9E05-E611-8F63-07BF91831A8A', 25);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('C66A9477-9E05-E611-8F63-07BF91831A8A', 27);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('C66A9477-9E05-E611-8F63-07BF91831A8A', 28);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('C66A9477-9E05-E611-8F63-07BF91831A8A', 36);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('C66A9477-9E05-E611-8F63-07BF91831A8A', 38);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('C66A9477-9E05-E611-8F63-07BF91831A8A', 39);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('C66A9477-9E05-E611-8F63-07BF91831A8A', 40);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('D284EB68-9E05-E611-8F63-07BF91831A8A', 27);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('DC11FCE1-A005-E611-88BD-E739B9B3E782', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('DC11FCE1-A005-E611-88BD-E739B9B3E782', 25);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('DC11FCE1-A005-E611-88BD-E739B9B3E782', 27);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('DC11FCE1-A005-E611-88BD-E739B9B3E782', 28);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('DC11FCE1-A005-E611-88BD-E739B9B3E782', 36);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('DC11FCE1-A005-E611-88BD-E739B9B3E782', 38);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('DC11FCE1-A005-E611-88BD-E739B9B3E782', 39);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('DC11FCE1-A005-E611-88BD-E739B9B3E782', 40);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('491B700F-BF39-419E-84CA-3B855DD35CA1', 27);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('30F6E748-ACE8-4786-9949-813C31C62025', 19);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('30F6E748-ACE8-4786-9949-813C31C62025', 25);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('30F6E748-ACE8-4786-9949-813C31C62025', 27);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('30F6E748-ACE8-4786-9949-813C31C62025', 28);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('30F6E748-ACE8-4786-9949-813C31C62025', 36);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('30F6E748-ACE8-4786-9949-813C31C62025', 38);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('30F6E748-ACE8-4786-9949-813C31C62025', 39);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('30F6E748-ACE8-4786-9949-813C31C62025', 40);
INSERT INTO agenda_aluno (agenda_id, aluno_id) VALUES ('830A7DE8-868D-4809-8B7D-1641E67F8342', 27);

-- Table: periodo_tipo
CREATE TABLE periodo_tipo (
  periodo_tipo_id smallint(6) NOT NULL ,
  descricao varchar(150) ,
  informacoes_gerais blob,
  PRIMARY KEY (periodo_tipo_id));

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

-- Table: mensagem_tipo
CREATE TABLE mensagem_tipo (
  mensagem_tipo_id smallint(6) NOT NULL,
  descricao varchar(150) ,
  informacoes_gerais blob,
  PRIMARY KEY (mensagem_tipo_id));

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
INSERT INTO aluno (aluno_id, nome, sobrenome, data_nascimento, sexo, rg, cpf, ativo, informacoes_gerais, escola_id) VALUES (19, 'Leonardo', 'Bomconpagno Alves', '2015-10-07', 'M', '427099705', 32087213828, 'S', X'7465737465', 1);
INSERT INTO aluno (aluno_id, nome, sobrenome, data_nascimento, sexo, rg, cpf, ativo, informacoes_gerais, escola_id) VALUES (25, 'Maria', 'da Silva', NULL, NULL, NULL, NULL, 'S', NULL, 1);
INSERT INTO aluno (aluno_id, nome, sobrenome, data_nascimento, sexo, rg, cpf, ativo, informacoes_gerais, escola_id) VALUES (27, 'Carlos', 'Vizinho', NULL, NULL, NULL, NULL, 'S', NULL, 1);
INSERT INTO aluno (aluno_id, nome, sobrenome, data_nascimento, sexo, rg, cpf, ativo, informacoes_gerais, escola_id) VALUES (28, 'Gertrudes', '', NULL, NULL, NULL, NULL, 'S', NULL, 1);
INSERT INTO aluno (aluno_id, nome, sobrenome, data_nascimento, sexo, rg, cpf, ativo, informacoes_gerais, escola_id) VALUES (36, 'Pedro', NULL, NULL, NULL, NULL, NULL, 'S', NULL, 1);
INSERT INTO aluno (aluno_id, nome, sobrenome, data_nascimento, sexo, rg, cpf, ativo, informacoes_gerais, escola_id) VALUES (38, 'Giovanna', NULL, NULL, NULL, NULL, NULL, 'S', NULL, 1);
INSERT INTO aluno (aluno_id, nome, sobrenome, data_nascimento, sexo, rg, cpf, ativo, informacoes_gerais, escola_id) VALUES (39, 'Julia', NULL, NULL, NULL, NULL, NULL, 'S', NULL, 1);
INSERT INTO aluno (aluno_id, nome, sobrenome, data_nascimento, sexo, rg, cpf, ativo, informacoes_gerais, escola_id) VALUES (40, 'Luiza', 'Ferreira Silva', '2010-12-27', 'F', NULL, NULL, 'S', NULL, 1);

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
INSERT INTO responsavel (responsavel_id, nome, sobrenome, sexo, rg, cpf, ativo, email, informacoes_gerais, escola_id, responsavel_tipo_id, senha) VALUES (9, 'Alvaro', 'Esteves Bomconpagno Alves', NULL, '427099705', 32087213828, 'S', 'sum182@gmail.com', NULL, 1, NULL, 'Zkh4SWFraExURS9EcDBCaFlRPT1h');
INSERT INTO responsavel (responsavel_id, nome, sobrenome, sexo, rg, cpf, ativo, email, informacoes_gerais, escola_id, responsavel_tipo_id, senha) VALUES (10, 'Vanessa', 'Keiko Bomconpagno Alves', NULL, NULL, NULL, 'S', NULL, NULL, 1, NULL, NULL);
INSERT INTO responsavel (responsavel_id, nome, sobrenome, sexo, rg, cpf, ativo, email, informacoes_gerais, escola_id, responsavel_tipo_id, senha) VALUES (17, 'b', 'b', NULL, NULL, NULL, 'S', 'b', NULL, 1, NULL, 'Zkh4SWFraExURS9EcDBCaFlRPT1i');
INSERT INTO responsavel (responsavel_id, nome, sobrenome, sexo, rg, cpf, ativo, email, informacoes_gerais, escola_id, responsavel_tipo_id, senha) VALUES (66, 'Leonardo', 'Lima da Silva', 'M', '370463754', 29163653893, 'S', 'leolima80rj@gmail.com', NULL, 1, 1, NULL);

-- Table: escola_telefone
CREATE TABLE escola_telefone (
  escola_telefone_id integer NOT NULL ,
  escola_id integer ,
  telefone_tipo_id smallint(6) ,
  numero varchar(50) ,
  PRIMARY KEY (escola_telefone_id));

-- Table: agenda_tipo
CREATE TABLE agenda_tipo (
  agenda_tipo_id smallint(6) NOT NULL,
  descricao varchar(150) DEFAULT NULL,
  informacoes_gerais text,
  PRIMARY KEY (agenda_tipo_id));

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

COMMIT TRANSACTION;
PRAGMA foreign_keys = on;
