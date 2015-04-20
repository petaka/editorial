-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 20-04-2015 a las 03:11:34
-- Versión del servidor: 5.6.17
-- Versión de PHP: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `editorial`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cargo`
--

CREATE TABLE IF NOT EXISTS `cargo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Volcado de datos para la tabla `cargo`
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
-- Estructura de tabla para la tabla `curso`
--

CREATE TABLE IF NOT EXISTS `curso` (
  `grado` varchar(5) NOT NULL,
  `id_escuela` int(11) NOT NULL,
  PRIMARY KEY (`grado`,`id_escuela`),
  KEY `grado` (`grado`),
  KEY `grado_2` (`grado`),
  KEY `grado_3` (`grado`),
  KEY `id_escuela` (`id_escuela`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `curso`
--

INSERT INTO `curso` (`grado`, `id_escuela`) VALUES
('3A', 3),
('4A', 3),
('1B', 4),
('2C', 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `escuela`
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
-- Volcado de datos para la tabla `escuela`
--

INSERT INTO `escuela` (`id`, `nombre`, `turno`, `telefono`, `email`, `domicilio`, `localidad`, `cp`, `sector`, `distrito`, `ubicacion`, `provincia`, `observaciones`) VALUES
(3, 'CHAMPAGNAT', 'M', 4811, 'champagnat@maristas.com.ar', 'MONTEVIDEO 1050', 'CIUDAD DE BS AS', 1019, 'PRIVADO', '01', 'CIUDAD DE BS AS', 'CIUDAD DE BS AS', 'Ver a Coord. De lengua Marcela Casaubon'),
(4, 'DEL CARMEN', 'M', 812, '', 'PARAGUAY 1766', 'CIUDAD DE BS AS', 1062, 'PRIVADO', '01', 'CIUDAD DE BS AS', 'CIUDAD DE BS AS', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona`
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
  PRIMARY KEY (`dni`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `persona`
--

INSERT INTO `persona` (`dni`, `nombre`, `apellido`, `tipo_dni`, `fecha_nac`, `direccion`, `direccion2`, `ciudad`, `provincia`, `cp`, `pais`, `email`, `telefono`) VALUES
(1, 'ASSADFASFD', 'ZXCZX<C', '', '0000-00-00', '', '', '', '', 0, 0, '', 0),
(441, 'PATRICIA', 'FLORESTANO', 'NNN', '0000-00-00', 'Ascasubi 5671', '', 'CARAPACHAY', 'BUENOS AIRES', 0, 0, 'patriciaflorestano@hotmail.com', 4762),
(33270548, 'nombre', 'apellido', '', '0000-00-00', '', '', '', '', 0, 0, '0', 0),
(33270917, 'CSAfzxc', 'qewqer', '', '0000-00-00', '', '', '', '', 0, 0, '', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona_curso`
--

CREATE TABLE IF NOT EXISTS `persona_curso` (
  `dni` int(11) NOT NULL,
  `id_escuela` int(11) NOT NULL,
  `grado` varchar(5) NOT NULL,
  PRIMARY KEY (`dni`,`id_escuela`,`grado`),
  KEY `id_escuela` (`id_escuela`),
  KEY `id_curso` (`grado`),
  KEY `grado` (`grado`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona_escuela_cargo`
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
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `curso`
--
ALTER TABLE `curso`
  ADD CONSTRAINT `curso_ibfk_1` FOREIGN KEY (`id_escuela`) REFERENCES `escuela` (`id`);

--
-- Filtros para la tabla `persona_curso`
--
ALTER TABLE `persona_curso`
  ADD CONSTRAINT `persona_curso_ibfk_3` FOREIGN KEY (`grado`) REFERENCES `curso` (`grado`),
  ADD CONSTRAINT `persona_curso_ibfk_1` FOREIGN KEY (`dni`) REFERENCES `persona` (`dni`),
  ADD CONSTRAINT `persona_curso_ibfk_2` FOREIGN KEY (`id_escuela`) REFERENCES `escuela` (`id`);

--
-- Filtros para la tabla `persona_escuela_cargo`
--
ALTER TABLE `persona_escuela_cargo`
  ADD CONSTRAINT `persona_escuela_cargo_ibfk_3` FOREIGN KEY (`id_cargo`) REFERENCES `cargo` (`id`),
  ADD CONSTRAINT `persona_escuela_cargo_ibfk_1` FOREIGN KEY (`dni`) REFERENCES `persona` (`dni`),
  ADD CONSTRAINT `persona_escuela_cargo_ibfk_2` FOREIGN KEY (`id_escuela`) REFERENCES `escuela` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
