-- phpMyAdmin SQL Dump
-- version 4.2.7
-- http://www.phpmyadmin.net
--
-- Host: localhost:3306
-- Generation Time: Apr 20, 2015 at 12:09 AM
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
-- Table structure for table `coleccion`
--

CREATE TABLE IF NOT EXISTS `coleccion` (
  `id_coleccion` int(11) NOT NULL,
  `descripcion` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `coleccion`
--

INSERT INTO `coleccion` (`id_coleccion`, `descripcion`) VALUES
(1, '"Cuentos clásicos"');

-- --------------------------------------------------------

--
-- Table structure for table `libro`
--

CREATE TABLE IF NOT EXISTS `libro` (
  `id_libro` varchar(20) NOT NULL,
  `codigo` varchar(10) NOT NULL,
  `titulo` varchar(50) NOT NULL,
  `grados` int(11) NOT NULL,
  `id_coleccion` int(11) NOT NULL,
  `año_lanzamiento` int(11) NOT NULL,
  `paginas` int(11) NOT NULL,
  `interior` varchar(50) NOT NULL,
  `peso` float NOT NULL,
  `tamaño` varchar(25) NOT NULL,
  `precio` float NOT NULL,
  `cod_barra` int(15) NOT NULL,
  `imagen` int(11) NOT NULL,
  `resumen` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `libro`
--

INSERT INTO `libro` (`id_libro`, `codigo`, `titulo`, `grados`, `id_coleccion`, `año_lanzamiento`, `paginas`, `interior`, `peso`, `tamaño`, `precio`, `cod_barra`, `imagen`, `resumen`) VALUES
('1', '1', 'titulo', 1, 1, 1, 1, 'interior', 1, 'tamaño', 2, 1, 1, 'resumen');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `coleccion`
--
ALTER TABLE `coleccion`
 ADD PRIMARY KEY (`id_coleccion`);

--
-- Indexes for table `libro`
--
ALTER TABLE `libro`
 ADD PRIMARY KEY (`id_libro`), ADD KEY `coleccion` (`id_coleccion`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `libro`
--
ALTER TABLE `libro`
ADD CONSTRAINT `libro_ibfk_1` FOREIGN KEY (`id_coleccion`) REFERENCES `coleccion` (`id_coleccion`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
