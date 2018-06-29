-- phpMyAdmin SQL Dump
-- version 4.8.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 29-06-2018 a las 23:04:00
-- Versión del servidor: 10.1.32-MariaDB
-- Versión de PHP: 7.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `fabin`
--
CREATE DATABASE IF NOT EXISTS `fabin` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `fabin`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `acciones`
--

DROP TABLE IF EXISTS `acciones`;
CREATE TABLE IF NOT EXISTS `acciones` (
  `id_accion` varchar(30) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `descrjipcion` varchar(30) NOT NULL,
  PRIMARY KEY (`id_accion`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Truncar tablas antes de insertar `acciones`
--

TRUNCATE TABLE `acciones`;
-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `articulos`
--

DROP TABLE IF EXISTS `articulos`;
CREATE TABLE IF NOT EXISTS `articulos` (
  `id_articulo` varchar(30) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `id_impiuesto` int(11) NOT NULL,
  `Id_categoria` int(11) NOT NULL,
  `id_unidad_mediad` varchar(30) NOT NULL,
  `activo` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_articulo`),
  UNIQUE KEY `articulos_idx` (`nombre`,`id_unidad_mediad`) USING BTREE,
  KEY `unidad_medida_articulos_fk` (`id_unidad_mediad`) USING BTREE,
  KEY `porcentaje_impuesto_articulos_fk` (`id_impiuesto`) USING BTREE,
  KEY `categoria_articulo_articulos_fk` (`Id_categoria`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Truncar tablas antes de insertar `articulos`
--

TRUNCATE TABLE `articulos`;
-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auditorias`
--

DROP TABLE IF EXISTS `auditorias`;
CREATE TABLE IF NOT EXISTS `auditorias` (
  `id_auditoria` int(11) NOT NULL,
  `fecha_acceso` varchar(30) NOT NULL,
  `id_accion` varchar(30) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  PRIMARY KEY (`id_auditoria`),
  UNIQUE KEY `auditorias_idx` (`fecha_acceso`) USING BTREE,
  KEY `acciones_auditorias_fk` (`id_accion`) USING BTREE,
  KEY `usuarios_auditorias_fk` (`id_usuario`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Truncar tablas antes de insertar `auditorias`
--

TRUNCATE TABLE `auditorias`;
-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria_articulo`
--

DROP TABLE IF EXISTS `categoria_articulo`;
CREATE TABLE IF NOT EXISTS `categoria_articulo` (
  `Id_categoria` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) NOT NULL,
  `descripcion_larga` varchar(30) NOT NULL,
  `activo` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`Id_categoria`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Truncar tablas antes de insertar `categoria_articulo`
--

TRUNCATE TABLE `categoria_articulo`;
-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

DROP TABLE IF EXISTS `cliente`;
CREATE TABLE IF NOT EXISTS `cliente` (
  `Id_cliente` varchar(30) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `razon_social` varchar(30) NOT NULL,
  `Nombre` varchar(30) NOT NULL,
  `telefon` varchar(30) NOT NULL,
  `direccion_fiscal` varchar(30) NOT NULL,
  PRIMARY KEY (`Id_cliente`),
  KEY `usuarios_cliente_fk` (`id_usuario`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Truncar tablas antes de insertar `cliente`
--

TRUNCATE TABLE `cliente`;
-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estatus`
--

DROP TABLE IF EXISTS `estatus`;
CREATE TABLE IF NOT EXISTS `estatus` (
  `id_estatus` varchar(30) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  PRIMARY KEY (`id_estatus`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Truncar tablas antes de insertar `estatus`
--

TRUNCATE TABLE `estatus`;
-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `formas_de_pago`
--

DROP TABLE IF EXISTS `formas_de_pago`;
CREATE TABLE IF NOT EXISTS `formas_de_pago` (
  `id_forma_de_pago` varchar(30) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `id_tipo_forma_de_pago` varchar(30) NOT NULL,
  `descripcion_larga` varchar(30) NOT NULL,
  `activo` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_forma_de_pago`),
  KEY `tipo_forma_de_pago_formas_de_pago_fk` (`id_tipo_forma_de_pago`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Truncar tablas antes de insertar `formas_de_pago`
--

TRUNCATE TABLE `formas_de_pago`;
-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `nivel_usuario`
--

DROP TABLE IF EXISTS `nivel_usuario`;
CREATE TABLE IF NOT EXISTS `nivel_usuario` (
  `id_usuario_tipo_usuario` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(30) NOT NULL,
  PRIMARY KEY (`id_usuario_tipo_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Truncar tablas antes de insertar `nivel_usuario`
--

TRUNCATE TABLE `nivel_usuario`;
-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `porcentaje_impuesto`
--

DROP TABLE IF EXISTS `porcentaje_impuesto`;
CREATE TABLE IF NOT EXISTS `porcentaje_impuesto` (
  `id_impiuesto` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) NOT NULL,
  `porcentaje` decimal(8,5) NOT NULL,
  `activo` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_impiuesto`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Truncar tablas antes de insertar `porcentaje_impuesto`
--

TRUNCATE TABLE `porcentaje_impuesto`;
-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `precios`
--

DROP TABLE IF EXISTS `precios`;
CREATE TABLE IF NOT EXISTS `precios` (
  `id_precio` varchar(30) NOT NULL,
  `id_tipo_precio` varchar(30) NOT NULL,
  `id_stock` varchar(30) NOT NULL,
  `precio` decimal(24,5) NOT NULL,
  PRIMARY KEY (`id_precio`),
  UNIQUE KEY `precios_idx` (`id_stock`,`precio`) USING BTREE,
  KEY `tipos_de_precio_precios_fk` (`id_tipo_precio`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Truncar tablas antes de insertar `precios`
--

TRUNCATE TABLE `precios`;
-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `stock`
--

DROP TABLE IF EXISTS `stock`;
CREATE TABLE IF NOT EXISTS `stock` (
  `id_stock` varchar(30) NOT NULL,
  `cantidad` varchar(30) NOT NULL,
  `id_articulo` varchar(30) NOT NULL,
  `id_tipo_precio` varchar(30) NOT NULL,
  `activo` tinyint(4) NOT NULL DEFAULT '1',
  `fecha_agregado` datetime NOT NULL,
  PRIMARY KEY (`id_stock`),
  UNIQUE KEY `stock_idx` (`id_articulo`,`id_tipo_precio`) USING BTREE,
  KEY `tipos_de_precio_stock_fk` (`id_tipo_precio`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Truncar tablas antes de insertar `stock`
--

TRUNCATE TABLE `stock`;
-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipos_de_precio`
--

DROP TABLE IF EXISTS `tipos_de_precio`;
CREATE TABLE IF NOT EXISTS `tipos_de_precio` (
  `id_tipo_precio` varchar(30) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `descripcion_larga` varchar(30) NOT NULL,
  `activo` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_tipo_precio`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Truncar tablas antes de insertar `tipos_de_precio`
--

TRUNCATE TABLE `tipos_de_precio`;
-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_forma_de_pago`
--

DROP TABLE IF EXISTS `tipo_forma_de_pago`;
CREATE TABLE IF NOT EXISTS `tipo_forma_de_pago` (
  `id_tipo_forma_de_pago` varchar(30) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  PRIMARY KEY (`id_tipo_forma_de_pago`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Truncar tablas antes de insertar `tipo_forma_de_pago`
--

TRUNCATE TABLE `tipo_forma_de_pago`;
-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `unidad_medida`
--

DROP TABLE IF EXISTS `unidad_medida`;
CREATE TABLE IF NOT EXISTS `unidad_medida` (
  `id_unidad_mediad` varchar(30) NOT NULL,
  `descripcion` varchar(30) NOT NULL,
  `descripcion_larga` varchar(30) NOT NULL,
  `activo` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_unidad_mediad`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Truncar tablas antes de insertar `unidad_medida`
--

TRUNCATE TABLE `unidad_medida`;
-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE IF NOT EXISTS `usuarios` (
  `id_usuario` int(11) NOT NULL AUTO_INCREMENT,
  `id_usuario_tipo_usuario` int(11) NOT NULL,
  `email` varchar(30) NOT NULL,
  `contrasenha` varchar(30) NOT NULL,
  `activo` tinyint(4) NOT NULL DEFAULT '1',
  `fecha_creacion` varchar(30) NOT NULL,
  `fecha_actualizacion` varchar(30) NOT NULL,
  PRIMARY KEY (`id_usuario`),
  KEY `nivel_usuario_usuarios_fk` (`id_usuario_tipo_usuario`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Truncar tablas antes de insertar `usuarios`
--

TRUNCATE TABLE `usuarios`;
-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

DROP TABLE IF EXISTS `ventas`;
CREATE TABLE IF NOT EXISTS `ventas` (
  `id_venta` varchar(30) NOT NULL,
  `Id_cliente` varchar(30) NOT NULL,
  `id_estatus` varchar(30) NOT NULL,
  `id_forma_de_pago` varchar(30) NOT NULL,
  `fecha_venta` datetime NOT NULL,
  PRIMARY KEY (`id_venta`),
  KEY `formas_de_pago_ventas_fk` (`id_forma_de_pago`) USING BTREE,
  KEY `estatus_ventas_fk` (`id_estatus`) USING BTREE,
  KEY `cliente_ventas_fk` (`Id_cliente`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Truncar tablas antes de insertar `ventas`
--

TRUNCATE TABLE `ventas`;
-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas_detalles`
--

DROP TABLE IF EXISTS `ventas_detalles`;
CREATE TABLE IF NOT EXISTS `ventas_detalles` (
  `id_stock` varchar(30) NOT NULL,
  `id_precio` varchar(30) NOT NULL,
  `id_venta` varchar(30) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precio_unitario` decimal(21,2) NOT NULL,
  `precio_unitario_con_impuesto` decimal(21,2) NOT NULL,
  PRIMARY KEY (`id_stock`),
  KEY `ventas_ventas_detalles_fk` (`id_venta`) USING BTREE,
  KEY `precios_ventas_detalles_fk` (`id_precio`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Truncar tablas antes de insertar `ventas_detalles`
--

TRUNCATE TABLE `ventas_detalles`;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `articulos`
--
ALTER TABLE `articulos`
  ADD CONSTRAINT `categoria_articulo_articulos_fk` FOREIGN KEY (`Id_categoria`) REFERENCES `categoria_articulo` (`Id_categoria`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `porcentaje_impuesto_articulos_fk` FOREIGN KEY (`id_impiuesto`) REFERENCES `porcentaje_impuesto` (`id_impiuesto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `unidad_medida_articulos_fk` FOREIGN KEY (`id_unidad_mediad`) REFERENCES `unidad_medida` (`id_unidad_mediad`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `auditorias`
--
ALTER TABLE `auditorias`
  ADD CONSTRAINT `acciones_auditorias_fk` FOREIGN KEY (`id_accion`) REFERENCES `acciones` (`id_accion`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `usuarios_auditorias_fk` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD CONSTRAINT `usuarios_cliente_fk` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `formas_de_pago`
--
ALTER TABLE `formas_de_pago`
  ADD CONSTRAINT `tipo_forma_de_pago_formas_de_pago_fk` FOREIGN KEY (`id_tipo_forma_de_pago`) REFERENCES `tipo_forma_de_pago` (`id_tipo_forma_de_pago`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `precios`
--
ALTER TABLE `precios`
  ADD CONSTRAINT `stock_precios_fk` FOREIGN KEY (`id_stock`) REFERENCES `stock` (`id_stock`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `tipos_de_precio_precios_fk` FOREIGN KEY (`id_tipo_precio`) REFERENCES `tipos_de_precio` (`id_tipo_precio`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `stock`
--
ALTER TABLE `stock`
  ADD CONSTRAINT `articulos_stock_fk` FOREIGN KEY (`id_articulo`) REFERENCES `articulos` (`id_articulo`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `nivel_usuario_usuarios_fk` FOREIGN KEY (`id_usuario_tipo_usuario`) REFERENCES `nivel_usuario` (`id_usuario_tipo_usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD CONSTRAINT `cliente_ventas_fk` FOREIGN KEY (`Id_cliente`) REFERENCES `cliente` (`Id_cliente`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `estatus_ventas_fk` FOREIGN KEY (`id_estatus`) REFERENCES `estatus` (`id_estatus`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `formas_de_pago_ventas_fk` FOREIGN KEY (`id_forma_de_pago`) REFERENCES `formas_de_pago` (`id_forma_de_pago`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `ventas_detalles`
--
ALTER TABLE `ventas_detalles`
  ADD CONSTRAINT `precios_ventas_detalles_fk` FOREIGN KEY (`id_precio`) REFERENCES `precios` (`id_precio`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `ventas_ventas_detalles_fk` FOREIGN KEY (`id_venta`) REFERENCES `ventas` (`id_venta`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
