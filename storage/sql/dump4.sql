
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
DROP TABLE IF EXISTS `languages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `languages` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sort` tinyint unsigned NOT NULL DEFAULT '1',
  `show` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `languages_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `languages` WRITE;
/*!40000 ALTER TABLE `languages` DISABLE KEYS */;
INSERT INTO `languages` VALUES (1,'EN','en',1,0,NULL,NULL),(2,'UA','ua',1,0,'2023-01-16 12:26:27','2023-01-16 12:26:27');
/*!40000 ALTER TABLE `languages` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pages` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta` json DEFAULT NULL,
  `main` json DEFAULT NULL,
  `sort` tinyint unsigned NOT NULL DEFAULT '1',
  `show` tinyint(1) NOT NULL DEFAULT '0',
  `category_id` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pages_slug_unique` (`slug`),
  KEY `pages_category_id_foreign` (`category_id`),
  CONSTRAINT `pages_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `pages` WRITE;
/*!40000 ALTER TABLE `pages` DISABLE KEYS */;
INSERT INTO `pages` VALUES (1,'Index','/','{\"1\": {\"title\": null, \"keywords\": null, \"description\": null}}',NULL,1,1,1,NULL,'2023-01-16 11:56:05'),(2,'Basketball','/basketball','{\"1\": {\"title\": null, \"keywords\": null, \"description\": null}}',NULL,1,1,2,'2023-01-16 11:56:37','2023-01-16 11:57:52'),(3,'Home','/home','{\"1\": {\"title\": null, \"keywords\": null, \"description\": null}, \"2\": {\"title\": null, \"keywords\": null, \"description\": null}}',NULL,1,1,1,'2023-01-16 12:26:51','2023-01-16 12:33:49'),(4,'Test','/test','{\"1\": {\"title\": null, \"keywords\": null, \"description\": null}, \"2\": {\"title\": null, \"keywords\": null, \"description\": null}}',NULL,1,0,1,'2023-01-16 12:54:36','2023-01-16 12:54:47');
/*!40000 ALTER TABLE `pages` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` json DEFAULT NULL,
  `sort` tinyint unsigned NOT NULL DEFAULT '1',
  `show` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `categories_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Page','page','{\"1\": {\"title\": \"Page\"}}',1,1,NULL,'2023-01-16 11:55:30'),(2,'Sport','sport',NULL,1,1,'2023-01-16 11:55:46','2023-01-16 12:26:36');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `menus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menus` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `options` json DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'header',
  `sort` tinyint unsigned NOT NULL DEFAULT '1',
  `show` tinyint(1) NOT NULL DEFAULT '0',
  `menu_id` bigint unsigned DEFAULT NULL,
  `template_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `menus_menu_id_foreign` (`menu_id`),
  KEY `menus_template_id_foreign` (`template_id`),
  CONSTRAINT `menus_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE,
  CONSTRAINT `menus_template_id_foreign` FOREIGN KEY (`template_id`) REFERENCES `templates` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `menus` WRITE;
/*!40000 ALTER TABLE `menus` DISABLE KEYS */;
INSERT INTO `menus` VALUES (1,'11','{\"1\": {\"image\": [], \"input\": \"Gregory\"}}','header',1,1,NULL,2,'2023-01-16 12:07:18','2023-01-16 12:34:21'),(2,'Menu','{\"1\": {\"image\": [], \"input\": \"Gregory\"}}','header',1,1,NULL,2,'2023-01-16 12:08:16','2023-01-16 12:34:20'),(3,'fff','{\"1\": {\"rio\": null, \"resty\": null}, \"2\": {\"rio\": null, \"resty\": null}}','footer',1,1,NULL,6,'2023-01-16 12:43:26','2023-01-16 12:43:51'),(4,'dfgfg','{\"1\": {\"sdggd\": \"fdgfg\", \"sdgsdg\": \"gg\"}, \"2\": {\"sdggd\": null, \"sdgsdg\": null}}','header',1,1,NULL,7,'2023-01-16 12:44:50','2023-01-16 12:45:01');
/*!40000 ALTER TABLE `menus` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `templates` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fields` json DEFAULT NULL,
  `sort` tinyint unsigned NOT NULL DEFAULT '1',
  `show` tinyint(1) NOT NULL DEFAULT '0',
  `template_id` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `templates_slug_unique` (`slug`),
  KEY `templates_template_id_foreign` (`template_id`),
  CONSTRAINT `templates_template_id_foreign` FOREIGN KEY (`template_id`) REFERENCES `templates` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `templates` WRITE;
