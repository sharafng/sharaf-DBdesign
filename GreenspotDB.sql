CREATE DATABASE  IF NOT EXISTS `green_spot` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `green_spot`;
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: green_spot
-- ------------------------------------------------------
-- Server version	8.0.34

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `product_id` int NOT NULL,
  `description` varchar(60) NOT NULL,
  `product_type` varchar(20) NOT NULL,
  `inventory` int NOT NULL,
  `unit` varchar(45) NOT NULL,
  `prod_location` varchar(10) NOT NULL,
  `supplier_id` int NOT NULL,
  PRIMARY KEY (`product_id`,`supplier_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1000,'Bennet Farm free-range eggs','Dairy',29,'dozen','D12',446),(1100,'Freshness White beans','Canned',13,'12 oz can','a2',678),(1222,'Freshness Green beans','Canned',59,'12 oz can','a3',678),(1223,'Freshness Green beans','Canned',12,'36 oz can','a7',678),(1224,'Freshness Wax beans','Canned',31,'12 oz can','a3',678),(2000,'Ruby\'s Kale','Produce',3,'bunch','p12',567),(2001,'Ruby\'s Organic Kale','Produce',20,'bunch','po2',567);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purchase`
--

DROP TABLE IF EXISTS `purchase`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `purchase` (
  `purchase_id` int NOT NULL AUTO_INCREMENT,
  `purchase_date` date NOT NULL,
  `quantity` int NOT NULL,
  `purchase_price` decimal(10,2) NOT NULL,
  `supplier_id` int NOT NULL,
  `product_id` int NOT NULL,
  PRIMARY KEY (`purchase_id`,`supplier_id`,`product_id`),
  KEY `fk_purchase_Supplier1_idx` (`supplier_id`),
  KEY `fk_purchase_product1_idx` (`product_id`),
  CONSTRAINT `fk_purchase_product1` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`),
  CONSTRAINT `fk_purchase_Supplier1` FOREIGN KEY (`supplier_id`) REFERENCES `supplier` (`supplier_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20009 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchase`
--

LOCK TABLES `purchase` WRITE;
/*!40000 ALTER TABLE `purchase` DISABLE KEYS */;
INSERT INTO `purchase` VALUES (20001,'2022-02-01',25,2.35,446,1000),(20002,'2022-02-02',40,0.69,678,1100),(20003,'2022-02-10',40,0.59,678,1222),(20004,'2022-02-10',10,1.75,678,1223),(20005,'2022-02-10',30,0.65,678,1224),(20006,'2022-02-12',25,1.29,567,2000),(20007,'2022-02-12',20,2.19,567,2001),(20008,'2022-02-15',10,1.80,678,1223);
/*!40000 ALTER TABLE `purchase` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales`
--

DROP TABLE IF EXISTS `sales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sales` (
  `sales_id` int NOT NULL,
  `sales_date` date NOT NULL,
  `quantity` int NOT NULL,
  `sales_price` decimal(10,2) NOT NULL,
  `customer_code` int DEFAULT NULL,
  `product_id` int NOT NULL,
  PRIMARY KEY (`sales_id`,`product_id`),
  KEY `fk_sales_product1_idx` (`product_id`),
  KEY `fk_sales_customer1_idx` (`customer_code`),
  CONSTRAINT `fk_sales_product1` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales`
--

LOCK TABLES `sales` WRITE;
/*!40000 ALTER TABLE `sales` DISABLE KEYS */;
INSERT INTO `sales` VALUES (10001,'2022-02-02',2,5.49,198765,1000),(10002,'2022-02-02',2,3.99,NULL,2000),(10003,'2022-02-02',2,1.49,202900,1100),(10004,'2022-02-04',2,5.99,196777,1000),(10005,'2022-02-07',8,1.49,198765,1100),(10006,'2022-02-11',4,5.49,277177,1000),(10007,'2022-02-11',4,1.49,NULL,1100),(10008,'2022-02-12',12,1.29,111000,1222),(10009,'2022-02-12',8,1.55,NULL,1224),(10010,'2022-02-13',5,3.49,198765,1223),(10011,'2022-02-13',1,6.99,100988,2001),(10012,'2022-02-14',12,6.99,202900,2001),(10013,'2022-02-15',2,3.99,111000,2000);
/*!40000 ALTER TABLE `sales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supplier`
--

DROP TABLE IF EXISTS `supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `supplier` (
  `supplier_id` int NOT NULL,
  `supplier_name` varchar(45) NOT NULL,
  `supplier_add` varchar(75) NOT NULL,
  PRIMARY KEY (`supplier_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplier`
--

LOCK TABLES `supplier` WRITE;
/*!40000 ALTER TABLE `supplier` DISABLE KEYS */;
INSERT INTO `supplier` VALUES (446,'Bennet Farms','Rt. 17 Evansville, IL 55446'),(567,'Ruby Redd Produce, LLC','1212 Milam St., Kenosha, AL, 34567'),(678,'Freshness, Inc.','202 E. Maple St., St. Joseph, MO 45678');
/*!40000 ALTER TABLE `supplier` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-10-31  6:45:58
