-- MySQL dump 10.13  Distrib 5.7.15, for Win64 (x86_64)
--
-- Host: localhost    Database: socialis
-- ------------------------------------------------------
-- Server version	5.7.15

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `e_abordaje`
--

DROP TABLE IF EXISTS `e_abordaje`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e_abordaje` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `observacion` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `e_abordaje`
--

LOCK TABLES `e_abordaje` WRITE;
/*!40000 ALTER TABLE `e_abordaje` DISABLE KEYS */;
INSERT INTO `e_abordaje` VALUES (1,'No hay abordajes.'),(2,'El paciente presenta.....'),(3,'El paciente presenta.....'),(4,'El paciente presenta.....'),(5,'El paciente presenta.....'),(6,'Prueba 2 de evaluación');
/*!40000 ALTER TABLE `e_abordaje` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `e_abordaje_asesoria`
--

DROP TABLE IF EXISTS `e_abordaje_asesoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e_abordaje_asesoria` (
  `id_abordaje` int(11) NOT NULL,
  `id_asesoria` int(11) NOT NULL,
  PRIMARY KEY (`id_abordaje`,`id_asesoria`),
  KEY `id_asesoria` (`id_asesoria`),
  CONSTRAINT `e_abordaje_asesoria_ibfk_2` FOREIGN KEY (`id_asesoria`) REFERENCES `e_asesoria` (`id`),
  CONSTRAINT `e_abordaje_asesoria_ibfk_3` FOREIGN KEY (`id_abordaje`) REFERENCES `e_abordaje` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `e_abordaje_asesoria`
--

LOCK TABLES `e_abordaje_asesoria` WRITE;
/*!40000 ALTER TABLE `e_abordaje_asesoria` DISABLE KEYS */;
INSERT INTO `e_abordaje_asesoria` VALUES (3,1),(4,1),(5,1),(3,2),(4,2),(5,2),(3,3),(4,3),(5,3),(3,4),(4,4),(5,4),(3,5),(4,5),(5,5),(3,6),(4,6),(5,6),(3,7),(4,7),(5,7);
/*!40000 ALTER TABLE `e_abordaje_asesoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `e_abordaje_cita`
--

DROP TABLE IF EXISTS `e_abordaje_cita`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e_abordaje_cita` (
  `id_abordaje` int(11) NOT NULL,
  `id_cita` int(11) NOT NULL,
  PRIMARY KEY (`id_abordaje`,`id_cita`),
  KEY `id_cita` (`id_cita`),
  CONSTRAINT `e_abordaje_cita_ibfk_1` FOREIGN KEY (`id_abordaje`) REFERENCES `e_abordaje` (`id`),
  CONSTRAINT `e_abordaje_cita_ibfk_2` FOREIGN KEY (`id_cita`) REFERENCES `e_cita` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `e_abordaje_cita`
--

LOCK TABLES `e_abordaje_cita` WRITE;
/*!40000 ALTER TABLE `e_abordaje_cita` DISABLE KEYS */;
/*!40000 ALTER TABLE `e_abordaje_cita` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `e_actividad`
--

DROP TABLE IF EXISTS `e_actividad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e_actividad` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `actividad` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `e_actividad`
--

LOCK TABLES `e_actividad` WRITE;
/*!40000 ALTER TABLE `e_actividad` DISABLE KEYS */;
INSERT INTO `e_actividad` VALUES (1,'bailar');
/*!40000 ALTER TABLE `e_actividad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `e_area`
--

DROP TABLE IF EXISTS `e_area`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e_area` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `area` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `e_area`
--

LOCK TABLES `e_area` WRITE;
/*!40000 ALTER TABLE `e_area` DISABLE KEYS */;
INSERT INTO `e_area` VALUES (1,'atención médica');
/*!40000 ALTER TABLE `e_area` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `e_asesoria`
--

DROP TABLE IF EXISTS `e_asesoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e_asesoria` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `asesoria` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `e_asesoria`
--

LOCK TABLES `e_asesoria` WRITE;
/*!40000 ALTER TABLE `e_asesoria` DISABLE KEYS */;
INSERT INTO `e_asesoria` VALUES (1,'acompañamiento emocional al paciente y cuidador primario'),(2,'recomendaciones de prevencion de maltrato (tríptico)'),(3,'orientación sobre derechos de personas mayores (privilegiar independencia y autonomía)'),(4,'localización familiar responsable'),(5,'reconocimiento escrito a la familia por participación activa en el cuidados al paciente'),(6,'orientación familiar sobre cuidados en pacientes con demencia'),(7,'cita a grupo de apoyo incmnsz de familiares de pacientes con demencia');
/*!40000 ALTER TABLE `e_asesoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `e_auxiliar`
--

DROP TABLE IF EXISTS `e_auxiliar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e_auxiliar` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `auxiliar` varchar(35) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `e_auxiliar`
--

