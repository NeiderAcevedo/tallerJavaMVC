-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 18-08-2021 a las 13:42:19
-- Versión del servidor: 10.4.17-MariaDB
-- Versión de PHP: 8.0.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `aeropuerto`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `aviones`
--

CREATE TABLE `aviones` (
  `matriculaAvion` varchar(10) NOT NULL,
  `modeloAvion` varchar(10) NOT NULL,
  `cedulaPropietario` int(11) NOT NULL,
  `tipoContrato` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contratos`
--

CREATE TABLE `contratos` (
  `tipoContrato` int(2) NOT NULL,
  `valorContrato` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `hangares`
--

CREATE TABLE `hangares` (
  `codigoHangar` int(3) NOT NULL,
  `cuposTotales` int(2) NOT NULL,
  `cuposDisponibles` int(2) NOT NULL,
  `cuposReservados` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `hangares`
--

INSERT INTO `hangares` (`codigoHangar`, `cuposTotales`, `cuposDisponibles`, `cuposReservados`) VALUES
(160, 16, 16, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `hangares_aviones`
--

CREATE TABLE `hangares_aviones` (
  `codigoHangar` int(3) NOT NULL,
  `matriculaAvion` varchar(10) NOT NULL,
  `fechaIngreso` date NOT NULL,
  `numeroCelda` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `metodospago`
--

CREATE TABLE `metodospago` (
  `metodoPado` int(2) NOT NULL,
  `nombre` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `metodospago`
--

INSERT INTO `metodospago` (`metodoPado`, `nombre`) VALUES
(1, 'credito'),
(2, 'contado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `popietario`
--

CREATE TABLE `popietario` (
  `cedulaPropietario` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `metodoPago` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `popietario`
--

INSERT INTO `popietario` (`cedulaPropietario`, `nombre`, `metodoPago`) VALUES
(101010, 'James', 1),
(111111, 'Maluma', 2);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `aviones`
--
ALTER TABLE `aviones`
  ADD PRIMARY KEY (`matriculaAvion`),
  ADD KEY `cedulaPropietario` (`cedulaPropietario`),
  ADD KEY `tipoContrato` (`tipoContrato`);

--
-- Indices de la tabla `contratos`
--
ALTER TABLE `contratos`
  ADD PRIMARY KEY (`tipoContrato`);

--
-- Indices de la tabla `hangares`
--
ALTER TABLE `hangares`
  ADD PRIMARY KEY (`codigoHangar`);

--
-- Indices de la tabla `hangares_aviones`
--
ALTER TABLE `hangares_aviones`
  ADD KEY `matriculaAvion` (`matriculaAvion`),
  ADD KEY `codigoHangar` (`codigoHangar`);

--
-- Indices de la tabla `metodospago`
--
ALTER TABLE `metodospago`
  ADD PRIMARY KEY (`metodoPado`);

--
-- Indices de la tabla `popietario`
--
ALTER TABLE `popietario`
  ADD PRIMARY KEY (`cedulaPropietario`),
  ADD KEY `metodoPago` (`metodoPago`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `contratos`
--
ALTER TABLE `contratos`
  MODIFY `tipoContrato` int(2) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `hangares`
--
ALTER TABLE `hangares`
  MODIFY `codigoHangar` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=161;

--
-- AUTO_INCREMENT de la tabla `metodospago`
--
ALTER TABLE `metodospago`
  MODIFY `metodoPado` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `popietario`
--
ALTER TABLE `popietario`
  MODIFY `cedulaPropietario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=111112;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `aviones`
--
ALTER TABLE `aviones`
  ADD CONSTRAINT `cedulaPropietario` FOREIGN KEY (`cedulaPropietario`) REFERENCES `popietario` (`cedulaPropietario`),
  ADD CONSTRAINT `tipoContrato` FOREIGN KEY (`tipoContrato`) REFERENCES `contratos` (`tipoContrato`);

--
-- Filtros para la tabla `hangares_aviones`
--
ALTER TABLE `hangares_aviones`
  ADD CONSTRAINT `codigoHangar` FOREIGN KEY (`codigoHangar`) REFERENCES `hangares` (`codigoHangar`),
  ADD CONSTRAINT `matriculaAvion` FOREIGN KEY (`matriculaAvion`) REFERENCES `aviones` (`matriculaAvion`);

--
-- Filtros para la tabla `popietario`
--
ALTER TABLE `popietario`
  ADD CONSTRAINT `metodoPago` FOREIGN KEY (`metodoPago`) REFERENCES `metodospago` (`metodoPado`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
