-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 12-01-2024 a las 09:42:18
-- Versión del servidor: 8.0.31
-- Versión de PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `usuarios`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `supermercado`
--

CREATE TABLE `supermercado` (
  `id_producto` int NOT NULL,
  `nombre` varchar(50) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `cantidad` int NOT NULL,
  `precio` DECIMAL(10,2) NOT NULL,
  `categoria` varchar(50) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `foto` varchar(200) COLLATE utf8mb4_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `supermercado`
--

INSERT INTO `supermercado` (`id_producto`, `nombre`, `cantidad`, `precio`, `categoria`, `foto`) VALUES
(1, 'Naranja especial para zumo malla 4 Kg', 2, 3.75, 'Frutas y verduras', 'https://dia.es/product_images/13627/13627_ISO_0_ES.jpg?imwidth=340'),
(2, 'Banana granel 500 g', 2, 0.56, 'Frutas y verduras', 'https://dia.es/product_images/42070/42070_ISO_0_ES.jpg?imwidth=340'),
(3, 'Manzana golden bolsa 1 Kg', 2, 1.49, 'Frutas y verduras', 'https://dia.es/product_images/171233/171233_ISO_0_ES.jpg?imwidth=340'),
(4, 'Filete de cinta de lomo tierno Selección de Dia bandeja 300 g', 2, 2.15, 'Carnicería', 'https://dia.es/product_images/166223/166223_ISO_0_ES.jpg?imwidth=340'),
(5, 'Champiñón entero bandeja 250 g', 2, 1.00, 'Verduras', 'https://dia.es/product_images/271527/271527_ISO_0_ES.jpg?imwidth=340'),
(6, 'Solomillo de pollo Selección de Dia bandeja 400 g', 2, 2.88, 'Carnicería', 'https://dia.es/product_images/261354/261354_ISO_0_ES.jpg?imwidth=340'),
(7, 'Hamburguesas de vacuno Selección de Dia bandeja 540 g', 2, 3.89, 'Carnicería', 'https://dia.es/product_images/244790/244790_ISO_0_ES.jpg?imwidth=340'),
(8, 'Mandarina granel 500 g', 2, 1.05, 'Frutas y verduras', 'https://dia.es/product_images/84/84_ISO_0_ES.jpg?imwidth=340'),
(9, 'Plátano de canarias bolsa 1.2 Kg', 2, 2.39, 'Frutas y verduras', 'https://dia.es/product_images/11468/11468_ISO_0_ES.jpg?imwidth=340'),
(10, 'Manzana fuji bolsa 1 Kg', 2, 2.19, 'Frutas y verduras', 'https://dia.es/product_images/54268/54268_ISO_0_ES.jpg?imwidth=340'),
(11, 'Cebolla dulce granel 1 Kg', 2, 1.99, 'Verduras', 'https://dia.es/product_images/45862/45862_ISO_0_ES.jpg?imwidth=340');
--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `supermercado`
--
ALTER TABLE `supermercado`
  ADD PRIMARY KEY (`id_producto`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `supermercado`
--
ALTER TABLE `supermercado`
  MODIFY `id_producto` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
