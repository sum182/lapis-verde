-- phpMyAdmin SQL Dump
-- version 3.3.3
-- http://www.phpmyadmin.net
--
-- Servidor: rmfactory.com.br
-- Tempo de Geração: Nov 18, 2015 as 10:52 AM
-- Versão do Servidor: 5.5.43
-- Versão do PHP: 5.3.28

-- HOSPEDE SEU BANCO DE DADOS NA NUVEM COM A RMFACTORY, A PARTIR DE R$ 9,90/mês.
-- TEMOS HOSPEDAGEM DE FIREBIRD, POSTGREE, SQL SERVER E ORACLE NA NUVEM TAMBÉM

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Banco de Dados: `rmfactory`
--
CREATE DATABASE `rmfactory` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `rmfactory`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `hotel`
--

DROP TABLE IF EXISTS `hotel`;
CREATE TABLE IF NOT EXISTS `hotel` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `ultimaatualizacao` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Extraindo dados da tabela `hotel`
--

INSERT INTO `hotel` (`id`, `nome`, `ultimaatualizacao`) VALUES
(1, 'Hotel Exemplo 01', '2015-11-18 10:51:03'),
(2, 'Hotel Exemplo 02', '2015-11-18 10:51:03'),
(3, 'Hotel Exemplo 03', '2015-11-18 10:51:03');

-- --------------------------------------------------------

--
-- Estrutura da tabela `hotel_caixa`
--

DROP TABLE IF EXISTS `hotel_caixa`;
CREATE TABLE IF NOT EXISTS `hotel_caixa` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `hotelid` int(10) unsigned NOT NULL,
  `descricao` varchar(100) NOT NULL,
  `valor` double NOT NULL,
  `atualizacao` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=1 ;

--
-- Extraindo dados da tabela `hotel_caixa`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `hotel_reserva`
--

DROP TABLE IF EXISTS `hotel_reserva`;
CREATE TABLE IF NOT EXISTS `hotel_reserva` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `hotelid` int(10) unsigned NOT NULL,
  `data` datetime NOT NULL,
  `descricao` varchar(45) NOT NULL,
  `quantidade` int(10) unsigned NOT NULL,
  `atualizacao` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=113 ;

--
-- Extraindo dados da tabela `hotel_reserva`
--

