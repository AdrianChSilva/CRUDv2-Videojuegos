-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 02-05-2018 a las 12:51:50
-- Versión del servidor: 10.1.31-MariaDB
-- Versión de PHP: 7.2.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `tiendavideojuegos`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `det_factura`
--

CREATE TABLE `det_factura` (
  `CodDetFact` int(11) NOT NULL,
  `CodVideojuegos` int(11) NOT NULL,
  `Cantidad` int(11) NOT NULL,
  `Precio` float NOT NULL,
  `Factura_idFactura` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `det_factura`
--

INSERT INTO `det_factura` (`CodDetFact`, `CodVideojuegos`, `Cantidad`, `Precio`, `Factura_idFactura`) VALUES
(1, 39, 1, 60, 1),
(2, 37, 1, 40, 1),
(3, 2, 1, 60, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factura`
--

CREATE TABLE `factura` (
  `idFactura` int(11) NOT NULL,
  `CodSocios` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `factura`
--

INSERT INTO `factura` (`idFactura`, `CodSocios`) VALUES
(1, 1),
(4, 2),
(5, 4),
(3, 7),
(2, 8);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `socios`
--

CREATE TABLE `socios` (
  `CodSocios` int(11) NOT NULL,
  `DNI` varchar(9) COLLATE utf8_spanish_ci NOT NULL,
  `nombre` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `apellidos` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `telefono` varchar(9) COLLATE utf8_spanish_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `genero` varchar(20) COLLATE utf8_spanish_ci DEFAULT NULL,
  `direccion` text COLLATE utf8_spanish_ci,
  `asociado` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `socios`
--

INSERT INTO `socios` (`CodSocios`, `DNI`, `nombre`, `apellidos`, `telefono`, `email`, `genero`, `direccion`, `asociado`) VALUES
(1, '11122233A', 'Pepito', 'Perez', '666777888', 'aaaaa@gmail.com', 'M', 'C/Algarabias', 'paco antonio'),
(2, '22233344B', 'Adolfino', 'Mussolini', '666888999', 'adolfH@gmail.com', 'M', 'C/Cómpeta', 'Francisco F.'),
(3, '77788844C', 'Stephen', 'Hawkers', '765888222', 'blackhole@gmail.com', 'M', 'C/Cautivo', 'Sheldon Cooper'),
(4, '99988877J', 'Tomasa', 'Aduriz', '741852963', 'madretomasa@gmail.com', 'F', 'C/Ramblas', 'Aziz Agdouri'),
(5, '37894651C', 'Adrian', 'Silva', '650744655', 'acs@gmail.com', 'M', 'C/alejandro pusk', 'Jose'),
(7, '68495712K', 'Susana', 'Melendez', '665889223', 'susm@gmail.com', 'F', 'C/Puerta', 'Rosa'),
(8, '23654789B', 'Celia', 'Dona', '650744600', 'wedwed@gmail.com', 'F', 'null', 'Ani'),
(9, '85798321H', 'Clemen', 'Tina', '651324786', 'mandarina@gmail.com', 'f', 'C/fruteria', 'Avocado3');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `videojuegos`
--

CREATE TABLE `videojuegos` (
  `CodVideojuegos` int(11) NOT NULL,
  `titulo` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `plataforma` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `desarrolladora` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `publisher` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `precio` float DEFAULT NULL,
  `stock` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `videojuegos`
--

INSERT INTO `videojuegos` (`CodVideojuegos`, `titulo`, `plataforma`, `desarrolladora`, `publisher`, `precio`, `stock`) VALUES
(1, 'CODWWII', 'PS4', 'Sledghe Hammer', 'Activision', 70, 80),
(2, 'Battlefield 1', 'PC', 'DICE', 'EA', 60, 20),
(3, 'ioñuio', 'Xbox One', 'uio', 'uio', 78, 89),
(5, 'Sea of thieves', 'Xbox One', 'Rare', 'Microsoft', 70, 20),
(6, 'Gears of War 4', 'Xbox One', 'EPIC', 'Microsoft', 70, 50),
(7, 'Shadow of the Colossus', 'PS4', 'Bluehole', 'Sony', 40, 50),
(8, 'Uncharted 4', 'PS4', 'Naughty Dog', 'Sony', 70, 80),
(11, 'Forza 6', 'Xbox One', 'Microsoft', 'Microsoft', 60, 60),
(21, 'Captain Toad', 'Switch', 'Nintendo', 'Nintendo', 65, 50),
(23, 'Smash Bros', 'Switch', 'Nintendo', 'Nintendo', 65, 60),
(24, 'Super Smash Bros', 'Switch', 'Nintendo', 'Nintendo', 65, 0),
(26, 'The legendof Zelda: Breath of the wild', 'Switch', 'Nintendo', 'Nintendo', 70, 0),
(27, 'Super Mario Odyssey', 'Switch', 'Nintendo', 'Nintendo', 69, 0),
(28, 'Forza6', 'Xbox One', 'Microsoft', 'Microsoft', 60, 0),
(32, 'CODWWII', 'Xbox One', 'Sledghe Hammer', 'Activision', 70, 90),
(33, 'Fifa 18', 'PS4', 'EA SPORTS', 'EA', 70, 90),
(34, 'Minit', 'PC', 'Devolver', 'Devolver', 30, 10),
(35, 'Mass Effect', 'Xbox One', 'BioWare', 'EA', 60, 120),
(36, 'Mass Effect', 'PS4', 'BioWare', 'EA', 60, 120),
(37, 'Firewatch', 'Switch', 'Campo Santo', 'Campo Santo', 40, 20),
(38, 'DarkSouls Remastered', 'Switch', 'From Software', 'Bandai NAMCO', 65, 50),
(39, 'DarkSouls III', 'PS4', 'From Software', 'Bandai NAMCO', 70, 35),
(40, 'DarkSouls III', 'Xbox One', 'From Software', 'Bandai NAMCO', 70, 35),
(41, 'DarkSouls III', 'PC', 'From Software', 'Bandai NAMCO', 50, 35),
(42, 'DarkSouls II', 'PS4', 'From Software', 'Bandai Namco', 40, 100),
(43, 'Vampyr', 'PC', 'Bethesda', 'Bethesda', 70, 50);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `det_factura`
--
ALTER TABLE `det_factura`
  ADD PRIMARY KEY (`CodDetFact`),
  ADD KEY `CodVideojuegos_idx` (`CodVideojuegos`),
  ADD KEY `fk_Det_Factura_Factura1_idx` (`Factura_idFactura`);

--
-- Indices de la tabla `factura`
--
ALTER TABLE `factura`
  ADD PRIMARY KEY (`idFactura`),
  ADD KEY `CodSocios_idx` (`CodSocios`);

--
-- Indices de la tabla `socios`
--
ALTER TABLE `socios`
  ADD PRIMARY KEY (`CodSocios`),
  ADD UNIQUE KEY `DNI_UNIQUE` (`DNI`);

--
-- Indices de la tabla `videojuegos`
--
ALTER TABLE `videojuegos`
  ADD PRIMARY KEY (`CodVideojuegos`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `factura`
--
ALTER TABLE `factura`
  MODIFY `idFactura` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `socios`
--
ALTER TABLE `socios`
  MODIFY `CodSocios` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `det_factura`
--
ALTER TABLE `det_factura`
  ADD CONSTRAINT `CodVideojuegos` FOREIGN KEY (`CodVideojuegos`) REFERENCES `videojuegos` (`CodVideojuegos`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Det_Factura_Factura1` FOREIGN KEY (`Factura_idFactura`) REFERENCES `factura` (`idFactura`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `factura`
--
ALTER TABLE `factura`
  ADD CONSTRAINT `CodSocios` FOREIGN KEY (`CodSocios`) REFERENCES `socios` (`CodSocios`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
