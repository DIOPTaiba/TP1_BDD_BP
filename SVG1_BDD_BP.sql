-- MySQL dump 10.13  Distrib 8.0.20, for Linux (x86_64)
--
-- Host: localhost    Database: banque_peuple
-- ------------------------------------------------------
-- Server version	8.0.20-0ubuntu0.20.04.1

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
-- Table structure for table `administrateur`
--

DROP TABLE IF EXISTS `administrateur`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `administrateur` (
  `id_admin` int NOT NULL AUTO_INCREMENT,
  `id_employes` int NOT NULL,
  `login` varchar(50) NOT NULL,
  `mot_de_passe` varchar(50) NOT NULL,
  PRIMARY KEY (`id_admin`),
  KEY `fk_employes_administrateur` (`id_employes`),
  CONSTRAINT `fk_employes_administrateur` FOREIGN KEY (`id_employes`) REFERENCES `employes` (`id_employes`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administrateur`
--

LOCK TABLES `administrateur` WRITE;
/*!40000 ALTER TABLE `administrateur` DISABLE KEYS */;
/*!40000 ALTER TABLE `administrateur` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `agence`
--

DROP TABLE IF EXISTS `agence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `agence` (
  `numero_agence` int NOT NULL AUTO_INCREMENT,
  `adresse` varchar(50) NOT NULL,
  `id_admin` int NOT NULL,
  PRIMARY KEY (`numero_agence`),
  KEY `fk_administrateur_agence` (`id_admin`),
  CONSTRAINT `fk_administrateur_agence` FOREIGN KEY (`id_admin`) REFERENCES `administrateur` (`id_admin`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agence`
--

LOCK TABLES `agence` WRITE;
/*!40000 ALTER TABLE `agence` DISABLE KEYS */;
/*!40000 ALTER TABLE `agence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `caissiere`
--

DROP TABLE IF EXISTS `caissiere`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `caissiere` (
  `id_caissiere` int NOT NULL AUTO_INCREMENT,
  `id_employes` int NOT NULL,
  `login` varchar(50) NOT NULL,
  `mot_de_passe` varchar(50) NOT NULL,
  PRIMARY KEY (`id_caissiere`),
  KEY `fk_employes_caissiere` (`id_employes`),
  CONSTRAINT `fk_employes_caissiere` FOREIGN KEY (`id_employes`) REFERENCES `employes` (`id_employes`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `caissiere`
--

LOCK TABLES `caissiere` WRITE;
/*!40000 ALTER TABLE `caissiere` DISABLE KEYS */;
/*!40000 ALTER TABLE `caissiere` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client_moral`
--

DROP TABLE IF EXISTS `client_moral`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `client_moral` (
  `id_client_moral` int NOT NULL AUTO_INCREMENT,
  `nom_entreprise` varchar(50) NOT NULL,
  `raison_social` varchar(50) NOT NULL,
  `identifiant_entreprise` varchar(50) NOT NULL,
  `id_clients` int NOT NULL,
  PRIMARY KEY (`id_client_moral`),
  KEY `fk_clients_client_moral` (`id_clients`),
  CONSTRAINT `fk_clients_client_moral` FOREIGN KEY (`id_clients`) REFERENCES `clients` (`id_clients`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client_moral`
--

LOCK TABLES `client_moral` WRITE;
/*!40000 ALTER TABLE `client_moral` DISABLE KEYS */;
/*!40000 ALTER TABLE `client_moral` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client_non_salarie`
--

DROP TABLE IF EXISTS `client_non_salarie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `client_non_salarie` (
  `id_client_non_salarie` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) NOT NULL,
  `prenom` varchar(50) NOT NULL,
  `carte_identite` varchar(15) NOT NULL,
  `id_clients` int NOT NULL,
  PRIMARY KEY (`id_client_non_salarie`),
  KEY `fk_clients_client_non_salarie` (`id_clients`),
  CONSTRAINT `fk_clients_client_non_salarie` FOREIGN KEY (`id_clients`) REFERENCES `clients` (`id_clients`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client_non_salarie`
--

LOCK TABLES `client_non_salarie` WRITE;
/*!40000 ALTER TABLE `client_non_salarie` DISABLE KEYS */;
/*!40000 ALTER TABLE `client_non_salarie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client_salarie`
--

DROP TABLE IF EXISTS `client_salarie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `client_salarie` (
  `id_client_salarie` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) NOT NULL,
  `prenom` varchar(50) NOT NULL,
  `carte_identite` varchar(15) NOT NULL,
  `profession` varchar(30) DEFAULT NULL,
  `salaire` double NOT NULL,
  `nom_employeur` varchar(30) NOT NULL,
  `adresse_entreprise` varchar(50) NOT NULL,
  `raison_social` varchar(50) NOT NULL,
  `identifiant_entreprise` varchar(50) NOT NULL,
  `id_clients` int NOT NULL,
  PRIMARY KEY (`id_client_salarie`),
  KEY `fk_clients_client_salarie` (`id_clients`),
  CONSTRAINT `fk_clients_client_salarie` FOREIGN KEY (`id_clients`) REFERENCES `clients` (`id_clients`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client_salarie`
--

LOCK TABLES `client_salarie` WRITE;
/*!40000 ALTER TABLE `client_salarie` DISABLE KEYS */;
/*!40000 ALTER TABLE `client_salarie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clients`
--

DROP TABLE IF EXISTS `clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clients` (
  `id_clients` int NOT NULL AUTO_INCREMENT,
  `adresse` varchar(50) NOT NULL,
  `telephone` varchar(20) NOT NULL,
  `email` varchar(30) DEFAULT NULL,
  `date_inscription` date NOT NULL,
  `type_client` varchar(20) NOT NULL,
  `id_responsable_compte` int NOT NULL,
  PRIMARY KEY (`id_clients`),
  KEY `fk_responsable_compte_clients` (`id_responsable_compte`),
  CONSTRAINT `fk_responsable_compte_clients` FOREIGN KEY (`id_responsable_compte`) REFERENCES `responsable_compte` (`id_responsable_compte`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clients`
--

LOCK TABLES `clients` WRITE;
/*!40000 ALTER TABLE `clients` DISABLE KEYS */;
/*!40000 ALTER TABLE `clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compte_bloque`
--

DROP TABLE IF EXISTS `compte_bloque`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `compte_bloque` (
  `id_compte_bloque` int NOT NULL AUTO_INCREMENT,
  `frais_ouverture` double NOT NULL,
  `montant_remuneration` double NOT NULL,
  `duree_blocage` date NOT NULL,
  `id_comptes` int NOT NULL,
  PRIMARY KEY (`id_compte_bloque`),
  KEY `fk_comptes_compte_bloque` (`id_comptes`),
  CONSTRAINT `fk_comptes_compte_bloque` FOREIGN KEY (`id_comptes`) REFERENCES `comptes` (`id_comptes`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compte_bloque`
--

LOCK TABLES `compte_bloque` WRITE;
/*!40000 ALTER TABLE `compte_bloque` DISABLE KEYS */;
/*!40000 ALTER TABLE `compte_bloque` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compte_courant`
--

DROP TABLE IF EXISTS `compte_courant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `compte_courant` (
  `id_compte_courant` int NOT NULL AUTO_INCREMENT,
  `agios` double NOT NULL,
  `id_comptes` int NOT NULL,
  PRIMARY KEY (`id_compte_courant`),
  KEY `fk_comptes_compte_courant` (`id_comptes`),
  CONSTRAINT `fk_comptes_compte_courant` FOREIGN KEY (`id_comptes`) REFERENCES `comptes` (`id_comptes`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compte_courant`
--

LOCK TABLES `compte_courant` WRITE;
/*!40000 ALTER TABLE `compte_courant` DISABLE KEYS */;
/*!40000 ALTER TABLE `compte_courant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compte_epargne`
--

DROP TABLE IF EXISTS `compte_epargne`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `compte_epargne` (
  `id_compte_epargne` int NOT NULL AUTO_INCREMENT,
  `frais_ouverture` double NOT NULL,
  `montant_remuneration` double NOT NULL,
  `id_comptes` int NOT NULL,
  PRIMARY KEY (`id_compte_epargne`),
  KEY `fk_comptes_compte_epargne` (`id_comptes`),
  CONSTRAINT `fk_comptes_compte_epargne` FOREIGN KEY (`id_comptes`) REFERENCES `comptes` (`id_comptes`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compte_epargne`
--

LOCK TABLES `compte_epargne` WRITE;
/*!40000 ALTER TABLE `compte_epargne` DISABLE KEYS */;
/*!40000 ALTER TABLE `compte_epargne` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comptes`
--

DROP TABLE IF EXISTS `comptes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comptes` (
  `id_comptes` int NOT NULL AUTO_INCREMENT,
  `numero_compte` varchar(30) NOT NULL,
  `cle_rib` int NOT NULL,
  `solde` double NOT NULL,
  `date_ouverture` date NOT NULL,
  `numero_agence` int NOT NULL,
  `id_clients` int NOT NULL,
  PRIMARY KEY (`id_comptes`),
  KEY `fk_agence_comptes` (`numero_agence`),
  KEY `fk_clients_comptes` (`id_clients`),
  CONSTRAINT `fk_agence_comptes` FOREIGN KEY (`numero_agence`) REFERENCES `agence` (`numero_agence`),
  CONSTRAINT `fk_clients_comptes` FOREIGN KEY (`id_clients`) REFERENCES `clients` (`id_clients`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comptes`
--

LOCK TABLES `comptes` WRITE;
/*!40000 ALTER TABLE `comptes` DISABLE KEYS */;
/*!40000 ALTER TABLE `comptes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employes`
--

DROP TABLE IF EXISTS `employes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employes` (
  `id_employes` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) NOT NULL,
  `prenom` varchar(50) NOT NULL,
  `adresse` varchar(50) NOT NULL,
  `telephone` varchar(20) NOT NULL,
  `email` varchar(30) NOT NULL,
  `date_embauche` date NOT NULL,
  `id_admin` int NOT NULL,
  `numero_agence` int NOT NULL,
  PRIMARY KEY (`id_employes`),
  KEY `fk_administrateur_employes` (`id_admin`),
  KEY `fk_agence_employes` (`numero_agence`),
  CONSTRAINT `fk_administrateur_employes` FOREIGN KEY (`id_admin`) REFERENCES `administrateur` (`id_admin`),
  CONSTRAINT `fk_agence_employes` FOREIGN KEY (`numero_agence`) REFERENCES `agence` (`numero_agence`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employes`
--

LOCK TABLES `employes` WRITE;
/*!40000 ALTER TABLE `employes` DISABLE KEYS */;
/*!40000 ALTER TABLE `employes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `etat_compte`
--

DROP TABLE IF EXISTS `etat_compte`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `etat_compte` (
  `id_etat_compte` int NOT NULL AUTO_INCREMENT,
  `etat_compte` varchar(10) NOT NULL,
  `date_changement_etat` date NOT NULL,
  `id_comptes` int NOT NULL,
  PRIMARY KEY (`id_etat_compte`),
  KEY `fk_comptes_etat_compte` (`id_comptes`),
  CONSTRAINT `fk_comptes_etat_compte` FOREIGN KEY (`id_comptes`) REFERENCES `comptes` (`id_comptes`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `etat_compte`
--

LOCK TABLES `etat_compte` WRITE;
/*!40000 ALTER TABLE `etat_compte` DISABLE KEYS */;
/*!40000 ALTER TABLE `etat_compte` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `operation_compte`
--

DROP TABLE IF EXISTS `operation_compte`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `operation_compte` (
  `id_operation_compte` int NOT NULL AUTO_INCREMENT,
  `type_operation` varchar(15) NOT NULL,
  `montant_operation` double NOT NULL,
  `date_operation` date NOT NULL,
  `id_compte_destinataire` int DEFAULT NULL,
  `id_comptes` int NOT NULL,
  `id_employes` int NOT NULL,
  PRIMARY KEY (`id_operation_compte`),
  KEY `fk_comptes_operation_compte` (`id_comptes`),
  KEY `fk_employes_operation_compte` (`id_employes`),
  CONSTRAINT `fk_comptes_operation_compte` FOREIGN KEY (`id_comptes`) REFERENCES `comptes` (`id_comptes`),
  CONSTRAINT `fk_employes_operation_compte` FOREIGN KEY (`id_employes`) REFERENCES `employes` (`id_employes`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `operation_compte`
--

LOCK TABLES `operation_compte` WRITE;
/*!40000 ALTER TABLE `operation_compte` DISABLE KEYS */;
/*!40000 ALTER TABLE `operation_compte` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profil_employes`
--

DROP TABLE IF EXISTS `profil_employes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `profil_employes` (
  `id_profil` int NOT NULL AUTO_INCREMENT,
  `profil` varchar(20) NOT NULL,
  `date_debut_poste` date NOT NULL,
  `id_employes` int NOT NULL,
  PRIMARY KEY (`id_profil`),
  KEY `fk_employes_profil_employes` (`id_employes`),
  CONSTRAINT `fk_employes_profil_employes` FOREIGN KEY (`id_employes`) REFERENCES `employes` (`id_employes`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profil_employes`
--

LOCK TABLES `profil_employes` WRITE;
/*!40000 ALTER TABLE `profil_employes` DISABLE KEYS */;
/*!40000 ALTER TABLE `profil_employes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `responsable_compte`
--

DROP TABLE IF EXISTS `responsable_compte`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `responsable_compte` (
  `id_responsable_compte` int NOT NULL AUTO_INCREMENT,
  `id_employes` int NOT NULL,
  `login` varchar(50) NOT NULL,
  `mot_de_passe` varchar(50) NOT NULL,
  PRIMARY KEY (`id_responsable_compte`),
  KEY `fk_employes_responsable_copmte` (`id_employes`),
  CONSTRAINT `fk_employes_responsable_copmte` FOREIGN KEY (`id_employes`) REFERENCES `employes` (`id_employes`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `responsable_compte`
--

LOCK TABLES `responsable_compte` WRITE;
/*!40000 ALTER TABLE `responsable_compte` DISABLE KEYS */;
/*!40000 ALTER TABLE `responsable_compte` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-06-25  8:53:53
