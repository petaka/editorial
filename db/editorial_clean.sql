-- phpMyAdmin SQL Dump
-- version 4.2.7
-- http://www.phpmyadmin.net
--
-- Host: localhost:3306
-- Generation Time: Apr 20, 2015 at 01:38 PM
-- Server version: 5.5.41-log
-- PHP Version: 5.6.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `editorial`
--

-- --------------------------------------------------------

--
-- Table structure for table `cargo`
--

CREATE TABLE IF NOT EXISTS `cargo` (
`id` int(11) NOT NULL,
  `descripcion` varchar(20) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `cargo`
--

INSERT INTO `cargo` (`id`, `descripcion`) VALUES
(1, 'Vicedirector/a'),
(2, 'Secretario/a'),
(3, 'Bibliotecario/a'),
(4, 'Director/a'),
(5, 'Coordinador/a'),
(6, 'Docente');

-- --------------------------------------------------------

--
-- Table structure for table `coleccion`
--

CREATE TABLE IF NOT EXISTS `coleccion` (
  `id_coleccion` int(11) NOT NULL,
  `descripcion` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `escuela`
--

CREATE TABLE IF NOT EXISTS `escuela` (
`id` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `turno` varchar(3) NOT NULL,
  `telefono` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `domicilio` varchar(50) NOT NULL,
  `localidad` varchar(20) NOT NULL,
  `cp` int(11) NOT NULL,
  `sector` varchar(20) NOT NULL,
  `distrito` varchar(20) NOT NULL,
  `ubicacion` varchar(20) NOT NULL,
  `provincia` varchar(20) NOT NULL,
  `observaciones` varchar(100) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

-- --------------------------------------------------------

--
-- Table structure for table `libro`
--

CREATE TABLE IF NOT EXISTS `libro` (
  `isbn` int(30) NOT NULL,
  `id_col` int(11) NOT NULL,
  `titulo` varchar(100) DEFAULT NULL,
  `codigo` varchar(10) DEFAULT NULL,
  `grados` varchar(10) DEFAULT NULL,
  `anio_lanzamiento` int(11) DEFAULT NULL,
  `paginas` int(11) DEFAULT NULL,
  `interior` varchar(100) DEFAULT NULL,
  `peso` varchar(100) DEFAULT NULL,
  `tamanio` varchar(100) DEFAULT NULL,
  `precio` float DEFAULT NULL,
  `codigo_barra` int(30) DEFAULT NULL,
  `imagen` varchar(300) DEFAULT NULL,
  `resumen` varchar(1000) DEFAULT NULL,
  `fecha_alta` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `libro_persona`
--

CREATE TABLE IF NOT EXISTS `libro_persona` (
  `isbn` int(30) NOT NULL,
  `dni` int(11) NOT NULL,
  `fecha` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `persona`
--

CREATE TABLE IF NOT EXISTS `persona` (
  `dni` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `apellido` varchar(50) NOT NULL,
  `tipo_dni` varchar(5) NOT NULL,
  `fecha_nac` date NOT NULL,
  `direccion` varchar(50) NOT NULL,
  `direccion2` varchar(50) NOT NULL,
  `ciudad` varchar(20) NOT NULL,
  `provincia` varchar(20) NOT NULL,
  `cp` int(11) NOT NULL,
  `pais` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `telefono` int(11) NOT NULL,
  `fecha_alta` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `persona_escuela`
--

CREATE TABLE IF NOT EXISTS `persona_escuela` (
  `dni` int(11) NOT NULL,
  `id_escuela` int(11) NOT NULL,
  `id_cargo` int(11) NOT NULL,
  `1_grado` tinyint(1) NOT NULL,
  `2_grado` tinyint(1) NOT NULL,
  `3_grado` tinyint(1) NOT NULL,
  `4_grado` tinyint(1) NOT NULL,
  `5_grado` tinyint(1) NOT NULL,
  `6_grado` tinyint(1) NOT NULL,
  `7_grado` tinyint(1) NOT NULL,
  `1_anio` tinyint(1) NOT NULL,
  `2_anio` tinyint(1) NOT NULL,
  `3_anio` tinyint(1) NOT NULL,
  `4_anio` tinyint(1) NOT NULL,
  `5_anio` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cargo`
--
ALTER TABLE `cargo`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `coleccion`
--
ALTER TABLE `coleccion`
 ADD PRIMARY KEY (`id_coleccion`);

--
-- Indexes for table `escuela`
--
ALTER TABLE `escuela`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `libro`
--
ALTER TABLE `libro`
 ADD PRIMARY KEY (`isbn`), ADD KEY `id_col` (`id_col`);

--
-- Indexes for table `libro_persona`
--
ALTER TABLE `libro_persona`
 ADD PRIMARY KEY (`isbn`,`dni`), ADD KEY `dni` (`dni`);

--
-- Indexes for table `persona`
--
ALTER TABLE `persona`
 ADD PRIMARY KEY (`dni`);

--
-- Indexes for table `persona_escuela`
--
ALTER TABLE `persona_escuela`
 ADD PRIMARY KEY (`dni`,`id_escuela`), ADD KEY `id_escuela` (`id_escuela`), ADD KEY `id_cargo` (`id_cargo`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cargo`
--
ALTER TABLE `cargo`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `escuela`
--
ALTER TABLE `escuela`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `libro`
--
ALTER TABLE `libro`
ADD CONSTRAINT `libro_ibfk_1` FOREIGN KEY (`id_col`) REFERENCES `coleccion` (`id_coleccion`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `libro_persona`
--
ALTER TABLE `libro_persona`
ADD CONSTRAINT `libro_persona_ibfk_2` FOREIGN KEY (`dni`) REFERENCES `persona` (`dni`),
ADD CONSTRAINT `libro_persona_ibfk_1` FOREIGN KEY (`isbn`) REFERENCES `libro` (`isbn`);

--
-- Constraints for table `persona_escuela`
--
ALTER TABLE `persona_escuela`
ADD CONSTRAINT `persona_escuela_ibfk_1` FOREIGN KEY (`dni`) REFERENCES `persona` (`dni`),
ADD CONSTRAINT `persona_escuela_ibfk_2` FOREIGN KEY (`id_escuela`) REFERENCES `escuela` (`id`),
ADD CONSTRAINT `persona_escuela_ibfk_3` FOREIGN KEY (`id_cargo`) REFERENCES `cargo` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