INSERT INTO `hotel_reserva` (`id`, `hotelid`, `data`, `descricao`, `quantidade`, `atualizacao`) VALUES
(1, 1, '2015-10-21 00:00:00', 'Ocupada', 12, '0000-00-00 00:00:00'),
(2, 1, '2015-10-21 00:00:00', 'Reservada', 8, '0000-00-00 00:00:00'),
(3, 1, '2015-10-21 00:00:00', 'Livre', 5, '0000-00-00 00:00:00'),
(4, 1, '2015-10-21 00:00:00', 'Interditada', 0, '0000-00-00 00:00:00'),
(5, 1, '2015-10-22 00:00:00', 'Ocupada', 15, '0000-00-00 00:00:00'),
(6, 1, '2015-10-22 00:00:00', 'Reservada', 5, '0000-00-00 00:00:00'),
(7, 1, '2015-10-22 00:00:00', 'Livre', 5, '0000-00-00 00:00:00'),
(8, 1, '2015-10-22 00:00:00', 'Interditada', 0, '0000-00-00 00:00:00'),
(9, 1, '2015-10-23 00:00:00', 'Ocupada', 14, '0000-00-00 00:00:00'),
(10, 1, '2015-10-23 00:00:00', 'Reservada', 8, '0000-00-00 00:00:00'),
(11, 1, '2015-10-23 00:00:00', 'Livre', 3, '0000-00-00 00:00:00'),
(12, 1, '2015-10-23 00:00:00', 'Interditada', 0, '0000-00-00 00:00:00'),
(13, 1, '2015-10-24 00:00:00', 'Ocupada', 14, '0000-00-00 00:00:00'),
(14, 1, '2015-10-24 00:00:00', 'Reservada', 8, '0000-00-00 00:00:00'),
(15, 1, '2015-10-24 00:00:00', 'Livre', 2, '0000-00-00 00:00:00'),
(16, 1, '2015-10-24 00:00:00', 'Interditada', 1, '0000-00-00 00:00:00'),
(17, 1, '2015-10-25 00:00:00', 'Ocupada', 9, '0000-00-00 00:00:00'),
(18, 1, '2015-10-25 00:00:00', 'Reservada', 10, '0000-00-00 00:00:00'),
(19, 1, '2015-10-25 00:00:00', 'Livre', 5, '0000-00-00 00:00:00'),
(20, 1, '2015-10-25 00:00:00', 'Interditada', 1, '0000-00-00 00:00:00'),
(21, 1, '2015-10-26 00:00:00', 'Ocupada', 13, '0000-00-00 00:00:00'),
(22, 1, '2015-10-26 00:00:00', 'Reservada', 7, '0000-00-00 00:00:00'),
(23, 1, '2015-10-26 00:00:00', 'Livre', 3, '0000-00-00 00:00:00'),
(24, 1, '2015-10-26 00:00:00', 'Interditada', 0, '0000-00-00 00:00:00'),
(25, 1, '2015-10-27 00:00:00', 'Ocupada', 14, '0000-00-00 00:00:00'),
(26, 1, '2015-10-27 00:00:00', 'Reservada', 6, '0000-00-00 00:00:00'),
(27, 1, '2015-10-27 00:00:00', 'Livre', 6, '0000-00-00 00:00:00'),
(28, 1, '2015-10-27 00:00:00', 'Interditada', 0, '0000-00-00 00:00:00'),
(29, 2, '2015-10-21 00:00:00', 'Ocupada', 12, '0000-00-00 00:00:00'),
(30, 2, '2015-10-21 00:00:00', 'Reservada', 8, '0000-00-00 00:00:00'),
(31, 2, '2015-10-21 00:00:00', 'Livre', 5, '0000-00-00 00:00:00'),
(32, 2, '2015-10-21 00:00:00', 'Interditada', 0, '0000-00-00 00:00:00'),
(33, 2, '2015-10-22 00:00:00', 'Ocupada', 15, '0000-00-00 00:00:00'),
(34, 2, '2015-10-22 00:00:00', 'Reservada', 5, '0000-00-00 00:00:00'),
(35, 2, '2015-10-22 00:00:00', 'Livre', 5, '0000-00-00 00:00:00'),
(36, 2, '2015-10-22 00:00:00', 'Interditada', 0, '0000-00-00 00:00:00'),
(37, 2, '2015-10-23 00:00:00', 'Ocupada', 14, '0000-00-00 00:00:00'),
(38, 2, '2015-10-23 00:00:00', 'Reservada', 8, '0000-00-00 00:00:00'),
(39, 2, '2015-10-23 00:00:00', 'Livre', 3, '0000-00-00 00:00:00'),
(40, 2, '2015-10-23 00:00:00', 'Interditada', 0, '0000-00-00 00:00:00'),
(41, 2, '2015-10-24 00:00:00', 'Ocupada', 14, '0000-00-00 00:00:00'),
(42, 2, '2015-10-24 00:00:00', 'Reservada', 8, '0000-00-00 00:00:00'),
(43, 2, '2015-10-24 00:00:00', 'Livre', 2, '0000-00-00 00:00:00'),
(44, 2, '2015-10-24 00:00:00', 'Interditada', 1, '0000-00-00 00:00:00'),
(45, 2, '2015-10-25 00:00:00', 'Ocupada', 9, '0000-00-00 00:00:00'),
(46, 2, '2015-10-25 00:00:00', 'Reservada', 10, '0000-00-00 00:00:00'),
(47, 2, '2015-10-25 00:00:00', 'Livre', 5, '0000-00-00 00:00:00'),
(48, 2, '2015-10-25 00:00:00', 'Interditada', 1, '0000-00-00 00:00:00'),
(49, 2, '2015-10-26 00:00:00', 'Ocupada', 13, '0000-00-00 00:00:00'),
(50, 2, '2015-10-26 00:00:00', 'Reservada', 7, '0000-00-00 00:00:00'),
(51, 2, '2015-10-26 00:00:00', 'Livre', 3, '0000-00-00 00:00:00'),
(52, 2, '2015-10-26 00:00:00', 'Interditada', 0, '0000-00-00 00:00:00'),
(53, 2, '2015-10-27 00:00:00', 'Ocupada', 14, '0000-00-00 00:00:00'),
(54, 2, '2015-10-27 00:00:00', 'Reservada', 6, '0000-00-00 00:00:00'),
(55, 2, '2015-10-27 00:00:00', 'Livre', 6, '0000-00-00 00:00:00'),
(56, 2, '2015-10-27 00:00:00', 'Interditada', 0, '0000-00-00 00:00:00'),
(57, 3, '2015-10-21 00:00:00', 'Ocupada', 12, '2015-10-19 23:17:14'),
(58, 3, '2015-10-21 00:00:00', 'Reservada', 8, '2015-10-19 23:17:14'),
(59, 3, '2015-10-21 00:00:00', 'Livre', 5, '2015-10-19 23:17:14'),
(60, 3, '2015-10-21 00:00:00', 'Interditada', 0, '2015-10-19 23:17:14'),
(61, 3, '2015-10-22 00:00:00', 'Ocupada', 15, '2015-10-19 23:17:14'),
(62, 3, '2015-10-22 00:00:00', 'Reservada', 5, '2015-10-19 23:17:14'),
(63, 3, '2015-10-22 00:00:00', 'Livre', 5, '2015-10-19 23:17:14'),
(64, 3, '2015-10-22 00:00:00', 'Interditada', 0, '2015-10-19 23:17:14'),
(65, 3, '2015-10-23 00:00:00', 'Ocupada', 14, '2015-10-19 23:17:14'),
(66, 3, '2015-10-23 00:00:00', 'Reservada', 8, '2015-10-19 23:17:14'),
(67, 3, '2015-10-23 00:00:00', 'Livre', 3, '2015-10-19 23:17:14'),
(68, 3, '2015-10-23 00:00:00', 'Interditada', 0, '2015-10-19 23:17:14'),
(69, 3, '2015-10-24 00:00:00', 'Ocupada', 14, '2015-10-19 23:17:14'),
(70, 3, '2015-10-24 00:00:00', 'Reservada', 8, '2015-10-19 23:17:14'),
(71, 3, '2015-10-24 00:00:00', 'Livre', 2, '2015-10-19 23:17:14'),
(72, 3, '2015-10-24 00:00:00', 'Interditada', 1, '2015-10-19 23:17:14'),
(73, 3, '2015-10-25 00:00:00', 'Ocupada', 9, '2015-10-19 23:17:14'),
(74, 3, '2015-10-25 00:00:00', 'Reservada', 10, '2015-10-19 23:17:14'),
(75, 3, '2015-10-25 00:00:00', 'Livre', 5, '2015-10-19 23:17:14'),
(76, 3, '2015-10-25 00:00:00', 'Interditada', 1, '2015-10-19 23:17:14'),
(77, 3, '2015-10-26 00:00:00', 'Ocupada', 13, '2015-10-19 23:17:14'),
(78, 3, '2015-10-26 00:00:00', 'Reservada', 7, '2015-10-19 23:17:14'),
(79, 3, '2015-10-26 00:00:00', 'Livre', 3, '2015-10-19 23:17:14'),
(80, 3, '2015-10-26 00:00:00', 'Interditada', 0, '2015-10-19 23:17:14'),
(81, 3, '2015-10-27 00:00:00', 'Ocupada', 14, '2015-10-19 23:17:14'),
(82, 3, '2015-10-27 00:00:00', 'Reservada', 6, '2015-10-19 23:17:14'),
(83, 3, '2015-10-27 00:00:00', 'Livre', 6, '2015-10-19 23:17:14'),
(84, 3, '2015-10-27 00:00:00', 'Interditada', 0, '2015-10-19 23:17:14');

