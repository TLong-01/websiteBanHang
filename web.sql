CREATE DATABASE  IF NOT EXISTS `webshop` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `webshop`;
-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: webshop
-- ------------------------------------------------------
-- Server version	8.0.31

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
-- Table structure for table `tbl_category`
--

DROP TABLE IF EXISTS `tbl_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `status` tinyint(1) DEFAULT '1',
  `created_date` datetime DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `seo` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `description` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_category`
--

LOCK TABLES `tbl_category` WRITE;
/*!40000 ALTER TABLE `tbl_category` DISABLE KEYS */;
INSERT INTO `tbl_category` VALUES (1,'HOODIE',1,'2021-11-30 20:34:50',NULL,NULL,NULL,'hoodie','Áo thu đông'),(2,'Quần bò',1,'2021-11-30 20:34:50',NULL,NULL,NULL,'quần bò','Quần áo'),(3,'Tshirt',1,'2021-11-30 20:34:50','2024-06-26 23:39:55',NULL,1,'tshirt','Áo phông'),(4,'Mũ',1,'2021-11-30 20:34:50','2024-07-08 23:00:04',NULL,1,'mu','MŨ'),(5,'Áo khoác',1,'2021-11-30 20:34:50','2024-07-08 23:00:30',NULL,1,'ao-khoac','Áo khoác');
/*!40000 ALTER TABLE `tbl_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_contact`
--

DROP TABLE IF EXISTS `tbl_contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_contact` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `email` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `massage` varchar(1000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_contact`
--

LOCK TABLES `tbl_contact` WRITE;
/*!40000 ALTER TABLE `tbl_contact` DISABLE KEYS */;
INSERT INTO `tbl_contact` VALUES (38,'Nam','namhai342@gmail.com','Shop cố gắng nhập thêm sản phẩm nhé!',1,'2023-06-09 09:13:12',NULL,NULL,NULL),(41,'Nguyễn Gia Thiều','giathieu123@gmail.com','Cải thiện nhiều hơn nhé',1,'2023-07-28 09:35:44',NULL,NULL,NULL);
/*!40000 ALTER TABLE `tbl_contact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_products`
--

DROP TABLE IF EXISTS `tbl_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `short_description` varchar(3000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `detail_description` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `price` decimal(13,2) NOT NULL,
  `status` tinyint(1) DEFAULT '1',
  `created_date` datetime DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `category_id` int DEFAULT NULL,
  `avatar` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `seo` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `price_sale` decimal(13,2) DEFAULT NULL,
  `product_status` int DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_1tbl_category_Ntbl_products_idx` (`category_id`),
  CONSTRAINT `fk_1tbl_category_Ntbl_products` FOREIGN KEY (`category_id`) REFERENCES `tbl_category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=689 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_products`
--

LOCK TABLES `tbl_products` WRITE;
/*!40000 ALTER TABLE `tbl_products` DISABLE KEYS */;
INSERT INTO `tbl_products` VALUES (58,'Hoodie','Hoodie','<p style=\"margin-bottom: 10px; line-height: 21px; max-width: 100%;\"><font color=\"#252a2b\" face=\"Quicksand, sans-serif\"><span style=\"font-size: 14px;\">Ảnh và sản phẩm được sản xuất từ Mom Says I\'m Cool&nbsp;</span></font></p><p style=\"margin-bottom: 10px; line-height: 21px; max-width: 100%;\"><font color=\"#252a2b\" face=\"Quicksand, sans-serif\"><span style=\"font-size: 14px;\">Kích thước: M, L</span></font></p><p style=\"margin-bottom: 10px; line-height: 21px; max-width: 100%;\"><font color=\"#252a2b\" face=\"Quicksand, sans-serif\"><span style=\"font-size: 14px;\">Màu sắc : Xanh</span></font></p><p style=\"margin-bottom: 10px; line-height: 21px; max-width: 100%;\"><font color=\"#252a2b\" face=\"Quicksand, sans-serif\"><span style=\"font-size: 14px;\">Chất liệu : Áo chất nỉ chân cua hoặc nỉ bông</span></font></p><p style=\"margin-bottom: 10px; line-height: 21px; max-width: 100%;\"><br></p>',190000.00,1,NULL,'2024-07-22 00:40:55',NULL,1,1,'product/avatar/hoodie-purple.png','hoodie',NULL,NULL,970),(79,'CASIO Z500','CASIO Z500','<p style=\"margin-bottom: 10px; line-height: 21px; max-width: 100%;\"><font color=\"#252a2b\" face=\"Quicksand, sans-serif\"><span style=\"font-size: 14px;\">Độ phân giải: 5.0mp&nbsp;</span></font></p><p style=\"margin-bottom: 10px; line-height: 21px; max-width: 100%;\"><font color=\"#252a2b\" face=\"Quicksand, sans-serif\"><span style=\"font-size: 14px;\">Zoom quang: 3x&nbsp;</span></font></p><p style=\"margin-bottom: 10px; line-height: 21px; max-width: 100%;\"><font color=\"#252a2b\" face=\"Quicksand, sans-serif\"><span style=\"font-size: 14px;\">Ngoại hình: 96% (màn hình có vết đen như hình, không ảnh hưởng chất lượng ảnh chụp ra)&nbsp;</span></font></p><p style=\"margin-bottom: 10px; line-height: 21px; max-width: 100%;\"><font color=\"#252a2b\" face=\"Quicksand, sans-serif\"><span style=\"font-size: 14px;\">Có thể quay video, flash và nhiều chế độ chụp khác.&nbsp;</span></font></p><p style=\"margin-bottom: 10px; line-height: 21px; max-width: 100%;\"><font color=\"#252a2b\" face=\"Quicksand, sans-serif\"><span style=\"font-size: 14px;\">Máy sử dụng tiếng Anh.&nbsp;</span></font></p><p style=\"margin-bottom: 10px; line-height: 21px; max-width: 100%;\"><font color=\"#252a2b\" face=\"Quicksand, sans-serif\"><span style=\"font-size: 14px;\">Máy đi kèm: pin, sạc, thẻ nhớ SD, dây đeo cổ tay.</span></font></p>',490000.00,1,NULL,'2024-07-12 19:38:50',NULL,1,1,'product/avatar/hoodie-kem.png','casio-z500',NULL,NULL,97),(80,'CASIO EX V7','CASIO EX V7','<p style=\"margin-bottom: 10px; line-height: 21px; max-width: 100%;\"><font color=\"#252a2b\" face=\"Quicksand, sans-serif\"><span style=\"font-size: 14px;\">Độ phân giải: 7.2mp</span></font></p><p style=\"margin-bottom: 10px; line-height: 21px; max-width: 100%;\"><font color=\"#252a2b\" face=\"Quicksand, sans-serif\"><span style=\"font-size: 14px;\">Zoom quang: 7x&nbsp;</span></font></p><p style=\"margin-bottom: 10px; line-height: 21px; max-width: 100%;\"><font color=\"#252a2b\" face=\"Quicksand, sans-serif\"><span style=\"font-size: 14px;\">Ngoại hình: 96%&nbsp;</span></font></p><p style=\"margin-bottom: 10px; line-height: 21px; max-width: 100%;\"><font color=\"#252a2b\" face=\"Quicksand, sans-serif\"><span style=\"font-size: 14px;\">Có thể quay video, flash và nhiều chế độ chụp khác.&nbsp;</span></font></p><p style=\"margin-bottom: 10px; line-height: 21px; max-width: 100%;\"><font color=\"#252a2b\" face=\"Quicksand, sans-serif\"><span style=\"font-size: 14px;\">Máy sử dụng tiếng Anh.&nbsp;</span></font></p><p style=\"margin-bottom: 10px; line-height: 21px; max-width: 100%;\"><font color=\"#252a2b\" face=\"Quicksand, sans-serif\"><span style=\"font-size: 14px;\">Máy đi kèm: pin, sạc, thẻ nhớ SD, dây đeo cổ tay.</span></font></p>',590000.00,1,NULL,NULL,NULL,NULL,1,'product/avatar/EX V7 - 590000.jpg','casio-ex-v7',NULL,NULL,2),(81,'NIKON COOLPIX 2100','NIKON COOLPIX 2100','<p style=\"margin-bottom: 10px; line-height: 21px; max-width: 100%;\"><font color=\"#252a2b\" face=\"Quicksand, sans-serif\"><span style=\"font-size: 14px;\">Độ phân giải: 2.0mp&nbsp;</span></font></p><p style=\"margin-bottom: 10px; line-height: 21px; max-width: 100%;\"><font color=\"#252a2b\" face=\"Quicksand, sans-serif\"><span style=\"font-size: 14px;\">Zoom quang: 4x&nbsp;</span></font></p><p style=\"margin-bottom: 10px; line-height: 21px; max-width: 100%;\"><font color=\"#252a2b\" face=\"Quicksand, sans-serif\"><span style=\"font-size: 14px;\">Ngoại hình: 95%&nbsp;</span></font></p><p style=\"margin-bottom: 10px; line-height: 21px; max-width: 100%;\"><font color=\"#252a2b\" face=\"Quicksand, sans-serif\"><span style=\"font-size: 14px;\">Có thể quay video, flash và nhiều chế độ chụp khác.&nbsp;</span></font></p><p style=\"margin-bottom: 10px; line-height: 21px; max-width: 100%;\"><font color=\"#252a2b\" face=\"Quicksand, sans-serif\"><span style=\"font-size: 14px;\">Máy nội địa chỉ có tiếng Nhật.&nbsp;</span></font></p><p style=\"margin-bottom: 10px; line-height: 21px; max-width: 100%;\"><font color=\"#252a2b\" face=\"Quicksand, sans-serif\"><span style=\"font-size: 14px;\">Máy đi kèm: 2pin AA dùng một lần, thẻ nhớ CF, dây đeo cổ tay.</span></font></p>',390000.00,1,NULL,NULL,NULL,NULL,3,'product/avatar/COOLPIX 2100 - 390000.jpg','nikon-coolpix-2100',NULL,NULL,2),(82,'NIKON COOLPIX S620','NIKON COOLPIX S620','<p style=\"margin-bottom: 10px; line-height: 21px; max-width: 100%;\"><font color=\"#252a2b\" face=\"Quicksand, sans-serif\"><span style=\"font-size: 14px;\">Độ phân giải: 12.2mp&nbsp;</span></font></p><p style=\"margin-bottom: 10px; line-height: 21px; max-width: 100%;\"><font color=\"#252a2b\" face=\"Quicksand, sans-serif\"><span style=\"font-size: 14px;\">Zoom quang: 4x</span></font></p><p style=\"margin-bottom: 10px; line-height: 21px; max-width: 100%;\"><font color=\"#252a2b\" face=\"Quicksand, sans-serif\"><span style=\"font-size: 14px;\">Ngoại hình: 95%&nbsp;</span></font></p><p style=\"margin-bottom: 10px; line-height: 21px; max-width: 100%;\"><font color=\"#252a2b\" face=\"Quicksand, sans-serif\"><span style=\"font-size: 14px;\">Có thể quay video, flash và nhiều chế độ chụp khác.&nbsp;</span></font></p><p style=\"margin-bottom: 10px; line-height: 21px; max-width: 100%;\"><font color=\"#252a2b\" face=\"Quicksand, sans-serif\"><span style=\"font-size: 14px;\">Máy sử dụng tiếng Anh.&nbsp;</span></font></p><p style=\"margin-bottom: 10px; line-height: 21px; max-width: 100%;\"><font color=\"#252a2b\" face=\"Quicksand, sans-serif\"><span style=\"font-size: 14px;\">Máy đi kèm: pin, sạc, thẻ nhớ SD, dây đeo cổ tay.</span></font></p>',290000.00,1,NULL,'2024-07-08 23:00:53',NULL,1,3,'product/avatar/hoodie-black.png','nikon-coolpix-s620',NULL,NULL,2),(83,'NIKON COOLPIX S3300','NIKON COOLPIX S3300','<p style=\"margin-bottom: 10px; line-height: 21px; max-width: 100%;\"><font color=\"#252a2b\" face=\"Quicksand, sans-serif\"><span style=\"font-size: 14px;\">Độ phân giải: 16mp&nbsp;</span></font></p><p style=\"margin-bottom: 10px; line-height: 21px; max-width: 100%;\"><font color=\"#252a2b\" face=\"Quicksand, sans-serif\"><span style=\"font-size: 14px;\">Zoom quang: 6x</span></font></p><p style=\"margin-bottom: 10px; line-height: 21px; max-width: 100%;\"><font color=\"#252a2b\" face=\"Quicksand, sans-serif\"><span style=\"font-size: 14px;\">Ngoại hình: 95%&nbsp;</span></font></p><p style=\"margin-bottom: 10px; line-height: 21px; max-width: 100%;\"><font color=\"#252a2b\" face=\"Quicksand, sans-serif\"><span style=\"font-size: 14px;\">Có thể quay video, flash và nhiều chế độ chụp khác.&nbsp;</span></font></p><p style=\"margin-bottom: 10px; line-height: 21px; max-width: 100%;\"><font color=\"#252a2b\" face=\"Quicksand, sans-serif\"><span style=\"font-size: 14px;\">Máy sử dụng tiếng Anh.&nbsp;</span></font></p><p style=\"margin-bottom: 10px; line-height: 21px; max-width: 100%;\"><font color=\"#252a2b\" face=\"Quicksand, sans-serif\"><span style=\"font-size: 14px;\">Máy đi kèm: pin, sạc, thẻ nhớ SD, dây đeo cổ tay.</span></font></p>',390000.00,1,NULL,'2024-07-08 23:01:07',NULL,1,3,'product/avatar/hoodie-white.png','nikon-coolpix-s3300',NULL,NULL,2),(125,'FUJIFILM F30','FUJIFILM F30','<p style=\"margin-bottom: 10px; line-height: 21px; max-width: 100%;\"><font color=\"#252a2b\" face=\"Quicksand, sans-serif\"><span style=\"font-size: 14px;\">Độ phân giải: 6.3mp&nbsp;</span></font></p><p style=\"margin-bottom: 10px; line-height: 21px; max-width: 100%;\"><font color=\"#252a2b\" face=\"Quicksand, sans-serif\"><span style=\"font-size: 14px;\">Zoom quang: 3x</span></font></p><p style=\"margin-bottom: 10px; line-height: 21px; max-width: 100%;\"><font color=\"#252a2b\" face=\"Quicksand, sans-serif\"><span style=\"font-size: 14px;\">Ngoại hình: 95%&nbsp;</span></font></p><p style=\"margin-bottom: 10px; line-height: 21px; max-width: 100%;\"><font color=\"#252a2b\" face=\"Quicksand, sans-serif\"><span style=\"font-size: 14px;\">Có thể quay video, flash và nhiều chế độ chụp khác.&nbsp;</span></font></p><p style=\"margin-bottom: 10px; line-height: 21px; max-width: 100%;\"><font color=\"#252a2b\" face=\"Quicksand, sans-serif\"><span style=\"font-size: 14px;\">Máy sử dụng tiếng Anh.&nbsp;</span></font></p><p style=\"margin-bottom: 10px; line-height: 21px; max-width: 100%;\"><font color=\"#252a2b\" face=\"Quicksand, sans-serif\"><span style=\"font-size: 14px;\">Máy đi kèm: pin, sạc, thẻ nhớ SD, dây đeo cổ tay.</span></font></p><div><br></div>',790000.00,1,NULL,NULL,NULL,NULL,2,'product/avatar/F30.png','fujifilm-f30',NULL,NULL,4),(126,'FUJIFILM FINEPIX Z700EXR','FUJIFILM FINEPIX Z700EXR','<p style=\"margin-bottom: 10px; line-height: 21px; max-width: 100%;\"><font color=\"#252a2b\" face=\"Quicksand, sans-serif\"><span style=\"font-size: 14px;\">Độ phân giải: 12mp&nbsp;</span></font></p><p style=\"margin-bottom: 10px; line-height: 21px; max-width: 100%;\"><font color=\"#252a2b\" face=\"Quicksand, sans-serif\"><span style=\"font-size: 14px;\">Zoom quang: 5x</span></font></p><p style=\"margin-bottom: 10px; line-height: 21px; max-width: 100%;\"><font color=\"#252a2b\" face=\"Quicksand, sans-serif\"><span style=\"font-size: 14px;\">Ngoại hình: 97%&nbsp;</span></font></p><p style=\"margin-bottom: 10px; line-height: 21px; max-width: 100%;\"><font color=\"#252a2b\" face=\"Quicksand, sans-serif\"><span style=\"font-size: 14px;\">Có thể quay video, flash và nhiều chế độ chụp khác.&nbsp;</span></font></p><p style=\"margin-bottom: 10px; line-height: 21px; max-width: 100%;\"><font color=\"#252a2b\" face=\"Quicksand, sans-serif\"><span style=\"font-size: 14px;\">Máy sử dụng tiếng Anh.&nbsp;</span></font></p><p style=\"margin-bottom: 10px; line-height: 21px; max-width: 100%;\"><font color=\"#252a2b\" face=\"Quicksand, sans-serif\"><span style=\"font-size: 14px;\">Máy đi kèm: pin, sạc, thẻ nhớ SD, dây đeo cổ tay.</span></font></p>',690000.00,1,NULL,NULL,NULL,NULL,2,'product/avatar/FINEPIX Z700EXR - 690000.jpg','fujifilm-finepix-z700exr',NULL,NULL,2),(608,'PANASONIC DMC LS1','PANASONIC DMC LS1','<p style=\"margin-bottom: 10px; line-height: 21px; max-width: 100%;\"><font color=\"#252a2b\" face=\"Quicksand, sans-serif\"><span style=\"font-size: 14px;\">Độ phân giải: 4.0mp&nbsp;</span></font></p><p style=\"margin-bottom: 10px; line-height: 21px; max-width: 100%;\"><font color=\"#252a2b\" face=\"Quicksand, sans-serif\"><span style=\"font-size: 14px;\">Zoom quang: 3x&nbsp;</span></font></p><p style=\"margin-bottom: 10px; line-height: 21px; max-width: 100%;\"><font color=\"#252a2b\" face=\"Quicksand, sans-serif\"><span style=\"font-size: 14px;\">Ngoại hình: 95%&nbsp;</span></font></p><p style=\"margin-bottom: 10px; line-height: 21px; max-width: 100%;\"><font color=\"#252a2b\" face=\"Quicksand, sans-serif\"><span style=\"font-size: 14px;\">Có thể quay video, flash và nhiều chế độ chụp khác.&nbsp;</span></font></p><p style=\"margin-bottom: 10px; line-height: 21px; max-width: 100%;\"><font color=\"#252a2b\" face=\"Quicksand, sans-serif\"><span style=\"font-size: 14px;\">Máy sử dụng tiếng Anh.&nbsp;</span></font></p><p style=\"margin-bottom: 10px; line-height: 21px; max-width: 100%;\"><font color=\"#252a2b\" face=\"Quicksand, sans-serif\"><span style=\"font-size: 14px;\">Máy đi kèm: 2pin AA dùng 1 lần, thẻ nhớ SD, dây đeo cổ tay.</span></font></p>',290000.00,0,NULL,NULL,NULL,NULL,4,'product/avatar/DMC LS1.png','panasonic-dmc-ls1',NULL,NULL,4);
/*!40000 ALTER TABLE `tbl_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_products_images`
--

DROP TABLE IF EXISTS `tbl_products_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_products_images` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `path` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `product_id` int NOT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_1tbl_products_Ntbl_products_images_idx` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_products_images`
--

LOCK TABLES `tbl_products_images` WRITE;
/*!40000 ALTER TABLE `tbl_products_images` DISABLE KEYS */;
INSERT INTO `tbl_products_images` VALUES (18,'the.jpg','product/pictures/the.jpg',670,1,NULL,NULL,NULL,NULL,NULL),(58,'EX V7 - 590000.jpg','product/pictures/EX V7 - 590000.jpg',80,1,NULL,NULL,NULL,NULL,NULL),(59,'COOLPIX 2100 - 390000.jpg','product/pictures/COOLPIX 2100 - 390000.jpg',81,1,NULL,NULL,NULL,NULL,NULL),(63,'F30.png','product/pictures/F30.png',125,1,NULL,NULL,NULL,NULL,NULL),(64,'FINEPIX Z700EXR - 690000.jpg','product/pictures/FINEPIX Z700EXR - 690000.jpg',126,1,NULL,NULL,NULL,NULL,NULL),(66,'DMC LS1.png','product/pictures/DMC LS1.png',608,1,NULL,NULL,NULL,NULL,NULL),(73,'hoodie-purple.png','product/pictures/hoodie-purple.png',58,1,NULL,NULL,NULL,NULL,NULL),(74,'hoodie-kem.png','product/pictures/hoodie-kem.png',79,1,NULL,NULL,NULL,NULL,NULL),(75,'hoodie-black.png','product/pictures/hoodie-black.png',82,1,NULL,NULL,NULL,NULL,NULL),(76,'hoodie-white.png','product/pictures/hoodie-white.png',83,1,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `tbl_products_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_roles`
--

DROP TABLE IF EXISTS `tbl_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_roles` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `description` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_roles`
--

LOCK TABLES `tbl_roles` WRITE;
/*!40000 ALTER TABLE `tbl_roles` DISABLE KEYS */;
INSERT INTO `tbl_roles` VALUES (3,'ADMIN',NULL,NULL,NULL,NULL,NULL,'ADMIN'),(4,'GUEST',NULL,NULL,NULL,NULL,NULL,'GUEST');
/*!40000 ALTER TABLE `tbl_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_saleorder`
--

DROP TABLE IF EXISTS `tbl_saleorder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_saleorder` (
  `id` int NOT NULL AUTO_INCREMENT,
  `code` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `user_id` int DEFAULT NULL,
  `customer_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `customer_address` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `customer_phone` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `customer_email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `total` decimal(13,2) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `seo` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `payment_status` int DEFAULT NULL,
  `payment_type` int DEFAULT NULL,
  `reason` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `total_price` decimal(19,2) DEFAULT NULL,
  `fee` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_1tbl_users_Ntbl_saleorder` (`user_id`),
  CONSTRAINT `FKbiu8ui4krw8j3gtn97w3rdq7v` FOREIGN KEY (`user_id`) REFERENCES `tbl_users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_saleorder`
--

LOCK TABLES `tbl_saleorder` WRITE;
/*!40000 ALTER TABLE `tbl_saleorder` DISABLE KEYS */;
INSERT INTO `tbl_saleorder` VALUES (34,'1696322328276',NULL,'Nguyen Minh Triet','Tan Binh - TP Ho Chi Minh','0955663321','minhtriet@gmail.com',3.00,0,'2023-10-03 15:38:48',NULL,NULL,NULL,NULL,2,1,NULL,50000.00,NULL),(35,'1696322381446',NULL,'Minh Triet','Tan Binh - TP Ho Chi Minh','0356213489','minhtriet123@gmail.com',2.00,1,'2023-10-03 15:39:41',NULL,NULL,NULL,NULL,4,1,'hủy',50000.00,30000),(36,'1292720240621',NULL,'Nguyễn Đức Hiếu','Manchester United - UK','0367533486','duchieu130@gmail.com',1.00,1,'2024-06-21 01:00:50',NULL,NULL,NULL,NULL,2,1,NULL,790000.00,30000),(37,'8476520240621',NULL,'Nguyễn Đức ','Manchester United - UK','0367533485','duchieu1370@gmail.com',1.00,1,'2024-06-21 02:12:05',NULL,NULL,NULL,NULL,1,1,NULL,790000.00,30000),(43,'8024620240705',NULL,'Nguyễn Đức Hiếu','Hà Nội','0367533485','duchieu1370@gmail.com',2.00,1,'2024-07-05 20:07:23',NULL,1,NULL,NULL,3,1,NULL,1580000.00,15000),(44,'4805420240705',NULL,'Nguyễn Hiếu','Hà Nội','0367533485','duchieu1370@gmail.com',3.00,1,'2024-07-05 20:47:51',NULL,1,NULL,NULL,1,1,NULL,2370000.00,15000),(45,'5567320240705',NULL,'Phạm Nhi','Mông Cổ','0367533485','duchieu1370@gmail.com',2.00,1,'2024-07-05 20:50:51',NULL,1,NULL,NULL,1,1,NULL,1580000.00,30000),(46,'7320120240705',NULL,'Nguyễn Đức Hiếu','Hà Nội','0367533485','duchieu1370@gmail.com',3.00,1,'2024-07-05 20:54:50',NULL,1,NULL,NULL,1,1,NULL,585000.00,15000),(48,'7989520240708',NULL,'Nguyễn Đức Hiếu','Đông Hà - Quảng Trị','0367533485','duchieu1370@gmail.com',1.00,1,'2024-07-08 23:25:09',NULL,1,NULL,NULL,2,1,NULL,220000.00,30000),(49,'7590820240709',NULL,'Nguyễn Đức Hiếu','Manchester United - UK','0367533485','duchieu1370@gmail.com',3.00,1,'2024-07-09 00:02:07',NULL,1,NULL,NULL,3,1,NULL,600000.00,30000),(50,'7300220240709',NULL,'Nguyễn Đức Hiếu','Manchester United - UK','0367533485','nhenhi672@gmail.com',1.00,1,'2024-07-09 00:31:00',NULL,1,NULL,NULL,1,1,NULL,220000.00,30000),(51,'9119920240709',NULL,'Nguyễn Đức Hiếu','Manchester United - UK','0367533485','nhenhi672@gmail.com',1.00,1,'2024-07-09 00:47:44',NULL,1,NULL,NULL,1,1,NULL,220000.00,30000),(52,'5622720240709',NULL,'Nguyễn Đức Hiếu','Manchester United - UK','0367533485','duchieu1370@gmail.com',2.00,1,'2024-07-09 00:51:13',NULL,1,NULL,NULL,1,1,NULL,410000.00,30000),(53,'7954520240712',NULL,'Nguyễn Đức Hiếu','Minh Hợp - Qùy Hợp','0367533485','duchieu13700@gmail.com',6.00,1,'2024-07-12 19:38:50',NULL,1,NULL,NULL,1,1,NULL,2070000.00,30000),(54,'6221220240721',NULL,'Nguyễn Đức Hiếu','Manchester United - UK','0367533485','duchieu1370@gmail.com',1.00,1,'2024-07-21 23:06:58',NULL,1,NULL,NULL,1,1,NULL,220000.00,30000),(55,'3122220240721',NULL,'Nguyễn Đức Hiếu','Manchester United - UK','0367533485','duchieu1370@gmail.com',1.00,1,'2024-07-21 23:07:27',NULL,1,NULL,NULL,1,1,NULL,220000.00,30000),(56,'2974120240721',NULL,'Nguyễn Đức Hiếu','Manchester United - UK','0367533485','duchieu1370@gmail.com',1.00,1,'2024-07-21 23:12:57',NULL,1,NULL,NULL,1,1,NULL,220000.00,30000),(57,'4073620240721',NULL,'Nguyễn Đức Hiếu','Manchester United - UK','0367533485','duchieu1370@gmail.com',1.00,1,'2024-07-21 23:39:21',NULL,1,NULL,NULL,1,1,NULL,220000.00,30000),(58,'5720220240722',NULL,'Nguyễn Đức Hiếu','Manchester United - UK','0367533485','duchieu1370@gmail.com',1.00,0,'2024-07-22 00:01:04',NULL,1,NULL,NULL,1,1,NULL,220000.00,30000),(59,'9156720240722',NULL,'Nguyễn Đức Hiếu','Manchester United - UK','0367533485','duchieu1370@gmail.com',1.00,1,'2024-07-22 00:02:19',NULL,1,NULL,NULL,1,1,NULL,220000.00,30000),(60,'4044320240722',NULL,'Nguyễn Đức Hiếu','Manchester United - UK','0367533485','duchieu1370@gmail.com',1.00,1,'2024-07-22 00:04:03',NULL,1,NULL,NULL,1,1,NULL,220000.00,30000),(61,'4672520240722',NULL,'Nguyễn Đức Hiếu','Minh Hợp - Qùy Hợp','0367533485','nhenhi672@gmail.com',1.00,1,'2024-07-22 00:36:25',NULL,1,NULL,NULL,1,1,NULL,220000.00,30000),(62,'9270220240722',NULL,'Nguyễn Đức Hiếu','Minh Hợp - Qùy Hợp','0367533485','nhenhi672@gmail.com',1.00,1,'2024-07-22 00:40:55',NULL,1,NULL,NULL,1,1,NULL,220000.00,30000);
/*!40000 ALTER TABLE `tbl_saleorder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_saleorder_products`
--

DROP TABLE IF EXISTS `tbl_saleorder_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_saleorder_products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `saleorder_id` int NOT NULL,
  `product_id` int NOT NULL,
  `quality` int NOT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `total` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKnyfdau9vc46jkiwvrgj1ns85v` (`product_id`),
  KEY `FKnpyir3q973iv4wq49ltw0kcrd` (`saleorder_id`),
  CONSTRAINT `FKnpyir3q973iv4wq49ltw0kcrd` FOREIGN KEY (`saleorder_id`) REFERENCES `tbl_saleorder` (`id`),
  CONSTRAINT `FKnyfdau9vc46jkiwvrgj1ns85v` FOREIGN KEY (`product_id`) REFERENCES `tbl_products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_saleorder_products`
--

LOCK TABLES `tbl_saleorder_products` WRITE;
/*!40000 ALTER TABLE `tbl_saleorder_products` DISABLE KEYS */;
INSERT INTO `tbl_saleorder_products` VALUES (48,34,80,1,1,NULL,NULL,NULL,NULL,NULL),(49,34,79,2,1,NULL,NULL,NULL,NULL,NULL),(50,34,81,1,1,NULL,NULL,NULL,NULL,NULL),(51,35,125,2,1,NULL,NULL,NULL,NULL,NULL),(52,35,608,2,1,NULL,NULL,NULL,NULL,NULL),(53,36,58,1,1,NULL,NULL,NULL,NULL,790000),(54,37,58,1,1,NULL,NULL,NULL,NULL,790000),(55,43,58,2,1,NULL,NULL,NULL,NULL,1580000),(56,44,58,3,1,NULL,NULL,NULL,NULL,2370000),(57,45,58,2,1,NULL,NULL,NULL,NULL,1580000),(58,46,58,3,1,NULL,NULL,NULL,NULL,570000),(60,48,58,1,1,NULL,NULL,NULL,NULL,190000),(61,49,58,3,1,NULL,NULL,NULL,NULL,570000),(62,50,58,1,1,NULL,NULL,NULL,NULL,190000),(63,51,58,1,1,NULL,NULL,NULL,NULL,190000),(64,52,58,2,1,NULL,NULL,NULL,NULL,380000),(65,53,58,3,1,NULL,NULL,NULL,NULL,570000),(66,53,79,3,1,NULL,NULL,NULL,NULL,1470000),(67,54,58,1,1,NULL,NULL,NULL,NULL,190000),(68,55,58,1,1,NULL,NULL,NULL,NULL,190000),(69,56,58,1,1,NULL,NULL,NULL,NULL,190000),(70,57,58,1,1,NULL,NULL,NULL,NULL,190000),(71,58,58,1,1,NULL,NULL,NULL,NULL,190000),(72,59,58,1,1,NULL,NULL,NULL,NULL,190000),(73,60,58,1,1,NULL,NULL,NULL,NULL,190000),(74,61,58,1,1,NULL,NULL,NULL,NULL,190000),(75,62,58,1,1,NULL,NULL,NULL,NULL,190000);
/*!40000 ALTER TABLE `tbl_saleorder_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_subcribe`
--

DROP TABLE IF EXISTS `tbl_subcribe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_subcribe` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=97 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_subcribe`
--

LOCK TABLES `tbl_subcribe` WRITE;
/*!40000 ALTER TABLE `tbl_subcribe` DISABLE KEYS */;
INSERT INTO `tbl_subcribe` VALUES (79,'hihi@gmail.com',1,'2023-03-06 14:43:32',NULL,NULL,NULL),(94,'hai2244@gmail.com',1,'2023-06-09 09:10:24',NULL,NULL,NULL),(95,'trieuanh137@gmail.com',1,'2023-06-19 08:01:26',NULL,NULL,NULL);
/*!40000 ALTER TABLE `tbl_subcribe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_users`
--

DROP TABLE IF EXISTS `tbl_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `email` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `address` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `phone` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username_UNIQUE` (`username`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  UNIQUE KEY `UKj562wwmipqt96rkoqbo0jc34` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_users`
--

LOCK TABLES `tbl_users` WRITE;
/*!40000 ALTER TABLE `tbl_users` DISABLE KEYS */;
INSERT INTO `tbl_users` VALUES (30,'admin',1,'2023-10-30 11:02:42',NULL,NULL,NULL,'$2a$04$DjcHdBp4E6qi/a5h94FbQ.FGYqIUPKp1nDxIw1nBFOCF7dDMp14Nq','admin123@gmail.com','Hà Nội','0123654789'),(31,'user',1,'2023-10-30 11:03:13',NULL,NULL,NULL,'$2a$04$SoUOcXW1nfOAxuyOjL1eC.YHIXcelB8Sp6SbJIQZfepE5PZfS.cXK','user123@gmai.com','Thành phố Hồ Chí Minh','0123556889'),(32,'hieu',1,'2023-11-29 15:00:05',NULL,NULL,NULL,'$2a$04$6278L6du7mYSCrCeeUTOJ.Ke57ZcScwrZ9EHsQM9r2YHz0CoOaWY.','duchieu1370@gmail.com','Số 2, Ngõ 50, Ngách 142/4, Mễ Trì Thượng','0367533485');
/*!40000 ALTER TABLE `tbl_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_users_roles`
--

DROP TABLE IF EXISTS `tbl_users_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_users_roles` (
  `user_id` int NOT NULL,
  `role_id` int NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `fk_1tbl_roles_Ntbl_users_roles_idx` (`role_id`),
  CONSTRAINT `fk_1tbl_roles_Ntbl_users_roles` FOREIGN KEY (`role_id`) REFERENCES `tbl_roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_1tbl_users_Ntbl_users_roles` FOREIGN KEY (`user_id`) REFERENCES `tbl_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_users_roles`
--

LOCK TABLES `tbl_users_roles` WRITE;
/*!40000 ALTER TABLE `tbl_users_roles` DISABLE KEYS */;
INSERT INTO `tbl_users_roles` VALUES (30,3),(31,4),(32,4);
/*!40000 ALTER TABLE `tbl_users_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'webshop'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-07-23 17:15:26
