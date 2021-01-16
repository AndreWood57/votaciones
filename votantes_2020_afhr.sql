-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         10.4.14-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win64
-- HeidiSQL Versión:             11.1.0.6116
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para votantes_2020_afhr
DROP DATABASE IF EXISTS `votantes_2020_afhr`;
CREATE DATABASE IF NOT EXISTS `votantes_2020_afhr` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `votantes_2020_afhr`;

-- Volcando estructura para tabla votantes_2020_afhr.administrador
DROP TABLE IF EXISTS `administrador`;
CREATE TABLE IF NOT EXISTS `administrador` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `adminID` int(11) NOT NULL DEFAULT 0,
  `password` varbinary(16) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_Admin_Persona` (`adminID`) USING BTREE,
  CONSTRAINT `FK_Administrador_Persona` FOREIGN KEY (`adminID`) REFERENCES `persona` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla votantes_2020_afhr.administrador: ~0 rows (aproximadamente)
DELETE FROM `administrador`;
/*!40000 ALTER TABLE `administrador` DISABLE KEYS */;
INSERT INTO `administrador` (`ID`, `adminID`, `password`) VALUES
	(3, 20, _binary 0xFE757822C9CD151434C2874FDCB25172);
/*!40000 ALTER TABLE `administrador` ENABLE KEYS */;

-- Volcando estructura para tabla votantes_2020_afhr.candidato
DROP TABLE IF EXISTS `candidato`;
CREATE TABLE IF NOT EXISTS `candidato` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `candidatoID` int(11) NOT NULL,
  `partidoID` int(11) NOT NULL,
  `numeroLista` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`ID`),
  KEY `FK_Candidato_Persona` (`candidatoID`) USING BTREE,
  KEY `FK_Candidato_Partido` (`partidoID`),
  CONSTRAINT `FK_Candidato_Partido` FOREIGN KEY (`partidoID`) REFERENCES `partido` (`ID`),
  CONSTRAINT `FK_Candidato_Persona` FOREIGN KEY (`candidatoID`) REFERENCES `persona` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla votantes_2020_afhr.candidato: ~17 rows (aproximadamente)
DELETE FROM `candidato`;
/*!40000 ALTER TABLE `candidato` DISABLE KEYS */;
INSERT INTO `candidato` (`ID`, `candidatoID`, `partidoID`, `numeroLista`) VALUES
	(1, 3, 1, 1),
	(2, 4, 1, 2),
	(3, 5, 1, 3),
	(4, 6, 1, 4),
	(5, 7, 2, 1),
	(6, 8, 2, 2),
	(7, 9, 2, 3),
	(8, 10, 2, 4),
	(9, 11, 3, 1),
	(10, 12, 3, 2),
	(11, 13, 3, 3),
	(12, 14, 4, 1),
	(13, 15, 4, 2),
	(14, 16, 4, 3),
	(15, 17, 5, 1),
	(16, 18, 5, 2),
	(17, 19, 5, 3);
/*!40000 ALTER TABLE `candidato` ENABLE KEYS */;

-- Volcando estructura para tabla votantes_2020_afhr.convocatoria
DROP TABLE IF EXISTS `convocatoria`;
CREATE TABLE IF NOT EXISTS `convocatoria` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` enum('Generales','Europeas','Autonomicas','Locales') NOT NULL,
  `circunscripcion` varchar(50) NOT NULL DEFAULT '',
  `numero_Cargos` int(11) NOT NULL DEFAULT 0,
  `fecha_Consulta` date NOT NULL,
  `estado` enum('Cerrado','Abierto','Finalizado') NOT NULL DEFAULT 'Cerrado',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla votantes_2020_afhr.convocatoria: ~0 rows (aproximadamente)
DELETE FROM `convocatoria`;
/*!40000 ALTER TABLE `convocatoria` DISABLE KEYS */;
INSERT INTO `convocatoria` (`ID`, `tipo`, `circunscripcion`, `numero_Cargos`, `fecha_Consulta`, `estado`) VALUES
	(1, 'Generales', 'Albacete', 4, '2020-11-04', 'Cerrado');
/*!40000 ALTER TABLE `convocatoria` ENABLE KEYS */;