-- --------------------------------------------------------

--
-- Estrutura da tabela `hotel_status`
--

DROP TABLE IF EXISTS `hotel_status`;
CREATE TABLE IF NOT EXISTS `hotel_status` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `hotelid` int(10) unsigned NOT NULL,
  `descricao` varchar(45) NOT NULL,
  `valor` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=78 ;

--
-- Extraindo dados da tabela `hotel_status`
--

INSERT INTO `hotel_status` (`id`, `hotelid`, `descricao`, `valor`) VALUES
(1, 1, 'Inicio Turno', '21/10/2015 07:47'),
(2, 1, 'Tempo Turno', '09:40'),
(3, 1, 'Entradas', '8'),
(4, 1, 'Contas Emitidas', '4'),
(5, 1, 'Contas Recebidas', '5'),
(6, 1, 'Contas a Receber', '1'),
(7, 1, 'Contas Canceladas', '2'),
(8, 1, 'Ocupadas', '32'),
(9, 1, 'Interditadas', '0'),
(10, 1, 'Venda', '10'),
(11, 1, 'Pedidos Cancelados', '2'),
(12, 1, 'Ocupacao', '64%'),
(13, 1, 'Consumidos', '4993.80'),
(14, 1, 'Depositos', '3468.70'),
(15, 1, 'Entradas Canceladas', '1'),
(16, 1, 'Update', '21/10/2015 17:22'),
(18, 1, 'Diarias', '20'),
(19, 1, 'Periodo', '10'),
(20, 1, 'Pernoite', '8'),
(21, 2, 'Inicio Turno', '21/10/2015 06:35'),
(22, 2, 'Tempo Turno', '10:12'),
(23, 2, 'Entradas', '10'),
(24, 2, 'Contas Emitidas', '2'),
(25, 2, 'Contas Recebidas', '8'),
(26, 2, 'Contas a Receber', '4'),
(27, 2, 'Contas Canceladas', '3'),
(28, 2, 'Ocupadas', '25'),
(29, 2, 'Interditadas', '0'),
(30, 2, 'Venda', '7'),
(31, 2, 'Pedidos Cancelados', '4'),
(32, 2, 'Ocupacao', '55%'),
(33, 2, 'Consumidos', '1219.43'),
(34, 2, 'Depositos', '4782.98'),
(35, 2, 'Entradas Canceladas', '2'),
(36, 2, 'Update', '21/10/2015 17:34'),
(37, 2, 'Diarias', '18'),
(38, 2, 'Periodo', '9'),
(39, 2, 'Pernoite', '4'),
(40, 3, 'Inicio Turno', '21/10/2015 05:58'),
(41, 3, 'Tempo Turno', '10:22'),
(42, 3, 'Entradas', '21'),
(43, 3, 'Contas Emitidas', '2'),
(44, 3, 'Contas Recebidas', '8'),
(45, 3, 'Contas a Receber', '10'),
(46, 3, 'Contas Canceladas', '4'),
(47, 3, 'Ocupadas', '29'),
(48, 3, 'Interditadas', '2'),
(49, 3, 'Venda', '9'),
(50, 3, 'Pedidos Cancelados', '3'),
(51, 3, 'Ocupacao', '77%'),
(52, 3, 'Consumidos', '833.80'),
(53, 3, 'Depositos', '6468.70'),
(54, 3, 'Entradas Canceladas', '3'),
(55, 3, 'Update', '21/10/2015 17:44'),
(56, 3, 'Diarias', '31'),
(57, 3, 'Periodo', '7'),
(58, 3, 'Pernoite', '3');

