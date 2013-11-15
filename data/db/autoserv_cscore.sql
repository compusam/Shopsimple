-- phpMyAdmin SQL Dump
-- version 4.0.4.1
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 01-11-2013 a las 16:17:12
-- Versión del servidor: 5.5.31
-- Versión de PHP: 5.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `autoserv_cscore`
--
CREATE DATABASE IF NOT EXISTS `autoserv_cscore` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `autoserv_cscore`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cart`
--

CREATE TABLE IF NOT EXISTS `cart` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `quantity` int(10) unsigned NOT NULL,
  `price` float(20,5) unsigned NOT NULL,
  `fees` float(20,5) unsigned NOT NULL DEFAULT '0.00000',
  `line_total` float(20,5) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`,`product_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=13 ;

--
-- Volcado de datos para la tabla `cart`
--

INSERT INTO `cart` (`id`, `user_id`, `product_id`, `quantity`, `price`, `fees`, `line_total`) VALUES
(1, 1, 5, 1, 974.00000, 0.00000, 974.00000),
(2, 1, 7, 3, 2382.00000, 0.00000, 2382.00000);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `category`
--

CREATE TABLE IF NOT EXISTS `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_parent` int(10) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8_spanish2_ci NOT NULL,
  `description` text COLLATE utf8_spanish2_ci NOT NULL,
  `thumb_img` varchar(125) COLLATE utf8_spanish2_ci NOT NULL,
  `full_img` varchar(125) COLLATE utf8_spanish2_ci NOT NULL,
  `last_update` int(10) unsigned NOT NULL,
  `category_order` int(10) unsigned NOT NULL,
  `category_status` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=7 ;

--
-- Volcado de datos para la tabla `category`
--

INSERT INTO `category` (`id`, `id_parent`, `name`, `description`, `thumb_img`, `full_img`, `last_update`, `category_order`, `category_status`) VALUES
(1, 0, 'Artículos de Viaje', '', 'viaje.png', '', 1372783986, 1, 1),
(2, 0, 'Aventura', '', 'aventura.png', '', 1372783987, 2, 1),
(3, 0, 'Hogar', '', 'hogar.png', '', 1372783988, 3, 1),
(4, 0, 'Entretenimiento', '', 'entretenimiento.png', '', 1372783989, 4, 1),
(5, 0, 'Para Él', '', 'parael.png', '', 1372783990, 5, 1),
(6, 0, 'Para Ella', '', 'paraella.png', '', 1372783991, 6, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `credits`
--

CREATE TABLE IF NOT EXISTS `credits` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `credit` int(10) unsigned NOT NULL,
  `last_update` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `credits`
--

INSERT INTO `credits` (`id`, `user_id`, `credit`, `last_update`) VALUES
(1, 1, 750, 1382467007),
(2, 13, 31188, 1382467007);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `credits_history`
--

CREATE TABLE IF NOT EXISTS `credits_history` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_period` int(10) unsigned NOT NULL,
  `id_username` int(10) unsigned NOT NULL,
  `credits` int(10) unsigned NOT NULL,
  `payments` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=20 ;

--
-- Volcado de datos para la tabla `credits_history`
--

INSERT INTO `credits_history` (`id`, `id_period`, `id_username`, `credits`, `payments`) VALUES
(1, 10, 1, 600, 0),
(2, 10, 1, 150, 0),
(3, 10, 13, 0, 336598),
(4, 10, 13, 0, 21512),
(5, 10, 13, 0, 161205),
(6, 10, 13, 0, 24347),
(7, 10, 13, 0, 1927),
(8, 10, 13, 0, 34458),
(9, 10, 13, 0, 24347),
(10, 10, 13, 0, 336598),
(11, 10, 13, 0, 2002),
(12, 10, 13, 0, 9635),
(13, 10, 13, 0, 2653),
(14, 10, 13, 0, 3936),
(15, 10, 13, 0, 2140),
(16, 10, 13, 0, 1070),
(17, 10, 13, 0, 3393),
(18, 10, 13, 0, 2002),
(19, 11, 13, 0, 989);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `credits_periods`
--

CREATE TABLE IF NOT EXISTS `credits_periods` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(60) COLLATE utf8_spanish2_ci NOT NULL,
  `from_date` int(10) unsigned NOT NULL,
  `to_date` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=13 ;

--
-- Volcado de datos para la tabla `credits_periods`
--

INSERT INTO `credits_periods` (`id`, `name`, `from_date`, `to_date`) VALUES
(1, 'Enero', 1385877600, 1359698399),
(2, 'Febrero', 1359698400, 1362117599),
(3, 'Marzo', 1362117600, 1364795999),
(4, 'Abril', 1364796000, 1367384399),
(5, 'mayo', 1367384400, 1370062799),
(6, 'junio', 1370062800, 1372654799),
(7, 'julio', 1372654800, 1375333199),
(8, 'agosto', 1375333200, 1378011599),
(9, 'septiembre', 1378011600, 1380603599),
(10, 'octubre', 1380603600, 1383285599),
(11, 'noviembre', 1383285600, 1385877599),
(12, 'diciembre', 1385877600, 1388555999);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `order_check`
--

