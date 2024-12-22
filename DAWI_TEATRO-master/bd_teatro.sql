-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: bd_teatro
-- ------------------------------------------------------
-- Server version	8.0.40

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `tb_area`
--

DROP TABLE IF EXISTS `tb_area`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_area` (
  `idarea` int NOT NULL AUTO_INCREMENT,
  `nomarea` varchar(30) DEFAULT NULL,
  `precio` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`idarea`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_area`
--

LOCK TABLES `tb_area` WRITE;
/*!40000 ALTER TABLE `tb_area` DISABLE KEYS */;
INSERT INTO `tb_area` VALUES (1,'General',50),(2,'VIP',100),(3,'Platinium',150);
/*!40000 ALTER TABLE `tb_area` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_categoria`
--

DROP TABLE IF EXISTS `tb_categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_categoria` (
  `idcat` int NOT NULL,
  `nomcat` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`idcat`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_categoria`
--

LOCK TABLES `tb_categoria` WRITE;
/*!40000 ALTER TABLE `tb_categoria` DISABLE KEYS */;
INSERT INTO `tb_categoria` VALUES (1,'Comedia'),(2,'Romance'),(3,'Drama'),(4,'Música');
/*!40000 ALTER TABLE `tb_categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_cliente`
--

DROP TABLE IF EXISTS `tb_cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_cliente` (
  `idcli` int NOT NULL AUTO_INCREMENT,
  `nomcli` varchar(50) NOT NULL,
  `apecli` varchar(50) NOT NULL,
  `dni` char(8) NOT NULL,
  `username` varchar(30) NOT NULL,
  `clave` varchar(30) NOT NULL,
  PRIMARY KEY (`idcli`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_cliente`
--

LOCK TABLES `tb_cliente` WRITE;
/*!40000 ALTER TABLE `tb_cliente` DISABLE KEYS */;
INSERT INTO `tb_cliente` VALUES (1,'Brayan','Pichiule','87654321','admin@mail.com','admin'),(2,'Miguel','Ruiz','87654321','miguelr@mail.com','miguelr');
/*!40000 ALTER TABLE `tb_cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_evento`
--

DROP TABLE IF EXISTS `tb_evento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_evento` (
  `idevento` int NOT NULL,
  `nomevento` varchar(100) DEFAULT NULL,
  `desevento` varchar(600) DEFAULT NULL,
  `idcat` int DEFAULT NULL,
  PRIMARY KEY (`idevento`),
  KEY `idcat` (`idcat`),
  CONSTRAINT `tb_evento_ibfk_1` FOREIGN KEY (`idcat`) REFERENCES `tb_categoria` (`idcat`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_evento`
--

LOCK TABLES `tb_evento` WRITE;
/*!40000 ALTER TABLE `tb_evento` DISABLE KEYS */;
INSERT INTO `tb_evento` VALUES (1,'BROMATES','Mejores amigos se mudan juntos',1),(2,'ROMEO Y JULIETA','Basado en el libro de William Shakespeare',2),(3,'HAMLET','Basado en el libro de William Shakespeare',3),(4,'EDICIÓN LIMITADA','Musicos que no conocias',4),(5,'COMEDY FEST',' Grandes comediantes se juntaron',1),(6,'LOS AMANTES DE TERUEL','Leyenda de los amantes de Teruel',2),(7,'LA DIVINA COMEDIA','Basado en poema de Dante Alighieri',3),(8,'GIAN MARCO','Concierto inolvidable con Gian Marco',4);
/*!40000 ALTER TABLE `tb_evento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_funcion`
--

DROP TABLE IF EXISTS `tb_funcion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_funcion` (
  `idfuncion` int NOT NULL,
  `idevento` int DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `horainicio` varchar(6) DEFAULT NULL,
  `horafin` varchar(6) DEFAULT NULL,
  PRIMARY KEY (`idfuncion`),
  KEY `idevento` (`idevento`),
  CONSTRAINT `tb_funcion_ibfk_1` FOREIGN KEY (`idevento`) REFERENCES `tb_evento` (`idevento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_funcion`
--

LOCK TABLES `tb_funcion` WRITE;
/*!40000 ALTER TABLE `tb_funcion` DISABLE KEYS */;
INSERT INTO `tb_funcion` VALUES (1,1,'2024-12-08','19:00','21:00'),(2,2,'2024-12-06','18:00','20:00'),(3,3,'2024-12-07','18:00','20:00'),(4,4,'2024-12-04','19:00','22:00'),(5,5,'2024-12-09','19:00','22:00'),(6,6,'2024-12-06','20:00','22:00'),(7,7,'2024-12-07','20:00','22:00'),(8,8,'2024-12-05','19:00','21:00'),(9,1,'2024-12-15','19:00','21:00'),(10,2,'2024-12-13','18:00','20:00'),(11,3,'2024-12-14','18:00','20:00'),(12,4,'2024-12-11','19:00','22:00'),(13,5,'2024-12-16','19:00','22:00'),(14,6,'2024-12-13','20:00','22:00'),(15,7,'2024-12-14','20:00','22:00'),(16,8,'2024-12-12','19:00','21:00');
/*!40000 ALTER TABLE `tb_funcion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_ticket`
--

DROP TABLE IF EXISTS `tb_ticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_ticket` (
  `idticket` int NOT NULL AUTO_INCREMENT,
  `idfuncion` int DEFAULT NULL,
  `idarea` int DEFAULT NULL,
  `idcli` int DEFAULT NULL,
  `unidades` int DEFAULT NULL,
  `total` double DEFAULT NULL,
  PRIMARY KEY (`idticket`),
  KEY `idfuncion` (`idfuncion`),
  KEY `idarea` (`idarea`),
  KEY `idcli` (`idcli`),
  CONSTRAINT `tb_ticket_ibfk_1` FOREIGN KEY (`idfuncion`) REFERENCES `tb_funcion` (`idfuncion`),
  CONSTRAINT `tb_ticket_ibfk_2` FOREIGN KEY (`idarea`) REFERENCES `tb_area` (`idarea`),
  CONSTRAINT `tb_ticket_ibfk_3` FOREIGN KEY (`idcli`) REFERENCES `tb_cliente` (`idcli`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_ticket`
--

LOCK TABLES `tb_ticket` WRITE;
/*!40000 ALTER TABLE `tb_ticket` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_ticket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_tipo`
--

DROP TABLE IF EXISTS `tb_tipo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_tipo` (
  `idTipo` int NOT NULL,
  `descripcion` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`idTipo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_tipo`
--

LOCK TABLES `tb_tipo` WRITE;
/*!40000 ALTER TABLE `tb_tipo` DISABLE KEYS */;
INSERT INTO `tb_tipo` VALUES (1,'administrador'),(2,'cliente');
/*!40000 ALTER TABLE `tb_tipo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'bd_teatro'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-12-22 14:28:04