LOCK TABLES `e_auxiliar` WRITE;
/*!40000 ALTER TABLE `e_auxiliar` DISABLE KEYS */;
INSERT INTO `e_auxiliar` VALUES (1,'lentes'),(2,'protesis dental'),(3,'auxiliar de la marcha');
/*!40000 ALTER TABLE `e_auxiliar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `e_cita`
--

DROP TABLE IF EXISTS `e_cita`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e_cita` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cita` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `e_cita`
--

LOCK TABLES `e_cita` WRITE;
/*!40000 ALTER TABLE `e_cita` DISABLE KEYS */;
/*!40000 ALTER TABLE `e_cita` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `e_conflicto`
--

DROP TABLE IF EXISTS `e_conflicto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e_conflicto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `conflicto` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `e_conflicto`
--

LOCK TABLES `e_conflicto` WRITE;
/*!40000 ALTER TABLE `e_conflicto` DISABLE KEYS */;
INSERT INTO `e_conflicto` VALUES (1,'psicológicos');
/*!40000 ALTER TABLE `e_conflicto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `e_cuidador`
--

DROP TABLE IF EXISTS `e_cuidador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e_cuidador` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) DEFAULT NULL,
  `nacimiento` date DEFAULT NULL,
  `ocupacion` varchar(35) DEFAULT NULL,
  `telefono_uno` varchar(20) DEFAULT NULL,
  `telefono_dos` varchar(20) DEFAULT NULL,
  `correo` varchar(45) DEFAULT NULL,
  `tiempo_cuidando` date DEFAULT NULL,
  `parentesco` varchar(20) DEFAULT NULL,
  `estado_civil` varchar(20) DEFAULT NULL,
  `escolaridad` varchar(35) DEFAULT NULL,
  `escala_zarit` varchar(20) DEFAULT NULL,
  `observacion` text,
  `vive_con_paciente` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `e_cuidador`
--

LOCK TABLES `e_cuidador` WRITE;
/*!40000 ALTER TABLE `e_cuidador` DISABLE KEYS */;
INSERT INTO `e_cuidador` VALUES (1,'',NULL,'','','','',NULL,NULL,NULL,NULL,NULL,'',0),(2,'Rodrigo Richardson','1987-08-06','','9991113454','5554157772','algo@hotmail.com','1992-04-01','hijo','divorciado/a','secundaria','sobrecarga leve','Lo cuida  bien',1),(3,'Rodrigo Richardson','1987-08-06','','9991113454','5554157772','algo@hotmail.com','1992-04-01','hijo','divorciado/a','secundaria','sobrecarga leve','Lo cuida  bien',1),(4,'Rodrigo Richardson','1987-08-06','','9991113454','5554157772','algo@hotmail.com','1992-04-01','hijo','divorciado/a','secundaria','sobrecarga leve','Lo cuida  bien',1);
/*!40000 ALTER TABLE `e_cuidador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `e_cuidador_conflicto`
--

DROP TABLE IF EXISTS `e_cuidador_conflicto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e_cuidador_conflicto` (
  `id_cuidador` int(11) NOT NULL,
  `id_conflicto` int(11) NOT NULL,
  PRIMARY KEY (`id_cuidador`,`id_conflicto`),
  KEY `id_conflicto` (`id_conflicto`),
  CONSTRAINT `e_cuidador_conflicto_ibfk_1` FOREIGN KEY (`id_cuidador`) REFERENCES `e_cuidador` (`id`),
  CONSTRAINT `e_cuidador_conflicto_ibfk_2` FOREIGN KEY (`id_conflicto`) REFERENCES `e_conflicto` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `e_cuidador_conflicto`
--

LOCK TABLES `e_cuidador_conflicto` WRITE;
/*!40000 ALTER TABLE `e_cuidador_conflicto` DISABLE KEYS */;
INSERT INTO `e_cuidador_conflicto` VALUES (2,1),(3,1),(4,1);
/*!40000 ALTER TABLE `e_cuidador_conflicto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `e_cuidador_funcion`
--

DROP TABLE IF EXISTS `e_cuidador_funcion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e_cuidador_funcion` (
  `id_cuidador` int(11) NOT NULL,
  `id_funcion` int(11) NOT NULL,
  PRIMARY KEY (`id_cuidador`,`id_funcion`),
  KEY `id_funcion` (`id_funcion`),
  CONSTRAINT `e_cuidador_funcion_ibfk_1` FOREIGN KEY (`id_cuidador`) REFERENCES `e_cuidador` (`id`),
  CONSTRAINT `e_cuidador_funcion_ibfk_2` FOREIGN KEY (`id_funcion`) REFERENCES `e_funcion` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `e_cuidador_funcion`
--

LOCK TABLES `e_cuidador_funcion` WRITE;
/*!40000 ALTER TABLE `e_cuidador_funcion` DISABLE KEYS */;
INSERT INTO `e_cuidador_funcion` VALUES (2,1),(3,2),(4,2);
/*!40000 ALTER TABLE `e_cuidador_funcion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `e_derechohabiente`
--

DROP TABLE IF EXISTS `e_derechohabiente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e_derechohabiente` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `derechohabiente` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `e_derechohabiente`
--

LOCK TABLES `e_derechohabiente` WRITE;
/*!40000 ALTER TABLE `e_derechohabiente` DISABLE KEYS */;
INSERT INTO `e_derechohabiente` VALUES (1,'ISSSTE');
/*!40000 ALTER TABLE `e_derechohabiente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `e_desapegoterapeutico`
--

DROP TABLE IF EXISTS `e_desapegoterapeutico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e_desapegoterapeutico` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `desapego_terapeutico` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `e_desapegoterapeutico`
--

LOCK TABLES `e_desapegoterapeutico` WRITE;
/*!40000 ALTER TABLE `e_desapegoterapeutico` DISABLE KEYS */;
INSERT INTO `e_desapegoterapeutico` VALUES (1,'falta de apoyo familiar');
/*!40000 ALTER TABLE `e_desapegoterapeutico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `e_diagnostico`
--

DROP TABLE IF EXISTS `e_diagnostico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e_diagnostico` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `patologia_social` tinyint(1) DEFAULT '0',
  `familia` varchar(14) DEFAULT NULL,
  `conflicto_historico` tinyint(1) DEFAULT '0',
  `conflicto_actual` tinyint(1) DEFAULT '0',
  `comunicacion` tinyint(1) DEFAULT '0',
  `red_familiar` tinyint(1) DEFAULT '0',
  `red_extrafamiliar` tinyint(1) DEFAULT '0',
  `red_institucional` tinyint(1) DEFAULT '0',
  `desgaste_emocional` varchar(20) DEFAULT NULL,
  `red_cuidados` varchar(30) DEFAULT NULL,
  `supervision` varchar(30) DEFAULT NULL,
  `maltrato` tinyint(1) DEFAULT '0',
  `colapso_cuidador` varchar(40) DEFAULT NULL,
  `riesgos_arquitectonicos` tinyint(1) DEFAULT '0',
  `nivel_socioeconomico` varchar(16) DEFAULT NULL,
  `observacion` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `e_diagnostico`
--

LOCK TABLES `e_diagnostico` WRITE;
/*!40000 ALTER TABLE `e_diagnostico` DISABLE KEYS */;
INSERT INTO `e_diagnostico` VALUES (1,0,NULL,0,0,0,0,0,0,NULL,NULL,NULL,0,NULL,0,NULL,''),(2,0,NULL,0,0,0,0,0,0,NULL,NULL,NULL,0,NULL,0,NULL,''),(3,0,NULL,0,1,0,1,0,0,'sí','parciales','insuficientes',0,'sobrecarga leve',0,'medio','Falta atencion'),(4,0,NULL,0,1,0,1,0,0,'sí','parciales','insuficientes',0,'sobrecarga leve',0,'medio','Falta atencion'),(5,0,NULL,0,1,0,1,0,0,'sí','parciales','insuficientes',0,'sobrecarga leve',0,'medio','Falta atencion'),(6,0,NULL,0,0,0,0,0,0,NULL,NULL,NULL,0,NULL,0,NULL,'');
/*!40000 ALTER TABLE `e_diagnostico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `e_diagnostico_area`
--

DROP TABLE IF EXISTS `e_diagnostico_area`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e_diagnostico_area` (
  `id_diagnostico` int(11) NOT NULL,
  `id_area` int(11) NOT NULL,
  PRIMARY KEY (`id_diagnostico`,`id_area`),
  KEY `id_area` (`id_area`),
  CONSTRAINT `e_diagnostico_area_ibfk_1` FOREIGN KEY (`id_diagnostico`) REFERENCES `e_diagnostico` (`id`),
  CONSTRAINT `e_diagnostico_area_ibfk_2` FOREIGN KEY (`id_area`) REFERENCES `e_area` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `e_diagnostico_area`
--

LOCK TABLES `e_diagnostico_area` WRITE;
/*!40000 ALTER TABLE `e_diagnostico_area` DISABLE KEYS */;
INSERT INTO `e_diagnostico_area` VALUES (3,1),(4,1),(5,1);
/*!40000 ALTER TABLE `e_diagnostico_area` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `e_diagnostico_desapegoterapeutico`
--

DROP TABLE IF EXISTS `e_diagnostico_desapegoterapeutico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e_diagnostico_desapegoterapeutico` (
  `id_diagnostico_medico` int(11) NOT NULL,
  `id_desapego_terapeutico` int(11) NOT NULL,
  PRIMARY KEY (`id_diagnostico_medico`,`id_desapego_terapeutico`),
  KEY `id_desapego_terapeutico` (`id_desapego_terapeutico`),
  CONSTRAINT `e_diagnostico_desapegoterapeutico_ibfk_1` FOREIGN KEY (`id_diagnostico_medico`) REFERENCES `e_diagnostico` (`id`),
  CONSTRAINT `e_diagnostico_desapegoterapeutico_ibfk_2` FOREIGN KEY (`id_desapego_terapeutico`) REFERENCES `e_desapegoterapeutico` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `e_diagnostico_desapegoterapeutico`
--

LOCK TABLES `e_diagnostico_desapegoterapeutico` WRITE;
/*!40000 ALTER TABLE `e_diagnostico_desapegoterapeutico` DISABLE KEYS */;
INSERT INTO `e_diagnostico_desapegoterapeutico` VALUES (3,1);
/*!40000 ALTER TABLE `e_diagnostico_desapegoterapeutico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `e_diagnostico_maltratoclasificacion`
--

DROP TABLE IF EXISTS `e_diagnostico_maltratoclasificacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e_diagnostico_maltratoclasificacion` (
  `id_diagnostico` int(11) NOT NULL,
  `id_clasificacion` int(11) NOT NULL,
  PRIMARY KEY (`id_diagnostico`,`id_clasificacion`),
  KEY `id_clasificacion` (`id_clasificacion`),
  CONSTRAINT `e_diagnostico_maltratoclasificacion_ibfk_1` FOREIGN KEY (`id_diagnostico`) REFERENCES `e_diagnostico` (`id`),
  CONSTRAINT `e_diagnostico_maltratoclasificacion_ibfk_2` FOREIGN KEY (`id_clasificacion`) REFERENCES `e_maltratoclasificacion` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `e_diagnostico_maltratoclasificacion`
--

LOCK TABLES `e_diagnostico_maltratoclasificacion` WRITE;
/*!40000 ALTER TABLE `e_diagnostico_maltratoclasificacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `e_diagnostico_maltratoclasificacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `e_diagnosticomedico`
--

DROP TABLE IF EXISTS `e_diagnosticomedico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e_diagnosticomedico` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `diagnostico_medico` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `e_diagnosticomedico`
--

LOCK TABLES `e_diagnosticomedico` WRITE;
/*!40000 ALTER TABLE `e_diagnosticomedico` DISABLE KEYS */;
/*!40000 ALTER TABLE `e_diagnosticomedico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `e_economia`
--

DROP TABLE IF EXISTS `e_economia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e_economia` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `situacion_economica` varchar(9) DEFAULT NULL,
  `ingreso_paciente` decimal(9,2) DEFAULT NULL,
  `ingreso_gobierno` decimal(9,2) DEFAULT NULL,
  `ingreso_hogar` decimal(9,2) DEFAULT NULL,
  `ingreso_no_hogar` decimal(9,2) DEFAULT NULL,
  `ingreso_otro` decimal(9,2) DEFAULT NULL,
  `ingreso_total` decimal(9,2) DEFAULT NULL,
  `observacion` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `e_economia`
--

LOCK TABLES `e_economia` WRITE;
/*!40000 ALTER TABLE `e_economia` DISABLE KEYS */;
INSERT INTO `e_economia` VALUES (1,NULL,0.00,0.00,0.00,0.00,0.00,0.00,''),(2,NULL,0.00,0.00,0.00,0.00,0.00,0.00,''),(3,'regular',5000.00,10000.00,0.00,7000.00,0.00,22000.00,'Economia'),(4,'regular',5000.00,10000.00,0.00,7000.00,0.00,22000.00,'Economia'),(5,'regular',5000.00,10000.00,0.00,7000.00,0.00,22000.00,'Economia'),(6,NULL,0.00,0.00,0.00,0.00,0.00,0.00,'');
/*!40000 ALTER TABLE `e_economia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `e_economia_institucion`
--

DROP TABLE IF EXISTS `e_economia_institucion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e_economia_institucion` (
  `id_economia` int(11) NOT NULL,
  `id_institucion` int(11) NOT NULL,
  PRIMARY KEY (`id_economia`,`id_institucion`),
  KEY `id_institucion` (`id_institucion`),
  CONSTRAINT `e_economia_institucion_ibfk_1` FOREIGN KEY (`id_economia`) REFERENCES `e_economia` (`id`),
  CONSTRAINT `e_economia_institucion_ibfk_2` FOREIGN KEY (`id_institucion`) REFERENCES `e_institucion` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `e_economia_institucion`
--

LOCK TABLES `e_economia_institucion` WRITE;
/*!40000 ALTER TABLE `e_economia_institucion` DISABLE KEYS */;
INSERT INTO `e_economia_institucion` VALUES (3,1),(4,1),(5,1),(3,2),(4,2),(5,2);
/*!40000 ALTER TABLE `e_economia_institucion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `e_economia_proveedor`
--

DROP TABLE IF EXISTS `e_economia_proveedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e_economia_proveedor` (
  `id_economia` int(11) NOT NULL,
  `id_proveedor` int(11) NOT NULL,
  PRIMARY KEY (`id_economia`,`id_proveedor`),
  KEY `id_proveedor` (`id_proveedor`),
  CONSTRAINT `e_economia_proveedor_ibfk_1` FOREIGN KEY (`id_economia`) REFERENCES `e_economia` (`id`),
  CONSTRAINT `e_economia_proveedor_ibfk_2` FOREIGN KEY (`id_proveedor`) REFERENCES `e_familiar` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `e_economia_proveedor`
--

LOCK TABLES `e_economia_proveedor` WRITE;
/*!40000 ALTER TABLE `e_economia_proveedor` DISABLE KEYS */;
INSERT INTO `e_economia_proveedor` VALUES (3,3),(4,3),(5,3);
/*!40000 ALTER TABLE `e_economia_proveedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `e_familia`
--

DROP TABLE IF EXISTS `e_familia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e_familia` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `relacion_familiar` varchar(70) DEFAULT NULL,
  `tipo_familia` varchar(35) DEFAULT NULL,
  `ciclo` varchar(60) DEFAULT NULL,
  `observacion` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `e_familia`
--

LOCK TABLES `e_familia` WRITE;
/*!40000 ALTER TABLE `e_familia` DISABLE KEYS */;
INSERT INTO `e_familia` VALUES (1,NULL,NULL,NULL,''),(2,NULL,NULL,NULL,''),(3,'desintegración familiar','reestructurada','nacimiento, crianza y formación a los hijos','Algo'),(4,NULL,'reestructurada','nacimiento, crianza y formación a los hijos','Algo'),(5,NULL,'reestructurada','nacimiento, crianza y formación a los hijos','Algo'),(6,NULL,NULL,NULL,'');
/*!40000 ALTER TABLE `e_familia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `e_familia_problema`
--

DROP TABLE IF EXISTS `e_familia_problema`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e_familia_problema` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_familia` int(11) NOT NULL,
  `id_problema` int(11) NOT NULL,
  `involucrados` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_familia` (`id_familia`),
  KEY `id_problema` (`id_problema`),
  CONSTRAINT `e_familia_problema_ibfk_1` FOREIGN KEY (`id_familia`) REFERENCES `e_familia` (`id`),
  CONSTRAINT `e_familia_problema_ibfk_2` FOREIGN KEY (`id_problema`) REFERENCES `e_problema` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `e_familia_problema`
--

LOCK TABLES `e_familia_problema` WRITE;
/*!40000 ALTER TABLE `e_familia_problema` DISABLE KEYS */;
INSERT INTO `e_familia_problema` VALUES (1,3,1,'familia de origen'),(2,3,2,'conyugales e hijos'),(3,4,1,'familia de origen'),(4,4,2,'conyugales e hijos'),(5,5,1,'familia de origen'),(6,5,2,'conyugales e hijos');
/*!40000 ALTER TABLE `e_familia_problema` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `e_familiar`
--

DROP TABLE IF EXISTS `e_familiar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e_familiar` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `familiar` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `e_familiar`
--

LOCK TABLES `e_familiar` WRITE;
/*!40000 ALTER TABLE `e_familiar` DISABLE KEYS */;
INSERT INTO `e_familiar` VALUES (1,'paciente'),(2,'cónyuge'),(3,'primo');
/*!40000 ALTER TABLE `e_familiar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `e_funcion`
--

DROP TABLE IF EXISTS `e_funcion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e_funcion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `funcion` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `e_funcion`
--

LOCK TABLES `e_funcion` WRITE;
/*!40000 ALTER TABLE `e_funcion` DISABLE KEYS */;
INSERT INTO `e_funcion` VALUES (1,'apoyo a las abvd'),(2,'compañía');
/*!40000 ALTER TABLE `e_funcion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `e_institucion`
--

DROP TABLE IF EXISTS `e_institucion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e_institucion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(70) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `e_institucion`
--

LOCK TABLES `e_institucion` WRITE;
/*!40000 ALTER TABLE `e_institucion` DISABLE KEYS */;
INSERT INTO `e_institucion` VALUES (1,'GDF'),(2,'Pension');
/*!40000 ALTER TABLE `e_institucion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `e_maltrato`
--

DROP TABLE IF EXISTS `e_maltrato`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e_maltrato` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `deteccion_maltrato` tinyint(1) DEFAULT '0',
  `observacion` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `e_maltrato`
--

LOCK TABLES `e_maltrato` WRITE;
/*!40000 ALTER TABLE `e_maltrato` DISABLE KEYS */;
INSERT INTO `e_maltrato` VALUES (1,0,''),(2,0,''),(3,1,'Mal'),(4,1,'Mal'),(5,1,'Mal'),(6,0,'');
/*!40000 ALTER TABLE `e_maltrato` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `e_maltrato_generador`
--

DROP TABLE IF EXISTS `e_maltrato_generador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e_maltrato_generador` (
  `id_maltrato` int(11) NOT NULL,
  `id_generador` int(11) NOT NULL,
  PRIMARY KEY (`id_maltrato`,`id_generador`),
  KEY `id_generador` (`id_generador`),
  CONSTRAINT `e_maltrato_generador_ibfk_1` FOREIGN KEY (`id_maltrato`) REFERENCES `e_maltrato` (`id`),
  CONSTRAINT `e_maltrato_generador_ibfk_2` FOREIGN KEY (`id_generador`) REFERENCES `e_familiar` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `e_maltrato_generador`
--

LOCK TABLES `e_maltrato_generador` WRITE;
/*!40000 ALTER TABLE `e_maltrato_generador` DISABLE KEYS */;
INSERT INTO `e_maltrato_generador` VALUES (3,2),(4,2),(5,2);
/*!40000 ALTER TABLE `e_maltrato_generador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `e_maltrato_maltratoclasificacion`
--

DROP TABLE IF EXISTS `e_maltrato_maltratoclasificacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e_maltrato_maltratoclasificacion` (
  `id_maltrato` int(11) NOT NULL,
  `id_clasificacion` int(11) NOT NULL,
  PRIMARY KEY (`id_maltrato`,`id_clasificacion`),
  KEY `id_clasificacion` (`id_clasificacion`),
  CONSTRAINT `e_maltrato_maltratoclasificacion_ibfk_1` FOREIGN KEY (`id_maltrato`) REFERENCES `e_maltrato` (`id`),
  CONSTRAINT `e_maltrato_maltratoclasificacion_ibfk_2` FOREIGN KEY (`id_clasificacion`) REFERENCES `e_maltratoclasificacion` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `e_maltrato_maltratoclasificacion`
--

LOCK TABLES `e_maltrato_maltratoclasificacion` WRITE;
/*!40000 ALTER TABLE `e_maltrato_maltratoclasificacion` DISABLE KEYS */;
INSERT INTO `e_maltrato_maltratoclasificacion` VALUES (3,1),(4,1),(5,1);
/*!40000 ALTER TABLE `e_maltrato_maltratoclasificacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `e_maltratoclasificacion`
--

DROP TABLE IF EXISTS `e_maltratoclasificacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e_maltratoclasificacion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(40) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `e_maltratoclasificacion`
--

LOCK TABLES `e_maltratoclasificacion` WRITE;
/*!40000 ALTER TABLE `e_maltratoclasificacion` DISABLE KEYS */;
INSERT INTO `e_maltratoclasificacion` VALUES (1,'negligencia');
/*!40000 ALTER TABLE `e_maltratoclasificacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `e_medicina`
--

DROP TABLE IF EXISTS `e_medicina`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e_medicina` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `medicina` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `e_medicina`
--

LOCK TABLES `e_medicina` WRITE;
/*!40000 ALTER TABLE `e_medicina` DISABLE KEYS */;
INSERT INTO `e_medicina` VALUES (1,'aspirinas');
/*!40000 ALTER TABLE `e_medicina` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `e_paciente`
--

DROP TABLE IF EXISTS `e_paciente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e_paciente` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `txt_dependencia` varchar(30) DEFAULT NULL,
  `bol_perdida_pareja` tinyint(1) DEFAULT '0',
  `bol_perdida_familiar` tinyint(1) DEFAULT '0',
  `bol_perdida_amistad` tinyint(1) DEFAULT '0',
  `bol_perdida_mascota` tinyint(1) DEFAULT '0',
  `bol_asiste_institucion` tinyint(1) DEFAULT '0',
  `bol_asiste_estancia` tinyint(1) DEFAULT '0',
  `txt_observacion` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `e_paciente`
--

LOCK TABLES `e_paciente` WRITE;
/*!40000 ALTER TABLE `e_paciente` DISABLE KEYS */;
INSERT INTO `e_paciente` VALUES (1,NULL,0,0,0,0,0,0,''),(2,'independiente',1,0,0,0,1,0,'esta desorientado'),(3,NULL,0,0,0,0,1,0,''),(4,NULL,0,0,0,0,1,0,''),(5,'parcialmente independiente',0,1,0,0,1,0,'Esta desorientado'),(6,'parcialmente independiente',0,1,0,0,1,0,'Esta desorientado'),(7,'parcialmente independiente',0,1,0,0,1,0,'Esta desorientado'),(8,NULL,0,0,0,0,1,0,'');
/*!40000 ALTER TABLE `e_paciente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `e_paciente_actividad`
--

DROP TABLE IF EXISTS `e_paciente_actividad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e_paciente_actividad` (
  `id_paciente` int(11) NOT NULL,
  `id_actividad` int(11) NOT NULL,
  PRIMARY KEY (`id_paciente`,`id_actividad`),
  KEY `id_actividad` (`id_actividad`),
  CONSTRAINT `e_paciente_actividad_ibfk_1` FOREIGN KEY (`id_paciente`) REFERENCES `e_paciente` (`id`),
  CONSTRAINT `e_paciente_actividad_ibfk_2` FOREIGN KEY (`id_actividad`) REFERENCES `e_actividad` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `e_paciente_actividad`
--

LOCK TABLES `e_paciente_actividad` WRITE;
/*!40000 ALTER TABLE `e_paciente_actividad` DISABLE KEYS */;
INSERT INTO `e_paciente_actividad` VALUES (2,1);
/*!40000 ALTER TABLE `e_paciente_actividad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `e_paciente_auxiliar`
--

DROP TABLE IF EXISTS `e_paciente_auxiliar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e_paciente_auxiliar` (
  `id_paciente` int(11) NOT NULL,
  `id_auxiliar` int(11) NOT NULL,
  PRIMARY KEY (`id_paciente`,`id_auxiliar`),
  KEY `id_auxiliar` (`id_auxiliar`),
  CONSTRAINT `e_paciente_auxiliar_ibfk_1` FOREIGN KEY (`id_paciente`) REFERENCES `e_paciente` (`id`),
  CONSTRAINT `e_paciente_auxiliar_ibfk_2` FOREIGN KEY (`id_auxiliar`) REFERENCES `e_auxiliar` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `e_paciente_auxiliar`
--

LOCK TABLES `e_paciente_auxiliar` WRITE;
/*!40000 ALTER TABLE `e_paciente_auxiliar` DISABLE KEYS */;
INSERT INTO `e_paciente_auxiliar` VALUES (2,1),(3,1),(4,1),(5,1),(6,1),(7,1),(2,2),(8,2),(3,3),(4,3),(5,3),(6,3),(7,3),(8,3);
/*!40000 ALTER TABLE `e_paciente_auxiliar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `e_paciente_diagnosticomedico`
--

DROP TABLE IF EXISTS `e_paciente_diagnosticomedico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e_paciente_diagnosticomedico` (
  `id_paciente` int(11) NOT NULL,
  `id_diagnostico_medico` int(11) NOT NULL,
  PRIMARY KEY (`id_paciente`,`id_diagnostico_medico`),
  KEY `id_diagnostico_medico` (`id_diagnostico_medico`),
  CONSTRAINT `e_paciente_diagnosticomedico_ibfk_1` FOREIGN KEY (`id_paciente`) REFERENCES `e_paciente` (`id`),
  CONSTRAINT `e_paciente_diagnosticomedico_ibfk_2` FOREIGN KEY (`id_diagnostico_medico`) REFERENCES `e_diagnosticomedico` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `e_paciente_diagnosticomedico`
--

LOCK TABLES `e_paciente_diagnosticomedico` WRITE;
/*!40000 ALTER TABLE `e_paciente_diagnosticomedico` DISABLE KEYS */;
/*!40000 ALTER TABLE `e_paciente_diagnosticomedico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `e_paciente_sindrome`
--

DROP TABLE IF EXISTS `e_paciente_sindrome`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e_paciente_sindrome` (
  `id_paciente` int(11) NOT NULL,
  `id_sindrome` int(11) NOT NULL,
  PRIMARY KEY (`id_paciente`,`id_sindrome`),
  KEY `id_sindrome` (`id_sindrome`),
  CONSTRAINT `e_paciente_sindrome_ibfk_1` FOREIGN KEY (`id_paciente`) REFERENCES `e_paciente` (`id`),
  CONSTRAINT `e_paciente_sindrome_ibfk_2` FOREIGN KEY (`id_sindrome`) REFERENCES `e_sindrome` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `e_paciente_sindrome`
--

LOCK TABLES `e_paciente_sindrome` WRITE;
/*!40000 ALTER TABLE `e_paciente_sindrome` DISABLE KEYS */;
/*!40000 ALTER TABLE `e_paciente_sindrome` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `e_problema`
--

DROP TABLE IF EXISTS `e_problema`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e_problema` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `problema` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `e_problema`
--

LOCK TABLES `e_problema` WRITE;
/*!40000 ALTER TABLE `e_problema` DISABLE KEYS */;
INSERT INTO `e_problema` VALUES (1,'abandono'),(2,'peleas');
/*!40000 ALTER TABLE `e_problema` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `e_recursos`
--

DROP TABLE IF EXISTS `e_recursos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e_recursos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `red_familiar` tinyint(1) DEFAULT '0',
  `red_extra_familiar` tinyint(1) DEFAULT '0',
  `red_institucional` tinyint(1) DEFAULT '0',
  `observacion` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `e_recursos`
--

LOCK TABLES `e_recursos` WRITE;
/*!40000 ALTER TABLE `e_recursos` DISABLE KEYS */;
INSERT INTO `e_recursos` VALUES (1,0,0,0,''),(2,0,1,0,'sdd'),(3,0,1,0,'sdd'),(4,0,1,0,'sdd'),(5,0,1,0,'sdd'),(6,0,1,0,'sdd'),(7,0,0,0,'');
/*!40000 ALTER TABLE `e_recursos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `e_serviciomedico`
--

DROP TABLE IF EXISTS `e_serviciomedico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e_serviciomedico` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gastos_medicos` tinyint(1) DEFAULT '0',
  `observacion` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `e_serviciomedico`
--

LOCK TABLES `e_serviciomedico` WRITE;
/*!40000 ALTER TABLE `e_serviciomedico` DISABLE KEYS */;
INSERT INTO `e_serviciomedico` VALUES (1,0,''),(2,0,''),(3,1,'Buen seguro'),(4,1,'Buen seguro'),(5,1,'Buen seguro'),(6,0,'');
/*!40000 ALTER TABLE `e_serviciomedico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `e_serviciomedico_derechohabiente`
--

DROP TABLE IF EXISTS `e_serviciomedico_derechohabiente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e_serviciomedico_derechohabiente` (
  `id_servicio_medico` int(11) NOT NULL,
  `id_derechohabiente` int(11) NOT NULL,
  PRIMARY KEY (`id_servicio_medico`,`id_derechohabiente`),
  KEY `id_derechohabiente` (`id_derechohabiente`),
  CONSTRAINT `e_serviciomedico_derechohabiente_ibfk_1` FOREIGN KEY (`id_servicio_medico`) REFERENCES `e_serviciomedico` (`id`),
  CONSTRAINT `e_serviciomedico_derechohabiente_ibfk_2` FOREIGN KEY (`id_derechohabiente`) REFERENCES `e_derechohabiente` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `e_serviciomedico_derechohabiente`
--

LOCK TABLES `e_serviciomedico_derechohabiente` WRITE;
/*!40000 ALTER TABLE `e_serviciomedico_derechohabiente` DISABLE KEYS */;
INSERT INTO `e_serviciomedico_derechohabiente` VALUES (3,1),(4,1),(5,1);
/*!40000 ALTER TABLE `e_serviciomedico_derechohabiente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `e_sindrome`
--

DROP TABLE IF EXISTS `e_sindrome`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e_sindrome` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sindrome` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `e_sindrome`
--

LOCK TABLES `e_sindrome` WRITE;
/*!40000 ALTER TABLE `e_sindrome` DISABLE KEYS */;
/*!40000 ALTER TABLE `e_sindrome` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `e_transporte`
--

DROP TABLE IF EXISTS `e_transporte`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e_transporte` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `transporte` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `e_transporte`
--

LOCK TABLES `e_transporte` WRITE;
/*!40000 ALTER TABLE `e_transporte` DISABLE KEYS */;
INSERT INTO `e_transporte` VALUES (1,'autobús urbano');
/*!40000 ALTER TABLE `e_transporte` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `e_tratamiento`
--

DROP TABLE IF EXISTS `e_tratamiento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e_tratamiento` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `observacion` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `e_tratamiento`
--

LOCK TABLES `e_tratamiento` WRITE;
/*!40000 ALTER TABLE `e_tratamiento` DISABLE KEYS */;
INSERT INTO `e_tratamiento` VALUES (1,''),(2,'sddsa'),(3,'sddsa'),(4,'sddsa'),(5,'sddsa'),(6,'sddsa'),(7,'');
/*!40000 ALTER TABLE `e_tratamiento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `e_tratamiento_administrador`
--

DROP TABLE IF EXISTS `e_tratamiento_administrador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e_tratamiento_administrador` (
  `id_tratamiento` int(11) NOT NULL,
  `id_administrador` int(11) NOT NULL,
  PRIMARY KEY (`id_tratamiento`,`id_administrador`),
  KEY `id_administrador` (`id_administrador`),
  CONSTRAINT `e_tratamiento_administrador_ibfk_1` FOREIGN KEY (`id_tratamiento`) REFERENCES `e_tratamiento` (`id`),
  CONSTRAINT `e_tratamiento_administrador_ibfk_2` FOREIGN KEY (`id_administrador`) REFERENCES `e_familiar` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `e_tratamiento_administrador`
--

LOCK TABLES `e_tratamiento_administrador` WRITE;
/*!40000 ALTER TABLE `e_tratamiento_administrador` DISABLE KEYS */;
INSERT INTO `e_tratamiento_administrador` VALUES (2,1),(3,1),(4,1),(5,1),(6,1);
/*!40000 ALTER TABLE `e_tratamiento_administrador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `e_tratamiento_comprador`
--

DROP TABLE IF EXISTS `e_tratamiento_comprador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e_tratamiento_comprador` (
  `id_tratamiento` int(11) NOT NULL,
  `id_comprador` int(11) NOT NULL,
  PRIMARY KEY (`id_tratamiento`,`id_comprador`),
  KEY `id_comprador` (`id_comprador`),
  CONSTRAINT `e_tratamiento_comprador_ibfk_1` FOREIGN KEY (`id_tratamiento`) REFERENCES `e_tratamiento` (`id`),
  CONSTRAINT `e_tratamiento_comprador_ibfk_2` FOREIGN KEY (`id_comprador`) REFERENCES `e_familiar` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `e_tratamiento_comprador`
--

LOCK TABLES `e_tratamiento_comprador` WRITE;
/*!40000 ALTER TABLE `e_tratamiento_comprador` DISABLE KEYS */;
INSERT INTO `e_tratamiento_comprador` VALUES (2,2),(3,2),(4,2),(5,2),(6,2);
/*!40000 ALTER TABLE `e_tratamiento_comprador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `e_tratamiento_medicina`
--

DROP TABLE IF EXISTS `e_tratamiento_medicina`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e_tratamiento_medicina` (
  `id_tratamiento` int(11) NOT NULL,
  `id_medicina` int(11) NOT NULL,
  PRIMARY KEY (`id_tratamiento`,`id_medicina`),
  KEY `id_medicina` (`id_medicina`),
  CONSTRAINT `e_tratamiento_medicina_ibfk_1` FOREIGN KEY (`id_tratamiento`) REFERENCES `e_tratamiento` (`id`),
  CONSTRAINT `e_tratamiento_medicina_ibfk_2` FOREIGN KEY (`id_medicina`) REFERENCES `e_medicina` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `e_tratamiento_medicina`
--

LOCK TABLES `e_tratamiento_medicina` WRITE;
/*!40000 ALTER TABLE `e_tratamiento_medicina` DISABLE KEYS */;
INSERT INTO `e_tratamiento_medicina` VALUES (4,1),(5,1),(6,1);
/*!40000 ALTER TABLE `e_tratamiento_medicina` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `e_tratamiento_transporte`
--

DROP TABLE IF EXISTS `e_tratamiento_transporte`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e_tratamiento_transporte` (
  `id_tratamiento` int(11) NOT NULL,
  `id_transporte` int(11) NOT NULL,
  PRIMARY KEY (`id_tratamiento`,`id_transporte`),
  KEY `id_transporte` (`id_transporte`),
  CONSTRAINT `e_tratamiento_transporte_ibfk_1` FOREIGN KEY (`id_tratamiento`) REFERENCES `e_tratamiento` (`id`),
  CONSTRAINT `e_tratamiento_transporte_ibfk_2` FOREIGN KEY (`id_transporte`) REFERENCES `e_transporte` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `e_tratamiento_transporte`
--

LOCK TABLES `e_tratamiento_transporte` WRITE;
/*!40000 ALTER TABLE `e_tratamiento_transporte` DISABLE KEYS */;
INSERT INTO `e_tratamiento_transporte` VALUES (2,1),(3,1),(4,1),(5,1),(6,1);
/*!40000 ALTER TABLE `e_tratamiento_transporte` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `e_vivienda`
--

DROP TABLE IF EXISTS `e_vivienda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e_vivienda` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tenencia` varchar(30) DEFAULT NULL,
  `tipo` varchar(30) DEFAULT NULL,
  `zona` varchar(10) DEFAULT NULL,
  `dormitorio_compartido` tinyint(1) DEFAULT '0',
  `acceso_banio` tinyint(1) DEFAULT '0',
  `elevador` tinyint(1) DEFAULT '0',
  `escaleras` tinyint(1) DEFAULT '0',
  `alfombra` tinyint(1) DEFAULT '0',
  `desnivel` tinyint(1) DEFAULT '0',
  `pasamanos` tinyint(1) DEFAULT '0',
  `obstaculos` tinyint(1) DEFAULT '0',
  `caidas` tinyint(1) DEFAULT '0',
  `especificacion` text,
  `observacion` text,
  `planta` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `e_vivienda`
--

LOCK TABLES `e_vivienda` WRITE;
/*!40000 ALTER TABLE `e_vivienda` DISABLE KEYS */;
INSERT INTO `e_vivienda` VALUES (1,NULL,NULL,NULL,0,0,0,0,0,0,0,0,0,NULL,'',NULL),(2,NULL,NULL,NULL,0,0,0,0,0,0,0,0,0,NULL,'',NULL),(3,'rentada','cuarto redondo','urbana',0,0,0,1,1,0,0,1,0,NULL,'Casa llena de adornos','planta baja'),(4,'rentada',NULL,'urbana',0,0,0,1,1,0,0,1,0,NULL,'Casa llena de adornos','planta baja'),(5,'rentada',NULL,'urbana',0,0,0,1,1,0,0,1,0,NULL,'Casa llena de adornos','planta baja'),(6,NULL,NULL,NULL,0,0,0,0,0,0,0,0,0,NULL,'',NULL);
/*!40000 ALTER TABLE `e_vivienda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `e_vivienda_companiero`
--

DROP TABLE IF EXISTS `e_vivienda_companiero`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `e_vivienda_companiero` (
  `id_vivienda` int(11) NOT NULL,
  `id_companiero` int(11) NOT NULL,
  PRIMARY KEY (`id_vivienda`,`id_companiero`),
  KEY `id_companiero` (`id_companiero`),
  CONSTRAINT `e_vivienda_companiero_ibfk_1` FOREIGN KEY (`id_vivienda`) REFERENCES `e_vivienda` (`id`),
  CONSTRAINT `e_vivienda_companiero_ibfk_2` FOREIGN KEY (`id_companiero`) REFERENCES `e_familiar` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `e_vivienda_companiero`
--

LOCK TABLES `e_vivienda_companiero` WRITE;
/*!40000 ALTER TABLE `e_vivienda_companiero` DISABLE KEYS */;
/*!40000 ALTER TABLE `e_vivienda_companiero` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `familiograma`
--

DROP TABLE IF EXISTS `familiograma`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `familiograma` (
  `id` int(11) NOT NULL,
  `json` varchar(100) NOT NULL,
  `comment` varchar(5000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `familiograma`
--

LOCK TABLES `familiograma` WRITE;
/*!40000 ALTER TABLE `familiograma` DISABLE KEYS */;
INSERT INTO `familiograma` VALUES (0,'json/paciente0.json',''),(1,'json/paciente1.json',''),(2,'json/paciente2.json',''),(6,'json/paciente6.json',''),(7,'json/paciente7.json','');
/*!40000 ALTER TABLE `familiograma` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paciente`
--

DROP TABLE IF EXISTS `paciente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `paciente` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `registro` int(11) NOT NULL,
  `no_cama` int(13) DEFAULT NULL,
  `codigo_postal` varchar(40) DEFAULT NULL,
  `telefono_casa` varchar(40) DEFAULT NULL,
  `telefono_cel` varchar(40) DEFAULT NULL,
  `fecha_evaluacion` varchar(15) DEFAULT NULL,
  `fecha_ingreso` varchar(45) DEFAULT NULL,
  `consulta_externa` varchar(45) DEFAULT NULL,
  `nombre` varchar(30) NOT NULL,
  `apellido_paterno` varchar(45) DEFAULT NULL,
  `apellido_materno` varchar(45) DEFAULT NULL,
  `fecha_nacimiento` varchar(45) DEFAULT NULL,
  `estado` varchar(45) DEFAULT NULL,
  `municipio` varchar(45) DEFAULT NULL,
  `colonia` varchar(45) DEFAULT NULL,
  `calle` varchar(45) DEFAULT NULL,
  `estado_civil` varchar(45) DEFAULT NULL,
  `genero` varchar(45) DEFAULT NULL,
  `sexo` varchar(45) DEFAULT NULL,
  `religion` varchar(45) DEFAULT NULL,
  `entrevista_a` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paciente`
--

LOCK TABLES `paciente` WRITE;
/*!40000 ALTER TABLE `paciente` DISABLE KEYS */;
INSERT INTO `paciente` VALUES (1,6364,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Gerardo García López',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(2,6364,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Ernesto González González',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(3,6364,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Gloria Andrade Ruiz',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(4,12345,20,'11346123','5544312312','5544321251','16/05/2017','16/05/2017','Ejemplo','Juan','Pérez','García','','CDMX','Xochimilco','Ejemplo','Ejemplo','','',NULL,'Catolico','Vecino'),(5,123456,21353,'132456','Prueba','Prueba','07/02/1900','02/03/1911','Prueba','Prueba','Prueba','Prueba','07/08/1912','CDMX','Prueba','Prueba','Prueba',NULL,'Hombre',NULL,NULL,'Prueba'),(6,1234567,21353,'132456','Prueba','Prueba','07/02/1935','02/03/1911','Prueba','Prueba','Prueba','Prueba','07/08/1912',NULL,'Prueba','Prueba','Prueba',NULL,'Hombre',NULL,NULL,'Prueba'),(7,123456789,5,'123456','123456','123456','01/12/2010','01/12/2010','Medicina Interna','Juan','Pérez','Pérez','05/02/1935','CDMX','Tlalpan','Prueba','Prueba','Soltero','','Masculino','Catolico','Vecino (Maria )'),(8,12345678,21353,'132456','Prueba','Prueba','07/02/1935','02/03/1911','Prueba','Juan','Hernández','Hernández','07/08/1912',NULL,'Prueba','Prueba','Prueba',NULL,'Hombre',NULL,NULL,'Prueba');
/*!40000 ALTER TABLE `paciente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trabajador`
--

DROP TABLE IF EXISTS `trabajador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trabajador` (
  `id_trabajador` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `tipo_trabajador` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `usuario` varchar(45) NOT NULL,
  PRIMARY KEY (`id_trabajador`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trabajador`
--

LOCK TABLES `trabajador` WRITE;
/*!40000 ALTER TABLE `trabajador` DISABLE KEYS */;
INSERT INTO `trabajador` VALUES (1,'AdministradorMaster','Administrador','admin','admin'),(2,'Slvia Bautista','Administrador','123456','SBautista');
/*!40000 ALTER TABLE `trabajador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `valoracion`
--

DROP TABLE IF EXISTS `valoracion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `valoracion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_paciente` int(11) NOT NULL,
  `id_e_paciente` int(11) DEFAULT '1',
  `id_e_cuidador` int(11) DEFAULT '1',
  `id_e_tratamiento` int(11) DEFAULT '1',
  `id_e_recursos` int(11) DEFAULT '1',
  `id_e_familia` int(11) DEFAULT '1',
  `id_e_economia` int(11) DEFAULT '1',
  `id_e_servicio_medico` int(11) DEFAULT '1',
  `id_e_maltrato` int(11) DEFAULT '1',
  `id_e_vivienda` int(11) DEFAULT '1',
  `id_e_diagnostico` int(11) DEFAULT '1',
  `id_e_abordaje` int(11) DEFAULT '1',
  `fecha` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `id_paciente` (`id_paciente`),
  KEY `id_e_paciente` (`id_e_paciente`),
  KEY `id_e_cuidador` (`id_e_cuidador`),
  KEY `id_e_tratamiento` (`id_e_tratamiento`),
  KEY `id_e_recursos` (`id_e_recursos`),
  KEY `id_e_familia` (`id_e_familia`),
  KEY `id_e_economia` (`id_e_economia`),
  KEY `id_e_servicio_medico` (`id_e_servicio_medico`),
  KEY `id_e_maltrato` (`id_e_maltrato`),
  KEY `id_e_vivienda` (`id_e_vivienda`),
  KEY `id_e_diagnostico` (`id_e_diagnostico`),
  KEY `id_e_abordaje` (`id_e_abordaje`),
  CONSTRAINT `valoracion_ibfk_1` FOREIGN KEY (`id_paciente`) REFERENCES `paciente` (`id`),
  CONSTRAINT `valoracion_ibfk_10` FOREIGN KEY (`id_e_vivienda`) REFERENCES `e_vivienda` (`id`),
  CONSTRAINT `valoracion_ibfk_11` FOREIGN KEY (`id_e_diagnostico`) REFERENCES `e_diagnostico` (`id`),
  CONSTRAINT `valoracion_ibfk_12` FOREIGN KEY (`id_e_abordaje`) REFERENCES `e_abordaje` (`id`),
  CONSTRAINT `valoracion_ibfk_2` FOREIGN KEY (`id_e_paciente`) REFERENCES `e_paciente` (`id`),
  CONSTRAINT `valoracion_ibfk_3` FOREIGN KEY (`id_e_cuidador`) REFERENCES `e_cuidador` (`id`),
  CONSTRAINT `valoracion_ibfk_4` FOREIGN KEY (`id_e_tratamiento`) REFERENCES `e_tratamiento` (`id`),
  CONSTRAINT `valoracion_ibfk_5` FOREIGN KEY (`id_e_recursos`) REFERENCES `e_recursos` (`id`),
  CONSTRAINT `valoracion_ibfk_6` FOREIGN KEY (`id_e_familia`) REFERENCES `e_familia` (`id`),
  CONSTRAINT `valoracion_ibfk_7` FOREIGN KEY (`id_e_economia`) REFERENCES `e_economia` (`id`),
  CONSTRAINT `valoracion_ibfk_8` FOREIGN KEY (`id_e_servicio_medico`) REFERENCES `e_serviciomedico` (`id`),
  CONSTRAINT `valoracion_ibfk_9` FOREIGN KEY (`id_e_maltrato`) REFERENCES `e_maltrato` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `valoracion`
--

LOCK TABLES `valoracion` WRITE;
/*!40000 ALTER TABLE `valoracion` DISABLE KEYS */;
INSERT INTO `valoracion` VALUES (33,1,1,1,1,1,1,1,1,1,1,1,1,'2017-05-16 08:43:38'),(34,8,2,1,1,1,1,1,1,1,1,1,1,'2017-05-17 08:49:00'),(35,3,7,4,6,6,5,5,5,5,5,5,5,'2017-05-17 09:00:15'),(36,3,8,1,7,7,6,6,6,6,6,6,6,'2017-05-17 09:21:31');
/*!40000 ALTER TABLE `valoracion` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-05-17 12:10:55