-- --------------------------------------------------------

--
-- Estrutura da tabela `hotel_suites`
--

DROP TABLE IF EXISTS `hotel_suites`;
CREATE TABLE IF NOT EXISTS `hotel_suites` (
  `hotelid` int(10) unsigned NOT NULL,
  `suiteid` int(10) unsigned NOT NULL,
  `descricao` varchar(100) NOT NULL,
  `status` varchar(100) NOT NULL,
  `previsaosaida` datetime NOT NULL,
  `atualizacao` datetime NOT NULL,
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Extraindo dados da tabela `hotel_suites`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `userid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `login` varchar(45) NOT NULL,
  `senha` varchar(45) NOT NULL,
  PRIMARY KEY (`userid`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Extraindo dados da tabela `user`
--

INSERT INTO `user` (`userid`, `login`, `senha`) VALUES
(1, 'admin', 'admin'),
(2, 'teste', 'teste');

-- --------------------------------------------------------

--
-- Estrutura da tabela `user_hotel`
--

DROP TABLE IF EXISTS `user_hotel`;
CREATE TABLE IF NOT EXISTS `user_hotel` (
  `userid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `hotelid` int(10) unsigned NOT NULL,
  PRIMARY KEY (`userid`,`hotelid`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Extraindo dados da tabela `user_hotel`
--

INSERT INTO `user_hotel` (`userid`, `hotelid`) VALUES
(1, 1),
(1, 3),
(2, 2);
