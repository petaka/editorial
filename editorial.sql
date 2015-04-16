-- phpMyAdmin SQL Dump
-- version 4.2.7
-- http://www.phpmyadmin.net
--
-- Host: localhost:3306
-- Generation Time: Apr 16, 2015 at 11:42 PM
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
-- Table structure for table `curso`
--

CREATE TABLE IF NOT EXISTS `curso` (
  `año` int(11) NOT NULL,
  `division` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `curso`
--

INSERT INTO `curso` (`año`, `division`) VALUES
(1, 'a');

-- --------------------------------------------------------

--
-- Table structure for table `escuela`
--

CREATE TABLE IF NOT EXISTS `escuela` (
`id` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `escuela`
--

INSERT INTO `escuela` (`id`, `nombre`) VALUES
(1, 'nombre');

-- --------------------------------------------------------

--
-- Table structure for table `persona`
--

CREATE TABLE IF NOT EXISTS `persona` (
  `dni` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `apellido` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `persona`
--

INSERT INTO `persona` (`dni`, `nombre`, `apellido`) VALUES
(111, 'nombre', 'apellido');

-- --------------------------------------------------------

--
-- Table structure for table `persona_escuela_curso`
--

CREATE TABLE IF NOT EXISTS `persona_escuela_curso` (
  `id_persona` int(11) NOT NULL,
  `id_escuela` int(11) NOT NULL,
  `id_curso` int(11) NOT NULL,
  `division` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `curso`
--
ALTER TABLE `curso`
 ADD PRIMARY KEY (`año`,`division`);

--
-- Indexes for table `escuela`
--
ALTER TABLE `escuela`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `persona`
--
ALTER TABLE `persona`
 ADD PRIMARY KEY (`dni`);

--
-- Indexes for table `persona_escuela_curso`
--
ALTER TABLE `persona_escuela_curso`
 ADD PRIMARY KEY (`id_persona`,`id_escuela`,`id_curso`,`division`), ADD KEY `id_persona` (`id_persona`), ADD KEY `id_escuela` (`id_escuela`), ADD KEY `id_curso` (`id_curso`), ADD KEY `division` (`division`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `escuela`
--
ALTER TABLE `escuela`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `persona_escuela_curso`
--
ALTER TABLE `persona_escuela_curso`
ADD CONSTRAINT `persona_escuela_curso_ibfk_1` FOREIGN KEY (`id_persona`) REFERENCES `escuela` (`id`),
ADD CONSTRAINT `persona_escuela_curso_ibfk_2` FOREIGN KEY (`id_escuela`) REFERENCES `persona` (`dni`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