-- Volcando estructura para tabla votantes_2020_afhr.direccion
DROP TABLE IF EXISTS `direccion`;
CREATE TABLE IF NOT EXISTS `direccion` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Tipo` enum('Calle','Avenida','Carretera','Plaza') NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `numero` varchar(50) NOT NULL,
  `portal` varchar(50) DEFAULT NULL,
  `puerta` varchar(50) DEFAULT NULL,
  `piso` varchar(50) DEFAULT NULL,
  `localidad` varchar(50) NOT NULL,
  `provincia` varchar(50) NOT NULL,
  `cp` varchar(50) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla votantes_2020_afhr.direccion: ~28 rows (aproximadamente)
DELETE FROM `direccion`;
/*!40000 ALTER TABLE `direccion` DISABLE KEYS */;
INSERT INTO `direccion` (`ID`, `Tipo`, `nombre`, `numero`, `portal`, `puerta`, `piso`, `localidad`, `provincia`, `cp`) VALUES
	(1, 'Calle', 'Tinte', '14', NULL, 'DCHA', 'Bajo', 'Albacete', 'Albacete', '02001'),
	(2, 'Avenida', 'Circunvalación', '146', NULL, 'A', '4', 'Albacete', 'Albacete', '02009'),
	(3, 'Calle', 'Federico Garcia Lorca', '14', '7', 'IZQ', '3', 'Albacete', 'Albacete', '02001'),
	(4, 'Plaza', 'Carretas', '27', NULL, 'H', '7', 'Albacete', 'Albacete', '02002'),
	(5, 'Calle', 'Blasco Ibañez', '2', NULL, 'B', '3', 'Albacete', 'Albacete', '02004'),
	(6, 'Avenida', 'España', '13', NULL, 'J', '5', 'Albacete', 'Albacete', '02003'),
	(7, 'Calle', 'Nuestra Señora de Araceli', '23', NULL, 'IZQ', '12', 'Albacete', 'Albacete', '02001'),
	(8, 'Calle', 'Arquitecto Daniel Rubio', '1', NULL, 'H', '3', 'Albacete', 'Albacete', '02005'),
	(9, 'Calle', 'Roberto Molina', '9', NULL, 'F', '4', 'Albacete', 'Albacete', '02005'),
	(10, 'Calle', 'Filipinas', '3', NULL, 'DCHA', '3', 'Albacete', 'Albacete', '02005'),
	(11, 'Calle', 'Jorge Juan', '34', NULL, 'B', '6', 'Albacete', 'Albacete', '02006'),
	(12, 'Calle', 'Malaga', '12', NULL, 'D', '7', 'Albacete', 'Albacete', '02006'),
	(13, 'Calle', 'Hellin', '25', NULL, 'B', '2', 'Albacete', 'Albacete', '02002'),
	(14, 'Calle', 'Tejares', '6', NULL, 'K', '4', 'Albacete', 'Albacete', '02002'),
	(15, 'Avenida', 'Abelardo Sanchez', '37', NULL, 'C', '7', 'Albacete', 'Albacete', '02003'),
	(16, 'Calle', 'Baños', '5', NULL, 'D', '4', 'Albacete', 'Albacete', '02004'),
	(17, 'Calle', 'Dionisio Guardiola', '17', NULL, 'H', '6', 'Albacete', 'Albacete', '02004'),
	(18, 'Calle', 'Joaquin Quijada', '36', NULL, NULL, NULL, 'Albacete', 'Albacete', '02004'),
	(19, 'Calle', 'Artazuriña', '14', NULL, 'E', '8', 'Bilbao', 'Pais Vasco', '48004'),
	(20, 'Calle', 'Marqués de Cortina', '31', NULL, 'H', '5', 'Tetuan', 'Madrid', '28020'),
	(21, 'Calle', 'Concha Espina', '20', NULL, 'G', '9', 'Palencia', 'Palencia', '34003'),
	(22, 'Calle', 'Lanceria', '3', NULL, 'B', '2', 'Jerez de la Frontera', 'Cádiz', '11403'),
	(23, 'Calle', 'Albacete', '18', NULL, 'H', '13', 'Madrid', 'Madrid', '28027'),
	(39, 'Calle', 'Federico García Lorca', '11', NULL, NULL, NULL, 'Albacete', 'Albacete', '02002'),
	(40, 'Calle', 'Margarita Simón martinez', '9', '3', 'H', '7', 'Albacete', 'Albacete', '02001');
/*!40000 ALTER TABLE `direccion` ENABLE KEYS */;

-- Volcando estructura para tabla votantes_2020_afhr.partido
DROP TABLE IF EXISTS `partido`;
CREATE TABLE IF NOT EXISTS `partido` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  `siglas` varchar(50) DEFAULT NULL,
  `logo` varchar(50) DEFAULT NULL,
  `votos` int(11) DEFAULT 0,
  `presidenteID` int(11) NOT NULL,
  `eslogan` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `nombre` (`nombre`),
  KEY `siglas` (`siglas`),
  KEY `FK_Partido_Persona` (`presidenteID`),
  CONSTRAINT `FK_Partido_Persona` FOREIGN KEY (`presidenteID`) REFERENCES `persona` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla votantes_2020_afhr.partido: ~5 rows (aproximadamente)
DELETE FROM `partido`;
/*!40000 ALTER TABLE `partido` DISABLE KEYS */;
INSERT INTO `partido` (`ID`, `nombre`, `siglas`, `logo`, `votos`, `presidenteID`, `eslogan`) VALUES
	(1, 'Partido Socialista Obrero Español', 'PSOE', '../images/partidos/psoe.svg', 27074, 22, 'Ahora Sí'),
	(2, 'VOX', 'VOX', '../images/partidos/vox.svg', 20478, 21, 'España siempre'),
	(3, 'Ciudadanos', 'CS', '../images/partidos/cs.svg', 8711, 24, 'España en marcha'),
	(4, 'Partido Popular', 'PP', '../images/partidos/pp.svg', 26588, 23, 'Por todo lo que nos une'),
	(5, 'Unidas Podemos', 'UP', '../images/partidos/podemos.svg', 10219, 25, 'Un gobierno contigo');
/*!40000 ALTER TABLE `partido` ENABLE KEYS */;

-- Volcando estructura para tabla votantes_2020_afhr.persona
DROP TABLE IF EXISTS `persona`;
CREATE TABLE IF NOT EXISTS `persona` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `dni` varchar(9) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `apellidos` varchar(50) NOT NULL,
  `telefono` varchar(12) NOT NULL,
  `fecha_nac` date NOT NULL,
  `correo_e` varchar(50) NOT NULL DEFAULT '',
  `sexo` enum('M','F') NOT NULL DEFAULT 'M',
  `direccionID` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `dni` (`dni`),
  UNIQUE KEY `telefono` (`telefono`),
  UNIQUE KEY `correo-e` (`correo_e`) USING BTREE,
  KEY `FK_Persona_Direccion` (`direccionID`),
  CONSTRAINT `FK_Persona_Direccion` FOREIGN KEY (`direccionID`) REFERENCES `direccion` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla votantes_2020_afhr.persona: ~28 rows (aproximadamente)
DELETE FROM `persona`;
/*!40000 ALTER TABLE `persona` DISABLE KEYS */;
INSERT INTO `persona` (`ID`, `dni`, `nombre`, `apellidos`, `telefono`, `fecha_nac`, `correo_e`, `sexo`, `direccionID`) VALUES
	(3, '94032917Q', 'Manuel Gabriel', 'González Ramos', '+34786748991', '2020-10-31', 'heseddozill-1956@yopmail.com', 'M', 1),
	(4, '63290962J', 'María Luisa', 'Vilches Ruiz', '+34683168352', '1879-06-15', 'ammakaby-3209@yopmail.com', 'F', 2),
	(5, '71304417S', 'José Carlos', 'Díaz Rodríguez', '+34848759213', '1997-04-23', 'sapefezez-1521@yopmail.com', 'M', 3),
	(6, '37751856R', 'Estefania', 'Escribano Villena', '+34863967274', '1989-07-17', 'ujyxakez-0355@yopmail.com', 'F', 4),
	(7, '46710788X', 'Rafael', 'Fernández-Lomana Gutiérrez', '+34928828425', '1973-02-14', 'allerg@urbanquarter.co', 'M', 5),
	(8, '80381045T', 'Juan Francisco', 'Robles Descalzo', '+34956349596', '1983-12-12', 'sahiwal@nameart.me', 'M', 6),
	(9, '64805654C', 'María Remedios', 'Gil Martínez', '+34639874327', '2001-11-03', 'herrischstem@bucol.net', 'F', 7),
	(10, '48480099G', 'María Teresa', 'Fernández Lara', '+34948569598', '1999-10-19', 'gezel@etiquettelatex.com', 'F', 8),
	(11, '57939738H', 'María Dolores', 'Arteaga Espinosa de los Molinos', '+34887712649', '1969-10-09', 'offenstehende@fridaymovo.com', 'F', 9),
	(12, '65977803V', 'Hugo Gabriel', 'Guillén Malagón', '+34622157350', '1958-01-18', 'voodoos@mahoteki.com', 'M', 10),
	(13, '42919119U', 'Ana Isabel', 'Martínez Molina', '+34791887601', '1988-10-24', 'dholewar@mymailcr.com', 'F', 11),
	(14, '43079625F', 'Carmen', 'Navarro Lacoba', '+34655195012', '1986-10-12', 'oscillie@bagshare.org', 'F', 12),
	(15, '33805964K', 'Manuel', 'Serrano Lóopez', '+34949858173', '1973-08-09', 'pc4658@aristockphoto.com', 'M', 13),
	(16, '57865756L', 'Manuel', 'Serena Fernández', '+34606972764', '1972-08-09', 'recouvrerait@cokils.com', 'F', 14),
	(17, '53966230Y', 'María', 'Pérez Segovia', '+34857329915', '1986-06-03', 'gakkashi@peterung.com', 'F', 15),
	(18, '44628419D', 'Emilio', 'Zamora Martínez', '+34652235576', '1981-07-05', 'yapons@walmartnet.com', 'M', 16),
	(19, '42986957M', 'Darcy Gioconda', 'Cárdenas Barrera', '+34895050727', '1987-12-11', 'avancie@rowmin.com', 'F', 17),
	(20, '94852699B', 'Valentina', 'Parrondo', '+34639030148', '1964-10-02', 'unburia@kittiza.com', 'F', 18),
	(21, '71667633J', 'Santiago', 'Abascal Conde', '+34990805839', '1976-04-14', 'santiago@abascal.com', 'M', 19),
	(22, '39440012X', 'Maria Cristina', 'Narbona Ruiz', '+34701273040', '1951-07-29', 'maria@narbona.com', 'F', 20),
	(23, '48853080V', 'Pablo', 'Casado Blanco', '+34671191101', '1981-02-01', 'pablo@casado.com', 'M', 21),
	(24, '37249649Z', 'Ines', 'Arrimadas García', '+34980029082', '1981-07-03', 'ines@arrimadas.com', 'F', 22),
	(25, '69728573N', 'Pablo', 'Iglesias Turrión', '+34763842523', '1978-10-17', 'pablo@iglesias.com', 'M', 23),
	(30, '37204427N', 'Marcela', 'Gutiérrrez', '+34123456789', '4556-03-12', 'marcela@gutierrez.com', 'F', 39),
	(31, '78456723L', 'Jesus Felipe', 'Vigo Euskadi', '+34907856342', '2020-11-20', 'jesus@euskadi.com', 'M', 40);
/*!40000 ALTER TABLE `persona` ENABLE KEYS */;

-- Volcando estructura para tabla votantes_2020_afhr.votante
DROP TABLE IF EXISTS `votante`;
CREATE TABLE IF NOT EXISTS `votante` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `votanteID` int(11) NOT NULL,
  `password` varbinary(16) DEFAULT NULL,
  `votado` enum('Y','N') NOT NULL DEFAULT 'N',
  PRIMARY KEY (`ID`),
  KEY `FK_Votante_Persona` (`votanteID`) USING BTREE,
  CONSTRAINT `FK_Votante_Persona` FOREIGN KEY (`votanteID`) REFERENCES `persona` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla votantes_2020_afhr.votante: ~5 rows (aproximadamente)
DELETE FROM `votante`;
/*!40000 ALTER TABLE `votante` DISABLE KEYS */;
INSERT INTO `votante` (`ID`, `votanteID`, `password`, `votado`) VALUES
	(12, 30, _binary 0x789B36D8CC0732807409AABA21C3F506, 'N'),
	(13, 31, _binary 0x7C98CB77638B458C2F428DD8A4935156, 'N');
/*!40000 ALTER TABLE `votante` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