/*!40000 ALTER TABLE `templates` DISABLE KEYS */;
INSERT INTO `templates` VALUES (1,'Template','template1','page','http://admin-panel/storage/templates/template.jpg','[{\"name\": \"blog\", \"type\": \"input\", \"label\": \"Blog\"}, {\"name\": \"description\", \"type\": \"textarea\", \"label\": \"Description\"}]',1,1,NULL,'2023-01-16 11:53:56','2023-01-16 12:34:36'),(2,'Order','order','menu','http://admin-panel/storage/templates/order.jpg','[{\"name\": \"input\", \"type\": \"input\", \"label\": \"Input\"}, {\"name\": \"image\", \"type\": \"image\", \"label\": \"Image\"}]',1,1,NULL,'2023-01-16 11:55:01','2023-01-16 11:56:54'),(3,'Type','type','page','http://admin-panel/storage/templates/type.jpg','[{\"name\": \"Name\", \"type\": \"input\", \"label\": \"Nomer\"}, {\"name\": \"Textarea\", \"type\": \"textarea\", \"label\": \"Textarea\"}]',1,1,NULL,'2023-01-16 12:30:06','2023-01-16 12:31:45'),(4,NULL,NULL,NULL,NULL,'[{\"name\": \"tatoo\", \"type\": \"image\", \"label\": \"Tatoo\"}, {\"name\": \"york\", \"type\": \"input\", \"label\": \"York\"}]',1,0,3,'2023-01-16 12:30:22','2023-01-16 12:31:34'),(6,'For Menu2','for-menu2','menu','http://admin-panel/storage/templates/for-menu2.jpg','[{\"name\": \"rio\", \"type\": \"input\", \"label\": \"New Rio\"}, {\"name\": \"resty\", \"type\": \"image\", \"label\": \"Resty\"}]',1,1,NULL,'2023-01-16 12:32:02','2023-01-16 12:32:36'),(7,'33','33','menu','http://admin-panel/storage/templates/33.jpg','[{\"name\": \"sdgsdg\", \"type\": \"input\", \"label\": \"dgdg\"}, {\"name\": \"sdggd\", \"type\": \"input\", \"label\": \"sdgdg\"}]',1,1,NULL,'2023-01-16 12:44:26','2023-01-16 12:44:44');
/*!40000 ALTER TABLE `templates` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `blocks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blocks` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `options` json DEFAULT NULL,
  `sort` tinyint unsigned NOT NULL DEFAULT '1',
  `show` tinyint(1) NOT NULL DEFAULT '0',
  `page_id` bigint unsigned DEFAULT NULL,
  `template_id` bigint unsigned NOT NULL,
  `block_id` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `blocks_page_id_foreign` (`page_id`),
  KEY `blocks_template_id_foreign` (`template_id`),
  KEY `blocks_block_id_foreign` (`block_id`),
  CONSTRAINT `blocks_block_id_foreign` FOREIGN KEY (`block_id`) REFERENCES `blocks` (`id`) ON DELETE CASCADE,
  CONSTRAINT `blocks_page_id_foreign` FOREIGN KEY (`page_id`) REFERENCES `pages` (`id`) ON DELETE CASCADE,
  CONSTRAINT `blocks_template_id_foreign` FOREIGN KEY (`template_id`) REFERENCES `templates` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `blocks` WRITE;
/*!40000 ALTER TABLE `blocks` DISABLE KEYS */;
INSERT INTO `blocks` VALUES (1,NULL,'{\"1\": {\"blog\": null, \"description\": null}}',1,0,2,1,NULL,'2023-01-16 11:57:14','2023-01-16 11:57:52'),(3,NULL,'{\"1\": {\"blog\": \"gjfj\", \"description\": \"gjfgj\"}, \"2\": {\"blog\": null, \"description\": null}}',1,0,3,1,NULL,'2023-01-16 12:27:10','2023-01-16 12:33:49'),(4,NULL,'{\"1\": {\"blog\": \"222\", \"description\": \"22\"}, \"2\": {\"blog\": null, \"description\": null}}',0,0,3,1,NULL,'2023-01-16 12:27:51','2023-01-16 12:33:49'),(5,NULL,'{\"1\": {\"Name\": \"cxcb\", \"Textarea\": \"xcbxcb\"}, \"2\": {\"Name\": null, \"Textarea\": null}}',1,0,3,3,NULL,'2023-01-16 12:33:07','2023-01-16 12:33:49'),(6,NULL,'{\"1\": {\"york\": \"xcbcb\", \"tatoo\": \"http://admin-panel/storage/blocks/6/1/tatoo/user-01.jpg\"}, \"2\": {\"york\": null, \"tatoo\": null}}',1,0,NULL,4,5,NULL,'2023-01-16 12:33:49'),(7,NULL,'{\"1\": {\"york\": \"erete\", \"tatoo\": \"http://admin-panel/storage/blocks/7/1/tatoo/post-10.jpg\"}, \"2\": {\"york\": null, \"tatoo\": null}}',1,0,NULL,4,5,NULL,'2023-01-16 12:33:49');
/*!40000 ALTER TABLE `blocks` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