CREATE TABLE IF NOT EXISTS `order_check` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_security` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `total` float(20,5) unsigned NOT NULL,
  `order_date` int(10) unsigned NOT NULL,
  `ip` int(10) unsigned NOT NULL,
  `order_status` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=20 ;

--
-- Volcado de datos para la tabla `order_check`
--

INSERT INTO `order_check` (`id`, `id_security`, `user_id`, `total`, `order_date`, `ip`, `order_status`) VALUES
(1, 0, 1, 3027.00000, 1379542419, 2130706433, 1),
(2, 0, 1, 3027.00000, 1379542589, 2130706433, 3),
(3, 0, 13, 336598.00000, 1382996787, 2130706433, 3),
(4, 0, 13, 21512.00000, 1382997429, 2130706433, 3),
(5, 0, 13, 161205.00000, 1382997468, 2130706433, 3),
(6, 0, 13, 24347.00000, 1382997525, 2130706433, 3),
(7, 0, 13, 1927.00000, 1382997929, 2130706433, 3),
(8, 0, 13, 34458.00000, 1382998092, 2130706433, 3),
(9, 0, 13, 24347.00000, 1382998846, 2130706433, 3),
(10, 0, 13, 336598.00000, 1382999382, 2130706433, 3),
(11, 0, 13, 2002.00000, 1382999424, 2130706433, 3),
(12, 0, 13, 9635.00000, 1383003857, 2130706433, 3),
(13, 0, 13, 2653.00000, 1383059113, 2130706433, 3),
(14, 0, 13, 3936.00000, 1383179438, 2130706433, 3),
(15, 0, 13, 2140.00000, 1383239045, 2130706433, 3),
(16, 0, 13, 1070.00000, 1383239161, 2130706433, 3),
(17, 0, 13, 3393.00000, 1383239220, 2130706433, 3),
(18, 0, 13, 2002.00000, 1383249292, 2130706433, 3),
(19, 0, 13, 989.00000, 1383317624, 2130706433, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `order_history`
--

CREATE TABLE IF NOT EXISTS `order_history` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(10) unsigned NOT NULL,
  `order_status` int(10) unsigned NOT NULL,
  `order_date` int(10) unsigned NOT NULL,
  `ip` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=19 ;

--
-- Volcado de datos para la tabla `order_history`
--

INSERT INTO `order_history` (`id`, `order_id`, `order_status`, `order_date`, `ip`) VALUES
(1, 2, 1, 1379542589, 2130706433),
(2, 3, 1, 1382996787, 2130706433),
(3, 4, 1, 1382997429, 2130706433),
(4, 5, 1, 1382997468, 2130706433),
(5, 6, 1, 1382997525, 2130706433),
(6, 7, 1, 1382997929, 2130706433),
(7, 8, 1, 1382998092, 2130706433),
(8, 9, 1, 1382998846, 2130706433),
(9, 10, 1, 1382999382, 2130706433),
(10, 11, 1, 1382999424, 2130706433),
(11, 12, 1, 1383003857, 2130706433),
(12, 13, 1, 1383059113, 2130706433),
(13, 14, 1, 1383179438, 2130706433),
(14, 15, 1, 1383239045, 2130706433),
(15, 16, 1, 1383239161, 2130706433),
(16, 17, 1, 1383239220, 2130706433),
(17, 18, 1, 1383249292, 2130706433),
(18, 19, 1, 1383317624, 2130706433);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `order_item`
--

CREATE TABLE IF NOT EXISTS `order_item` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(10) unsigned NOT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `quantity` int(10) unsigned NOT NULL,
  `price` float(20,5) unsigned NOT NULL,
  `fees` float(20,5) unsigned NOT NULL,
  `line_total` float(20,5) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`),
  KEY `product_id` (`product_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=19 ;

--
-- Volcado de datos para la tabla `order_item`
--

INSERT INTO `order_item` (`id`, `order_id`, `product_id`, `quantity`, `price`, `fees`, `line_total`) VALUES
(1, 2, 25, 3, 3027.00000, 0.00000, 3027.00000),
(2, 3, 149, 1, 336598.00000, 0.00000, 336598.00000),
(3, 4, 12, 2, 10756.00000, 0.00000, 21512.00000),
(4, 5, 152, 1, 161205.00000, 0.00000, 161205.00000),
(5, 6, 151, 1, 24347.00000, 0.00000, 24347.00000),
(6, 7, 143, 1, 1927.00000, 0.00000, 1927.00000),
(7, 8, 56, 1, 34458.00000, 0.00000, 34458.00000),
(8, 9, 151, 1, 24347.00000, 0.00000, 24347.00000),
(9, 10, 149, 1, 336598.00000, 0.00000, 336598.00000),
(10, 11, 145, 1, 2002.00000, 0.00000, 2002.00000),
(11, 12, 143, 5, 1927.00000, 0.00000, 9635.00000),
(12, 13, 161, 1, 2653.00000, 0.00000, 2653.00000),
(13, 14, 150, 1, 3936.00000, 0.00000, 3936.00000),
(14, 15, 56, 2, 1070.00000, 0.00000, 2140.00000),
(15, 16, 56, 1, 1070.00000, 0.00000, 1070.00000),
(16, 17, 55, 1, 3393.00000, 0.00000, 3393.00000),
(17, 18, 145, 1, 2002.00000, 0.00000, 2002.00000),
(18, 19, 143, 1, 989.00000, 0.00000, 989.00000);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `order_status`
--

CREATE TABLE IF NOT EXISTS `order_status` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name_status` varchar(255) COLLATE utf8_spanish2_ci NOT NULL,
  `description` text COLLATE utf8_spanish2_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=5 ;

--
-- Volcado de datos para la tabla `order_status`
--

INSERT INTO `order_status` (`id`, `name_status`, `description`) VALUES
(1, 'Nuevo', ''),
(2, 'Pendiente', ''),
(3, 'Enviado', ''),
(4, 'Liberado', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `payment`
--

CREATE TABLE IF NOT EXISTS `payment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `method_id` int(10) unsigned NOT NULL,
  `order_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `total` float(20,5) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `method_id` (`method_id`),
  KEY `order_id` (`order_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=19 ;

--
-- Volcado de datos para la tabla `payment`
--

INSERT INTO `payment` (`id`, `method_id`, `order_id`, `user_id`, `total`) VALUES
(1, 1, 2, 1, 3027.00000),
(2, 1, 3, 13, 336598.00000),
(3, 1, 4, 13, 21512.00000),
(4, 1, 5, 13, 161205.00000),
(5, 1, 6, 13, 24347.00000),
(6, 1, 7, 13, 1927.00000),
(7, 1, 8, 13, 34458.00000),
(8, 1, 9, 13, 24347.00000),
(9, 1, 10, 13, 336598.00000),
(10, 1, 11, 13, 2002.00000),
(11, 1, 12, 13, 9635.00000),
(12, 1, 13, 13, 2653.00000),
(13, 1, 14, 13, 3936.00000),
(14, 1, 15, 13, 2140.00000),
(15, 1, 16, 13, 1070.00000),
(16, 1, 17, 13, 3393.00000),
(17, 1, 18, 13, 2002.00000),
(18, 1, 19, 13, 989.00000);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `payment_method`
--

CREATE TABLE IF NOT EXISTS `payment_method` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_spanish2_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `payment_method`
--

INSERT INTO `payment_method` (`id`, `name`) VALUES
(1, 'Puntos');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permissions`
--

CREATE TABLE IF NOT EXISTS `permissions` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id_role` int(11) NOT NULL,
  `id_resource` int(11) NOT NULL,
  `permission` enum('allow','deny') NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=32 ;

--
-- Volcado de datos para la tabla `permissions`
--

INSERT INTO `permissions` (`id`, `id_role`, `id_resource`, `permission`) VALUES
(1, 1, 1, 'allow'),
(2, 1, 2, 'allow'),
(3, 1, 3, 'allow'),
(4, 1, 4, 'allow'),
(5, 1, 5, 'allow'),
(6, 1, 6, 'allow'),
(7, 1, 7, 'allow'),
(8, 1, 10, 'allow'),
(9, 1, 11, 'allow'),
(10, 1, 12, 'allow'),
(11, 1, 13, 'allow'),
(12, 1, 14, 'allow'),
(13, 1, 15, 'allow'),
(16, 1, 18, 'allow'),
(19, 1, 21, 'allow'),
(20, 1, 22, 'allow'),
(21, 1, 23, 'allow'),
(22, 1, 24, 'allow'),
(23, 1, 25, 'allow'),
(24, 1, 26, 'allow'),
(25, 1, 27, 'allow'),
(26, 1, 28, 'allow'),
(27, 1, 29, 'allow'),
(28, 1, 30, 'allow'),
(29, 1, 31, 'allow'),
(31, 1, 33, 'allow');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `product`
--

CREATE TABLE IF NOT EXISTS `product` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sku` varchar(255) COLLATE utf8_spanish2_ci NOT NULL,
  `other_sku` varchar(125) COLLATE utf8_spanish2_ci NOT NULL,
  `description` text COLLATE utf8_spanish2_ci NOT NULL,
  `thumb_image` varchar(125) COLLATE utf8_spanish2_ci NOT NULL,
  `full_image` varchar(125) COLLATE utf8_spanish2_ci NOT NULL,
  `last_update` int(10) unsigned DEFAULT '0',
  `product_status` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=239 ;

--
-- Volcado de datos para la tabla `product`
--

INSERT INTO `product` (`id`, `sku`, `other_sku`, `description`, `thumb_image`, `full_image`, `last_update`, `product_status`) VALUES
(1, 'ALLY2-241-13', 'WII U SET BASICO 8GB, BLANCO', 'WII U SET BASICO 8GB, BLANCO', 'ALLY2-241-13.jpg', 'ALLY2-241-13.jpg', 0, 1),
(2, 'ALLY2-242-13', 'WII U SET DE LUXE 32GB', 'WII U SET DE LUXE 32GB + SOPORTES CONSOLA Y GAME PAD + BASE RECARGA DEL GAMEPAD, NEGRO', 'ALLY2-242-13.jpg', 'ALLY2-242-13.jpg', 0, 1),
(3, 'ALLY2-243-13', 'VOLANTE INALAMBRICO  XBOX 360', 'El volante será compatible con todos los juegos de conducción disponibles en Xbox 360, salvo excepciones aún sin confirmar que podrían limitar su funcionamiento. Además, contará con gatillos para acelerar y frenar, los clásicos botones y cruceta, vibración y una banda de luces que ofrecerá información visual al jugador.', 'ALLY2-243-13.jpg', 'ALLY2-243-13.jpg', 0, 1),
(4, 'ALLY2-244-13', 'Pluma Midnight', 'Bolígrafo de tinta negra con ball point de resina', 'ALLY2-244-13.jpg', 'ALLY2-244-13.jpg', 0, 1),
(5, 'ALLY2-245-13', 'Cartera Meisterstuck', 'Cartera con capacidad para 6 tarjetas', 'ALLY2-245-13.jpg', 'ALLY2-245-13.jpg', 0, 1),
(6, 'ALLY2-246-13', 'Cartera Canvas Gris', 'Cartera con capacidad para 6 tarjetas', 'resized/Cartera_Canvas_G_524331b922a19_140x140.jpg', 'resized/Cartera_Canvas_G_524331b922a19_140x140.jpg', 0, 1),
(7, 'ALLY2-238-13', 'PS VITA  CON FIFA 2013', 'Descubre formas completamente nuevas para jugar. La PS Vita revoluciona la experiencia de juego con joysticks analógicos dobles, pantallas multitáctiles frontales y paneles táctiles traseros, sensores de movimiento y cámaras frontal y trasera. Juega a la velocidad de tu estilo de vida móvil: comienza tu juego en la PS3™ y continúalo dondequiera que vayas con tu PS Vita.', 'ALLY2-238-13.jpg', 'ALLY2-238-13.jpg', 0, 1),
(8, 'ALLY2-239-13', 'NINTENDO 3DS XL AZUL/NEGRO, ROJO/NEGRO', 'La principal diferencia de esta Nintendo 3DS XL con respecto al modelo que tenemos actualmente la encontraremos en el tamaño de las pantallas, que en la 3DS XL serán un 90% más grandes. La pantalla superior de la actual Nintendo 3DS mide 3,53 pulgadas, mientras que en la nueva 3DS XL llegará hasta las 4,88 pulgadas. La pantalla inferior, por su parte, pasa de las 3,02 pulgadas actuales a las 4,18 pulgadas en la 3DS XL. Todo esto hace que la consola sea un 46% más grande que la actual.', 'ALLY2-239-13.jpg', 'ALLY2-239-13.jpg', 0, 1),
(9, 'ALLY2-240-13', 'PS3 250 GB', 'Sistema PlayStation 3 \n250GB \nControl Inalámbrico \n DualShock 3 \nCable de voltaje \nCable AV', 'ALLY2-240-13.jpg', 'ALLY2-240-13.jpg', 0, 1),
(10, 'ALLY2-180-13', 'Sillón Kahlo Individual', 'Fabricado en Casco en Madera de Pino Selecto. Espumas Poliuretanas Ureblock.', 'ALLY2-180-13.jpg', 'ALLY2-180-13.jpg', 0, 1),
(11, 'ALLY2-181-13', 'Sillón Kahlo Love Seat', 'Fabricado en Casco en Madera de Pino Selecto. Espumas Poliuretanas Ureblock.', 'ALLY2-181-13.jpg', 'ALLY2-181-13.jpg', 0, 1),
(12, 'ALLY2-182-13', 'Edredón Abia', 'Coordinado Confeccionado\nen Jacquard y telas teñidas en\npoliéster y algodón Queen Size', 'ALLY2-182-13.jpg', 'ALLY2-182-13.jpg', 0, 1),
(13, 'ALLY2-183-13', 'Edredón Cali', 'Coordinado Confeccionado\nen Jacquard y telas teñidas en\npoliéster y algodón King Size', 'ALLY2-183-13.jpg', 'ALLY2-183-13.jpg', 0, 1),
(14, 'ALLY2-184-13', 'Edredón Cartago', 'Coordinado Confeccionado\ncon telas 100% algodón y\njuego de sábanas en satín de\n300 hilos 100% algodón Queen Size', 'ALLY2-184-13.jpg', 'ALLY2-184-13.jpg', 0, 1),
(15, 'ALLY2-185-13', 'Edredón Kentia', 'Coordinado confeccionado con\ntelas estampadas en 180 hilos\np.p.c. 50% Alg y 50% Pol (Para\ncolchones de hasta 30 cm de\naltura) Individual', 'ALLY2-185-13.jpg', 'ALLY2-185-13.jpg', 0, 1),
(16, 'ALLY2-186-13', 'Edredón Karur', 'Coordinado confeccionado\ncon telas estampadas y\nteñidas en 144 hilos p.p.c.\n50% Alg y 50% Pol (Para\ncolchones de hasta 30 cm de\naltura) Matrimonial', 'ALLY2-186-13.jpg', 'ALLY2-186-13.jpg', 0, 1),
(17, 'ALLY2-187-13', 'Edredón  Rodas', 'Coordinado confeccionado\ncon telas estampadas y\nteñidas en 144 hilos p.p.c.\n50% Alg y 50% Pol (Para\ncolchones de hasta 30 cm de\naltura) Matrimonial', 'ALLY2-187-13.jpg', 'ALLY2-187-13.jpg', 0, 1),
(18, 'ALLY2-188-13', 'Edredón Bardo', 'Coordinado Confeccionado\ncon telas 100% algodón y\njuego de sábanas en percal\nde 180 hilos 100% algodón King size', 'ALLY2-188-13.jpg', 'ALLY2-188-13.jpg', 0, 1),
(19, 'ALLY2-192-13', 'BASE ENFRIADORA PARA LAPTOP', 'BASE ENFRIADORA MICROSOFT Z3C-00034 PARA LAPTOP 11"', 'ALLY2-192-13.jpg', 'ALLY2-192-13.jpg', 0, 1),
(20, 'ALLY2-193-13', 'DISCO DURO', 'DISCO DURO ADATA HD710 500GB', 'ALLY2-193-13.jpg', 'ALLY2-193-13.jpg', 0, 1),
(21, 'ALLY2-194-13', 'ANGRY BIRDS TRILOGY, WII U', 'ANGRY BIRDS TRILOGY, WII U', 'ALLY2-194-13.jpg', 'ALLY2-194-13.jpg', 0, 1),
(22, 'ALLY2-195-13', 'ASSASSINS CREED II, XBOX, PS3', 'ASSASSINS CREED II, XBOX', 'ALLY2-195-13.jpg', 'ALLY2-195-13.jpg', 0, 1),
(23, 'ALLY2-196-13', 'BATMAN ARKHAM CITY, XBOX, PS3', 'BATMAN ARKHAM CITY PS3', 'resized/BATMAN_ARKHAM_CI_5243304c58a0e_140x140.jpg', 'resized/BATMAN_ARKHAM_CI_5243304c58a0e_140x140.jpg', 0, 1),
(24, 'ALLY2-197-13', 'DONKEY KONG COUNTRY RETURNS 3D, WII', 'DONKEY KONG COUNTRY RETURNS 3D, WII', 'ALLY2-197-13.jpg', 'ALLY2-197-13.jpg', 0, 1),
(25, 'ALLY2-198-13', 'FABLE THE JOURNEY, XBOX', 'FABLE THE JOURNEY, XBOX', 'ALLY2-198-13.jpg', 'ALLY2-198-13.jpg', 0, 1),
(26, 'ALLY2-199-13', 'GEAR OF WAR JUDGMENT, XBOX', 'GEAR OF WAR JUDGMENT, XBOX', 'ALLY2-199-13.jpg', 'ALLY2-199-13.jpg', 0, 1),
(27, 'ALLY2-200-13', 'INJUSTICE GODS AMONG US  STEELBOOK, PS3,', 'INJUSTICE GODS AMONG US  STEELBOOK, PS3,', 'ALLY2-200-13.jpg', 'ALLY2-200-13.jpg', 0, 1),
(28, 'ALLY2-201-13', 'LUIGIS MANSION DARK MOON, 3DS', 'LUIGIS MANSION DARK MOON, 3DS', 'ALLY2-201-13.jpg', 'ALLY2-201-13.jpg', 0, 1),
(29, 'ALLY2-202-13', 'TELEFONO PANASONIC KXTG1712MEB', '2 auriculares. Pantalla LCD iluminada en auricular. Expandible a 6 auriculares. Base Compacta y Estilizada. Identificador de Llamadas. Directorio Telefónico para 50 registros. Irrupción (Compartir llamada). Alarma de Despertador.', 'ALLY2-202-13.jpg', 'ALLY2-202-13.jpg', 0, 1),
(30, 'ALLY2-203-13', 'TABLETA BLUSENS TOUCH90WC  BLANCA 9"', 'Extremamente compacto, portátil y ligero, para que puedas llevártelo a todas partes y disfrutar de todo tu contenido en los momentos de ocio, de trabajo o en tus viajes. El Blusens Touch-90 cuenta con un potente procesador multimedia para que disfrutes no sólo de tu música, si no también de tus películas, contenido de internet etc', 'ALLY2-203-13.jpg', 'ALLY2-203-13.jpg', 0, 1),
(31, 'ALLY2-204-13', 'Monedero Electrónico Liverpool $2500', 'Monedero electrónico de $2500 para canjear por productos en las tiendas Liverpool de toda la República Mexicana.', 'ALLY2-204-13.jpg', 'ALLY2-204-13.jpg', 0, 1),
(32, 'ALLY2-205-13', 'Monedero Electrónico Liverpool $5000', 'Monedero electrónico de $5000 para canjear por productos en las tiendas Liverpool de toda la República Mexicana.', 'ALLY2-205-13.jpg', 'ALLY2-205-13.jpg', 0, 1),
(33, 'ALLY2-206-13', 'Proyector Sony', 'PROY SONY DX140 3LCD 3200 XGA HDMI 7000HR 2.5KG MALETIN', 'ALLY2-206-13.jpg', 'ALLY2-206-13.jpg', 0, 1),
(34, 'ALLY2-207-13', 'Cuna weekend', 'Su sistema de cierre tipo sombrilla permite armarla en segundos. No requiere herramientas para su ensamble. Su bolsa lateral permite guardar algunos accesorios del bebé. Incluye segundo piso. Con mobil para el entretenimiento del bebé.. Práctico cambiador fácil de montar y desmontar', 'ALLY2-207-13.jpg', 'ALLY2-207-13.jpg', 0, 1),
(35, 'ALLY2-208-13', 'Vaso antigoteo SPORT 12 OZ 18 M +\nAVENT', 'Recomendado para niños de 18 meses en adelante. Antigoteo Fácil de limpiar\nEl vaso entero puede esterilizarse para mayor higiene', 'ALLY2-208-13.jpg', 'ALLY2-208-13.jpg', 0, 1),
(36, 'ALLY2-209-13', 'Boletos de cine para 2 personas', 'Boletos de Lunes a domingo para dos personas.', 'ALLY2-209-13.jpg', 'ALLY2-209-13.jpg', 0, 1),
(37, 'ALLY2-210-13', 'Móvil Casita de las Abejas', 'Móvil las abejas rotatorios, coloridas vuelan al ritmo de una melodía dulce y\nestimulan el primer audio y habilidades visuales del bebé, puede instalarse\nal lado de la cuna y se activa tirando la flor de la colmena musical. Después\nde 6 meses de edad, cuando sea necesario eliminar los juguetes colgantes, puede utilizarse la colmena musical para bebé confort con una suave\ncanción de cuna. Edad: - 6 meses +', 'ALLY2-210-13.jpg', 'ALLY2-210-13.jpg', 0, 1),
(38, 'ALLY2-211-13', 'Carriola Helios Color: Naranja, Rojo y\nVerde', 'Ventajas y Características: Respaldo ajustable en tres posiciones con una\nsola mano Vestidura fácil de desmontar para su lavado Mecanismo fácil\nde accionar para un practico cierre Canastilla amplia para guardar los\nartículos del bebe Ruedas traseras con freno Contenido: 1 Pza.', 'ALLY2-211-13.jpg', 'ALLY2-211-13.jpg', 0, 1),
(39, 'ALLY2-212-13', 'Auto asiento Challenger', 'Ventajas y Características: Sistema central de ajuste de cinturones\nCumple con las estrictas normas internacionales de seguridad Para grupo 0 (0 a9kg) y Grupo 1 (9 a 18kg) Múltiples posiciones fácilmente ajustables\ncon una sola mano Cinturón de seguridad de cinco puntos fácilmente\najustables Contenido: 1 Pza.', 'ALLY2-212-13.jpg', 'ALLY2-212-13.jpg', 0, 1),
(40, 'ALLY2-213-13', 'GYM SET "FAT FREE"', 'Set de pesas, cuerda, banda elástica y hand grips en bolso.', 'ALLY2-213-13.jpg', 'ALLY2-213-13.jpg', 0, 1),
(41, 'ALLY2-214-13', 'Moto Eléctrica Nitro niño', '2 motor, velocidad 4-6km/hora, 1.5 horas de autonomía\nBatería seca recargable 2 x 6 Volts\nIncluye cargador de batería de 12Volts\nAcelerador de pedal\nEdad recomendable de 3-5 años', 'ALLY2-214-13.jpg', 'ALLY2-214-13.jpg', 0, 1),
(42, 'ALLY2-215-13', 'Moto Eléctrica Nitro niña', '2 motor, velocidad 4-6km/hora, 1.5 horas de autonomía\nBatería seca recargable 2 x 6 Volts\nIncluye cargador de batería de 12Volts\nAcelerador de pedal\nEdad recomendable de 3-5 años', 'ALLY2-215-13.jpg', 'ALLY2-215-13.jpg', 0, 1),
(43, 'ALLY2-216-13', 'CONTROL INALAMBRICO XBOX 360', 'CONTROL INALAMBRICO XBOX 360', 'ALLY2-216-13.jpg', 'ALLY2-216-13.jpg', 0, 1),
(44, 'ALLY2-217-13', 'Gimnasio Lion In The Park de Bright Sartas', '4 melodías. Sonajero con cuentas de colores. Espejo ajustable para el autodescubrimiento del bebé.\nMordedor refrescante. 6 aros para enganchar otros juguetes. Lavable 30º. Medidas abierta: 46 x 76 x 76 cm.', 'ALLY2-217-13.jpg', 'ALLY2-217-13.jpg', 0, 1),
(45, 'ALLY2-218-13', 'APPLE TV-SPA', 'Apple TV es un pequeño centro de entretenimiento que reproduce el contenido que quieras desde iTunes, Netflix, YouTube y más, en tu TV de pantalla ancha. Todo en una resolución HD de hasta 1080p. Simplemente conéctalo y descubrirás todo un mundo de películas, fotos, música y mucho más.', 'ALLY2-218-13.jpg', 'ALLY2-218-13.jpg', 0, 1),
(46, 'ALLY2-219-13', 'Multifuncional Epson', 'MLTIFUNCIONAL EPSON STYLUS PHOTO  40PPM WIFI PANTALLA 6 TINTAS', 'ALLY2-219-13.jpg', 'ALLY2-219-13.jpg', 0, 1),
(48, 'ALLY2-221-13', 'LLAVERO PRISMA', 'LLAVERO PRISMA (INCLUYE 2 ARILLOS SEPARABLES Y CAJA INDIVIDUAL.)', 'ALLY2-221-13.jpg', 'ALLY2-221-13.jpg', 0, 1),
(49, 'ALLY2-222-13', 'LLAVERO ASTORIA', 'LLAVERO ASTORIA (INCLUYE ESTUCHE ESPECIAL.)', 'ALLY2-222-13.jpg', 'ALLY2-222-13.jpg', 0, 1),
(50, 'ALLY2-223-13', 'MASAJEADOR FACIAL "TOUCH ONE"', 'Masajeador de cara, cuero cabelludo y cuerpo.  5 accesorios para relajación y estimulación.  Motor de larga duración. \nCon 2 intensidades.', 'ALLY2-223-13.jpg', 'ALLY2-223-13.jpg', 0, 1),
(51, 'ALLY2-224-13', 'Juego de 12 Tubos Eléctricos JUMBO Cerámica y Iones', 'Juego de tubos con tecnología de cerámica y generador de iones.\nIncluye 4 tubos súper jumbo suaves aterciopelados para ondas definidas (1.75"), 8 tubos jumbo suaves aterciopelados para dar volumen (1.5"), calor instantáneo en 2 minutos y listos para usarse.\nTapa transparente con cubierta.\nClips para sujetar con compartimento de almacenaje.', 'ALLY2-224-13.jpg', 'ALLY2-224-13.jpg', 0, 1),
(52, 'ALLY2-225-13', 'Curso de inglés Harmon Hall.', 'Curso de inglés de lunes a viernes (1 1/2 diaria) programado a 4 semanas. Sujeto a disponibilidad de fechas y sucursales de Harmon Hall.', 'ALLY2-225-13.jpg', 'ALLY2-225-13.jpg', 0, 1),
(53, 'ALLY2-226-13', 'Kit de bandas de resistencia Everlast', 'Tonifica y fortalece todo el cuerpo. 3 bandas (de resistencia ligera, mediana y fuerte). Incluye banda circular. Recubierta de espuma para una mayor comodidad. Incluye 60 minutos de entrenamiento DVD portátil y una bolsa con cordón de almacenamiento con correa ajustable.', 'ALLY2-226-13.jpg', 'ALLY2-226-13.jpg', 0, 1),
(54, 'ALLY2-227-13', 'Lámpara con imán y luz', 'Ideal como apoyo para cambiar llantas ya que gracias al imán se pega en el carro y alumbra con sus 7 LEDS', 'ALLY2-227-13.jpg', 'ALLY2-227-13.jpg', 0, 1),
(55, 'ALLY228--13', 'Organizador de Cajuela', 'Ideal para mantener el carro o camioneta organizada, incluye hielera 1 six para mantener las bebidas frías en viajes.', 'ALLY228--13.jpg', 'ALLY228--13.jpg', 0, 1),
(56, 'ALLY2-229-13', 'Paraguas con lámpara', 'Paraguas con cubierta plástica ideal para sujetarla cuando se usa como lámpara. Dimensiones cerrado 10.5 x 2 x 2', 'ALLY2-229-13.jpg', 'ALLY2-229-13.jpg', 0, 1),
(57, 'ALLY2-230-13', 'Maleta deportiva', 'Maleta ideal para gym, con bolsa lateral para zapatos deportivos. Medida 13¨x 20 x 12"', 'ALLY2-230-13.jpg', 'ALLY2-230-13.jpg', 0, 1),
(58, 'ALLY2-231-13', 'TV 18.5"', 'TV SAMSUNG 18.5 LED 2HDMI USB VGA COAXIAL 1366X768 5W X 2C', 'ALLY2-231-13.jpg', 'ALLY2-231-13.jpg', 0, 1),
(59, 'ALLY2-232-13', 'TV 32"', 'TV LED 32 SAMSUNG HD 60HZ US HDMI HIGH GLOSS', 'ALLY2-232-13.jpg', 'ALLY2-232-13.jpg', 0, 1),
(60, 'ALLY2-233-13', 'TV 32"', 'TV LED 32 SAMSUNG FHD(1080P) 60HZ WI-FI APLICACIONES 3HDMI 2USB', 'ALLY2-233-13.jpg', 'ALLY2-233-13.jpg', 0, 1),
(61, 'ALLY2-234-13', 'TV 40"', 'TV LED 40 SAMSUNG FHD(1080P) 60HZ SLIM DESIGN 2HDMI 1USB', 'ALLY2-234-13.jpg', 'ALLY2-234-13.jpg', 0, 1),
(62, 'ALLY2-235-13', 'TV 46"', 'TV LED 46 SAMSUNG FHD (1080P) 60HZ SLIM USB 1 HDMI 2 SOCCER MODE', 'ALLY2-235-13.jpg', 'ALLY2-235-13.jpg', 0, 1),
(63, 'ALLY2-236-13', 'TV 55"', 'TV LED 55 SAMSUNG FHD 240HZ 3D WIFI SMART INTERACTION ULTRA SLIM', 'ALLY2-236-13.jpg', 'ALLY2-236-13.jpg', 0, 1),
(64, 'ALLY2-237-13', 'PS VITA', 'Descubre formas completamente nuevas para jugar. La PS Vita revoluciona la experiencia de juego con joysticks analógicos dobles, pantallas multitáctiles frontales y paneles táctiles traseros, sensores de movimiento y cámaras frontal y trasera. Juega a la velocidad de tu estilo de vida móvil: comienza tu juego en la PS3™ y continúalo dondequiera que vayas con tu PS Vita.', 'ALLY2-237-13.jpg', 'ALLY2-237-13.jpg', 0, 1),
(65, 'ALLY2-1-13', 'Bicicleta niño', 'Bicicleta para niño con llanta de aire rodada 12; 1 velocidad con llantitas.', 'ALLY2-1-13.jpg', 'ALLY2-1-13.jpg', 0, 1),
(66, 'ALLY2-2-13', 'Bicicleta niña', 'Bicicleta para niña con llanta Eva rodada 12; 1 velocidad con salpicaderas.', 'ALLY2-2-13.jpg', 'ALLY2-2-13.jpg', 0, 1),
(67, 'ALLY2-3-13', 'Bicicleta niño', 'Bicicleta rodada 20; 1 velocidad |', 'ALLY2-3-13.jpg', 'ALLY2-3-13.jpg', 0, 1),
(68, 'ALLY2-4-13', 'Bicicleta niño', 'Bicicleta rodada 16; 1 velocidad; tijera rígida', 'ALLY2-4-13.jpg', 'ALLY2-4-13.jpg', 0, 1),
(69, 'ALLY2-5-13', 'Scooter niño', 'Scooter rodada 16 1 velocidad; tijera rígida; freno trasero V brake', 'ALLY2-5-13.jpg', 'ALLY2-5-13.jpg', 0, 1),
(70, 'ALLY2-6-13', 'Scooter niña', 'Scooter rodada 16 1 velocidad; tijera rígida; freno trasero V brake', 'ALLY2-6-13.jpg', 'ALLY2-6-13.jpg', 0, 1),
(71, 'ALLY2-7-13', 'Bicicleta niña', 'Bicicleta rodada 20; 1 velocidad; motas', 'ALLY2-7-13.jpg', 'ALLY2-7-13.jpg', 0, 1),
(72, 'ALLY2-8-13', 'Bicicleta hombre', 'Bicicleta rodada 24; 21 velocidades; cuadro AC rígido; Freno V brake AC', 'ALLY2-8-13.jpg', 'ALLY2-8-13.jpg', 0, 1),
(73, 'ALLY2-9-13', 'Bicicleta hombre', 'Bicicleta para caballero rodada 26; 21 velocidades; Cuadro AC D.S. Tij.; Suspensión MTB; Freno V Brake; Salpicadera trasera.  Marca Arkon.', 'ALLY2-9-13.jpg', 'ALLY2-9-13.jpg', 0, 1),
(74, 'ALLY2-10-13', 'Bicicleta hombre', 'Bicicleta Amsterdam para hombre rodada 26', 'ALLY2-10-13.jpg', 'ALLY2-10-13.jpg', 0, 1),
(75, 'ALLY2-11-13', 'Bicicleta mujer', 'Bicicleta para dama rodada 26; 7 velocidades; canastilla.', 'ALLY2-11-13.jpg', 'ALLY2-11-13.jpg', 0, 1),
(76, 'ALLY2-12-13', 'Bicicleta mujer', 'Bicicleta Firenze para mujer rodada 26', 'ALLY2-12-13.jpg', 'ALLY2-12-13.jpg', 0, 1),
(77, 'ALLY2-13-13', 'Juego anillo y aretes mujer', 'Juego de anillo y aretes en oro blanco de 14K con brillantes 201D 1.88.', 'ALLY2-13-13.jpg', 'ALLY2-13-13.jpg', 0, 1),
(78, 'ALLY2-14-13', 'Juego anillo y aretes mujer', 'Juego de anillo y aretes en oro rosa de 14K con brillantes 64D .32.', 'ALLY2-14-13.jpg', 'ALLY2-14-13.jpg', 0, 1),
(79, 'ALLY2-15-13', 'Juego anillo y aretes mujer', 'Juego de anillo y aretes en oro blanco de 14K 2.62D 2.72.', 'ALLY2-15-13.jpg', 'ALLY2-15-13.jpg', 0, 1),
(80, 'ALLY2-16-13', 'Juego de mesa Monopoly', 'Juego de mesa para toda la familia', 'ALLY2-16-13.jpg', 'ALLY2-16-13.jpg', 0, 1),
(81, 'ALLY2-17-13', 'Juego de destreza Twister', 'Juego de destreza para toda la familia', 'ALLY2-17-13.jpg', 'ALLY2-17-13.jpg', 0, 1),
(82, 'ALLY2-18-13', 'Juego de mesa Caras y Gestos', 'Juego de mesa para toda la familia', 'ALLY2-18-13.jpg', 'ALLY2-18-13.jpg', 0, 1),
(83, 'ALLY2-19-13', 'Juego de mesa Jenga', 'Juego de mesa para toda la familia', 'ALLY2-19-13.jpg', 'ALLY2-19-13.jpg', 0, 1),
(84, 'ALLY2-20-13', 'Juego de mesa Pictionary Edición Familiar', 'Juego de mesa para toda la familia', 'ALLY2-20-13.jpg', 'ALLY2-20-13.jpg', 0, 1),
(85, 'ALLY2-21-13', 'Andadera vagón de juguete', 'Andadera Vagón didáctica Fisher Price', 'ALLY2-21-13.jpg', 'ALLY2-21-13.jpg', 0, 1),
(86, 'ALLY2-22-13', 'Caja registradora Barbie', 'Caja registradora Barbie', 'ALLY2-22-13.jpg', 'ALLY2-22-13.jpg', 0, 1),
(87, 'ALLY2-23-13', 'Taller mecánico Hot Wheels', 'Taller mecánico Hot Wheels', 'ALLY2-23-13.jpg', 'ALLY2-23-13.jpg', 0, 1),
(88, 'ALLY2-24-13', 'Deslizador Vector', 'Deslizador con resistente diseño y duradero material.', 'ALLY2-24-13.jpg', 'ALLY2-24-13.jpg', 0, 1),
(89, 'ALLY2-25-13', 'Buggy Push Around Rojo', 'Carrito con bocina, cinturón de seguridad. Pesa 22.7 kg.', 'ALLY2-25-13.jpg', 'ALLY2-25-13.jpg', 0, 1),
(90, 'ALLY2-26-13', 'Carriola Cordoba', 'Carriola con respaldo ajustable en 3 posiciones,, vestidura fácil de desmontar para lavado, charola frontal y botón de seguridad.', 'ALLY2-26-13.jpg', 'ALLY2-26-13.jpg', 0, 1),
(91, 'ALLY2-27-13', 'Licuadora Facilite Plus', 'Licuadora de plástico. 6 velocidades', 'ALLY2-27-13.jpg', 'ALLY2-27-13.jpg', 0, 1),
(92, 'ALLY2-28-13', 'Licuadora Black and Decker', 'Licuadora con base metálica, cuchillas de acero inoxidable, jarra Perfect Pour® de 1500 ml. Sistema contra sobrecalentamiento.', 'ALLY2-28-13.jpg', 'ALLY2-28-13.jpg', 0, 1),
(93, 'ALLY2-29-13', 'Batidora Robot Legend Inox', 'Batidora con tecnología turbo rotation system. Caña desmontable con sistema "easy lock". Incluye picador, vaso medidor y batidor de globo.', 'ALLY2-29-13.jpg', 'ALLY2-29-13.jpg', 0, 1),
(94, 'ALLY2-30-13', 'Batidora Black and Decker', 'Batidora manual 5 velocidades 175 Watts, garantía directa de fábrica.', 'ALLY2-30-13.jpg', 'ALLY2-30-13.jpg', 0, 1),
(95, 'ALLY2-31-13', 'Exprimidor Black and Decker', 'Exprimidor de cono grande auto-reversible, control de pulpa. Incluye colador, jarra transparente de 1 litro. Guarda cable y contiene cono pequeño con agitador.', 'ALLY2-31-13.jpg', 'ALLY2-31-13.jpg', 0, 1),
(96, 'ALLY2-32-13', 'Tostador Moulinex', 'Tostador Principio 1 BIS.', 'ALLY2-32-13.jpg', 'ALLY2-32-13.jpg', 0, 1),
(97, 'ALLY2-33-13', 'Cafetera Taurus', 'Cafetera 6 tazas con filtro permanente.', 'ALLY2-33-13.jpg', 'ALLY2-33-13.jpg', 0, 1),
(98, 'ALLY2-34-13', 'Cafetera Black and Decker', 'Cafetera 12 tazas programable. Apagado automático y panel digital. Filtro permanente.', 'ALLY2-34-13.jpg', 'ALLY2-34-13.jpg', 0, 1),
(99, 'ALLY2-35-13', 'Olla Cinsa Forta', 'Olla de presión Cinsa Forta de 5L.', 'ALLY2-35-13.jpg', 'ALLY2-35-13.jpg', 0, 1),
(100, 'ALLY2-36-13', 'Olla Hamilton Beach', 'Olla de lenta cocción de 4L.', 'ALLY2-36-13.jpg', 'ALLY2-36-13.jpg', 0, 1),
(101, 'ALLY2-37-13', 'Plancha Black and Decker', 'Plancha con base de acero inoxidable, vapor extra, chorro de vapor concentrado y spray.', 'ALLY2-37-13.jpg', 'ALLY2-37-13.jpg', 0, 1),
(102, 'ALLY2-38-13', 'Plancha Black and Decker', 'Plancha a vapor vertical con mango ergonómico, comfort grip y suela de acero inoxidable.', 'ALLY2-38-13.jpg', 'ALLY2-38-13.jpg', 0, 1),
(103, 'ALLY2-39-13', 'Plancha Sliza', 'Plancha de vapor con tanque de 1.9L. Desodorizante y mata bacterias. Hasta con 1 hora de vapor continuo.', 'ALLY2-39-13.jpg', 'ALLY2-39-13.jpg', 0, 1),
(104, 'ALLY2-40-13', 'Ventilador Taurus Air Black', 'Ventilador de piso de 56cm de 3 velocidades. Potente motor.', 'ALLY2-40-13.jpg', 'ALLY2-40-13.jpg', 0, 1),
(105, 'ALLY2-41-13', 'Calefactor Taurus Averno', 'Calefactor', 'ALLY2-41-13.jpg', 'ALLY2-41-13.jpg', 0, 1),
(106, 'ALLY2-42-13', 'Ventilador Navia', 'Ventilador de torre de 16´con 3 velocidades con pantalla LCD.', 'ALLY2-42-13.jpg', 'ALLY2-42-13.jpg', 0, 1),
(107, 'ALLY2-43-13', 'Horno Tostador Black and Decker', 'Horno tostador para asar, tostar y mantener caliente. Reloj automático de 30 minutos. Con capacidad para 4 piezas de pan o 1 pizza personal.', 'ALLY2-43-13.jpg', 'ALLY2-43-13.jpg', 0, 1),
(108, 'ALLY2-44-13', 'Horno de Microondas GE', 'Horno de microondas color silver. 10 niveles de potencia y 6 selecciones rápidas de cocinado. Diseño ideal para combinar con cualquier tipo de cocina.', 'ALLY2-44-13.jpg', 'ALLY2-44-13.jpg', 0, 1),
(109, 'ALLY2-45-13', 'Microondas Whirlpool', 'Microondas .7 pies 700 Watts con 10 niveles de potencia. Con funciones predeterminadas', 'ALLY2-45-13.jpg', 'ALLY2-45-13.jpg', 0, 1),
(110, 'ALLY2-46-13', 'Refrigerador Whirlpool', 'Frigo Bar con capacidad de 5 pies cúbicos, sistema de deshielo semi-automático "Push Button". Controles mecánicos y charola para carnes frías.', 'ALLY2-46-13.jpg', 'ALLY2-46-13.jpg', 0, 1),
(111, 'ALLY2-47-13', 'Refrigerador para vinos GE', 'Refrigerador para vinos con capacidad para 8 botellas. Controles Glass Touch LCD, display digital y jaladera integrada.', 'ALLY2-47-13.jpg', 'ALLY2-47-13.jpg', 0, 1),
(112, 'ALLY2-48-13', 'Lavadora Whirlpool', 'Lavadora automática con 15 kilos de capacidad, 8 ciclos, 4 niveles de agua, 4 temperaturas y 2 perillas.', 'ALLY2-48-13.jpg', 'ALLY2-48-13.jpg', 0, 1),
(113, 'ALLY2-49-13', 'Secadora Whirlpool', 'Secadora de 15 kg de capacidad con sistema de secado automático, 13 ciclos pre programados y protector contra arrugas.', 'ALLY2-49-13.jpg', 'ALLY2-49-13.jpg', 0, 1),
(114, 'ALLY2-51-13', 'Batería tipo sazón Ekco', 'Set de 5 sartenes en color rojo. Budinera 22cm, tapa de vidrio 22cm, cazo 16cm, sartén 20cm, hervidor 10cm.', 'ALLY2-51-13.jpg', 'ALLY2-51-13.jpg', 0, 1),
(115, 'ALLY2-52-13', 'Batería Chapala KUCHE', 'Batería de 12 piezas en acero inoxidable 18/10. Acabado espejo, tapas de cristal templado.  \nOlla con tapa de 16 x 9.5 cm- Cacerola con tapa de 16 x 9.5 cm\n- Cacerola con tapa de 18 x 10.5 cm\n- Cacerola con tapa de 20 x 11.5 cm\n- Cacerola con tapa de 24 x 13.5 cm\n- Sartén con tapa de 24 x 6 cm', 'ALLY2-52-13.jpg', 'ALLY2-52-13.jpg', 0, 1),
(116, 'ALLY2-53-13', '3 pack de sartenes Ekco', 'Juego de sartenes de 3 piezas en colores. Antiadherente Duraflon Tecnología de alto rendimiento. Aluminio 100%, el mejor conductor de calor. Espesor: 1.35mm. Colore: Verde (18cm), morado (20cm) y naranja (24cm).', 'ALLY2-53-13.jpg', 'ALLY2-53-13.jpg', 0, 1),
(117, 'ALLY2-54-13', '3 pack Vanguardia Ekco', 'Juego de sartenes Duraflon. Espesor 2.1mm. (20 24 y 26cms).', 'ALLY2-54-13.jpg', 'ALLY2-54-13.jpg', 0, 1),
(118, 'ALLY2-55-13', 'Sandwichera Black and Decker', 'Sandwichera con capacidad para 2 piezas. Superficie antiadherente, corta y sella los sandwiches. Luz indicadora de encendido y cuando está listo el sandwich. Asas frescas al tacto', 'ALLY2-55-13.jpg', 'ALLY2-55-13.jpg', 0, 1),
(119, 'ALLY2-56-13', 'Sartén eléctrico Odiseo Taurus', 'Sartén eléctrico con tapa de vidrio refractario y recubrimiento antiadherente.', 'ALLY2-56-13.jpg', 'ALLY2-56-13.jpg', 0, 1),
(120, 'ALLY2-57-13', 'Secadora de pelo Conair', 'Secadora iónica turmalina guarda cable y plegable.', 'ALLY2-57-13.jpg', 'ALLY2-57-13.jpg', 0, 1),
(121, 'ALLY2-58-13', 'Tenaza rizadora Conair', 'Tenaza rizadora de cerámica y turmalina 1" digital.', 'ALLY2-58-13.jpg', 'ALLY2-58-13.jpg', 0, 1),
(122, 'ALLY2-59-13', 'Juego de peluquería Conair', 'Juego de peluquería The Chopper 24 piezas.', 'ALLY2-59-13.jpg', 'ALLY2-59-13.jpg', 0, 1),
(123, 'ALLY2-60-13', 'Rasuradora eléctrica Taurus', 'Rasuradora eléctrica.', 'ALLY2-60-13.jpg', 'ALLY2-60-13.jpg', 0, 1),
(124, 'ALLY2-61-13', 'Recortadora barba y bigotes Conair', 'Recortadora barba y bigotes de 5 piezas. Utiliza baterías.', 'ALLY2-61-13.jpg', 'ALLY2-61-13.jpg', 0, 1),
(125, 'ALLY2-62-13', 'Báscula Esvelty', 'Báscula digital Esvelty color gris.', 'ALLY2-62-13.jpg', 'ALLY2-62-13.jpg', 0, 1),
(126, 'ALLY2-63-13', 'Cojín eléctrico Conair', 'Cojín eléctrico de calor. Tamaño compacto.', 'ALLY2-63-13.jpg', 'ALLY2-63-13.jpg', 0, 1),
(127, 'ALLY2-64-13', 'Báscula Conair', 'Báscula digital color silver base negra y agarradera.', 'ALLY2-64-13.jpg', 'ALLY2-64-13.jpg', 0, 1),
(128, 'ALLY2-65-13', 'Loción Armani', 'Loción Acqua de Gio para caballero 100ml', 'ALLY2-65-13.jpg', 'ALLY2-65-13.jpg', 0, 1),
(129, 'ALLY2-66-13', 'Loción Swiss Army', 'Loción Swiss Army para caballero 100ml', 'ALLY2-66-13.jpg', 'ALLY2-66-13.jpg', 0, 1),
(130, 'ALLY2-67-13', 'Loción Hugo Boss', 'Loción Hugo de Hugo 100ml', 'ALLY2-67-13.jpg', 'ALLY2-67-13.jpg', 0, 1),
(131, 'ALLY2-68-13', 'Perfume Paris Hilton', 'Perfume Paris Hilton 100 ml', 'ALLY2-68-13.jpg', 'ALLY2-68-13.jpg', 0, 1),
(132, 'ALLY2-69-13', 'Perfume Nina Ricci', 'Perfume Nina 100ml', 'ALLY2-69-13.jpg', 'ALLY2-69-13.jpg', 0, 1),
(133, 'ALLY2-70-13', 'Perfume Antonio Puig (Carolina Herrera)', 'Perfume Carolina Herrera 100ml', 'ALLY2-70-13.jpg', 'ALLY2-70-13.jpg', 0, 1),
(134, 'ALLY2-71-13', 'Perfume Cacharel', 'Perfume Amor Amor 100ml', 'ALLY2-71-13.jpg', 'ALLY2-71-13.jpg', 0, 1),
(135, 'ALLY2-72-13', 'Dock Sony', 'Bocina docking Sony iPod, iPhone. Auxiliar portable control R.', 'ALLY2-72-13.jpg', 'ALLY2-72-13.jpg', 0, 1),
(136, 'ALLY2-73-13', 'Audífonos Sony', 'Audífonos con diadema Sony, graves/agudos profundos. Gris/Verde.', 'ALLY2-73-13.jpg', 'ALLY2-73-13.jpg', 0, 1),
(137, 'ALLY2-74-13', 'Bocina Sony', 'Bocina Sony bluetooth en color blanco, NFC Bat. Rec, sonido 360 con auxiliar.', 'ALLY2-74-13.jpg', 'ALLY2-74-13.jpg', 0, 1),
(138, 'ALLY2-75-13', 'Bocina dock Bose', 'Bocina para iPod Bose Soundock Serie II en color gris.', 'ALLY2-75-13.jpg', 'ALLY2-75-13.jpg', 0, 1),
(139, 'ALLY2-76-13', 'Pluma Shaeffer Mini Prelude', 'Bolígrafo Shaeffer Mini Prelude color champagne.', 'ALLY2-76-13.jpg', 'ALLY2-76-13.jpg', 0, 1),
(140, 'ALLY2-77-13', 'Pluma Shaeffer Intensity', 'Bolígrafo Shaeffer Intensity Medici Cromo CT', 'ALLY2-77-13.jpg', 'ALLY2-77-13.jpg', 0, 1),
(141, 'ALLY2-78-13', 'Pluma Shaeffer Intensity', 'Bolígrafo Shaeffer Intensity Fibra de Carbono Cromo CT', 'ALLY2-78-13.jpg', 'ALLY2-78-13.jpg', 0, 1),
(142, 'ALLY2-79-13', 'Pluma Ferrari', 'Bolígrafo Ferrari Serie 300 en color rojo', 'ALLY2-79-13.jpg', 'ALLY2-79-13.jpg', 0, 1),
(143, 'ALLY2-80-13', 'Termo Penguin Cool Gear', 'Termo flip top con popote. Grip de hule en la parte anterior y posterior con capacidad de 22 oz.', 'ALLY2-80-13.jpg', 'ALLY2-80-13.jpg', 0, 1),
(144, 'ALLY2-81-13', 'Cool Gear Water Filtration BPA Free', 'Hecho de Tritan Copolyester. Presenta un filtro y un sistema freezer stick que reduce el sabor a cloro y otras impurezas del agua. Puede filtrar hasta 150 galones de agua (4 meses) antes de ser reemplazado y dependiendo del uso. Capacidad de 26 oz.', 'ALLY2-81-13.jpg', 'ALLY2-81-13.jpg', 0, 1),
(145, 'ALLY2-82-13', 'Termo Acero Inoxidable Wenger', 'Termo de acero inoxidable de rosca de plástico. Capacidad de 26 oz.', 'ALLY2-82-13.jpg', 'ALLY2-82-13.jpg', 0, 1),
(146, 'ALLY2-83-13', 'Bolsa acolchada Nicole', 'Bolsa acolchada acabado brilloso imitación piel con cierre magnético en el compartimento principal y bolsa con cierre de velcro frontal. 11´´. Colores: negro, rojo, morado y aqua.', 'ALLY2-83-13.jpg', 'ALLY2-83-13.jpg', 0, 1),
(147, 'ALLY2-84-13', 'Bolsa para laptop Kenneth Cole', 'Bolsa de vinyl texturizado con compartimento de en medio para laptop de 15.4´´. Incluye una segunda bolsa para tablet, panel de organización con varias bolsas. Incluye tira para ajustar al asa de las maletas.', 'ALLY2-84-13.jpg', 'ALLY2-84-13.jpg', 0, 1),
(148, 'ALLY2-85-13', 'Back pack Field & Co. Colección Cambridge.', 'Mochila inspirada en la Ivo League de los 60. Compartimento que incluye bolsa acolchada para la laptop o tablet. 2 bolsas largas frontales y 2 bolsas con cierre de velcro para accesorios adicionales. Color café.', 'ALLY2-85-13.jpg', 'ALLY2-85-13.jpg', 0, 1),
(149, 'ALLY2-86-13', 'Mochila Wenger para laptop', 'Compartimento principal puede contener una laptop de 15.4´´. Tiene puerto para audífonos, panel de organización, 2 bolsas laterales de malla. Color carbón.', 'ALLY2-86-13.jpg', 'ALLY2-86-13.jpg', 0, 1),
(150, 'ALLY2-87-13', 'Mochila High Sierra Curve', 'Mochila con organizador para plumas. Puerto para audífonos, bolsas de malla laterales. Tiras en forma S con bolsa para el celular.', 'ALLY2-87-13.jpg', 'ALLY2-87-13.jpg', 0, 1),
(151, 'ALLY2-88-13', 'Mochila High Sierra Drench Hydration', 'Mochila con compartimento que puede contener reserva de hasta 2 litros de agua. Válvula manos libres para agua. La bolsa frontal puede guardar un casco,. Cubierta del tubo para el agua aislada.', 'ALLY2-88-13.jpg', 'ALLY2-88-13.jpg', 0, 1),
(152, 'ALLY2-89-13', 'Back pack High Sierra', 'Back pack de polycanvas con multicompartimentos que guarda laptop de 17´´. Con puerto para audífonos y bolsa de zipper lateral. Back-pack con panel posterior.', 'ALLY2-89-13.jpg', 'ALLY2-89-13.jpg', 0, 1),
(153, 'ALLY2-90-13', 'Bolsa Messenger Falcon', 'Bolsa messenger para laptop de 13´´. Bolsa frontal con seguro de broche. Se puede convertir en backpack y tiene tira para asegurarla al asa de la maleta.', 'ALLY2-90-13.jpg', 'ALLY2-90-13.jpg', 0, 1),
(154, 'ALLY2-91-13', 'Bolsa duffel Mia', 'Compartimento principal con cierre de zipper y bolsa frontal expandible para tapete de yoga. Colores: Azul con gris, Negro con verde y Negro con rosa.', 'ALLY2-91-13.jpg', 'ALLY2-91-13.jpg', 0, 1),
(155, 'ALLY2-92-13', 'Bolsa duffel Nicole', 'Compartimento principal grande. Exterior acolchado. Bolsa frontal con cierre metálico y pies metálicos para mantener la parte inferior limpia. Con tira para el asa de la maleta.', 'ALLY2-92-13.jpg', 'ALLY2-92-13.jpg', 0, 1),
(156, 'ALLY2-93-13', 'Maleta duffel Slazenger', 'Bolsa de nylon con compartimento en forma U con zipper y panel organizador. Puerto para audífonos y bolsa exterior para accesorios. Bolsa interior para zapatos y pies de plástico para mantenerla limpia.', 'ALLY2-93-13.jpg', 'ALLY2-93-13.jpg', 0, 1),
(157, 'ALLY2-94-13', 'Maleta duffel Colossus High Sierra', 'Maleta de polycanvas y nylon. Recubierta de PVC hace que el interior sea fácil de limpiar. Bolsa frontal con zipper y bolsa lateral con velcro, bolsa para botella de agua. Bolsa tricot para lentes de sol, goggles.', 'ALLY2-94-13.jpg', 'ALLY2-94-13.jpg', 0, 1),
(158, 'ALLY2-95-13', 'Maleta duffel Ejecutive Sport Wheeler High Sierra', 'Maleta de nylon con compartimento inferior con 2 bolsas de zipper y 2 de malla. Con llantas en línea y fijas. Asa telescópica que se extienden hasta 41´´.', 'ALLY2-95-13.jpg', 'ALLY2-95-13.jpg', 0, 1),
(159, 'ALLY2-96-13', 'Kit de utilidad elleven', 'Compartimento principal con zipper en forma U, bolsa de velcro frontal, 2 bolsas laterales de zipper, con organizador y divisores elásticos.', 'ALLY2-96-13.jpg', 'ALLY2-96-13.jpg', 0, 1),
(160, 'ALLY2-97-13', 'Clip para dinero Zippo', 'Clip de metal pulido para billetes y tarjetas. Incluye caja de regalo.', 'ALLY2-97-13.jpg', 'ALLY2-97-13.jpg', 0, 1),
(161, 'ALLY2-98-13', 'Set de excursión Trailblazer', 'Set de 4 piezas que incluye estuche de velcro con tira para el hombro, brújula, binoculares y utensilio multi-usos. El utensilio tiene cuchara, cuchillo, tenedor y sacacorchos. 5x30 magnificación binocular.', 'ALLY2-98-13.jpg', 'ALLY2-98-13.jpg', 0, 1),
(162, 'ALLY2-99-13', 'Mochila hielera con bocinas Encore', 'Compartimento anti fugas con capacidad de hasta 20 latas. Bocinas resistentes al agua compatibles con la mayoría de los reproductores de CD y MP3 incluyendo iPods. Puerto para audífonos, Requiere 4 baterías AA (no incluidas). Colores: Royal (azul) o plateado.', 'ALLY2-99-13.jpg', 'ALLY2-99-13.jpg', 0, 1),
(163, 'ALLY2-102-13', 'Organizador para asiento elleven', 'Este exclusivo diseño presenta una ventana para ver el iPad 1, 2 y versiones más recientes así como demás tablets. Incluye tecnología Tech Trap para transportar tu smartphone y sus respectivos cables. Un organizador. Se ajusta a la cabecera del asiento con un broche de metal y una cuerda elástica ajustable.', 'ALLY2-102-13.jpg', 'ALLY2-102-13.jpg', 0, 1),
(164, 'ALLY2-103-13', 'Kit de herramienta Highway Deluxe', 'Kit de 44 piezas. Contiene llaves, pinzas, cinta, cepillo, navaja, calibrador de llantas, base de desarmador con 3 adaptadores, 19 cubos, 11 sockets, cinta eléctrica, cepillo para llantas, cables para corriente y rompe ventanas con cortador de cinturón de seguridad. El set incluye estuche.', 'ALLY2-103-13.jpg', 'ALLY2-103-13.jpg', 0, 1),
(165, 'ALLY2-104-13', 'Kit de carretera neet', 'Set de 6 piezas que incluye cables de corriente, calibrador de llantas, linterna, desarmadores cabeza Phillips y de cruz así como estuche que sirve de soporte para las rodillas.', 'ALLY2-104-13.jpg', 'ALLY2-104-13.jpg', 0, 1),
(166, 'ALLY2-105-13', 'Lentes de sol Slazenger Pilot', 'Lentes de sol tipo Aviador con estuche resistente. Incluyen tela limpiadora.', 'ALLY2-105-13.jpg', 'ALLY2-105-13.jpg', 0, 1),
(167, 'ALLY2-106-13', 'Set de vino Milano', 'Set de 4 piezas que incluye estuche, saca corchos manual, drip ring y cortador de aluminio. El estuche tiene abertura tipo concha de almeja y cerradura de doble chasquido. Incluye caja de regalo.', 'ALLY2-106-13.jpg', 'ALLY2-106-13.jpg', 0, 1),
(168, 'ALLY2-107-13', 'Porta tarjetas Luxembourg', 'Tarjetero cromado', 'ALLY2-107-13.jpg', 'ALLY2-107-13.jpg', 0, 1),
(169, 'ALLY2-108-13', 'Clip para dinero Lira', 'Clip para dinero con acabado en metal plata. Incluye caja de regalo de 2 piezas.', 'ALLY2-108-13.jpg', 'ALLY2-108-13.jpg', 0, 1),
(170, 'ALLY2-109-13', 'Tarjetero Monte Carlo', 'Tarjetero de metal cromado y piel.', 'ALLY2-109-13.jpg', 'ALLY2-109-13.jpg', 0, 1),
(171, 'ALLY2-110-13', 'Bolsa Hartford Messenger', 'Bolsa para laptop con zipper y asas de cuero. Compartimentos para cables y accesorios. Bolsa extra para acceso fácil a documentos.', 'ALLY2-110-13.jpg', 'ALLY2-110-13.jpg', 0, 1),
(172, 'ALLY2-111-13', 'Bolsa Terra Verde', 'Bolsa amigable con el medio ambiente. Hecha de polipropileno afelpado y de buen tamaño para cargar con documentos, computadora o hasta los tennis para el gimnasio.', 'ALLY2-111-13.jpg', 'ALLY2-111-13.jpg', 0, 1),
(173, 'ALLY2-112-13', 'Bolsa Bar Harbor', 'Bolsa con compartimento principal expandible y 3 bolsas frontales. Hecha de algodón y con asas que combinan con la base de la misma.', 'ALLY2-112-13.jpg', 'ALLY2-112-13.jpg', 0, 1),
(174, 'ALLY2-113-13', 'Hielera Companion', 'Hielera de neopreno anti fugas y aislada. El compartimento principal puede contener 6 latas de 12 onzas. Bolsa frontal para guardar accesorios o condimentos.', 'ALLY2-113-13.jpg', 'ALLY2-113-13.jpg', 0, 1),
(175, 'ALLY2-114-13', 'Hielera mochila Ice River', 'Capacidad para 18 latas. Bolsas laterales para guardar accesorios y condimentos. Pads en el asa para mayor comodidad.', 'ALLY2-114-13.jpg', 'ALLY2-114-13.jpg', 0, 1),
(176, 'ALLY2-115-13', 'Hielera con ruedas Ice River', 'Hielera con capacidad para 54 latas o 34 latas y 3 botellas de vino. Asas laterales con pads para manejo accesible. Asa telescópica que se extiende hasta 24.5´´. Bolsas laterales con zipper para guardar utensilios y condimentos.', 'ALLY2-115-13.jpg', 'ALLY2-115-13.jpg', 0, 1),
(177, 'ALLY2-116-13', 'Hielera asiento Ice River', 'Hielera/asiento con capacidad para 12 latas, asa ajustable para el hombro y se dobla cuando se requiera guardar.', 'ALLY2-116-13.jpg', 'ALLY2-116-13.jpg', 0, 1),
(178, 'ALLY2-117-13', 'Set para café Malibú', 'Set de 4 tazas con platos y cucharitas de cerámica para expresso. Incluye caja.', 'ALLY2-117-13.jpg', 'ALLY2-117-13.jpg', 0, 1),
(179, 'ALLY2-118-13', 'Juego Terra de utensilios para parrilla', 'Juego de utensilios para parrilla de madera, acero inoxidable y plástico.', 'ALLY2-118-13.jpg', 'ALLY2-118-13.jpg', 0, 1),
(180, 'ALLY2-119-13', 'Portarretrato 7¨digital', 'Portarretratos 7¨digital MP3 y MP4', 'ALLY2-119-13.jpg', 'ALLY2-119-13.jpg', 0, 1),
(181, 'ALLY2-120-13', 'Maletín de poker bellagio', 'Maletín incluye 200 fichas, 2 barajas plastificadas, 5 dados, 1 ficha de dealer y llaves', 'ALLY2-120-13.jpg', 'ALLY2-120-13.jpg', 0, 1),
(182, 'ALLY2-121-13', 'Hielera BBQ', 'Hielera plegable con tapadera. Incluye 5 accesorios, sacacorchos, destapador, cuchillo, tenedor, espátula tenazas en acero inoxidable', 'ALLY2-121-13.jpg', 'ALLY2-121-13.jpg', 0, 1),
(183, 'ALLY2-122-13', 'Set de BBQ', 'Set de BBQ, incluye pinzas, espátula, tenedor para  BBQ y estuche metálico', 'ALLY2-122-13.jpg', 'ALLY2-122-13.jpg', 0, 1),
(184, 'ALLY2-123-13', 'Bolsa Lena', 'Bolsa hecha de tela canvas, medida 49 x 33 x 10cm', 'ALLY2-123-13.jpg', 'ALLY2-123-13.jpg', 0, 1),
(185, 'ALLY2-124-13', 'Bolsa de Playa', 'Bolsa de Yute, medidas 50 x 35 x 15cm', 'ALLY2-124-13.jpg', 'ALLY2-124-13.jpg', 0, 1),
(186, 'ALLY2-125-13', 'Asador Smokey Joe Gold', 'Asador weber portátil de carbón smokey Joe Gold', 'ALLY2-125-13.jpg', 'ALLY2-125-13.jpg', 0, 1),
(187, 'ALLY2-126-13', 'Asador de carbón de 22.5', 'Asador Kettle webber de 22.5¨ para carbón', 'ALLY2-126-13.jpg', 'ALLY2-126-13.jpg', 0, 1),
(188, 'ALLY2-127-13', 'Reloj de pulso con correa de caucho en color azul.', 'Reloj de pulso en color azul con correa de caucho de silicón, bisel rotatorio, cristal mineralizado y movimiento japonés de alta precisión. Incluye estuche de plástico. Resiste 1 ATM.', 'resized/Reloj_de_pulso_c_524445dc3e2a3_140x140.jpg', 'Reloj_de_pulso_c_524445dc4b582.jpg', 0, 1),
(189, 'ALLY2-128-13', 'Reloj de pulso con correa de caucho en color rojo.', 'Reloj de pulso en color rojo con correa de caucho de silicón, bisel rotatorio, cristal mineralizado y movimiento japonés de alta precisión. Incluye estuche de plástico. Resiste 1 ATM.', 'resized/Reloj_de_pulso_c_524445f85f5ee_140x140.jpg', 'Reloj_de_pulso_c_524445f86c10d.jpg', 0, 1),
(190, 'ALLY2-129-13', 'Reloj de pulso con correa de caucho en color negro.', 'Reloj de pulso en color negro con correa de caucho de silicón, bisel rotatorio, cristal mineralizado y movimiento japonés de alta precisión. Incluye estuche de plástico. Resiste 1 ATM.', 'resized/Reloj_de_pulso_c_5244461daa130_140x140.jpg', 'Reloj_de_pulso_c_5244461db7c17.jpg', 0, 1),
(191, 'ALLY2-130-13', 'Reloj con extensible de acero Chronographs', 'Reloj de pulso con cronógrafo, bisel rotatorio, cristal mineralizado y extensible de acero. Incluye estuche de metal color color plata. Resiste 3 ATM.', 'resized/Reloj_con_extens_524446448f775_140x140.jpg', 'Reloj_con_extens_524446449ed78.jpg', 0, 1),
(192, 'ALLY2-131-13', 'Reloj con correa negra de silicón integrada.', 'Reloj de pulso con correa negra de silicón, movimiento japonés de alta precisión, bisel rotatorio y cristal mineralizado. Incluye estuche de metal en color plata mate. Resiste 3 ATM.', 'resized/Reloj_con_correa_5244465a1237f_140x140.jpg', 'Reloj_con_correa_5244465a1cb77.jpg', 0, 1),
(193, 'ALLY2-132-13', 'Reloj con correa blanca de silicón integrada.', 'Reloj de pulso con correa blanca de silicón, movimiento japonés de alta precisión, bisel rotatorio y cristal mineralizado. Incluye estuche de metal en color plata mate. Resiste 3 ATM.', 'resized/Reloj_con_correa_524446813cf08_140x140.jpg', 'Reloj_con_correa_5244468147af9.jpg', 0, 1),
(194, 'ALLY2-133-13', 'Mochila de ruedas de Pitufos', 'Mochila infantil temática  con ruedas de personaje Pitufos', 'resized/Mochila_de_rueda_5243318ccfb8c_140x140.jpg', 'resized/Mochila_de_rueda_5243318ccfb8c_140x140.jpg', 0, 1),
(195, 'ALLY2-134-13', 'Mochila de ruedas De Winx 3D', 'Mochila infantil temática  con ruedas de personaje WINNX 3D', 'ALLY2-134-13.jpg', 'ALLY2-134-13.jpg', 0, 1),
(196, 'ALLY2-135-13', 'Adrenalina', '1 o 2 personas. Elige entre más de 85 actividades para 1 o 2 personas en DF, Hidalgo, Mich, Morelos, Pue, Gro, Qro, Tlax y Ver (salto en paracaídas, globo aerostático, 4x4 etc.). En algunas experiencias se incluye una noche de hospedaje', 'ALLY2-135-13.jpg', 'ALLY2-135-13.jpg', 0, 1),
(197, 'ALLY2-136-13', 'Aventura', '1 o 2 personas. Elige entre más de 100 actividades para 1 o 2 personas en DF, Hidalgo, Mich, Morelos, Pue, Gro, Qro, Tlax y Ver (bungy, golf, clases de surf, tubbing, esgrima, gotcha, etc).', 'ALLY2-136-13.jpg', 'ALLY2-136-13.jpg', 0, 1),
(198, 'ALLY2-137-13', 'MultiExperiencia', '1 o 2 personas. Elige entre más de 200 actividades  en DF, Hidalgo, Mich, Morelos, Pue, Gro, Qro, Tlax, Jal, Pue, Q.Roo, Ver (hoteles, cenas, spa, actividades, etc).', 'ALLY2-137-13.jpg', 'ALLY2-137-13.jpg', 0, 1),
(199, 'ALLY2-138-13', 'Relajación', '1 persona. Elige entre más de 190 tratamientos de bienestar para 1 persona en DF, Hidalgo, Morelos, Puebla, Querétaro y Veracruz. Masajes relajantes, faciales, yoga y pilates, chocolaterapia, diseño de imagen, exfoliaciones, etc.', 'ALLY2-138-13.jpg', 'ALLY2-138-13.jpg', 0, 1),
(200, 'ALLY2-139-13', 'Momento Relax', '1 persona. Elige entre más de 160 tratamientos de bienestar para 1 persona en DF, Hidalgo, Morelos, Puebla, Querétaro y Veracruz. Masajes relajantes, faciales, yoga y pilates, chocolaterapia, diseño de imagen, exfoliaciones, etc.', 'ALLY2-139-13.jpg', 'ALLY2-139-13.jpg', 0, 1),
(201, 'ALLY2-140-13', 'Cena para dos', '2 personas. Elige entre más de 50 cenas para 2 personas en la Ciudad de México, Cuernavaca y Monterrey. Cocina internacional, libanesa, italiana, peruana, gourmet, mexicana, francesa, japonesa, mediterránea y MÁS.', 'ALLY2-140-13.jpg', 'ALLY2-140-13.jpg', 0, 1),
(202, 'ALLY2-141-13', 'Escape pintoresco', '2 personas. Elige entre más de 65 hoteles pintorescos, una noche y desayuno incluido en DF, Guanajuato, Guerrero, Hidalgo, Michoacán, Morelos, Oaxaca, Puebla, Querétaro, Quintana Roo, Tlaxcala, Mérida y Veracruz.', 'ALLY2-141-13.jpg', 'ALLY2-141-13.jpg', 0, 1),
(203, 'ALLY2-142-13', 'Estancia con encanto', '2 personas. Elige entre más de 75 hoteles de 3-4*, una noche con desayuno y cena en la Zona Metropolitana de la Ciudad de México, Colima, Guanajuato, Guerreo, Hidalgo, Michoacán, Morelos, Puebla, Querétaro, Veracruz, Jalisco y Nuevo León.', 'ALLY2-142-13.jpg', 'ALLY2-142-13.jpg', 0, 1),
(204, 'ALLY2-143-13', 'Estancia Exquisita', '2 personas. Elige entre más de 60 hoteles 5*, una noche con desayuno y cena gourmet en la Ciudad de México, Guanajuato, Hidalgo, Michoacán, Morelos, Puebla, Monterrey, Guadalajara, Querétaro, Nuevo León, Jalisco y más.', 'ALLY2-143-13.jpg', 'ALLY2-143-13.jpg', 0, 1),
(205, 'ALLY2-144-13', 'Nayarit', '1 o 2 personas. Elige entre más de 50 actividades  en el Estado de Nayarit.', 'ALLY2-144-13.jpg', 'ALLY2-144-13.jpg', 0, 1),
(206, 'ALLY2-145-13', 'Blu Ray Samsung BD-F5100', 'Conéctate a tus aplicaciones favoritas cuando quieras. El BD-F5100 tiene precargadas una serie de aplicaciones como Youtube, Facebook o Accuweather, que te permitirán estar conectado a tus redes sociales y entretenido.', 'ALLY2-145-13.jpg', 'ALLY2-145-13.jpg', 0, 1),
(207, 'ALLY2-147-13', 'Refrigerador 14 pies', 'Capacidad De 14 Pies Cúbicos \nControles En Perilla\nParrillas De Cristal Templado\nCajón De Frutas Y Verduras\nSin Jaladera En Puerta', 'ALLY2-147-13.jpg', 'ALLY2-147-13.jpg', 0, 1),
(208, 'ALLY2-148-13', 'Home theater', 'FULL HD 1080 ESCALADO\nLECTURA DE MULTITUD DE FORMATOS\nUSB: DISFRUTA DE TUS FOTOS, CANCIONES Y PELÍCULAS DIRECTAMENTE DESDE EL USB', 'ALLY2-148-13.jpg', 'ALLY2-148-13.jpg', 0, 1),
(209, 'ALLY2-150-13', 'DVD Sony', 'Descubre el modelo DVD más accesible y delgado de la línea Sony. Con sólo 270 mm de ancho, el avanzado reproductor DVP-SR115 cuenta con funciones de reproducción tanto de video como de archivos multimedia como música MP3, imágenes JPG las cuales, incluso, pueden ser descargados de algún disco DVD. Además, disfruta de su función multiformato y mando a distancia para la TV.', 'ALLY2-150-13.jpg', 'ALLY2-150-13.jpg', 0, 1),
(210, 'ALLY2-151-13', 'REFRIG G E GSMT6AAEDFGP 26P SILVER', 'Control de temperatura digital exterior.  \n-Fábrica de hielos.  \n-Despachador de agua.  \n-Alarma en puerta.  \n-3 parrillas de cristal templado.  \n-4 anaqueles transparentes (2 fijos / 2 ajustables).  \n-2 cajones con tapa de cristal.  \n-5 anaqueles en puerta.  \n-Silver.  \n-26 pies.', 'ALLY2-151-13.jpg', 'ALLY2-151-13.jpg', 0, 1),
(211, 'ALLY2-152-13', 'Mini componente Sony', 'Minicomponente de 120W (RMS) con función de grabación y reproducción de MP3 por USB.', 'ALLY2-152-13.jpg', 'ALLY2-152-13.jpg', 0, 1),
(212, 'ALLY2-153-13', 'Grabadora Sony', 'Sony Grabadora ZS-S10CP Compact CD Boombox, 2W, AM/FM, Negro', 'ALLY2-153-13.jpg', 'ALLY2-153-13.jpg', 0, 1),
(213, 'ALLY2-154-13', 'Ipod Touch 5ta generación de 32 GB', 'Ipod Touch 5ta generacion de 32 GB', 'ALLY2-154-13.jpg', 'ALLY2-154-13.jpg', 0, 1),
(214, 'ALLY2-155-13', 'Ipod Touch 5ta generacion de 64 GB', 'Ipod Touch 5ta generacion de 64 GB', 'ALLY2-155-13.jpg', 'ALLY2-155-13.jpg', 0, 1),
(215, 'ALLY2-156-13', 'IPAD MINI WI-FI 16GB BLANCA Y NEGRA', 'IPAD MINI WI-FI 16GB BLANCA Y NEGRA', 'ALLY2-156-13.jpg', 'ALLY2-156-13.jpg', 0, 1),
(216, 'ALLY2-157-13', 'IPAD MINI WI-FI 32GB BLANCA Y NEGRA', 'IPAD MINI WI-FI 32GB BLANCA Y NEGRA', 'ALLY2-157-13.jpg', 'ALLY2-157-13.jpg', 0, 1),
(217, 'ALLY2-158-13', 'IPAD MINI WI-FI CELLULAR 16GB BLACK-SPA', 'IPAD MINI WI-FI CELLULAR 16GB BLACK-SPA', 'ALLY2-158-13.jpg', 'ALLY2-158-13.jpg', 0, 1),
(218, 'ALLY2-159-13', 'IPAD MINI 5   64GB', 'IPAD MINI WI-FI 64GB BLACK-SPA .', 'ALLY2-159-13.jpg', 'ALLY2-159-13.jpg', 0, 1),
(219, 'ALLY2-160-13', 'IPAD 4GEN WI-FI 16GB WHITE/BLACK-SPA', 'IPAD 4GEN WI-FI 16GB WHITE/BLACK-SPA', 'ALLY2-160-13.jpg', 'ALLY2-160-13.jpg', 0, 1),
(220, 'ALLY2-161-13', 'IPAD 4GEN WI-FI 32GB WHITE/BLACK-SPA .', 'IPAD 4GEN WI-FI 32GB WHITE/BLACK-SPA .', 'ALLY2-161-13.jpg', 'ALLY2-161-13.jpg', 0, 1),
(221, 'ALLY2-162-13', 'IPAD 4GEN WI-FI CELLULAR 32GB BLACK-SPA', 'IPAD 4GEN WI-FI CELLULAR 32GB BLACK-SPA', 'ALLY2-162-13.jpg', 'ALLY2-162-13.jpg', 0, 1),
(222, 'ALLY2-163-13', 'IPAD 4GEN WI-FI 64GB WHITE/BLACK-SPA .', 'IPAD 4GEN WI-FI 64GB WHITE/BLACK-SPA .', 'ALLY2-163-13.jpg', 'ALLY2-163-13.jpg', 0, 1),
(223, 'ALLY2-164-13', 'IPOD NANO 16 GB', 'IPOD NANO 16 GB', 'ALLY2-164-13.jpg', 'ALLY2-164-13.jpg', 0, 1),
(224, 'ALLY2-165-13', 'IPOD SHUFFLE 2GB AZUL .', 'IPOD SHUFFLE 2GB AZUL .', 'ALLY2-165-13.jpg', 'ALLY2-165-13.jpg', 0, 1),
(225, 'ALLY2-166-13', 'IPOD CLASSIC 160G/BLACK', 'IPOD CLASSIC 160G/BLACK', 'ALLY2-166-13.jpg', 'ALLY2-166-13.jpg', 0, 1),
(226, 'ALLY2-167-13', 'APPLE REMOTE', 'APPLE REMOTE', 'ALLY2-167-13.jpg', 'ALLY2-167-13.jpg', 0, 1),
(227, 'ALLY2-168-13', 'IPAD MINI SMART COVER LIGHT GRAY ZML', 'IPAD MINI SMART COVER LIGHT GRAY ZML', 'ALLY2-168-13.jpg', 'ALLY2-168-13.jpg', 0, 1),
(228, 'ALLY2-169-13', 'MAGSAFE TO MAGSAFE 2 CONVERTER', 'MAGSAFE TO MAGSAFE 2 CONVERTER', 'ALLY2-169-13.jpg', 'ALLY2-169-13.jpg', 0, 1),
(229, 'ALLY2-170-13', 'MACBOOK AIR 11.6/ I5DC 1.3GHZ/4 256FLASH-SPA', 'MACBOOK AIR 11.6/ I5DC 1.3GHZ/4 256FLASH-SPA', 'ALLY2-170-13.jpg', 'ALLY2-170-13.jpg', 0, 1),
(230, 'ALLY2-171-13', 'Laptop Samsung', 'SAMSUNG ATIVBOOK2 15.6 PEN_2117U 4GB 500GB WIN 8. MINERAL', 'ALLY2-171-13.jpg', 'ALLY2-171-13.jpg', 0, 1),
(231, 'ALLY2-172-13', 'Laptop Presario', 'LAPTOP PRESARIO CQ45-D03LA 14 E1-1500 4G 500G WIN8 DVDSM NEGRO', 'ALLY2-172-13.jpg', 'ALLY2-172-13.jpg', 0, 1),
(232, 'ALLY2-174-13', 'Cámara Canon', 'CAMARA DIGITAL EOS REBELT5I 18-55 ISSTM US', 'ALLY2-174-13.jpg', 'ALLY2-174-13.jpg', 0, 1),
(233, 'ALLY2-175-13', 'Camara Samsung', 'CAMARA DIGITAL SAMSUNG 14M 18X WIFI BLANCA HVGA C/ESTUCHE MEM 4GB', 'ALLY2-175-13.jpg', 'ALLY2-175-13.jpg', 0, 1),
(234, 'ALLY2-176-13', 'Aspiradora Koblenz', 'Aspiradora de mano portátil y ligera; Color: Blanco con copa de polvo translúcida en color uva; Características eléctricas: 120 Volts; Potencia de motor: 400 W; Cable extra largo de 5.5m; Filtro de tela lavable\n•ACCESORIOS: 1 accesorio esquinero con adaptador', 'ALLY2-176-13.jpg', 'ALLY2-176-13.jpg', 0, 1),
(235, 'ALLY2-177-13', 'CELULAR SONY ERICSSON J108 PLATA', 'Cámara fotográfica de 2 megapíxeles.\nSalida de 3,5 milímetros para auriculares.\nMemoria interna de 280 MB.\nRanura para tarjetas de memoria microSD y microSDHC.', 'ALLY2-177-13.jpg', 'ALLY2-177-13.jpg', 0, 1),
(236, 'ALLY2-178-13', 'CELULAR SONY ERICSSON X10 BLANCO MINI', 'está equipado con el procesador Qualcomm Snapdragon de 1 GHz, cámara de 8 megapixels con autofocus, soporte para gráficos 3D y conectividad HSDPA a 7.2 Mbps.', 'ALLY2-178-13.jpg', 'ALLY2-178-13.jpg', 0, 1),
(237, 'ALLY2-179-13', 'CELULAR NOKIA C3 GRIS', 'El Nokia C3 (Gris) llega como un móvil enfocado a redes sociales que opera bajo un sistema operativo Symbian S40,  el cual es suficiente para ejecutar infinidades de  programas y aplicaciones así como manejo de redes sociales que hay en Internet. Incorpora acceso a Ovi Mail (Email en el dispositivo) y Ovi Chat (para mantenerse en contacto con tus amigos). Posee una pantalla QVGA de 2.4 pulgadas, Wi-Fi, cámara de 2 megapixels y conector de auriculares de 3.5 mm. Su pantalla de inicio provee acceso rápido a aplicaciones y redes sociales.', 'ALLY2-179-13.jpg', 'ALLY2-179-13.jpg', 0, 1);
INSERT INTO `product` (`id`, `sku`, `other_sku`, `description`, `thumb_image`, `full_image`, `last_update`, `product_status`) VALUES
(238, 'Product_sku', 'Product_name', 'Product_desc', 'product_full_image', 'product_full_image', 0, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `product_category`
--

CREATE TABLE IF NOT EXISTS `product_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_id` (`product_id`),
  KEY `category_id` (`category_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=120 ;

--
-- Volcado de datos para la tabla `product_category`
--

INSERT INTO `product_category` (`id`, `category_id`, `product_id`) VALUES
(1, 6, 185),
(2, 3, 178),
(3, 5, 192),
(4, 6, 173),
(5, 4, 81),
(6, 2, 186),
(7, 6, 75),
(8, 6, 184),
(9, 1, 159),
(10, 1, 151),
(11, 2, 56),
(12, 6, 139),
(13, 6, 140),
(14, 4, 83),
(15, 4, 45),
(16, 1, 163),
(17, 6, 147),
(18, 3, 99),
(19, 3, 15),
(20, 6, 120),
(21, 5, 170),
(22, 4, 80),
(23, 4, 26),
(24, 2, 182),
(25, 2, 183),
(26, 6, 155),
(27, 6, 132),
(28, 6, 189),
(29, 4, 24),
(30, 6, 78),
(31, 5, 190),
(32, 3, 116),
(33, 6, 133),
(34, 5, 73),
(35, 3, 115),
(36, 2, 175),
(37, 6, 193),
(38, 4, 84),
(39, 3, 17),
(40, 3, 10),
(41, 3, 16),
(42, 2, 177),
(43, 4, 181),
(44, 5, 168),
(45, 1, 164),
(46, 5, 48),
(47, 5, 148),
(48, 3, 14),
(49, 6, 134),
(50, 5, 160),
(51, 6, 146),
(52, 4, 82),
(53, 5, 169),
(54, 5, 74),
(55, 6, 171),
(56, 4, 28),
(57, 1, 157),
(58, 4, 22),
(59, 1, 55),
(60, 6, 77),
(61, 6, 79),
(62, 3, 11),
(63, 1, 152),
(64, 4, 9),
(65, 6, 172),
(66, 2, 54),
(67, 2, 187),
(68, 3, 117),
(69, 5, 130),
(70, 5, 188),
(71, 4, 8),
(72, 5, 49),
(73, 3, 12),
(74, 4, 43),
(75, 4, 25),
(76, 4, 36),
(77, 4, 21),
(78, 3, 114),
(79, 1, 149),
(80, 3, 100),
(81, 5, 72),
(82, 5, 124),
(83, 1, 156),
(84, 1, 150),
(85, 5, 122),
(86, 4, 23),
(87, 6, 131),
(88, 2, 176),
(89, 3, 167),
(90, 6, 51),
(91, 4, 7),
(92, 2, 162),
(93, 3, 18),
(94, 5, 129),
(95, 5, 141),
(96, 4, 27),
(97, 2, 179),
(98, 6, 76),
(99, 2, 145),
(100, 2, 143),
(101, 5, 142),
(102, 1, 158),
(103, 1, 153),
(104, 1, 165),
(105, 5, 191),
(106, 5, 128),
(107, 2, 161),
(108, 4, 64),
(109, 2, 174),
(110, 5, 166),
(111, 5, 123),
(112, 3, 13),
(113, 6, 121),
(114, 4, 1),
(115, 4, 2),
(116, 4, 3),
(117, 5, 4),
(118, 5, 5),
(119, 5, 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `product_price`
--

CREATE TABLE IF NOT EXISTS `product_price` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(10) unsigned NOT NULL,
  `price` float(20,5) unsigned NOT NULL,
  `currency` varchar(125) COLLATE utf8_spanish2_ci NOT NULL,
  `last_update` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_id` (`product_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=330 ;

--
-- Volcado de datos para la tabla `product_price`
--

INSERT INTO `product_price` (`id`, `product_id`, `price`, `currency`, `last_update`) VALUES
(1, 101, 972.00000, 'Puntos', 1380064653),
(2, 35, 1028.00000, 'Puntos', 1380064654),
(3, 78, 89452.00000, 'Puntos', 1380064653),
(4, 104, 2170.00000, 'Puntos', 1380064653),
(5, 225, 20931.00000, 'Puntos', 1380064653),
(6, 182, 4307.00000, 'Puntos', 1380064653),
(7, 95, 1463.00000, 'Puntos', 1380064653),
(8, 208, 10926.00000, 'Puntos', 1380064653),
(9, 185, 469.00000, 'Puntos', 1380064653),
(10, 16, 3689.00000, 'Puntos', 1380064653),
(11, 187, 8473.00000, 'Puntos', 1380064653),
(12, 120, 4613.00000, 'Puntos', 1380064653),
(13, 93, 1755.00000, 'Puntos', 1380064653),
(14, 231, 32113.00000, 'Puntos', 1380064653),
(15, 23, 3629.00000, 'Puntos', 1380064653),
(16, 8, 24228.00000, 'Puntos', 1380064654),
(17, 24, 4235.00000, 'Puntos', 1380064653),
(18, 147, 13578.00000, 'Puntos', 1380064653),
(19, 39, 13493.00000, 'Puntos', 1380064654),
(20, 235, 8515.00000, 'Puntos', 1380064653),
(21, 138, 24295.00000, 'Puntos', 1380064653),
(22, 56, 1070.00000, 'Puntos', 1380064654),
(23, 194, 2311.00000, 'Puntos', 1380064653),
(24, 76, 10141.00000, 'Puntos', 1380064653),
(25, 229, 97290.00000, 'Puntos', 1380064653),
(26, 7, 37725.00000, 'Puntos', 1380064654),
(27, 99, 2002.00000, 'Puntos', 1380064653),
(28, 140, 4159.00000, 'Puntos', 1380064653),
(29, 141, 4159.00000, 'Puntos', 1380064653),
(30, 46, 18647.00000, 'Puntos', 1380064654),
(31, 215, 28836.00000, 'Puntos', 1380064653),
(32, 30, 10616.00000, 'Puntos', 1380064653),
(33, 114, 1525.00000, 'Puntos', 1380064653),
(34, 10, 24347.00000, 'Puntos', 1380064653),
(35, 227, 2857.00000, 'Puntos', 1380064653),
(36, 17, 3689.00000, 'Puntos', 1380064653),
(37, 57, 2201.00000, 'Puntos', 1380064654),
(38, 212, 7236.00000, 'Puntos', 1380064653),
(39, 62, 70835.00000, 'Puntos', 1380064654),
(40, 52, 19603.00000, 'Puntos', 1380064654),
(41, 173, 2117.00000, 'Puntos', 1380064653),
(42, 38, 16152.00000, 'Puntos', 1380064654),
(43, 98, 3665.00000, 'Puntos', 1380064653),
(44, 226, 1627.00000, 'Puntos', 1380064653),
(45, 133, 6857.00000, 'Puntos', 1380064653),
(46, 181, 2696.00000, 'Puntos', 1380064653),
(47, 139, 2554.00000, 'Puntos', 1380064653),
(48, 79, 336598.00000, 'Puntos', 1380064653),
(49, 119, 2571.00000, 'Puntos', 1380064653),
(50, 177, 2328.00000, 'Puntos', 1380064653),
(51, 195, 2311.00000, 'Puntos', 1380064653),
(52, 175, 2328.00000, 'Puntos', 1380064653),
(53, 165, 4072.00000, 'Puntos', 1380064653),
(54, 172, 1641.00000, 'Puntos', 1380064653),
(55, 110, 14790.00000, 'Puntos', 1380064653),
(56, 96, 1360.00000, 'Puntos', 1380064653),
(57, 217, 39935.00000, 'Puntos', 1380064653),
(58, 189, 2431.00000, 'Puntos', 1380064653),
(59, 12, 15323.00000, 'Puntos', 1380064653),
(60, 196, 15252.00000, 'Puntos', 1380064653),
(61, 111, 10133.00000, 'Puntos', 1380064653),
(62, 18, 17390.00000, 'Puntos', 1380064653),
(63, 48, 117.00000, 'Puntos', 1380064654),
(64, 73, 10756.00000, 'Puntos', 1380064653),
(65, 205, 6040.00000, 'Puntos', 1380064653),
(66, 54, 1863.00000, 'Puntos', 1380064654),
(67, 27, 6052.00000, 'Puntos', 1380064653),
(68, 188, 2431.00000, 'Puntos', 1380064653),
(69, 128, 5534.00000, 'Puntos', 1380064653),
(70, 59, 28636.00000, 'Puntos', 1380064654),
(71, 33, 70654.00000, 'Puntos', 1380064654),
(72, 213, 25817.00000, 'Puntos', 1380064653),
(73, 184, 539.00000, 'Puntos', 1380064653),
(74, 210, 79718.00000, 'Puntos', 1380064653),
(75, 11, 34458.00000, 'Puntos', 1380064653),
(76, 105, 1226.00000, 'Puntos', 1380064653),
(77, 97, 1054.00000, 'Puntos', 1380064653),
(78, 150, 3936.00000, 'Puntos', 1380064653),
(79, 156, 4751.00000, 'Puntos', 1380064653),
(80, 81, 1351.00000, 'Puntos', 1380064653),
(81, 36, 549.00000, 'Puntos', 1380064654),
(82, 176, 4868.00000, 'Puntos', 1380064653),
(83, 180, 5474.00000, 'Puntos', 1380064653),
(84, 178, 1096.00000, 'Puntos', 1380064653),
(85, 53, 4412.00000, 'Puntos', 1380064654),
(86, 207, 33354.00000, 'Puntos', 1380064653),
(87, 68, 6423.00000, 'Puntos', 1380064653),
(88, 75, 9711.00000, 'Puntos', 1380064653),
(89, 85, 2791.00000, 'Puntos', 1380064653),
(90, 169, 305.00000, 'Puntos', 1380064653),
(91, 31, 15255.00000, 'Puntos', 1380064653),
(92, 25, 4235.00000, 'Puntos', 1380064653),
(93, 107, 2653.00000, 'Puntos', 1380064653),
(94, 28, 4841.00000, 'Puntos', 1380064653),
(95, 106, 6160.00000, 'Puntos', 1380064653),
(96, 190, 2431.00000, 'Puntos', 1380064653),
(97, 29, 5113.00000, 'Puntos', 1380064653),
(98, 230, 44333.00000, 'Puntos', 1380064653),
(99, 83, 1409.00000, 'Puntos', 1380064653),
(100, 161, 3393.00000, 'Puntos', 1380064653),
(101, 65, 5654.00000, 'Puntos', 1380064653),
(102, 77, 247146.00000, 'Puntos', 1380064653),
(103, 41, 23870.00000, 'Puntos', 1380064654),
(104, 50, 1670.00000, 'Puntos', 1380064654),
(105, 152, 10862.00000, 'Puntos', 1380064653),
(106, 61, 50366.00000, 'Puntos', 1380064654),
(107, 222, 59076.00000, 'Puntos', 1380064653),
(108, 148, 4072.00000, 'Puntos', 1380064653),
(109, 121, 2384.00000, 'Puntos', 1380064653),
(110, 160, 1695.00000, 'Puntos', 1380064653),
(111, 171, 4954.00000, 'Puntos', 1380064653),
(112, 67, 6945.00000, 'Puntos', 1380064653),
(113, 146, 1356.00000, 'Puntos', 1380064653),
(114, 26, 6052.00000, 'Puntos', 1380064653),
(115, 216, 37160.00000, 'Puntos', 1380064653),
(116, 86, 5879.00000, 'Puntos', 1380064653),
(117, 134, 5312.00000, 'Puntos', 1380064653),
(118, 91, 2393.00000, 'Puntos', 1380064653),
(119, 19, 1773.00000, 'Puntos', 1380064653),
(120, 157, 7467.00000, 'Puntos', 1380064653),
(121, 100, 1927.00000, 'Puntos', 1380064653),
(122, 145, 1084.00000, 'Puntos', 1380064653),
(123, 168, 575.00000, 'Puntos', 1380064653),
(124, 233, 11137.00000, 'Puntos', 1380064653),
(125, 203, 8480.00000, 'Puntos', 1380064653),
(126, 55, 3393.00000, 'Puntos', 1380064654),
(127, 197, 2989.00000, 'Puntos', 1380064653),
(128, 193, 3316.00000, 'Puntos', 1380064653),
(129, 70, 6453.00000, 'Puntos', 1380064653),
(130, 112, 31801.00000, 'Puntos', 1380064653),
(131, 20, 5901.00000, 'Puntos', 1380064653),
(132, 151, 6516.00000, 'Puntos', 1380064653),
(133, 51, 4191.00000, 'Puntos', 1380064654),
(134, 34, 12100.00000, 'Puntos', 1380064654),
(135, 74, 10264.00000, 'Puntos', 1380064653),
(136, 236, 29043.00000, 'Puntos', 1380064653),
(137, 22, 1811.00000, 'Puntos', 1380064653),
(138, 90, 19491.00000, 'Puntos', 1380064653),
(139, 204, 15191.00000, 'Puntos', 1380064653),
(140, 164, 7467.00000, 'Puntos', 1380064653),
(141, 69, 6453.00000, 'Puntos', 1380064653),
(142, 103, 8385.00000, 'Puntos', 1380064653),
(143, 186, 4353.00000, 'Puntos', 1380064653),
(144, 117, 1892.00000, 'Puntos', 1380064653),
(145, 118, 1561.00000, 'Puntos', 1380064653),
(146, 123, 899.00000, 'Puntos', 1380064653),
(147, 37, 5692.00000, 'Puntos', 1380064654),
(148, 80, 1621.00000, 'Puntos', 1380064653),
(149, 116, 1064.00000, 'Puntos', 1380064653),
(150, 49, 117.00000, 'Puntos', 1380064654),
(151, 108, 5007.00000, 'Puntos', 1380064653),
(152, 158, 22405.00000, 'Puntos', 1380064653),
(153, 131, 2797.00000, 'Puntos', 1380064653),
(154, 40, 1598.00000, 'Puntos', 1380064654),
(155, 21, 7122.00000, 'Puntos', 1380064653),
(156, 9, 30286.00000, 'Puntos', 1380064654),
(157, 82, 2189.00000, 'Puntos', 1380064653),
(158, 126, 1799.00000, 'Puntos', 1380064653),
(159, 66, 4056.00000, 'Puntos', 1380064653),
(160, 113, 30130.00000, 'Puntos', 1380064653),
(161, 200, 3355.00000, 'Puntos', 1380064653),
(162, 237, 9175.00000, 'Puntos', 1380064653),
(163, 214, 34433.00000, 'Puntos', 1380064653),
(164, 211, 10258.00000, 'Puntos', 1380064653),
(165, 232, 87499.00000, 'Puntos', 1380064653),
(166, 149, 10862.00000, 'Puntos', 1380064653),
(167, 89, 4578.00000, 'Puntos', 1380064653),
(168, 170, 464.00000, 'Puntos', 1380064653),
(169, 72, 8113.00000, 'Puntos', 1380064653),
(170, 132, 5716.00000, 'Puntos', 1380064653),
(171, 63, 161205.00000, 'Puntos', 1380064654),
(172, 45, 8325.00000, 'Puntos', 1380064654),
(173, 102, 1830.00000, 'Puntos', 1380064653),
(174, 44, 4581.00000, 'Puntos', 1380064654),
(175, 135, 4497.00000, 'Puntos', 1380064653),
(176, 14, 15323.00000, 'Puntos', 1380064653),
(177, 60, 36574.00000, 'Puntos', 1380064654),
(178, 92, 5380.00000, 'Puntos', 1380064653),
(179, 43, 5143.00000, 'Puntos', 1380064654),
(180, 88, 3655.00000, 'Puntos', 1380064653),
(181, 109, 8321.00000, 'Puntos', 1380064653),
(182, 84, 1428.00000, 'Puntos', 1380064653),
(183, 71, 8543.00000, 'Puntos', 1380064653),
(184, 153, 4751.00000, 'Puntos', 1380064653),
(185, 115, 2164.00000, 'Puntos', 1380064653),
(186, 163, 1328.00000, 'Puntos', 1380064653),
(187, 142, 3421.00000, 'Puntos', 1380064653),
(188, 221, 56865.00000, 'Puntos', 1380064653),
(189, 94, 1218.00000, 'Puntos', 1380064653),
(190, 183, 1223.00000, 'Puntos', 1380064653),
(191, 127, 1938.00000, 'Puntos', 1380064653),
(192, 125, 1084.00000, 'Puntos', 1380064653),
(193, 130, 4378.00000, 'Puntos', 1380064653),
(194, 234, 2811.00000, 'Puntos', 1380064653),
(195, 58, 15925.00000, 'Puntos', 1380064654),
(196, 192, 3316.00000, 'Puntos', 1380064653),
(197, 179, 1526.00000, 'Puntos', 1380064653),
(198, 15, 5545.00000, 'Puntos', 1380064653),
(199, 87, 2740.00000, 'Puntos', 1380064653),
(200, 144, 1626.00000, 'Puntos', 1380064653),
(201, 143, 989.00000, 'Puntos', 1380064653),
(202, 137, 5562.00000, 'Puntos', 1380064653),
(203, 159, 2441.00000, 'Puntos', 1380064653),
(204, 136, 1765.00000, 'Puntos', 1380064653),
(205, 154, 2238.00000, 'Puntos', 1380064653),
(206, 219, 42357.00000, 'Puntos', 1380064653),
(207, 218, 45477.00000, 'Puntos', 1380064653),
(208, 224, 4296.00000, 'Puntos', 1380064653),
(209, 206, 8099.00000, 'Puntos', 1380064653),
(210, 166, 2415.00000, 'Puntos', 1380064653),
(211, 155, 4072.00000, 'Puntos', 1380064653),
(212, 191, 7005.00000, 'Puntos', 1380064653),
(213, 223, 12915.00000, 'Puntos', 1380064653),
(214, 129, 2908.00000, 'Puntos', 1380064653),
(215, 42, 23870.00000, 'Puntos', 1380064654),
(216, 162, 4072.00000, 'Puntos', 1380064653),
(217, 64, 27259.00000, 'Puntos', 1380064654),
(218, 174, 1163.00000, 'Puntos', 1380064653),
(219, 228, 988.00000, 'Puntos', 1380064653),
(220, 167, 2984.00000, 'Puntos', 1380064653),
(221, 124, 1046.00000, 'Puntos', 1380064653),
(222, 220, 50712.00000, 'Puntos', 1380064653),
(223, 13, 20252.00000, 'Puntos', 1380064653),
(224, 198, 4819.00000, 'Puntos', 1380064653),
(225, 199, 5186.00000, 'Puntos', 1380064653),
(226, 201, 5186.00000, 'Puntos', 1380064653),
(227, 202, 5430.00000, 'Puntos', 1380064653),
(228, 122, 3137.00000, 'Puntos', 1380064653),
(229, 32, 30511.00000, 'Puntos', 1380064653),
(230, 209, 3011.00000, 'Puntos', 1380064653),
(231, 1, 36345.00000, 'Puntos', 1380064654),
(232, 2, 44221.00000, 'Puntos', 1380064654),
(233, 3, 5447.00000, 'Puntos', 1380064654),
(234, 4, 24788.00000, 'Puntos', 1380064654),
(235, 5, 22034.00000, 'Puntos', 1380064654),
(236, 6, 17411.00000, 'Puntos', 1380064654),
(237, 101, 972.00000, 'Puntos', 1380064653),
(238, 35, 1028.00000, 'Puntos', 1380064654),
(239, 78, 89452.00000, 'Puntos', 1380064653),
(240, 104, 2170.00000, 'Puntos', 1380064653),
(241, 225, 20931.00000, 'Puntos', 1380064653),
(242, 182, 4307.00000, 'Puntos', 1380064653),
(243, 95, 1463.00000, 'Puntos', 1380064653),
(244, 208, 10926.00000, 'Puntos', 1380064653),
(245, 185, 469.00000, 'Puntos', 1380064653),
(246, 16, 3689.00000, 'Puntos', 1380064653),
(247, 187, 8473.00000, 'Puntos', 1380064653),
(248, 120, 4613.00000, 'Puntos', 1380064653),
(249, 93, 1755.00000, 'Puntos', 1380064653),
(250, 231, 32113.00000, 'Puntos', 1380064653),
(251, 23, 3629.00000, 'Puntos', 1380064653),
(252, 8, 24228.00000, 'Puntos', 1380064654),
(253, 24, 4235.00000, 'Puntos', 1380064653),
(254, 147, 13578.00000, 'Puntos', 1380064653),
(255, 39, 13493.00000, 'Puntos', 1380064654),
(256, 235, 8515.00000, 'Puntos', 1380064653),
(257, 138, 24295.00000, 'Puntos', 1380064653),
(258, 56, 1070.00000, 'Puntos', 1380064654),
(259, 194, 2311.00000, 'Puntos', 1380064653),
(260, 76, 10141.00000, 'Puntos', 1380064653),
(261, 229, 97290.00000, 'Puntos', 1380064653),
(262, 7, 37725.00000, 'Puntos', 1380064654),
(263, 99, 2002.00000, 'Puntos', 1380064653),
(264, 140, 4159.00000, 'Puntos', 1380064653),
(265, 141, 4159.00000, 'Puntos', 1380064653),
(266, 46, 18647.00000, 'Puntos', 1380064654),
(267, 215, 28836.00000, 'Puntos', 1380064653),
(268, 30, 10616.00000, 'Puntos', 1380064653),
(269, 114, 1525.00000, 'Puntos', 1380064653),
(270, 10, 24347.00000, 'Puntos', 1380064653),
(271, 227, 2857.00000, 'Puntos', 1380064653),
(272, 17, 3689.00000, 'Puntos', 1380064653),
(273, 57, 2201.00000, 'Puntos', 1380064654),
(274, 212, 7236.00000, 'Puntos', 1380064653),
(275, 62, 70835.00000, 'Puntos', 1380064654),
(276, 52, 19603.00000, 'Puntos', 1380064654),
(277, 173, 2117.00000, 'Puntos', 1380064653),
(278, 38, 16152.00000, 'Puntos', 1380064654),
(279, 98, 3665.00000, 'Puntos', 1380064653),
(280, 226, 1627.00000, 'Puntos', 1380064653),
(281, 133, 6857.00000, 'Puntos', 1380064653),
(282, 181, 2696.00000, 'Puntos', 1380064653),
(283, 139, 2554.00000, 'Puntos', 1380064653),
(284, 79, 336598.00000, 'Puntos', 1380064653),
(285, 119, 2571.00000, 'Puntos', 1380064653),
(286, 177, 2328.00000, 'Puntos', 1380064653),
(287, 195, 2311.00000, 'Puntos', 1380064653),
(288, 175, 2328.00000, 'Puntos', 1380064653),
(289, 165, 4072.00000, 'Puntos', 1380064653),
(290, 172, 1641.00000, 'Puntos', 1380064653),
(291, 110, 14790.00000, 'Puntos', 1380064653),
(292, 96, 1360.00000, 'Puntos', 1380064653),
(293, 217, 39935.00000, 'Puntos', 1380064653),
(294, 189, 2431.00000, 'Puntos', 1380064653),
(295, 12, 15323.00000, 'Puntos', 1380064653),
(296, 196, 15252.00000, 'Puntos', 1380064653),
(297, 111, 10133.00000, 'Puntos', 1380064653),
(298, 18, 17390.00000, 'Puntos', 1380064653),
(299, 48, 117.00000, 'Puntos', 1380064654),
(300, 73, 10756.00000, 'Puntos', 1380064653),
(301, 205, 6040.00000, 'Puntos', 1380064653),
(302, 54, 1863.00000, 'Puntos', 1380064654),
(303, 27, 6052.00000, 'Puntos', 1380064653),
(304, 188, 2431.00000, 'Puntos', 1380064653),
(305, 128, 5534.00000, 'Puntos', 1380064653),
(306, 59, 28636.00000, 'Puntos', 1380064654),
(307, 33, 70654.00000, 'Puntos', 1380064654),
(308, 213, 25817.00000, 'Puntos', 1380064653),
(309, 184, 539.00000, 'Puntos', 1380064653),
(310, 210, 79718.00000, 'Puntos', 1380064653),
(311, 11, 34458.00000, 'Puntos', 1380064653),
(312, 105, 1226.00000, 'Puntos', 1380064653),
(313, 97, 1054.00000, 'Puntos', 1380064653),
(314, 150, 3936.00000, 'Puntos', 1380064653),
(315, 156, 4751.00000, 'Puntos', 1380064653),
(316, 81, 1351.00000, 'Puntos', 1380064653),
(317, 36, 549.00000, 'Puntos', 1380064654),
(318, 176, 4868.00000, 'Puntos', 1380064653),
(319, 180, 5474.00000, 'Puntos', 1380064653),
(320, 178, 1096.00000, 'Puntos', 1380064653),
(321, 53, 4412.00000, 'Puntos', 1380064654),
(322, 207, 33354.00000, 'Puntos', 1380064653),
(323, 68, 6423.00000, 'Puntos', 1380064653),
(324, 75, 9711.00000, 'Puntos', 1380064653),
(325, 85, 2791.00000, 'Puntos', 1380064653),
(326, 169, 305.00000, 'Puntos', 1380064653),
(327, 31, 15255.00000, 'Puntos', 1380064653),
(328, 25, 4235.00000, 'Puntos', 1380064653),
(329, 107, 2653.00000, 'Puntos', 1380064653);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `resource`
--

CREATE TABLE IF NOT EXISTS `resource` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_parent` int(11) NOT NULL,
  `id_type` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `resource` varchar(125) NOT NULL,
  `descripcion` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=34 ;

--
-- Volcado de datos para la tabla `resource`
--

INSERT INTO `resource` (`id`, `id_parent`, `id_type`, `nombre`, `resource`, `descripcion`) VALUES
(1, 0, 1, 'application_index', 'Application\\Controller\\Index/index', ''),
(2, 1, 2, 'application_comoparticipar', 'Application\\Controller\\Index/comoparticipar', ''),
(3, 1, 2, 'application_mispuntos', 'Application\\Controller\\Index/mispuntos', ''),
(4, 1, 2, 'application_catalogo', 'Application\\Controller\\Index/catalogo', ''),
(5, 1, 2, 'application_canjeartupremio', 'Application\\Controller\\Index/canjeartupremio', ''),
(6, 1, 2, 'application_laselecciongepp', 'Application\\Controller\\Index/laselecciongepp', ''),
(7, 1, 2, 'application_tablaposicion', 'Application\\Controller\\Index/tablaposicion', ''),
(8, 1, 2, 'application_incentivos', 'Application\\Controller\\Index/incentivos', ''),
(9, 1, 2, 'application_reconocimientos', 'Application\\Controller\\Index/reconocimientos', ''),
(10, 1, 2, 'application_categoria', 'Application\\Controller\\Index/categoria', ''),
(11, 1, 2, 'application_producto', 'Application\\Controller\\Index/producto', ''),
(12, 1, 2, 'application_carrito', 'Application\\Controller\\Index/carrito', ''),
(13, 1, 2, 'application_checkout', 'Application\\Controller\\Index/checkout', ''),
(14, 0, 1, 'cscategorycmf_index', 'Cscategorycmf\\Controller\\Index/index', 'Categoy'),
(15, 0, 1, 'cscurrencypoints_index', 'Cscurrencypoints\\Controller\\Index/index', 'Cscurrencypoints'),
(18, 0, 1, 'csproductcmf_index', 'Csproductcmf\\Controller\\Index/index', 'csproductcmf'),
(21, 18, 2, 'csproductcmf_controller_index_producto', 'Csproductcmf\\Controller\\Index/producto', 'csproductcmf_controller_index_producto'),
(22, 0, 1, 'cscart_controller_index_carrito', 'Cscart\\Controller\\Index/carrito', 'cscart_controller_index_carrito'),
(23, 0, 1, 'cscheckout_controller_index_checkout', 'Cscheckout\\Controller\\Index/checkout', 'cscheckout_controller_index_checkout'),
(24, 0, 1, 'asignacion_controller_index_index', 'Asignacion\\Controller\\Index/index', 'asignacion_controller_index_index'),
(25, 24, 2, 'asignacion_controller_index_desasignaruta', 'Asignacion\\Controller\\Index/desasignaruta', 'asignacion_controller_index_desasignaruta'),
(26, 24, 2, 'asignacion_controller_index_asignaruta', 'Asignacion\\Controller\\Index/asignaruta', 'asignacion_controller_index_asignaruta'),
(27, 24, 2, 'asignacion_controller_index_buscaempleado', 'Asignacion\\Controller\\Index/buscaempleado', 'asignacion_controller_index_buscaempleado'),
(28, 24, 2, 'asignacion_controller_index_empleadoasi', 'Asignacion\\Controller\\Index/empleadoasi', 'asignacion_controller_index_empleadoasi'),
(29, 1, 2, 'application_controller_index_privacidad', 'Application\\Controller\\Index/privacidad', 'application_controller_index_privacidad'),
(30, 0, 1, 'tickets_controller_index', 'Tickets\\Controller\\Index/index', 'tickets_controller_index'),
(31, 30, 2, 'tickets_controller_addticket', 'Tickets\\Controller\\Index/addticket', 'tickets_controller_addticket'),
(33, 1, 2, 'application_controller_index_miperfil', 'Application\\Controller\\Index/miperfil', 'application_controller_index_miperfil');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE IF NOT EXISTS `roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role` varchar(40) NOT NULL,
  `id_parent` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id`, `role`, `id_parent`) VALUES
(1, 'administrator', 0),
(2, 'public', 0),
(3, 'registered', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `display_name` varchar(50) DEFAULT NULL,
  `password` varchar(128) NOT NULL,
  `state` smallint(5) unsigned DEFAULT NULL,
  `gid` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=14 ;

--
-- Volcado de datos para la tabla `user`
--

INSERT INTO `user` (`id`, `username`, `email`, `display_name`, `password`, `state`, `gid`) VALUES
(1, 'admin', 'eduardooa@comprartepremia.com', 'AGUILAR RUFINO,TOMAS', '$2a$08$xfIwlIVf7QDUvo8m75M.a.v18nnRcxZxLUdLTmCwk7svsUtlSrP2.', 1, 1),
(2, 'juan.perez', 'eduardooa@hotmail.com', 'Juan Perez', '$2a$08$xfIwlIVf7QDUvo8m75M.a.v18nnRcxZxLUdLTmCwk7svsUtlSrP2.', 1, 1),
(3, 'Flavio', 'portela828@gmail.com', 'Flavio', '$2y$08$TBomK1/wf9QkZzXIFwr8KevWNb4mJ0SidOrhIa3bd1PPWsFBrvldm', 1, 1),
(4, 'flavio.portela', 'flavio3_portela@hotmail.com', 'Flavio', '$2y$08$AVkdwp8U2zCq98oYq57MMuhKbkVv9F0x2c9rTrOw4hcRxB2Y.kU3S', 1, 1),
(13, 'flavio.vlza', 'flavio@mail.com', 'Flavio Portela Valenzuela', '$2y$08$tSsxSMkTu.MNnP0b2pKGA.3VIvl1FEEAzWOFQR5s3zTrpcYeCfxC6', 1, 1);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
