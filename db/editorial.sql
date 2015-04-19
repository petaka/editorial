-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Apr 19, 2015 at 07:23 PM
-- Server version: 5.6.17
-- PHP Version: 5.5.12

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
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `curso_escuela`
--

CREATE TABLE IF NOT EXISTS `curso_escuela` (
  `grado` int(11) NOT NULL,
  `id_escuela` int(11) NOT NULL,
  `division` varchar(1) NOT NULL,
  PRIMARY KEY (`grado`,`id_escuela`,`division`),
  KEY `id_escuela` (`id_escuela`),
  KEY `grado` (`grado`,`id_escuela`),
  KEY `grado_2` (`grado`,`id_escuela`),
  KEY `division` (`division`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `curso_escuela`
--

INSERT INTO `curso_escuela` (`grado`, `id_escuela`, `division`) VALUES
(4, 3, 'A'),
(4, 3, 'B');

-- --------------------------------------------------------

--
-- Table structure for table `escuela`
--

CREATE TABLE IF NOT EXISTS `escuela` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
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
  `observaciones` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `escuela`
--

INSERT INTO `escuela` (`id`, `nombre`, `turno`, `telefono`, `email`, `domicilio`, `localidad`, `cp`, `sector`, `distrito`, `ubicacion`, `provincia`, `observaciones`) VALUES
(3, 'CHAMPAGNAT', 'M', 4811, 'champagnat@maristas.com.ar', 'MONTEVIDEO 1050', 'CIUDAD DE BS AS', 1019, 'PRIVADO', '01', 'CIUDAD DE BS AS', 'CIUDAD DE BS AS', 'Ver a Coord. De lengua Marcela Casaubon'),
(4, 'DEL CARMEN', 'M', 812, '', 'PARAGUAY 1766', 'CIUDAD DE BS AS', 1062, 'PRIVADO', '01', 'CIUDAD DE BS AS', 'CIUDAD DE BS AS', '');

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
  `email` int(11) NOT NULL,
  `telefono` int(11) NOT NULL,
  PRIMARY KEY (`dni`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `persona`
--

INSERT INTO `persona` (`dni`, `nombre`, `apellido`, `tipo_dni`, `fecha_nac`, `direccion`, `direccion2`, `ciudad`, `provincia`, `cp`, `pais`, `email`, `telefono`) VALUES
(33270548, 'nombre', 'apellido', '', '0000-00-00', '', '', '', '', 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `persona_curso`
--

CREATE TABLE IF NOT EXISTS `persona_curso` (
  `dni` int(11) NOT NULL,
  `id_escuela` int(11) NOT NULL,
  `grado` int(11) NOT NULL,
  `division` varchar(1) NOT NULL,
  `materia` varchar(30) NOT NULL,
  PRIMARY KEY (`dni`,`id_escuela`,`grado`,`division`),
  KEY `id_escuela` (`id_escuela`),
  KEY `grado` (`grado`),
  KEY `division` (`division`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `persona_escuela`
--

CREATE TABLE IF NOT EXISTS `persona_escuela` (
  `dni` int(11) NOT NULL,
  `id_escuela` int(11) NOT NULL,
  PRIMARY KEY (`dni`,`id_escuela`),
  KEY `id_escuela` (`id_escuela`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `persona_escuela_cargo`
--

CREATE TABLE IF NOT EXISTS `persona_escuela_cargo` (
  `dni` int(11) NOT NULL,
  `id_escuela` int(11) NOT NULL,
  `id_cargo` int(11) NOT NULL,
  PRIMARY KEY (`dni`,`id_escuela`,`id_cargo`),
  KEY `id_escuela` (`id_escuela`),
  KEY `id_cargo` (`id_cargo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `curso_escuela`
--
ALTER TABLE `curso_escuela`
  ADD CONSTRAINT `curso_escuela_ibfk_1` FOREIGN KEY (`id_escuela`) REFERENCES `escuela` (`id`);

--
-- Constraints for table `persona_curso`
--
ALTER TABLE `persona_curso`
  ADD CONSTRAINT `persona_curso_ibfk_1` FOREIGN KEY (`dni`) REFERENCES `persona` (`dni`),
  ADD CONSTRAINT `persona_curso_ibfk_2` FOREIGN KEY (`id_escuela`) REFERENCES `curso_escuela` (`id_escuela`),
  ADD CONSTRAINT `persona_curso_ibfk_3` FOREIGN KEY (`grado`) REFERENCES `curso_escuela` (`grado`),
  ADD CONSTRAINT `persona_curso_ibfk_4` FOREIGN KEY (`division`) REFERENCES `curso_escuela` (`division`);

--
-- Constraints for table `persona_escuela`
--
ALTER TABLE `persona_escuela`
  ADD CONSTRAINT `persona_escuela_ibfk_2` FOREIGN KEY (`id_escuela`) REFERENCES `escuela` (`id`),
  ADD CONSTRAINT `persona_escuela_ibfk_1` FOREIGN KEY (`dni`) REFERENCES `persona` (`dni`);

--
-- Constraints for table `persona_escuela_cargo`
--
ALTER TABLE `persona_escuela_cargo`
  ADD CONSTRAINT `persona_escuela_cargo_ibfk_3` FOREIGN KEY (`id_cargo`) REFERENCES `cargo` (`id`),
  ADD CONSTRAINT `persona_escuela_cargo_ibfk_1` FOREIGN KEY (`dni`) REFERENCES `persona` (`dni`),
  ADD CONSTRAINT `persona_escuela_cargo_ibfk_2` FOREIGN KEY (`id_escuela`) REFERENCES `escuela` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
