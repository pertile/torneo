-- --------------------------------------------------------
-- Host:                         localhost
-- Versión del servidor:         5.7.24 - MySQL Community Server (GPL)
-- SO del servidor:              Win64
-- HeidiSQL Versión:             10.2.0.5599
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Volcando estructura para tabla basquet.categories
CREATE TABLE IF NOT EXISTS `categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT '1',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `categories_slug_unique` (`slug`),
  KEY `categories_parent_id_foreign` (`parent_id`),
  CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla basquet.categories: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` (`id`, `parent_id`, `order`, `name`, `slug`, `created_at`, `updated_at`) VALUES
	(1, NULL, 1, 'Maxi 35', 'category-1', '2020-02-25 22:42:22', '2020-02-26 20:13:01'),
	(2, NULL, 2, 'Maxi 42', 'category-2', '2020-02-25 22:42:22', '2020-02-26 20:13:42'),
	(3, NULL, 3, 'Maxi 50', 'maxi-50', '2020-02-26 20:13:34', '2020-02-26 20:13:34');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;

-- Volcando estructura para tabla basquet.data_rows
CREATE TABLE IF NOT EXISTS `data_rows` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `data_type_id` int(10) unsigned NOT NULL,
  `field` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `browse` tinyint(1) NOT NULL DEFAULT '1',
  `read` tinyint(1) NOT NULL DEFAULT '1',
  `edit` tinyint(1) NOT NULL DEFAULT '1',
  `add` tinyint(1) NOT NULL DEFAULT '1',
  `delete` tinyint(1) NOT NULL DEFAULT '1',
  `details` text COLLATE utf8mb4_unicode_ci,
  `order` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `data_rows_data_type_id_foreign` (`data_type_id`),
  CONSTRAINT `data_rows_data_type_id_foreign` FOREIGN KEY (`data_type_id`) REFERENCES `data_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=178 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla basquet.data_rows: ~126 rows (aproximadamente)
/*!40000 ALTER TABLE `data_rows` DISABLE KEYS */;
INSERT INTO `data_rows` (`id`, `data_type_id`, `field`, `type`, `display_name`, `required`, `browse`, `read`, `edit`, `add`, `delete`, `details`, `order`) VALUES
	(1, 1, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
	(2, 1, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
	(3, 1, 'email', 'text', 'Email', 1, 1, 1, 1, 1, 1, NULL, 3),
	(4, 1, 'password', 'password', 'Password', 1, 0, 0, 1, 1, 0, NULL, 4),
	(5, 1, 'remember_token', 'text', 'Remember Token', 0, 0, 0, 0, 0, 0, NULL, 5),
	(6, 1, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, NULL, 6),
	(7, 1, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 7),
	(8, 1, 'avatar', 'image', 'Avatar', 0, 1, 1, 1, 1, 1, NULL, 8),
	(9, 1, 'user_belongsto_role_relationship', 'relationship', 'Role', 0, 1, 1, 1, 1, 0, '{"model":"TCG\\\\Voyager\\\\Models\\\\Role","table":"roles","type":"belongsTo","column":"role_id","key":"id","label":"display_name","pivot_table":"roles","pivot":0}', 10),
	(10, 1, 'user_belongstomany_role_relationship', 'relationship', 'Roles', 0, 1, 1, 1, 1, 0, '{"model":"TCG\\\\Voyager\\\\Models\\\\Role","table":"roles","type":"belongsToMany","column":"id","key":"id","label":"display_name","pivot_table":"user_roles","pivot":"1","taggable":"0"}', 11),
	(11, 1, 'settings', 'hidden', 'Settings', 0, 0, 0, 0, 0, 0, NULL, 12),
	(12, 2, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
	(13, 2, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
	(14, 2, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 3),
	(15, 2, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 4),
	(16, 3, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, '{}', 1),
	(17, 3, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, '{}', 2),
	(18, 3, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, '{}', 3),
	(19, 3, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 4),
	(20, 3, 'display_name', 'text', 'Display Name', 1, 1, 1, 1, 1, 1, '{}', 5),
	(21, 1, 'role_id', 'text', 'Role', 1, 1, 1, 1, 1, 1, NULL, 9),
	(22, 4, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
	(23, 4, 'parent_id', 'select_dropdown', 'Parent', 0, 0, 1, 1, 1, 1, '{"default":"","null":"","options":{"":"-- None --"},"relationship":{"key":"id","label":"name"}}', 2),
	(24, 4, 'order', 'text', 'Order', 1, 1, 1, 1, 1, 1, '{"default":1}', 3),
	(25, 4, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 4),
	(26, 4, 'slug', 'text', 'Slug', 1, 1, 1, 1, 1, 1, '{"slugify":{"origin":"name"}}', 5),
	(27, 4, 'created_at', 'timestamp', 'Created At', 0, 0, 1, 0, 0, 0, NULL, 6),
	(28, 4, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 7),
	(29, 5, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
	(30, 5, 'author_id', 'text', 'Author', 1, 0, 1, 1, 0, 1, NULL, 2),
	(31, 5, 'category_id', 'text', 'Category', 1, 0, 1, 1, 1, 0, NULL, 3),
	(32, 5, 'title', 'text', 'Title', 1, 1, 1, 1, 1, 1, NULL, 4),
	(33, 5, 'excerpt', 'text_area', 'Excerpt', 1, 0, 1, 1, 1, 1, NULL, 5),
	(34, 5, 'body', 'rich_text_box', 'Body', 1, 0, 1, 1, 1, 1, NULL, 6),
	(35, 5, 'image', 'image', 'Post Image', 0, 1, 1, 1, 1, 1, '{"resize":{"width":"1000","height":"null"},"quality":"70%","upsize":true,"thumbnails":[{"name":"medium","scale":"50%"},{"name":"small","scale":"25%"},{"name":"cropped","crop":{"width":"300","height":"250"}}]}', 7),
	(36, 5, 'slug', 'text', 'Slug', 1, 0, 1, 1, 1, 1, '{"slugify":{"origin":"title","forceUpdate":true},"validation":{"rule":"unique:posts,slug"}}', 8),
	(37, 5, 'meta_description', 'text_area', 'Meta Description', 1, 0, 1, 1, 1, 1, NULL, 9),
	(38, 5, 'meta_keywords', 'text_area', 'Meta Keywords', 1, 0, 1, 1, 1, 1, NULL, 10),
	(39, 5, 'status', 'select_dropdown', 'Status', 1, 1, 1, 1, 1, 1, '{"default":"DRAFT","options":{"PUBLISHED":"published","DRAFT":"draft","PENDING":"pending"}}', 11),
	(40, 5, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, NULL, 12),
	(41, 5, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 13),
	(42, 5, 'seo_title', 'text', 'SEO Title', 0, 1, 1, 1, 1, 1, NULL, 14),
	(43, 5, 'featured', 'checkbox', 'Featured', 1, 1, 1, 1, 1, 1, NULL, 15),
	(44, 6, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
	(45, 6, 'author_id', 'text', 'Author', 1, 0, 0, 0, 0, 0, NULL, 2),
	(46, 6, 'title', 'text', 'Title', 1, 1, 1, 1, 1, 1, NULL, 3),
	(47, 6, 'excerpt', 'text_area', 'Excerpt', 1, 0, 1, 1, 1, 1, NULL, 4),
	(48, 6, 'body', 'rich_text_box', 'Body', 1, 0, 1, 1, 1, 1, NULL, 5),
	(49, 6, 'slug', 'text', 'Slug', 1, 0, 1, 1, 1, 1, '{"slugify":{"origin":"title"},"validation":{"rule":"unique:pages,slug"}}', 6),
	(50, 6, 'meta_description', 'text', 'Meta Description', 1, 0, 1, 1, 1, 1, NULL, 7),
	(51, 6, 'meta_keywords', 'text', 'Meta Keywords', 1, 0, 1, 1, 1, 1, NULL, 8),
	(52, 6, 'status', 'select_dropdown', 'Status', 1, 1, 1, 1, 1, 1, '{"default":"INACTIVE","options":{"INACTIVE":"INACTIVE","ACTIVE":"ACTIVE"}}', 9),
	(53, 6, 'created_at', 'timestamp', 'Created At', 1, 1, 1, 0, 0, 0, NULL, 10),
	(54, 6, 'updated_at', 'timestamp', 'Updated At', 1, 0, 0, 0, 0, 0, NULL, 11),
	(55, 6, 'image', 'image', 'Page Image', 0, 1, 1, 1, 1, 1, NULL, 12),
	(76, 12, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
	(77, 12, 'name', 'text', 'Nombre', 1, 1, 1, 1, 1, 1, '{}', 2),
	(78, 12, 'shield', 'image', 'Escudo', 0, 1, 1, 1, 1, 1, '{}', 3),
	(79, 12, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 4),
	(80, 12, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 5),
	(81, 12, 'deleted_at', 'timestamp', 'Deleted At', 0, 1, 1, 1, 1, 1, '{}', 6),
	(82, 13, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
	(83, 13, 'nombre', 'text', 'Nombre', 1, 1, 1, 1, 1, 1, '{}', 2),
	(84, 13, 'apellido', 'text', 'Apellido', 1, 1, 1, 1, 1, 1, '{}', 3),
	(85, 13, 'DNI', 'text', 'DNI', 1, 1, 1, 1, 1, 1, '{}', 4),
	(86, 13, 'mail', 'text', 'Mail', 0, 1, 1, 1, 1, 1, '{}', 6),
	(87, 13, 'photo', 'image', 'Photo', 0, 1, 1, 1, 1, 1, '{}', 7),
	(88, 13, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 8),
	(89, 13, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 9),
	(90, 13, 'deleted_at', 'timestamp', 'Deleted At', 0, 1, 1, 1, 1, 1, '{}', 10),
	(107, 16, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
	(108, 16, 'person_id', 'text', 'Person Id', 0, 1, 1, 1, 1, 1, '{}', 2),
	(109, 16, 'squad_id', 'text', 'Squad Id', 0, 1, 1, 1, 1, 1, '{}', 3),
	(110, 16, 'squad_member_hasmany_person_relationship', 'relationship', 'people', 0, 1, 1, 1, 1, 1, '{"model":"App\\\\Person","table":"people","type":"belongsTo","column":"person_id","key":"id","label":"full_name","pivot_table":"people","pivot":"0","taggable":"0"}', 4),
	(111, 16, 'squad_member_belongsto_squad_relationship', 'relationship', 'squads', 0, 1, 1, 1, 1, 1, '{"model":"App\\\\Squad","table":"squads","type":"belongsTo","column":"squad_id","key":"id","label":"name","pivot_table":"categories","pivot":"0","taggable":"0"}', 5),
	(112, 17, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
	(113, 17, 'team_id', 'text', 'Team Id', 0, 1, 1, 1, 1, 1, '{}', 2),
	(114, 17, 'tournament_id', 'text', 'Tournament Id', 0, 1, 1, 1, 1, 1, '{}', 3),
	(115, 17, 'name', 'text', 'Name', 0, 1, 1, 1, 1, 1, '{}', 4),
	(116, 17, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 5),
	(117, 17, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 6),
	(118, 17, 'deleted_at', 'timestamp', 'Deleted At', 0, 1, 1, 1, 1, 1, '{}', 7),
	(119, 17, 'squad_belongsto_tournament_relationship', 'relationship', 'tournaments', 0, 1, 1, 1, 1, 1, '{"model":"App\\\\Tournament","table":"tournaments","type":"belongsTo","column":"tournament_id","key":"id","label":"name","pivot_table":"categories","pivot":"0","taggable":"0"}', 8),
	(120, 17, 'squad_belongsto_team_relationship', 'relationship', 'teams', 0, 1, 1, 1, 1, 1, '{"model":"App\\\\Team","table":"teams","type":"belongsTo","column":"team_id","key":"id","label":"name","pivot_table":"categories","pivot":"0","taggable":null}', 9),
	(121, 16, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 4),
	(122, 16, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 5),
	(123, 13, 'born_date', 'date', 'Born Date', 0, 1, 1, 1, 1, 1, '{}', 5),
	(124, 19, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
	(125, 19, 'tournament_id', 'text', 'Tournament Id', 1, 1, 1, 1, 1, 1, '{}', 2),
	(126, 19, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, '{}', 3),
	(127, 19, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 4),
	(128, 19, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 5),
	(129, 19, 'deleted_at', 'timestamp', 'Deleted At', 0, 1, 1, 1, 1, 1, '{}', 6),
	(130, 19, 'instance_belongsto_tournament_relationship', 'relationship', 'tournaments', 0, 1, 1, 1, 1, 1, '{"model":"App\\\\Tournament","table":"tournaments","type":"belongsTo","column":"tournament_id","key":"id","label":"name","pivot_table":"categories","pivot":"0","taggable":null}', 7),
	(146, 21, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
	(147, 21, 'home', 'text', 'Home', 1, 1, 1, 1, 1, 1, '{}', 2),
	(148, 21, 'away', 'text', 'Away', 1, 1, 1, 1, 1, 1, '{}', 3),
	(149, 21, 'home_score', 'text', 'Home Score', 0, 1, 1, 1, 1, 1, '{}', 4),
	(150, 21, 'away_score', 'text', 'Away Score', 0, 1, 1, 1, 1, 1, '{}', 5),
	(151, 21, 'home_points', 'text', 'Home Points', 0, 1, 1, 1, 1, 1, '{}', 6),
	(152, 21, 'away_points', 'text', 'Away Points', 0, 1, 1, 1, 1, 1, '{}', 7),
	(153, 21, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 8),
	(154, 21, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 9),
	(155, 21, 'deleted_at', 'timestamp', 'Deleted At', 0, 1, 1, 1, 1, 1, '{}', 10),
	(156, 21, 'date', 'date', 'Date', 0, 1, 1, 1, 1, 1, '{}', 11),
	(157, 21, 'instance_id', 'text', 'Instance Id', 0, 1, 1, 1, 1, 1, '{}', 12),
	(158, 21, 'match_belongsto_instance_relationship', 'relationship', 'instances', 0, 1, 1, 1, 1, 1, '{"model":"App\\\\Instance","table":"instances","type":"belongsTo","column":"instance_id","key":"id","label":"name","pivot_table":"categories","pivot":"0","taggable":"0"}', 13),
	(159, 21, 'match_belongsto_squad_relationship', 'relationship', 'home', 0, 1, 1, 1, 1, 1, '{"model":"App\\\\Squad","table":"squads","type":"belongsTo","column":"home","key":"id","label":"name","pivot_table":"categories","pivot":"0","taggable":"0"}', 14),
	(160, 21, 'match_belongsto_squad_relationship_1', 'relationship', 'away', 0, 1, 1, 1, 1, 1, '{"model":"App\\\\Squad","table":"squads","type":"belongsTo","column":"away","key":"id","label":"name","pivot_table":"categories","pivot":"0","taggable":"0"}', 15),
	(161, 22, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
	(162, 22, 'name', 'text', 'Name', 0, 1, 1, 1, 1, 1, '{}', 2),
	(163, 22, 'category_id', 'text', 'Category Id', 0, 0, 0, 0, 0, 0, '{}', 3),
	(164, 22, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 5),
	(165, 22, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 6),
	(166, 22, 'deleted_at', 'timestamp', 'Deleted At', 0, 1, 1, 1, 1, 1, '{}', 7),
	(167, 22, 'valid', 'checkbox', 'Valid', 0, 1, 1, 1, 1, 1, '{}', 4),
	(168, 22, 'tournament_belongsto_category_relationship', 'relationship', 'categories', 0, 1, 1, 1, 1, 1, '{"model":"App\\\\Category","table":"categories","type":"belongsTo","column":"id","key":"id","label":"name","pivot_table":"categories","pivot":"0","taggable":"0"}', 8),
	(169, 23, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
	(170, 23, 'instance_id', 'text', 'Instance Id', 1, 1, 1, 1, 1, 1, '{}', 2),
	(171, 23, 'team_id', 'text', 'Team Id', 1, 1, 1, 1, 1, 1, '{}', 3),
	(172, 23, 'date', 'text', 'Date', 1, 1, 1, 1, 1, 1, '{}', 4),
	(173, 23, 'points', 'text', 'Points', 1, 1, 1, 1, 1, 1, '{}', 5),
	(174, 23, 'note', 'text', 'Note', 0, 1, 1, 1, 1, 1, '{}', 6),
	(175, 23, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 7),
	(176, 23, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 8),
	(177, 23, 'deleted_at', 'timestamp', 'Deleted At', 0, 1, 1, 1, 1, 1, '{}', 9);
/*!40000 ALTER TABLE `data_rows` ENABLE KEYS */;

-- Volcando estructura para tabla basquet.data_types
CREATE TABLE IF NOT EXISTS `data_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_singular` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_plural` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `policy_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `controller` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `generate_permissions` tinyint(1) NOT NULL DEFAULT '0',
  `server_side` tinyint(4) NOT NULL DEFAULT '0',
  `details` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `data_types_name_unique` (`name`),
  UNIQUE KEY `data_types_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla basquet.data_types: ~16 rows (aproximadamente)
/*!40000 ALTER TABLE `data_types` DISABLE KEYS */;
INSERT INTO `data_types` (`id`, `name`, `slug`, `display_name_singular`, `display_name_plural`, `icon`, `model_name`, `policy_name`, `controller`, `description`, `generate_permissions`, `server_side`, `details`, `created_at`, `updated_at`) VALUES
	(1, 'users', 'users', 'User', 'Users', 'voyager-person', 'TCG\\Voyager\\Models\\User', 'TCG\\Voyager\\Policies\\UserPolicy', '', '', 1, 0, NULL, '2020-02-25 22:42:21', '2020-02-25 22:42:21'),
	(2, 'menus', 'menus', 'Menu', 'Menus', 'voyager-list', 'TCG\\Voyager\\Models\\Menu', NULL, '', '', 1, 0, NULL, '2020-02-25 22:42:21', '2020-02-25 22:42:21'),
	(3, 'roles', 'roles', 'Role', 'Roles', 'voyager-lock', 'TCG\\Voyager\\Models\\Role', NULL, 'TCG\\Voyager\\Http\\Controllers\\VoyagerRoleController', NULL, 1, 0, '{"order_column":null,"order_display_column":null,"order_direction":"desc","default_search_key":null,"scope":null}', '2020-02-25 22:42:21', '2020-04-10 16:04:39'),
	(4, 'categories', 'categories', 'Category', 'Categories', 'voyager-categories', 'TCG\\Voyager\\Models\\Category', NULL, '', '', 1, 0, NULL, '2020-02-25 22:42:22', '2020-02-25 22:42:22'),
	(5, 'posts', 'posts', 'Post', 'Posts', 'voyager-news', 'TCG\\Voyager\\Models\\Post', 'TCG\\Voyager\\Policies\\PostPolicy', '', '', 1, 0, NULL, '2020-02-25 22:42:22', '2020-02-25 22:42:22'),
	(6, 'pages', 'pages', 'Page', 'Pages', 'voyager-file-text', 'TCG\\Voyager\\Models\\Page', NULL, '', '', 1, 0, NULL, '2020-02-25 22:42:22', '2020-02-25 22:42:22'),
	(7, 'person', 'persona', 'Persona', 'Personas', 'voyager-person', 'App\\Person', NULL, NULL, NULL, 1, 0, '{"order_column":null,"order_display_column":"apellido","order_direction":"asc","default_search_key":null}', '2020-02-26 18:57:36', '2020-02-26 18:57:36'),
	(12, 'teams', 'teams', 'Equipo', 'Equipos', NULL, 'App\\Team', NULL, NULL, NULL, 1, 0, '{"order_column":null,"order_display_column":"name","order_direction":"asc","default_search_key":null,"scope":null}', '2020-02-26 19:34:49', '2020-02-26 19:37:15'),
	(13, 'people', 'people', 'Person', 'People', NULL, 'App\\Person', NULL, NULL, NULL, 1, 0, '{"order_column":null,"order_display_column":null,"order_direction":"asc","default_search_key":null,"scope":null}', '2020-02-26 20:07:42', '2020-03-04 00:10:42'),
	(16, 'squad_members', 'squad-members', 'Squad Member', 'Squad Members', NULL, 'App\\SquadMember', NULL, NULL, NULL, 1, 0, '{"order_column":null,"order_display_column":null,"order_direction":"asc","default_search_key":null,"scope":null}', '2020-02-28 17:24:46', '2020-03-04 00:07:34'),
	(17, 'squads', 'squads', 'Squad', 'Squads', NULL, 'App\\Squad', NULL, NULL, NULL, 1, 0, '{"order_column":null,"order_display_column":null,"order_direction":"asc","default_search_key":null,"scope":null}', '2020-03-02 19:59:50', '2020-03-04 00:00:02'),
	(18, 'instance', 'instance', 'Instance', 'Instances', NULL, 'App\\Instance', NULL, NULL, NULL, 1, 0, '{"order_column":null,"order_display_column":null,"order_direction":"asc","default_search_key":null}', '2020-03-05 17:21:58', '2020-03-05 17:21:58'),
	(19, 'instances', 'instances', 'Instance', 'Instances', NULL, 'App\\Instance', NULL, NULL, NULL, 1, 0, '{"order_column":null,"order_display_column":null,"order_direction":"asc","default_search_key":null}', '2020-03-05 17:24:49', '2020-03-05 17:24:49'),
	(21, 'matches', 'matches', 'Match', 'Matches', NULL, 'App\\Match', NULL, NULL, NULL, 1, 0, '{"order_column":null,"order_display_column":null,"order_direction":"asc","default_search_key":null,"scope":null}', '2020-03-05 18:15:56', '2020-03-05 18:33:44'),
	(22, 'tournaments', 'tournaments', 'Tournament', 'Tournaments', NULL, 'App\\Tournament', NULL, NULL, NULL, 1, 0, '{"order_column":null,"order_display_column":null,"order_direction":"asc","default_search_key":null,"scope":null}', '2020-03-27 13:39:21', '2020-03-27 13:41:39'),
	(23, 'incidents', 'incidents', 'Incident', 'Incidents', NULL, 'App\\Incident', NULL, NULL, NULL, 1, 0, '{"order_column":null,"order_display_column":null,"order_direction":"asc","default_search_key":null}', '2020-04-10 15:18:33', '2020-04-10 15:18:33');
/*!40000 ALTER TABLE `data_types` ENABLE KEYS */;

-- Volcando estructura para tabla basquet.failed_jobs
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla basquet.failed_jobs: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;

-- Volcando estructura para tabla basquet.incidents
CREATE TABLE IF NOT EXISTS `incidents` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `instance_id` int(10) unsigned NOT NULL,
  `team_id` int(10) unsigned NOT NULL,
  `date` date NOT NULL,
  `points` int(11) NOT NULL,
  `note` tinytext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK1_instance` (`instance_id`),
  KEY `FK2_team` (`team_id`),
  CONSTRAINT `FK1_instance` FOREIGN KEY (`instance_id`) REFERENCES `instances` (`id`),
  CONSTRAINT `FK2_team` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla basquet.incidents: ~22 rows (aproximadamente)
/*!40000 ALTER TABLE `incidents` DISABLE KEYS */;
INSERT INTO `incidents` (`id`, `instance_id`, `team_id`, `date`, `points`, `note`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, 1, 12, '2020-03-23', -1, 'Mala inclusión de jugador', NULL, '2020-03-25 01:11:15', NULL),
	(2, 1, 11, '2020-05-23', 2, 'hghgfhf', NULL, '2020-03-25 00:36:19', NULL),
	(3, 1, 8, '2020-03-18', -1, 'vcxvzcvs', '2020-03-26 22:58:24', '2020-03-30 18:29:09', '2020-03-30 18:29:09'),
	(4, 1, 10, '2020-03-24', 0, 'gfgd', '2020-03-26 23:12:36', '2020-03-27 12:34:25', '2020-03-27 12:34:25'),
	(5, 1, 12, '2020-03-24', -1, 'que te re-contra', '2020-03-26 23:15:35', '2020-03-30 18:29:06', '2020-03-30 18:29:06'),
	(6, 1, 12, '2020-03-17', 9, 'dfdf', '2020-03-26 23:17:03', '2020-03-27 12:34:05', '2020-03-27 12:34:05'),
	(7, 1, 10, '2020-03-26', -1, 'fddsfds', '2020-03-26 23:19:02', '2020-03-27 12:32:02', '2020-03-27 12:32:02'),
	(8, 3, 3, '2018-03-15', -1, 'Mala inclusión de un jugador', '2020-03-27 21:27:38', '2020-03-27 21:27:38', NULL),
	(9, 3, 4, '2020-03-18', 1, 'por capos', '2020-03-30 14:16:20', '2020-03-30 14:16:20', NULL),
	(10, 3, 8, '2020-03-24', -2, 'fajan mucho', '2020-03-30 14:19:00', '2020-03-30 14:20:39', '2020-03-30 14:20:39'),
	(11, 3, 8, '2020-03-09', 4, 'fdsfds', '2020-03-30 14:22:06', '2020-03-30 14:22:06', NULL),
	(12, 3, 11, '2020-03-31', -3, 'csdcds', '2020-03-30 14:22:55', '2020-03-30 18:29:12', '2020-03-30 18:29:12'),
	(13, 3, 7, '2020-03-31', -1, 'papapapapa', '2020-03-30 14:24:03', '2020-03-30 18:38:26', '2020-03-30 18:38:26'),
	(14, 3, 9, '2020-03-23', -5, 'fesf adsfvadf a', '2020-03-30 14:36:16', '2020-03-30 18:29:14', '2020-03-30 18:29:14'),
	(15, 3, 7, '2020-03-16', -1, 'prueba', '2020-03-30 18:29:38', '2020-03-30 18:29:38', NULL),
	(16, 3, 8, '2020-03-15', -2, 'prueba choronga', '2020-03-30 18:38:06', '2020-03-30 18:38:27', '2020-03-30 18:38:27'),
	(17, 3, 9, '2020-03-17', -2, 'czxcxzcxa', '2020-03-30 18:39:14', '2020-03-30 18:40:25', '2020-03-30 18:40:25'),
	(18, 3, 12, '2020-03-26', -3, 'vcxz zxvz', '2020-03-30 18:40:47', '2020-03-30 18:44:02', '2020-03-30 18:44:02'),
	(19, 3, 7, '2020-03-24', -1, 'cdf sda f', '2020-03-30 18:44:19', '2020-03-30 18:45:39', '2020-03-30 18:45:39'),
	(20, 3, 9, '2020-03-22', 1, 'cdzc zs', '2020-03-30 18:45:11', '2020-03-30 18:45:37', '2020-03-30 18:45:37'),
	(21, 3, 4, '2020-03-31', -1, 'sacc s<c asc sa', '2020-03-30 18:45:55', '2020-03-30 18:45:55', NULL),
	(22, 3, 9, '2020-03-26', -1, 'vcxzv zxvczx vczx', '2020-03-30 18:56:40', '2020-03-30 18:56:40', NULL);
/*!40000 ALTER TABLE `incidents` ENABLE KEYS */;

-- Volcando estructura para tabla basquet.instances
CREATE TABLE IF NOT EXISTS `instances` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tournament_id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `one_absent` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '20-0',
  `two_absents` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '0-0',
  `won` tinyint(4) DEFAULT '2',
  `draw` tinyint(4) DEFAULT '0',
  `lost` tinyint(4) DEFAULT '1',
  `absent` tinyint(4) DEFAULT '0',
  `draw_possible` tinyint(4) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla basquet.instances: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `instances` DISABLE KEYS */;
INSERT INTO `instances` (`id`, `tournament_id`, `name`, `one_absent`, `two_absents`, `won`, `draw`, `lost`, `absent`, `draw_possible`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, 1, 'Fase de grupos', '20-0', '0', 2, 0, 1, 0, 0, '2020-03-05 17:26:04', '2020-03-05 17:26:04', NULL),
	(2, 2, 'Primera ronda', '20-0', '0-0', 2, 0, 1, 0, 0, '2020-04-25 17:46:40', NULL, NULL),
	(3, 3, 'Primera fase', '20-0', '0-0', 2, 0, 1, 0, 0, '2020-03-27 13:27:14', '2020-03-27 13:27:14', NULL);
/*!40000 ALTER TABLE `instances` ENABLE KEYS */;

-- Volcando estructura para tabla basquet.matches
CREATE TABLE IF NOT EXISTS `matches` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `instance_id` int(11) DEFAULT NULL,
  `home` int(11) NOT NULL,
  `away` int(11) NOT NULL,
  `home_score` int(11) DEFAULT NULL,
  `away_score` int(11) DEFAULT NULL,
  `home_points` int(11) DEFAULT NULL,
  `away_points` int(11) DEFAULT NULL,
  `home_played` tinyint(4) DEFAULT NULL,
  `away_played` tinyint(4) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `note` tinytext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=160 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla basquet.matches: ~146 rows (aproximadamente)
/*!40000 ALTER TABLE `matches` DISABLE KEYS */;
INSERT INTO `matches` (`id`, `instance_id`, `home`, `away`, `home_score`, `away_score`, `home_points`, `away_points`, `home_played`, `away_played`, `date`, `note`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, 1, 4, 3, 99, 61, 2, 1, 1, 1, '2020-03-11', 'ggggggg', '2020-03-05 18:30:00', '2020-03-22 01:44:36', NULL),
	(14, 1, 3, 4, 77, 99, 1, 2, 1, 1, '2020-03-17', 'a ver si anda el puto', '2020-03-18 20:05:13', '2020-04-11 22:40:52', NULL),
	(15, 1, 3, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-03-18 20:05:13', '2020-03-18 20:05:13', NULL),
	(16, 1, 3, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-03-18 20:05:13', '2020-03-18 20:05:13', NULL),
	(17, 1, 3, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-03-18 20:05:13', '2020-03-18 20:05:13', NULL),
	(18, 1, 3, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-03-18 20:05:13', '2020-03-18 20:05:13', NULL),
	(19, 1, 3, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-03-18 20:05:13', '2020-03-18 20:05:13', NULL),
	(20, 1, 3, 10, 74, 55, 2, 1, 1, 1, '2018-07-03', NULL, '2020-03-18 20:05:13', '2020-03-27 20:46:18', NULL),
	(21, 1, 3, 11, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-03-18 20:05:13', '2020-03-18 20:05:13', NULL),
	(22, 1, 3, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-03-18 20:05:13', '2020-03-18 20:05:13', NULL),
	(24, 1, 4, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-03-18 20:05:13', '2020-03-18 20:05:13', NULL),
	(25, 1, 4, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-03-18 20:05:13', '2020-03-18 20:05:13', NULL),
	(26, 1, 4, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-03-18 20:05:13', '2020-03-18 20:05:13', NULL),
	(27, 1, 4, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-03-18 20:05:13', '2020-03-18 20:05:13', NULL),
	(28, 1, 4, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-03-18 20:05:13', '2020-03-18 20:05:13', NULL),
	(29, 1, 4, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-03-18 20:05:13', '2020-03-18 20:05:13', NULL),
	(30, 1, 4, 11, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-03-18 20:05:13', '2020-03-18 20:05:13', NULL),
	(31, 1, 4, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-03-18 20:05:13', '2020-03-18 20:05:13', NULL),
	(32, 1, 5, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-03-18 20:05:13', '2020-03-18 20:05:13', NULL),
	(33, 1, 5, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-03-18 20:05:13', '2020-03-18 20:05:13', NULL),
	(34, 1, 5, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-03-18 20:05:13', '2020-03-18 20:05:13', NULL),
	(35, 1, 5, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-03-18 20:05:13', '2020-03-18 20:05:13', NULL),
	(36, 1, 5, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-03-18 20:05:13', '2020-03-18 20:05:13', NULL),
	(37, 1, 5, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-03-18 20:05:13', '2020-03-18 20:05:13', NULL),
	(38, 1, 5, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-03-18 20:05:13', '2020-03-18 20:05:13', NULL),
	(39, 1, 5, 11, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-03-18 20:05:13', '2020-03-18 20:05:13', NULL),
	(40, 1, 5, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-03-18 20:05:13', '2020-03-18 20:05:13', NULL),
	(41, 1, 6, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-03-18 20:05:13', '2020-03-18 20:05:13', NULL),
	(42, 1, 6, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-03-18 20:05:13', '2020-03-18 20:05:13', NULL),
	(43, 1, 6, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-03-18 20:05:13', '2020-03-18 20:05:13', NULL),
	(44, 1, 6, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-03-18 20:05:13', '2020-03-18 20:05:13', NULL),
	(45, 1, 6, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-03-18 20:05:13', '2020-03-18 20:05:13', NULL),
	(46, 1, 6, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-03-18 20:05:13', '2020-03-18 20:05:13', NULL),
	(47, 1, 6, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-03-18 20:05:13', '2020-03-18 20:05:13', NULL),
	(48, 1, 6, 11, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-03-18 20:05:13', '2020-03-18 20:05:13', NULL),
	(49, 1, 6, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-03-18 20:05:13', '2020-03-18 20:05:13', NULL),
	(50, 1, 7, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-03-18 20:05:13', '2020-03-18 20:05:13', NULL),
	(51, 1, 7, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-03-18 20:05:13', '2020-03-18 20:05:13', NULL),
	(52, 1, 7, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-03-18 20:05:13', '2020-03-18 20:05:13', NULL),
	(53, 1, 7, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-03-18 20:05:13', '2020-03-18 20:05:13', NULL),
	(54, 1, 7, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-03-18 20:05:13', '2020-03-18 20:05:13', NULL),
	(55, 1, 7, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-03-18 20:05:13', '2020-03-18 20:05:13', NULL),
	(56, 1, 7, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-03-18 20:05:13', '2020-03-18 20:05:13', NULL),
	(57, 1, 7, 11, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-03-18 20:05:13', '2020-03-18 20:05:13', NULL),
	(58, 1, 7, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-03-18 20:05:13', '2020-03-18 20:05:13', NULL),
	(59, 1, 8, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-03-18 20:05:13', '2020-03-18 20:05:13', NULL),
	(60, 1, 8, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-03-18 20:05:13', '2020-03-18 20:05:13', NULL),
	(61, 1, 8, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-03-18 20:05:13', '2020-03-18 20:05:13', NULL),
	(62, 1, 8, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-03-18 20:05:13', '2020-03-18 20:05:13', NULL),
	(63, 1, 8, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-03-18 20:05:13', '2020-03-18 20:05:13', NULL),
	(64, 1, 8, 9, 74, 80, 1, 2, 1, 1, '2018-10-03', NULL, '2020-03-18 20:05:13', '2020-03-27 20:50:11', NULL),
	(65, 1, 8, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-03-18 20:05:13', '2020-03-18 20:05:13', NULL),
	(66, 1, 8, 11, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-03-18 20:05:13', '2020-03-18 20:05:13', NULL),
	(67, 1, 8, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-03-18 20:05:13', '2020-03-18 20:05:13', NULL),
	(68, 1, 9, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-03-18 20:05:13', '2020-03-18 20:05:13', NULL),
	(69, 1, 9, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-03-18 20:05:13', '2020-03-18 20:05:13', NULL),
	(70, 1, 9, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-03-18 20:05:13', '2020-03-18 20:05:13', NULL),
	(71, 1, 9, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-03-18 20:05:13', '2020-03-18 20:05:13', NULL),
	(72, 1, 9, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-03-18 20:05:13', '2020-03-18 20:05:13', NULL),
	(73, 1, 9, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-03-18 20:05:13', '2020-03-18 20:05:13', NULL),
	(74, 1, 9, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-03-18 20:05:13', '2020-03-18 20:05:13', NULL),
	(75, 1, 9, 11, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-03-18 20:05:13', '2020-03-18 20:05:13', NULL),
	(76, 1, 9, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-03-18 20:05:13', '2020-03-18 20:05:13', NULL),
	(77, 1, 10, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-03-18 20:05:13', '2020-03-18 20:05:13', NULL),
	(78, 1, 10, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-03-18 20:05:13', '2020-03-18 20:05:13', NULL),
	(79, 1, 10, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-03-18 20:05:13', '2020-03-18 20:05:13', NULL),
	(80, 1, 10, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-03-18 20:05:13', '2020-03-18 20:05:13', NULL),
	(81, 1, 10, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-03-18 20:05:13', '2020-03-18 20:05:13', NULL),
	(82, 1, 10, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-03-18 20:05:13', '2020-03-18 20:05:13', NULL),
	(83, 1, 10, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-03-18 20:05:13', '2020-03-18 20:05:13', NULL),
	(84, 1, 10, 11, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-03-18 20:05:13', '2020-03-18 20:05:13', NULL),
	(85, 1, 10, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-03-18 20:05:13', '2020-03-18 20:05:13', NULL),
	(86, 1, 11, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-03-18 20:05:13', '2020-03-18 20:05:13', NULL),
	(87, 1, 11, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-03-18 20:05:13', '2020-03-18 20:05:13', NULL),
	(88, 1, 11, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-03-18 20:05:13', '2020-03-18 20:05:13', NULL),
	(89, 1, 11, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-03-18 20:05:13', '2020-03-18 20:05:13', NULL),
	(90, 1, 11, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-03-18 20:05:13', '2020-03-18 20:05:13', NULL),
	(91, 1, 11, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-03-18 20:05:13', '2020-03-18 20:05:13', NULL),
	(92, 1, 11, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-03-18 20:05:13', '2020-03-18 20:05:13', NULL),
	(93, 1, 11, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-03-18 20:05:13', '2020-03-18 20:05:13', NULL),
	(94, 1, 11, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-03-18 20:05:13', '2020-03-18 20:05:13', NULL),
	(95, 1, 12, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-03-18 20:05:13', '2020-03-18 20:05:13', NULL),
	(96, 1, 12, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-03-18 20:05:13', '2020-03-18 20:05:13', NULL),
	(97, 1, 12, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-03-18 20:05:13', '2020-03-18 20:05:13', NULL),
	(98, 1, 12, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-03-18 20:05:13', '2020-03-18 20:05:13', NULL),
	(99, 1, 12, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-03-18 20:05:13', '2020-03-18 20:05:13', NULL),
	(100, 1, 12, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-03-18 20:05:13', '2020-03-18 20:05:13', NULL),
	(101, 1, 12, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-03-18 20:05:13', '2020-03-18 20:05:13', NULL),
	(102, 1, 12, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-03-18 20:05:13', '2020-03-18 20:05:13', NULL),
	(103, 1, 12, 11, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-03-18 20:05:13', '2020-03-18 20:05:13', NULL),
	(104, 3, 3, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-03-27 13:36:20', '2020-03-27 13:36:20', NULL),
	(105, 3, 3, 7, 75, 43, 2, 1, 1, 1, '2018-03-15', NULL, '2020-03-27 13:36:20', '2020-03-27 21:21:55', NULL),
	(106, 3, 3, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-03-27 13:36:20', '2020-03-27 13:36:20', NULL),
	(107, 3, 3, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-03-27 13:36:20', '2020-03-27 13:36:20', NULL),
	(108, 3, 3, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-03-27 13:36:20', '2020-03-27 13:36:20', NULL),
	(109, 3, 3, 11, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-03-27 13:36:20', '2020-03-27 13:36:20', NULL),
	(110, 3, 3, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-03-27 13:36:20', '2020-03-27 13:36:20', NULL),
	(111, 3, 4, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-03-27 13:36:20', '2020-03-27 13:36:20', NULL),
	(112, 3, 4, 7, 58, 57, 2, 1, 1, 1, '2018-06-03', NULL, '2020-03-27 13:36:20', '2020-03-27 20:40:00', NULL),
	(113, 3, 4, 8, 78, 52, 2, 1, 1, 1, '2018-02-27', NULL, '2020-03-27 13:36:20', '2020-03-27 20:20:51', NULL),
	(114, 3, 4, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-03-27 13:36:20', '2020-03-27 13:36:20', NULL),
	(115, 3, 4, 10, 84, 60, 2, 1, 1, 1, '2018-03-12', NULL, '2020-03-27 13:36:20', '2020-03-27 21:23:52', NULL),
	(116, 3, 4, 11, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-03-27 13:36:20', '2020-03-27 13:36:20', NULL),
	(117, 3, 4, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-03-27 13:36:20', '2020-03-27 13:36:20', NULL),
	(118, 3, 7, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-03-27 13:36:20', '2020-03-27 13:36:20', NULL),
	(119, 3, 7, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-03-27 13:36:20', '2020-03-27 13:36:20', NULL),
	(120, 3, 7, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-03-27 13:36:20', '2020-03-27 13:36:20', NULL),
	(121, 3, 7, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-03-27 13:36:20', '2020-03-27 13:36:20', NULL),
	(122, 3, 7, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-03-27 13:36:20', '2020-03-27 13:36:20', NULL),
	(123, 3, 7, 11, 75, 57, 2, 1, 1, 1, '2018-03-03', NULL, '2020-03-27 13:36:20', '2020-03-30 14:06:34', NULL),
	(124, 3, 7, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-03-27 13:36:20', '2020-03-27 13:36:20', NULL),
	(125, 3, 8, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-03-27 13:36:20', '2020-03-27 13:36:20', NULL),
	(126, 3, 8, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-03-27 13:36:20', '2020-03-27 13:36:20', NULL),
	(127, 3, 8, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-03-27 13:36:20', '2020-03-27 13:36:20', NULL),
	(128, 3, 8, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-03-27 13:36:20', '2020-03-27 13:36:20', NULL),
	(129, 3, 8, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-03-27 13:36:20', '2020-03-27 13:36:20', NULL),
	(130, 3, 8, 11, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-03-27 13:36:20', '2020-03-27 13:36:20', NULL),
	(131, 3, 8, 12, 72, 47, 2, 1, 1, 1, '2018-03-16', NULL, '2020-03-27 13:36:20', '2020-03-27 21:23:03', NULL),
	(132, 3, 9, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-03-27 13:36:20', '2020-03-27 13:36:20', NULL),
	(133, 3, 9, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-03-27 13:36:20', '2020-03-27 13:36:20', NULL),
	(134, 3, 9, 7, 74, 60, 2, 1, 1, 1, '2018-02-24', NULL, '2020-03-27 13:36:20', '2020-03-27 20:17:02', NULL),
	(135, 3, 9, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-03-27 13:36:20', '2020-03-27 13:36:20', NULL),
	(136, 3, 9, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-03-27 13:36:20', '2020-03-27 13:36:20', NULL),
	(137, 3, 9, 11, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-03-27 13:36:20', '2020-03-27 13:36:20', NULL),
	(138, 3, 9, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-03-27 13:36:20', '2020-03-27 13:36:20', NULL),
	(139, 3, 10, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-03-27 13:36:20', '2020-03-27 13:36:20', NULL),
	(140, 3, 10, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-03-27 13:36:20', '2020-03-27 13:36:20', NULL),
	(141, 3, 10, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-03-27 13:36:20', '2020-03-27 13:36:20', NULL),
	(142, 3, 10, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-03-27 13:36:20', '2020-03-27 13:36:20', NULL),
	(143, 3, 10, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-03-27 13:36:20', '2020-03-27 13:36:20', NULL),
	(144, 3, 10, 11, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-03-27 13:36:20', '2020-03-27 13:36:20', NULL),
	(145, 3, 10, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-03-27 13:36:20', '2020-03-27 13:36:20', NULL),
	(146, 3, 11, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-03-27 13:36:20', '2020-03-27 13:36:20', NULL),
	(147, 3, 11, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-03-27 13:36:20', '2020-03-27 13:36:20', NULL),
	(148, 3, 11, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-03-27 13:36:20', '2020-03-27 13:36:20', NULL),
	(149, 3, 11, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-03-27 13:36:20', '2020-03-27 13:36:20', NULL),
	(150, 3, 11, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-03-27 13:36:20', '2020-03-27 13:36:20', NULL),
	(151, 3, 11, 10, 68, 61, 2, 1, 1, 1, '2018-02-20', NULL, '2020-03-27 13:36:20', '2020-03-27 20:03:43', NULL),
	(152, 3, 11, 12, 70, 49, 2, 1, 1, 1, '2018-06-03', NULL, '2020-03-27 13:36:20', '2020-03-30 14:08:03', NULL),
	(153, 3, 12, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-03-27 13:36:20', '2020-03-27 13:36:20', NULL),
	(154, 3, 12, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-03-27 13:36:20', '2020-03-27 13:36:20', NULL),
	(155, 3, 12, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-03-27 13:36:20', '2020-03-27 13:36:20', NULL),
	(156, 3, 12, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-03-27 13:36:20', '2020-03-27 13:36:20', NULL),
	(157, 3, 12, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-03-27 13:36:20', '2020-03-27 13:36:20', NULL),
	(158, 3, 12, 10, 17, 95, 1, 2, 1, 1, '2019-03-03', NULL, '2020-03-27 13:36:20', '2020-03-27 20:23:02', NULL),
	(159, 3, 12, 11, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-03-27 13:36:20', '2020-03-27 13:36:20', NULL);
/*!40000 ALTER TABLE `matches` ENABLE KEYS */;

-- Volcando estructura para tabla basquet.menus
CREATE TABLE IF NOT EXISTS `menus` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `menus_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla basquet.menus: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `menus` DISABLE KEYS */;
INSERT INTO `menus` (`id`, `name`, `created_at`, `updated_at`) VALUES
	(1, 'admin', '2020-02-25 22:42:21', '2020-02-25 22:42:21'),
	(2, 'main', '2020-02-25 23:47:40', '2020-02-25 23:47:40');
/*!40000 ALTER TABLE `menus` ENABLE KEYS */;

-- Volcando estructura para tabla basquet.menu_items
CREATE TABLE IF NOT EXISTS `menu_items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `menu_id` int(10) unsigned DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `target` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '_self',
  `icon_class` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `order` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `route` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parameters` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `menu_items_menu_id_foreign` (`menu_id`),
  CONSTRAINT `menu_items_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla basquet.menu_items: ~25 rows (aproximadamente)
/*!40000 ALTER TABLE `menu_items` DISABLE KEYS */;
INSERT INTO `menu_items` (`id`, `menu_id`, `title`, `url`, `target`, `icon_class`, `color`, `parent_id`, `order`, `created_at`, `updated_at`, `route`, `parameters`) VALUES
	(1, 1, 'Dashboard', '', '_self', 'voyager-boat', NULL, NULL, 1, '2020-02-25 22:42:21', '2020-02-25 22:42:21', 'voyager.dashboard', NULL),
	(2, 1, 'Media', '', '_self', 'voyager-images', NULL, NULL, 4, '2020-02-25 22:42:21', '2020-02-28 20:27:35', 'voyager.media.index', NULL),
	(3, 1, 'Users', '', '_self', 'voyager-person', NULL, NULL, 3, '2020-02-25 22:42:21', '2020-02-25 22:42:21', 'voyager.users.index', NULL),
	(4, 1, 'Roles', '', '_self', 'voyager-lock', NULL, NULL, 2, '2020-02-25 22:42:21', '2020-02-25 22:42:21', 'voyager.roles.index', NULL),
	(5, 1, 'Tools', '', '_self', 'voyager-tools', NULL, NULL, 8, '2020-02-25 22:42:21', '2020-02-28 20:27:35', NULL, NULL),
	(6, 1, 'Menu Builder', '', '_self', 'voyager-list', NULL, 5, 1, '2020-02-25 22:42:21', '2020-02-28 20:27:35', 'voyager.menus.index', NULL),
	(7, 1, 'Database', '', '_self', 'voyager-data', NULL, 5, 2, '2020-02-25 22:42:21', '2020-02-28 20:27:35', 'voyager.database.index', NULL),
	(8, 1, 'Compass', '', '_self', 'voyager-compass', NULL, 5, 3, '2020-02-25 22:42:21', '2020-02-28 20:27:35', 'voyager.compass.index', NULL),
	(9, 1, 'BREAD', '', '_self', 'voyager-bread', NULL, 5, 4, '2020-02-25 22:42:21', '2020-02-28 20:27:35', 'voyager.bread.index', NULL),
	(10, 1, 'Settings', '', '_self', 'voyager-settings', NULL, NULL, 9, '2020-02-25 22:42:21', '2020-02-28 20:27:35', 'voyager.settings.index', NULL),
	(11, 1, 'Categories', '', '_self', 'voyager-categories', NULL, NULL, 7, '2020-02-25 22:42:22', '2020-02-28 20:27:35', 'voyager.categories.index', NULL),
	(12, 1, 'Posts', '', '_self', 'voyager-news', NULL, NULL, 5, '2020-02-25 22:42:22', '2020-02-28 20:27:35', 'voyager.posts.index', NULL),
	(13, 1, 'Pages', '', '_self', 'voyager-file-text', NULL, NULL, 6, '2020-02-25 22:42:22', '2020-02-28 20:27:35', 'voyager.pages.index', NULL),
	(14, 1, 'Hooks', '', '_self', 'voyager-hook', NULL, 5, 5, '2020-02-25 22:42:22', '2020-02-28 20:27:35', 'voyager.hooks', NULL),
	(20, 1, 'Equipos', '', '_self', NULL, '#000000', NULL, 10, '2020-02-26 19:34:49', '2020-02-28 20:27:38', 'voyager.teams.index', 'null'),
	(21, 1, 'People', '', '_self', NULL, NULL, NULL, 11, '2020-02-26 20:07:42', '2020-02-28 20:27:38', 'voyager.people.index', NULL),
	(24, 1, 'Squad Members', '', '_self', NULL, NULL, NULL, 14, '2020-02-28 17:24:46', '2020-02-28 20:27:38', 'voyager.squad-members.index', NULL),
	(26, 2, 'Equipo', '', '_self', NULL, '#000000', 25, 1, '2020-02-28 20:29:13', '2020-02-28 20:29:19', 'voyager.teams.index', NULL),
	(27, 2, 'Torneos', '', '_self', NULL, '#000000', NULL, 15, '2020-02-28 20:29:36', '2020-02-28 20:29:36', 'voyager.tournaents.index', NULL),
	(28, 1, 'Gravy', '/vendor/voyager/gravy', '_self', NULL, '#000000', NULL, 16, '2020-03-02 16:43:55', '2020-03-02 16:43:55', NULL, ''),
	(29, 1, 'Squads', '', '_self', NULL, NULL, NULL, 17, '2020-03-02 19:59:50', '2020-03-02 19:59:50', 'voyager.squads.index', NULL),
	(31, 1, 'Instances', '', '_self', NULL, NULL, NULL, 19, '2020-03-05 17:24:49', '2020-03-05 17:24:49', 'voyager.instances.index', NULL),
	(33, 1, 'Matches', '', '_self', NULL, NULL, NULL, 20, '2020-03-05 18:15:56', '2020-03-05 18:15:56', 'voyager.matches.index', NULL),
	(34, 1, 'Tournaments', '', '_self', NULL, NULL, NULL, 21, '2020-03-27 13:39:21', '2020-03-27 13:39:21', 'voyager.tournaments.index', NULL),
	(35, 1, 'Incidents', '', '_self', NULL, NULL, NULL, 22, '2020-04-10 15:18:33', '2020-04-10 15:18:33', 'voyager.incidents.index', NULL);
/*!40000 ALTER TABLE `menu_items` ENABLE KEYS */;

-- Volcando estructura para tabla basquet.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla basquet.migrations: ~31 rows (aproximadamente)
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(1, '2014_10_12_000000_create_users_table', 1),
	(2, '2014_10_12_100000_create_password_resets_table', 1),
	(3, '2016_01_01_000000_add_voyager_user_fields', 1),
	(4, '2016_01_01_000000_create_data_types_table', 1),
	(5, '2016_05_19_173453_create_menu_table', 1),
	(6, '2016_10_21_190000_create_roles_table', 1),
	(7, '2016_10_21_190000_create_settings_table', 1),
	(8, '2016_11_30_135954_create_permission_table', 1),
	(9, '2016_11_30_141208_create_permission_role_table', 1),
	(10, '2016_12_26_201236_data_types__add__server_side', 1),
	(11, '2017_01_13_000000_add_route_to_menu_items_table', 1),
	(12, '2017_01_14_005015_create_translations_table', 1),
	(13, '2017_01_15_000000_make_table_name_nullable_in_permissions_table', 1),
	(14, '2017_03_06_000000_add_controller_to_data_types_table', 1),
	(15, '2017_04_21_000000_add_order_to_data_rows_table', 1),
	(16, '2017_07_05_210000_add_policyname_to_data_types_table', 1),
	(17, '2017_08_05_000000_add_group_to_settings_table', 1),
	(18, '2017_11_26_013050_add_user_role_relationship', 1),
	(19, '2017_11_26_015000_create_user_roles_table', 1),
	(20, '2018_03_11_000000_add_user_settings', 1),
	(21, '2018_03_14_000000_add_details_to_data_types_table', 1),
	(22, '2018_03_16_000000_make_settings_value_nullable', 1),
	(23, '2019_08_19_000000_create_failed_jobs_table', 1),
	(24, '2016_01_01_000000_create_pages_table', 2),
	(25, '2016_01_01_000000_create_posts_table', 2),
	(26, '2016_02_15_204651_create_categories_table', 2),
	(27, '2017_04_11_000000_alter_post_nullable_fields_table', 2),
	(28, '2020_03_17_200247_tournament', 3),
	(29, '2020_03_23_230126_create_incidents_table', 4),
	(30, '2018_08_08_100000_create_telescope_entries_table', 5),
	(31, '2019_12_14_000001_create_personal_access_tokens_table', 6);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;

-- Volcando estructura para tabla basquet.pages
CREATE TABLE IF NOT EXISTS `pages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `author_id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `excerpt` text COLLATE utf8mb4_unicode_ci,
  `body` text COLLATE utf8mb4_unicode_ci,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` text COLLATE utf8mb4_unicode_ci,
  `meta_keywords` text COLLATE utf8mb4_unicode_ci,
  `status` enum('ACTIVE','INACTIVE') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'INACTIVE',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pages_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla basquet.pages: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `pages` DISABLE KEYS */;
INSERT INTO `pages` (`id`, `author_id`, `title`, `excerpt`, `body`, `image`, `slug`, `meta_description`, `meta_keywords`, `status`, `created_at`, `updated_at`) VALUES
	(1, 0, 'Hello World', 'Hang the jib grog grog blossom grapple dance the hempen jig gangway pressgang bilge rat to go on account lugger. Nelsons folly gabion line draught scallywag fire ship gaff fluke fathom case shot. Sea Legs bilge rat sloop matey gabion long clothes run a shot across the bow Gold Road cog league.', '<p>Hello World. Scallywag grog swab Cat o\'nine tails scuttle rigging hardtack cable nipper Yellow Jack. Handsomely spirits knave lad killick landlubber or just lubber deadlights chantey pinnace crack Jennys tea cup. Provost long clothes black spot Yellow Jack bilged on her anchor league lateen sail case shot lee tackle.</p>\n<p>Ballast spirits fluke topmast me quarterdeck schooner landlubber or just lubber gabion belaying pin. Pinnace stern galleon starboard warp carouser to go on account dance the hempen jig jolly boat measured fer yer chains. Man-of-war fire in the hole nipperkin handsomely doubloon barkadeer Brethren of the Coast gibbet driver squiffy.</p>', 'pages/page1.jpg', 'hello-world', 'Yar Meta Description', 'Keyword1, Keyword2', 'ACTIVE', '2020-02-25 22:42:22', '2020-02-25 22:42:22');
/*!40000 ALTER TABLE `pages` ENABLE KEYS */;

-- Volcando estructura para tabla basquet.password_resets
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla basquet.password_resets: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
INSERT INTO `password_resets` (`email`, `token`, `created_at`) VALUES
	('admin@admin.com', '$2y$10$3qnMLRoNcC.jd.o.T7GyXOBCD8a7ua/nci/3jqif68hvLMLFfjQg.', '2020-04-03 19:59:17'),
	('admin@admin.com', '$2y$10$V7vfhNa8rn9RVuLja90KEOA9vFwi3euKuGrggJrCq6/XNz4nuvBle', '2020-04-03 19:59:17');
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;

-- Volcando estructura para tabla basquet.people
CREATE TABLE IF NOT EXISTS `people` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `apellido` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `DNI` int(11) NOT NULL,
  `mail` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `born_date` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla basquet.people: ~24 rows (aproximadamente)
/*!40000 ALTER TABLE `people` DISABLE KEYS */;
INSERT INTO `people` (`id`, `nombre`, `apellido`, `DNI`, `mail`, `photo`, `created_at`, `updated_at`, `deleted_at`, `born_date`) VALUES
	(1, 'Leopoldo Federico', 'Pértile', 28661625, 'leopoldofederico@gmail.com', NULL, '2020-02-26 20:08:00', '2020-03-04 00:12:33', NULL, '1981-07-01'),
	(3, 'Raúl Oscar', 'Guerrero', 30356426, NULL, NULL, '2020-03-04 00:08:00', '2020-03-04 00:12:12', NULL, '1983-06-05'),
	(4, 'Fernando Manuel', 'Franco', 30399967, NULL, NULL, '2020-03-04 00:09:00', '2020-03-04 00:11:43', NULL, '1983-07-20'),
	(5, 'Juan Manuel', 'Rath', 22713941, NULL, NULL, '2020-03-04 00:18:30', '2020-03-04 00:18:30', NULL, '1972-04-28'),
	(6, 'Miguel Ángel', 'Nicoloff', 28316409, NULL, NULL, '2020-03-04 00:19:15', '2020-03-04 00:19:15', NULL, '1980-09-29'),
	(7, 'Sergio Ariel', 'Espíndola', 28388198, NULL, NULL, '2020-03-04 00:20:01', '2020-03-04 00:20:01', NULL, '1980-08-11'),
	(8, 'Fabián', 'Béker', 22933592, NULL, NULL, '2020-03-04 00:20:47', '2020-03-04 00:20:47', NULL, '1972-01-26'),
	(9, 'Del Campo', 'Ariel Agustín', 30626603, NULL, NULL, '2020-03-04 00:21:38', '2020-03-04 00:21:38', NULL, '1984-02-24'),
	(10, 'Gabriel Edgardo', 'Baneki', 24046300, NULL, NULL, '2020-03-04 00:22:40', '2020-03-04 00:22:40', NULL, '1972-09-23'),
	(11, 'Roberto Antonio', 'Falcón', 22687131, NULL, NULL, '2020-03-04 00:23:43', '2020-03-04 00:23:43', NULL, '1972-03-28'),
	(12, 'Ariel Edgardo', 'Arévalo', 27214605, NULL, NULL, '2020-03-04 00:24:45', '2020-03-04 00:24:45', NULL, '1979-02-20'),
	(13, 'Diego César', 'Mattana', 22912002, NULL, NULL, '2020-03-04 00:25:43', '2020-03-04 00:25:43', NULL, '1972-05-14'),
	(14, 'Santiago Manuel', 'Acuña', 23987543, NULL, NULL, '2020-03-04 00:26:26', '2020-03-04 00:26:26', NULL, '1974-11-27'),
	(15, 'Germán Gabriel', 'Gómez', 29983996, NULL, NULL, '2020-03-04 00:26:59', '2020-03-04 00:26:59', NULL, '1983-07-23'),
	(16, 'Ariel Alejandro', 'Riquelme', 26623875, NULL, NULL, '2020-03-04 00:27:32', '2020-03-04 00:27:32', NULL, '1978-08-13'),
	(17, 'Walter Sebastián', 'Cisnero', 29092826, NULL, NULL, '2020-03-04 00:28:00', '2020-03-04 00:28:31', NULL, '1982-03-04'),
	(18, 'Horacio Alejandro', 'Nelson', 24082005, NULL, NULL, '2020-03-04 00:29:05', '2020-03-04 00:29:05', NULL, '1974-08-24'),
	(19, 'Darío', 'Vega', 27155154, NULL, NULL, '2020-03-04 12:37:49', '2020-03-04 12:37:49', NULL, '1979-03-29'),
	(20, 'Edgardo', 'Gutiérrez', 24631357, NULL, NULL, '2020-03-04 12:38:46', '2020-03-04 12:38:46', NULL, '1975-06-07'),
	(21, 'Jorge', 'Romero', 25518346, NULL, NULL, '2020-03-04 12:40:27', '2020-03-04 12:40:27', NULL, '1975-06-07'),
	(22, 'Manuel', 'Masso', 30789825, NULL, NULL, '2020-03-04 12:41:09', '2020-03-04 12:41:09', NULL, '1984-03-23'),
	(23, 'Marcos', 'Fernández', 25534643, NULL, NULL, '2020-03-04 12:44:22', '2020-03-04 12:44:22', NULL, '1977-03-18'),
	(24, 'Hugo', 'Gauna', 30051019, NULL, NULL, '2020-03-04 12:45:12', '2020-03-04 12:45:12', NULL, '1983-04-26'),
	(25, 'Luis', 'Escalante', 24095195, NULL, NULL, '2020-03-04 12:47:20', '2020-03-04 12:47:20', NULL, '1975-06-05');
/*!40000 ALTER TABLE `people` ENABLE KEYS */;

-- Volcando estructura para tabla basquet.permissions
CREATE TABLE IF NOT EXISTS `permissions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `table_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `permissions_key_index` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=127 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla basquet.permissions: ~91 rows (aproximadamente)
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
INSERT INTO `permissions` (`id`, `key`, `table_name`, `created_at`, `updated_at`) VALUES
	(1, 'browse_admin', NULL, '2020-02-25 22:42:21', '2020-02-25 22:42:21'),
	(2, 'browse_bread', NULL, '2020-02-25 22:42:21', '2020-02-25 22:42:21'),
	(3, 'browse_database', NULL, '2020-02-25 22:42:21', '2020-02-25 22:42:21'),
	(4, 'browse_media', NULL, '2020-02-25 22:42:21', '2020-02-25 22:42:21'),
	(5, 'browse_compass', NULL, '2020-02-25 22:42:21', '2020-02-25 22:42:21'),
	(6, 'browse_menus', 'menus', '2020-02-25 22:42:21', '2020-02-25 22:42:21'),
	(7, 'read_menus', 'menus', '2020-02-25 22:42:21', '2020-02-25 22:42:21'),
	(8, 'edit_menus', 'menus', '2020-02-25 22:42:21', '2020-02-25 22:42:21'),
	(9, 'add_menus', 'menus', '2020-02-25 22:42:21', '2020-02-25 22:42:21'),
	(10, 'delete_menus', 'menus', '2020-02-25 22:42:21', '2020-02-25 22:42:21'),
	(11, 'browse_roles', 'roles', '2020-02-25 22:42:21', '2020-02-25 22:42:21'),
	(12, 'read_roles', 'roles', '2020-02-25 22:42:21', '2020-02-25 22:42:21'),
	(13, 'edit_roles', 'roles', '2020-02-25 22:42:21', '2020-02-25 22:42:21'),
	(14, 'add_roles', 'roles', '2020-02-25 22:42:21', '2020-02-25 22:42:21'),
	(15, 'delete_roles', 'roles', '2020-02-25 22:42:21', '2020-02-25 22:42:21'),
	(16, 'browse_users', 'users', '2020-02-25 22:42:21', '2020-02-25 22:42:21'),
	(17, 'read_users', 'users', '2020-02-25 22:42:21', '2020-02-25 22:42:21'),
	(18, 'edit_users', 'users', '2020-02-25 22:42:21', '2020-02-25 22:42:21'),
	(19, 'add_users', 'users', '2020-02-25 22:42:21', '2020-02-25 22:42:21'),
	(20, 'delete_users', 'users', '2020-02-25 22:42:21', '2020-02-25 22:42:21'),
	(21, 'browse_settings', 'settings', '2020-02-25 22:42:21', '2020-02-25 22:42:21'),
	(22, 'read_settings', 'settings', '2020-02-25 22:42:21', '2020-02-25 22:42:21'),
	(23, 'edit_settings', 'settings', '2020-02-25 22:42:21', '2020-02-25 22:42:21'),
	(24, 'add_settings', 'settings', '2020-02-25 22:42:21', '2020-02-25 22:42:21'),
	(25, 'delete_settings', 'settings', '2020-02-25 22:42:21', '2020-02-25 22:42:21'),
	(26, 'browse_categories', 'categories', '2020-02-25 22:42:22', '2020-02-25 22:42:22'),
	(27, 'read_categories', 'categories', '2020-02-25 22:42:22', '2020-02-25 22:42:22'),
	(28, 'edit_categories', 'categories', '2020-02-25 22:42:22', '2020-02-25 22:42:22'),
	(29, 'add_categories', 'categories', '2020-02-25 22:42:22', '2020-02-25 22:42:22'),
	(30, 'delete_categories', 'categories', '2020-02-25 22:42:22', '2020-02-25 22:42:22'),
	(31, 'browse_posts', 'posts', '2020-02-25 22:42:22', '2020-02-25 22:42:22'),
	(32, 'read_posts', 'posts', '2020-02-25 22:42:22', '2020-02-25 22:42:22'),
	(33, 'edit_posts', 'posts', '2020-02-25 22:42:22', '2020-02-25 22:42:22'),
	(34, 'add_posts', 'posts', '2020-02-25 22:42:22', '2020-02-25 22:42:22'),
	(35, 'delete_posts', 'posts', '2020-02-25 22:42:22', '2020-02-25 22:42:22'),
	(36, 'browse_pages', 'pages', '2020-02-25 22:42:22', '2020-02-25 22:42:22'),
	(37, 'read_pages', 'pages', '2020-02-25 22:42:22', '2020-02-25 22:42:22'),
	(38, 'edit_pages', 'pages', '2020-02-25 22:42:22', '2020-02-25 22:42:22'),
	(39, 'add_pages', 'pages', '2020-02-25 22:42:22', '2020-02-25 22:42:22'),
	(40, 'delete_pages', 'pages', '2020-02-25 22:42:22', '2020-02-25 22:42:22'),
	(41, 'browse_hooks', NULL, '2020-02-25 22:42:22', '2020-02-25 22:42:22'),
	(42, 'browse_person', 'person', '2020-02-26 18:57:36', '2020-02-26 18:57:36'),
	(43, 'read_person', 'person', '2020-02-26 18:57:36', '2020-02-26 18:57:36'),
	(44, 'edit_person', 'person', '2020-02-26 18:57:36', '2020-02-26 18:57:36'),
	(45, 'add_person', 'person', '2020-02-26 18:57:36', '2020-02-26 18:57:36'),
	(46, 'delete_person', 'person', '2020-02-26 18:57:36', '2020-02-26 18:57:36'),
	(67, 'browse_teams', 'teams', '2020-02-26 19:34:49', '2020-02-26 19:34:49'),
	(68, 'read_teams', 'teams', '2020-02-26 19:34:49', '2020-02-26 19:34:49'),
	(69, 'edit_teams', 'teams', '2020-02-26 19:34:49', '2020-02-26 19:34:49'),
	(70, 'add_teams', 'teams', '2020-02-26 19:34:49', '2020-02-26 19:34:49'),
	(71, 'delete_teams', 'teams', '2020-02-26 19:34:49', '2020-02-26 19:34:49'),
	(72, 'browse_people', 'people', '2020-02-26 20:07:42', '2020-02-26 20:07:42'),
	(73, 'read_people', 'people', '2020-02-26 20:07:42', '2020-02-26 20:07:42'),
	(74, 'edit_people', 'people', '2020-02-26 20:07:42', '2020-02-26 20:07:42'),
	(75, 'add_people', 'people', '2020-02-26 20:07:42', '2020-02-26 20:07:42'),
	(76, 'delete_people', 'people', '2020-02-26 20:07:42', '2020-02-26 20:07:42'),
	(87, 'browse_squad_members', 'squad_members', '2020-02-28 17:24:46', '2020-02-28 17:24:46'),
	(88, 'read_squad_members', 'squad_members', '2020-02-28 17:24:46', '2020-02-28 17:24:46'),
	(89, 'edit_squad_members', 'squad_members', '2020-02-28 17:24:46', '2020-02-28 17:24:46'),
	(90, 'add_squad_members', 'squad_members', '2020-02-28 17:24:46', '2020-02-28 17:24:46'),
	(91, 'delete_squad_members', 'squad_members', '2020-02-28 17:24:46', '2020-02-28 17:24:46'),
	(92, 'browse_squads', 'squads', '2020-03-02 19:59:50', '2020-03-02 19:59:50'),
	(93, 'read_squads', 'squads', '2020-03-02 19:59:50', '2020-03-02 19:59:50'),
	(94, 'edit_squads', 'squads', '2020-03-02 19:59:50', '2020-03-02 19:59:50'),
	(95, 'add_squads', 'squads', '2020-03-02 19:59:50', '2020-03-02 19:59:50'),
	(96, 'delete_squads', 'squads', '2020-03-02 19:59:50', '2020-03-02 19:59:50'),
	(97, 'browse_instance', 'instance', '2020-03-05 17:21:58', '2020-03-05 17:21:58'),
	(98, 'read_instance', 'instance', '2020-03-05 17:21:58', '2020-03-05 17:21:58'),
	(99, 'edit_instance', 'instance', '2020-03-05 17:21:58', '2020-03-05 17:21:58'),
	(100, 'add_instance', 'instance', '2020-03-05 17:21:58', '2020-03-05 17:21:58'),
	(101, 'delete_instance', 'instance', '2020-03-05 17:21:58', '2020-03-05 17:21:58'),
	(102, 'browse_instances', 'instances', '2020-03-05 17:24:49', '2020-03-05 17:24:49'),
	(103, 'read_instances', 'instances', '2020-03-05 17:24:49', '2020-03-05 17:24:49'),
	(104, 'edit_instances', 'instances', '2020-03-05 17:24:49', '2020-03-05 17:24:49'),
	(105, 'add_instances', 'instances', '2020-03-05 17:24:49', '2020-03-05 17:24:49'),
	(106, 'delete_instances', 'instances', '2020-03-05 17:24:49', '2020-03-05 17:24:49'),
	(112, 'browse_matches', 'matches', '2020-03-05 18:15:56', '2020-03-05 18:15:56'),
	(113, 'read_matches', 'matches', '2020-03-05 18:15:56', '2020-03-05 18:15:56'),
	(114, 'edit_matches', 'matches', '2020-03-05 18:15:56', '2020-03-05 18:15:56'),
	(115, 'add_matches', 'matches', '2020-03-05 18:15:56', '2020-03-05 18:15:56'),
	(116, 'delete_matches', 'matches', '2020-03-05 18:15:56', '2020-03-05 18:15:56'),
	(117, 'browse_tournaments', 'tournaments', '2020-03-27 13:39:21', '2020-03-27 13:39:21'),
	(118, 'read_tournaments', 'tournaments', '2020-03-27 13:39:21', '2020-03-27 13:39:21'),
	(119, 'edit_tournaments', 'tournaments', '2020-03-27 13:39:21', '2020-03-27 13:39:21'),
	(120, 'add_tournaments', 'tournaments', '2020-03-27 13:39:21', '2020-03-27 13:39:21'),
	(121, 'delete_tournaments', 'tournaments', '2020-03-27 13:39:21', '2020-03-27 13:39:21'),
	(122, 'browse_incidents', 'incidents', '2020-04-10 15:18:33', '2020-04-10 15:18:33'),
	(123, 'read_incidents', 'incidents', '2020-04-10 15:18:33', '2020-04-10 15:18:33'),
	(124, 'edit_incidents', 'incidents', '2020-04-10 15:18:33', '2020-04-10 15:18:33'),
	(125, 'add_incidents', 'incidents', '2020-04-10 15:18:33', '2020-04-10 15:18:33'),
	(126, 'delete_incidents', 'incidents', '2020-04-10 15:18:33', '2020-04-10 15:18:33');
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;

-- Volcando estructura para tabla basquet.permission_role
CREATE TABLE IF NOT EXISTS `permission_role` (
  `permission_id` bigint(20) unsigned NOT NULL,
  `role_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `permission_role_permission_id_index` (`permission_id`),
  KEY `permission_role_role_id_index` (`role_id`),
  CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla basquet.permission_role: ~138 rows (aproximadamente)
/*!40000 ALTER TABLE `permission_role` DISABLE KEYS */;
INSERT INTO `permission_role` (`permission_id`, `role_id`) VALUES
	(1, 1),
	(1, 3),
	(2, 1),
	(3, 1),
	(4, 1),
	(5, 1),
	(6, 1),
	(7, 1),
	(8, 1),
	(9, 1),
	(10, 1),
	(11, 1),
	(12, 1),
	(13, 1),
	(14, 1),
	(15, 1),
	(16, 1),
	(17, 1),
	(18, 1),
	(19, 1),
	(20, 1),
	(21, 1),
	(22, 1),
	(23, 1),
	(24, 1),
	(25, 1),
	(26, 1),
	(26, 3),
	(27, 1),
	(27, 3),
	(28, 1),
	(28, 3),
	(29, 1),
	(29, 3),
	(30, 1),
	(30, 3),
	(31, 1),
	(31, 3),
	(32, 1),
	(32, 3),
	(33, 1),
	(33, 3),
	(34, 1),
	(34, 3),
	(35, 1),
	(35, 3),
	(36, 1),
	(36, 3),
	(37, 1),
	(37, 3),
	(38, 1),
	(38, 3),
	(39, 1),
	(39, 3),
	(40, 1),
	(40, 3),
	(42, 1),
	(42, 3),
	(43, 1),
	(43, 3),
	(44, 1),
	(44, 3),
	(45, 1),
	(45, 3),
	(46, 1),
	(46, 3),
	(67, 1),
	(67, 3),
	(68, 1),
	(68, 3),
	(69, 1),
	(69, 3),
	(70, 1),
	(70, 3),
	(71, 1),
	(71, 3),
	(72, 1),
	(72, 2),
	(72, 3),
	(73, 1),
	(73, 3),
	(74, 1),
	(74, 3),
	(75, 1),
	(75, 3),
	(76, 1),
	(76, 3),
	(87, 1),
	(87, 3),
	(88, 1),
	(88, 3),
	(89, 1),
	(89, 3),
	(90, 1),
	(90, 3),
	(91, 1),
	(91, 3),
	(92, 1),
	(93, 1),
	(94, 1),
	(95, 1),
	(96, 1),
	(97, 1),
	(98, 1),
	(99, 1),
	(100, 1),
	(101, 1),
	(102, 1),
	(103, 1),
	(104, 1),
	(105, 1),
	(106, 1),
	(112, 1),
	(112, 3),
	(113, 1),
	(113, 3),
	(114, 1),
	(114, 3),
	(115, 1),
	(116, 1),
	(117, 1),
	(117, 3),
	(118, 1),
	(118, 3),
	(119, 1),
	(119, 3),
	(120, 1),
	(120, 3),
	(121, 1),
	(121, 3),
	(122, 1),
	(122, 3),
	(123, 1),
	(123, 3),
	(124, 1),
	(124, 3),
	(125, 1),
	(126, 1);
/*!40000 ALTER TABLE `permission_role` ENABLE KEYS */;

-- Volcando estructura para tabla basquet.personal_access_tokens
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla basquet.personal_access_tokens: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;

-- Volcando estructura para tabla basquet.posts
CREATE TABLE IF NOT EXISTS `posts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `author_id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `seo_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `excerpt` text COLLATE utf8mb4_unicode_ci,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` text COLLATE utf8mb4_unicode_ci,
  `meta_keywords` text COLLATE utf8mb4_unicode_ci,
  `status` enum('PUBLISHED','DRAFT','PENDING') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'DRAFT',
  `featured` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `posts_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla basquet.posts: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` (`id`, `author_id`, `category_id`, `title`, `seo_title`, `excerpt`, `body`, `image`, `slug`, `meta_description`, `meta_keywords`, `status`, `featured`, `created_at`, `updated_at`) VALUES
	(1, 0, NULL, 'Lorem Ipsum Post', NULL, 'This is the excerpt for the Lorem Ipsum Post', '<p>This is the body of the lorem ipsum post</p>', 'posts/post1.jpg', 'lorem-ipsum-post', 'This is the meta description', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2020-02-25 22:42:22', '2020-02-25 22:42:22'),
	(2, 0, NULL, 'My Sample Post', NULL, 'This is the excerpt for the sample Post', '<p>This is the body for the sample post, which includes the body.</p>\n                <h2>We can use all kinds of format!</h2>\n                <p>And include a bunch of other stuff.</p>', 'posts/post2.jpg', 'my-sample-post', 'Meta Description for sample post', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2020-02-25 22:42:22', '2020-02-25 22:42:22'),
	(3, 0, NULL, 'Latest Post', NULL, 'This is the excerpt for the latest post', '<p>This is the body for the latest post</p>', 'posts/post3.jpg', 'latest-post', 'This is the meta description', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2020-02-25 22:42:22', '2020-02-25 22:42:22'),
	(4, 0, NULL, 'Yarr Post', NULL, 'Reef sails nipperkin bring a spring upon her cable coffer jury mast spike marooned Pieces of Eight poop deck pillage. Clipper driver coxswain galleon hempen halter come about pressgang gangplank boatswain swing the lead. Nipperkin yard skysail swab lanyard Blimey bilge water ho quarter Buccaneer.', '<p>Swab deadlights Buccaneer fire ship square-rigged dance the hempen jig weigh anchor cackle fruit grog furl. Crack Jennys tea cup chase guns pressgang hearties spirits hogshead Gold Road six pounders fathom measured fer yer chains. Main sheet provost come about trysail barkadeer crimp scuttle mizzenmast brig plunder.</p>\n<p>Mizzen league keelhaul galleon tender cog chase Barbary Coast doubloon crack Jennys tea cup. Blow the man down lugsail fire ship pinnace cackle fruit line warp Admiral of the Black strike colors doubloon. Tackle Jack Ketch come about crimp rum draft scuppers run a shot across the bow haul wind maroon.</p>\n<p>Interloper heave down list driver pressgang holystone scuppers tackle scallywag bilged on her anchor. Jack Tar interloper draught grapple mizzenmast hulk knave cable transom hogshead. Gaff pillage to go on account grog aft chase guns piracy yardarm knave clap of thunder.</p>', 'posts/post4.jpg', 'yarr-post', 'this be a meta descript', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2020-02-25 22:42:22', '2020-02-25 22:42:22');
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;

-- Volcando estructura para tabla basquet.roles
CREATE TABLE IF NOT EXISTS `roles` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla basquet.roles: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` (`id`, `name`, `display_name`, `created_at`, `updated_at`) VALUES
	(1, 'admin', 'Administrator', '2020-02-25 22:42:21', '2020-02-25 22:42:21'),
	(2, 'user', 'Normal User', '2020-02-25 22:42:21', '2020-02-25 22:42:21'),
	(3, 'editor', 'Editor', '2020-03-02 18:57:52', '2020-03-02 18:57:52');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;

-- Volcando estructura para tabla basquet.settings
CREATE TABLE IF NOT EXISTS `settings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  `details` text COLLATE utf8mb4_unicode_ci,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int(11) NOT NULL DEFAULT '1',
  `group` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `settings_key_unique` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla basquet.settings: ~10 rows (aproximadamente)
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` (`id`, `key`, `display_name`, `value`, `details`, `type`, `order`, `group`) VALUES
	(1, 'site.title', 'Site Title', 'Site Title', '', 'text', 1, 'Site'),
	(2, 'site.description', 'Site Description', 'Site Description', '', 'text', 2, 'Site'),
	(3, 'site.logo', 'Site Logo', '', '', 'image', 3, 'Site'),
	(4, 'site.google_analytics_tracking_id', 'Google Analytics Tracking ID', '', '', 'text', 4, 'Site'),
	(5, 'admin.bg_image', 'Admin Background Image', '', '', 'image', 5, 'Admin'),
	(6, 'admin.title', 'Admin Title', 'Voyager', '', 'text', 1, 'Admin'),
	(7, 'admin.description', 'Admin Description', 'Welcome to Voyager. The Missing Admin for Laravel', '', 'text', 2, 'Admin'),
	(8, 'admin.loader', 'Admin Loader', '', '', 'image', 3, 'Admin'),
	(9, 'admin.icon_image', 'Admin Icon Image', '', '', 'image', 4, 'Admin'),
	(10, 'admin.google_analytics_client_id', 'Google Analytics Client ID (used for admin dashboard)', '', '', 'text', 1, 'Admin');
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;

-- Volcando estructura para tabla basquet.squads
CREATE TABLE IF NOT EXISTS `squads` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `team_id` int(11) DEFAULT NULL,
  `tournament_id` int(11) DEFAULT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla basquet.squads: ~18 rows (aproximadamente)
/*!40000 ALTER TABLE `squads` DISABLE KEYS */;
INSERT INTO `squads` (`id`, `team_id`, `tournament_id`, `name`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, 4, 1, 'San Fernando 2020 \'35', '2020-02-28 17:23:50', '2020-02-28 17:23:50', NULL),
	(2, 5, 1, 'Sánfer Vip 2020 Maxi 35', '2020-03-04 12:33:25', '2020-03-04 12:33:25', NULL),
	(3, 6, 1, 'CUNE 2020 Maxi 35', '2020-03-05 18:14:54', '2020-03-05 18:14:54', NULL),
	(4, 11, 1, 'Juventud 2020 Maxi 35', '2020-03-17 23:09:44', '2020-03-17 23:09:44', NULL),
	(5, 7, 1, 'Old School 2020 Maxi 35', '2020-03-17 23:10:17', '2020-03-17 23:10:17', NULL),
	(6, 8, 1, 'Don Orione 2020 Maxi 35', '2020-03-17 23:10:42', '2020-03-17 23:10:42', NULL),
	(7, 9, 1, 'Regatas 2020 Maxi 35', '2020-03-17 23:11:40', '2020-03-17 23:11:40', NULL),
	(8, 10, 1, 'Contadores 2020 Maxi 35', '2020-03-17 23:12:01', '2020-03-17 23:12:01', NULL),
	(9, 12, 1, 'Matacos 2020 Maxi 35', '2020-03-17 23:12:19', '2020-03-17 23:12:19', NULL),
	(10, 3, 1, 'Sarmieto 2020 Maxi 35', '2020-03-17 23:13:08', '2020-03-17 23:13:08', NULL),
	(11, 4, 3, 'San Fernando 2019 Maxi 35', '2020-03-27 13:28:00', '2020-03-27 13:28:00', NULL),
	(12, 3, 3, 'Sarmiento 2019 Maxi 35', '2020-03-27 13:28:23', '2020-03-27 13:28:23', NULL),
	(13, 11, 3, 'Juventud 2019 Maxi 35', '2020-03-27 13:28:54', '2020-03-27 13:28:54', NULL),
	(14, 7, 3, 'Old School 2019 Maxi 35', '2020-03-27 13:29:15', '2020-03-27 13:29:15', NULL),
	(15, 9, 3, 'Regatas 2019 Maxi 35', '2020-03-27 13:29:36', '2020-03-27 13:29:36', NULL),
	(16, 10, 3, 'Contadores 2019 Maxi 35', '2020-03-27 13:29:58', '2020-03-27 13:29:58', NULL),
	(17, 8, 3, 'Don Orione 2019 Maxi 35', '2020-03-27 13:30:19', '2020-03-27 13:30:19', NULL),
	(18, 12, 3, 'Matacos 2019 MAxi 35', '2020-03-27 13:30:45', '2020-03-27 13:30:45', NULL);
/*!40000 ALTER TABLE `squads` ENABLE KEYS */;

-- Volcando estructura para tabla basquet.squad_members
CREATE TABLE IF NOT EXISTS `squad_members` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `person_id` int(11) DEFAULT NULL,
  `squad_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla basquet.squad_members: ~21 rows (aproximadamente)
/*!40000 ALTER TABLE `squad_members` DISABLE KEYS */;
INSERT INTO `squad_members` (`id`, `person_id`, `squad_id`, `created_at`, `updated_at`) VALUES
	(1, 1, 1, '2020-03-04 00:07:49', '2020-03-04 00:07:49'),
	(2, 3, 1, '2020-03-04 12:34:23', '2020-03-04 12:34:23'),
	(3, 12, 1, '2020-03-04 12:34:42', '2020-03-04 12:34:42'),
	(4, 9, 1, '2020-03-04 12:35:04', '2020-03-04 12:35:04'),
	(5, 13, 1, '2020-03-04 12:35:18', '2020-03-04 12:35:18'),
	(6, 14, 1, '2020-03-04 12:35:32', '2020-03-04 12:35:32'),
	(7, 10, 1, '2020-03-04 12:36:46', '2020-03-04 12:36:46'),
	(8, 16, 1, '2020-03-04 12:37:00', '2020-03-04 12:37:00'),
	(9, 20, 1, '2020-03-04 12:38:59', '2020-03-04 12:38:59'),
	(10, 21, 1, '2020-03-04 12:40:38', '2020-03-04 12:40:38'),
	(11, 6, 2, '2020-03-04 12:42:03', '2020-03-04 12:42:03'),
	(12, 15, 2, '2020-03-04 12:42:16', '2020-03-04 12:42:16'),
	(13, 4, 2, '2020-03-04 12:42:28', '2020-03-04 12:42:28'),
	(14, 5, 2, '2020-03-04 12:42:37', '2020-03-04 12:42:37'),
	(15, 17, 2, '2020-03-04 12:42:49', '2020-03-04 12:42:49'),
	(16, 7, 2, '2020-03-04 12:43:21', '2020-03-04 12:43:21'),
	(17, 8, 2, '2020-03-04 12:43:32', '2020-03-04 12:43:32'),
	(18, 11, 2, '2020-03-04 12:43:47', '2020-03-04 12:43:47'),
	(19, 24, 2, '2020-03-04 12:44:00', '2020-03-04 12:48:24'),
	(20, 18, 2, '2020-03-04 12:44:41', '2020-03-04 12:44:41'),
	(21, 25, 2, '2020-03-04 12:47:27', '2020-03-04 12:47:27');
/*!40000 ALTER TABLE `squad_members` ENABLE KEYS */;

-- Volcando estructura para procedimiento basquet.Standings
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `Standings`(
	IN `instance` INT,
	IN `dateParam` DATE


)
BEGIN
SELECT teams.id AS team_id, teams.name, teams.shield,
	(SELECT COUNT(*) FROM matches WHERE DATE <= dateParam AND home = team_id and instance_id = instance) +
	(SELECT COUNT(*) FROM matches WHERE DATE <= dateParam AND away = team_id and instance_id = instance) AS played,	

	(SELECT ifnull(SUM(home_points),0) FROM matches WHERE DATE <= dateParam AND (home = team_id) and instance_id = instance) +
	(SELECT ifnull(SUM(away_points),0) FROM matches WHERE DATE <= dateParam AND (away = team_id) and instance_id = instance) AS Points,	

	(SELECT COUNT(*) FROM matches WHERE DATE <= dateParam AND home = team_id and instance_id = instance and home_score > away_score) + 
	(SELECT COUNT(*) FROM matches WHERE DATE <= dateParam AND away = team_id and instance_id = instance and home_score < away_score) as Win,

	(SELECT COUNT(*) FROM matches WHERE DATE <= dateParam AND team_id in(home,away) and instance_id = instance and home_score = away_score) as Draw,

	(SELECT COUNT(*) FROM matches WHERE DATE <= dateParam AND home = team_id and instance_id = instance and home_score < away_score) + 
	(SELECT COUNT(*) FROM matches WHERE DATE <= dateParam AND away = team_id and instance_id = instance and home_score > away_score) as Lost,

	(SELECT ifnull(SUM(home_score),0) FROM matches WHERE DATE <= dateParam AND (home = team_id) and instance_id = instance) +
	(SELECT ifnull(SUM(away_score),0) FROM matches WHERE DATE <= dateParam AND (away = team_id) and instance_id = instance) AS ScoreFor,

	(SELECT ifnull(SUM(away_score),0) FROM matches WHERE DATE <= dateParam AND (home = team_id) and instance_id = instance) +
	(SELECT ifnull(SUM(home_score),0) FROM matches WHERE DATE <= dateParam AND (away = team_id) and instance_id = instance) AS ScoreAgainst,

	(SELECT ifnull(SUM(home_score) - SUM(away_score), 0) FROM matches WHERE DATE <= dateParam AND (home = team_id) and instance_id = instance) +
	(SELECT ifnull(SUM(away_score) - SUM(home_score), 0) FROM matches WHERE DATE <= dateParam AND (away = team_id) and instance_id = instance)
		AS ScoreDifference
FROM matches inner join teams ON (matches.home = teams.id or matches.away = teams.id)
WHERE instance_id=instance
GROUP BY teams.id
ORDER BY points DESC, scoredifference DESC, played asc;
END//
DELIMITER ;

-- Volcando estructura para tabla basquet.teams
CREATE TABLE IF NOT EXISTS `teams` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `shield` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla basquet.teams: ~12 rows (aproximadamente)
/*!40000 ALTER TABLE `teams` DISABLE KEYS */;
INSERT INTO `teams` (`id`, `name`, `shield`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(3, 'Sarmiento', 'teams\\February2020\\NyUSg8qtcd0h8tJTMDzD.png', '2020-02-26 16:28:00', '2020-02-26 19:28:58', NULL),
	(4, 'San Fernando', 'teams\\February2020\\fdTDVJyCPshDkZpZzJoi.jpg', '2020-02-26 19:35:21', '2020-02-26 19:35:21', NULL),
	(5, 'Sánfer Vip', 'teams\\March2020\\oTqO33RH9M1ug5FIHRLp.png', '2020-03-04 12:32:33', '2020-03-04 12:32:33', NULL),
	(6, 'CUNE', 'teams\\March2020\\giFy5p9t4rJpO4WVmFpt.jpg', '2020-03-05 18:14:29', '2020-03-05 18:14:29', NULL),
	(7, 'Old School', NULL, '2020-03-17 22:48:00', '2020-03-17 22:48:52', NULL),
	(8, 'Don Orione', 'teams\\March2020\\DJdt8fU4pLZyZV2GA8Wb.png', '2020-03-17 22:50:04', '2020-03-17 22:50:04', NULL),
	(9, 'Regatas', 'teams\\March2020\\Ck0bB9Kf6kDWsgVPue5p.png', '2020-03-17 22:53:41', '2020-03-17 22:53:41', NULL),
	(10, 'Contadores', NULL, '2020-03-17 22:55:39', '2020-03-17 22:55:39', NULL),
	(11, 'Juventud', 'teams\\March2020\\oMXjICYJaeXc5inxdCAN.jpg', '2020-03-17 22:56:53', '2020-03-17 22:56:53', NULL),
	(12, 'Matacos', NULL, '2020-03-17 22:57:02', '2020-03-17 22:57:02', NULL),
	(13, 'Villa San Martín', 'teams\\March2020\\QQpkUQPWvO2gtMb8mW6F.jpg', '2020-03-24 20:18:36', '2020-03-24 20:18:36', NULL),
	(14, 'Fontana', 'teams\\March2020\\s8XB2ZDIQIDQzMiO1pNn.png', '2020-03-24 20:21:00', '2020-03-24 20:21:00', NULL);
/*!40000 ALTER TABLE `teams` ENABLE KEYS */;

-- Volcando estructura para tabla basquet.tournaments
CREATE TABLE IF NOT EXISTS `tournaments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `valid` tinyint(4) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla basquet.tournaments: ~5 rows (aproximadamente)
/*!40000 ALTER TABLE `tournaments` DISABLE KEYS */;
INSERT INTO `tournaments` (`id`, `name`, `category_id`, `created_at`, `updated_at`, `deleted_at`, `valid`) VALUES
	(1, 'Ambach 35 2020', 1, '2020-02-26 20:20:41', '2020-02-26 20:20:41', NULL, 1),
	(2, 'Ambach 50 2020', 3, '2020-02-26 20:21:33', '2020-02-26 20:21:33', NULL, 1),
	(3, 'Ambach 35 2019 Inicial', 1, '2020-03-17 17:10:00', '2020-03-27 13:42:40', NULL, 1),
	(4, 'Ambach 42 2019 Inicial', 2, '2020-03-17 17:11:34', '2020-03-17 17:11:34', NULL, 0),
	(5, 'Ambach 50 2019 Inicial', 3, '2020-03-17 17:11:58', '2020-03-17 17:11:58', NULL, 0);
/*!40000 ALTER TABLE `tournaments` ENABLE KEYS */;

-- Volcando estructura para tabla basquet.translations
CREATE TABLE IF NOT EXISTS `translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `table_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `column_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `foreign_key` int(10) unsigned NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `translations_table_name_column_name_foreign_key_locale_unique` (`table_name`,`column_name`,`foreign_key`,`locale`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla basquet.translations: ~30 rows (aproximadamente)
/*!40000 ALTER TABLE `translations` DISABLE KEYS */;
INSERT INTO `translations` (`id`, `table_name`, `column_name`, `foreign_key`, `locale`, `value`, `created_at`, `updated_at`) VALUES
	(1, 'data_types', 'display_name_singular', 5, 'pt', 'Post', '2020-02-25 22:42:22', '2020-02-25 22:42:22'),
	(2, 'data_types', 'display_name_singular', 6, 'pt', 'Página', '2020-02-25 22:42:22', '2020-02-25 22:42:22'),
	(3, 'data_types', 'display_name_singular', 1, 'pt', 'Utilizador', '2020-02-25 22:42:22', '2020-02-25 22:42:22'),
	(4, 'data_types', 'display_name_singular', 4, 'pt', 'Categoria', '2020-02-25 22:42:22', '2020-02-25 22:42:22'),
	(5, 'data_types', 'display_name_singular', 2, 'pt', 'Menu', '2020-02-25 22:42:22', '2020-02-25 22:42:22'),
	(6, 'data_types', 'display_name_singular', 3, 'pt', 'Função', '2020-02-25 22:42:22', '2020-02-25 22:42:22'),
	(7, 'data_types', 'display_name_plural', 5, 'pt', 'Posts', '2020-02-25 22:42:22', '2020-02-25 22:42:22'),
	(8, 'data_types', 'display_name_plural', 6, 'pt', 'Páginas', '2020-02-25 22:42:22', '2020-02-25 22:42:22'),
	(9, 'data_types', 'display_name_plural', 1, 'pt', 'Utilizadores', '2020-02-25 22:42:22', '2020-02-25 22:42:22'),
	(10, 'data_types', 'display_name_plural', 4, 'pt', 'Categorias', '2020-02-25 22:42:22', '2020-02-25 22:42:22'),
	(11, 'data_types', 'display_name_plural', 2, 'pt', 'Menus', '2020-02-25 22:42:22', '2020-02-25 22:42:22'),
	(12, 'data_types', 'display_name_plural', 3, 'pt', 'Funções', '2020-02-25 22:42:22', '2020-02-25 22:42:22'),
	(13, 'categories', 'slug', 1, 'pt', 'categoria-1', '2020-02-25 22:42:22', '2020-02-25 22:42:22'),
	(14, 'categories', 'name', 1, 'pt', 'Categoria 1', '2020-02-25 22:42:22', '2020-02-25 22:42:22'),
	(15, 'categories', 'slug', 2, 'pt', 'categoria-2', '2020-02-25 22:42:22', '2020-02-25 22:42:22'),
	(16, 'categories', 'name', 2, 'pt', 'Categoria 2', '2020-02-25 22:42:22', '2020-02-25 22:42:22'),
	(17, 'pages', 'title', 1, 'pt', 'Olá Mundo', '2020-02-25 22:42:22', '2020-02-25 22:42:22'),
	(18, 'pages', 'slug', 1, 'pt', 'ola-mundo', '2020-02-25 22:42:22', '2020-02-25 22:42:22'),
	(19, 'pages', 'body', 1, 'pt', '<p>Olá Mundo. Scallywag grog swab Cat o\'nine tails scuttle rigging hardtack cable nipper Yellow Jack. Handsomely spirits knave lad killick landlubber or just lubber deadlights chantey pinnace crack Jennys tea cup. Provost long clothes black spot Yellow Jack bilged on her anchor league lateen sail case shot lee tackle.</p>\r\n<p>Ballast spirits fluke topmast me quarterdeck schooner landlubber or just lubber gabion belaying pin. Pinnace stern galleon starboard warp carouser to go on account dance the hempen jig jolly boat measured fer yer chains. Man-of-war fire in the hole nipperkin handsomely doubloon barkadeer Brethren of the Coast gibbet driver squiffy.</p>', '2020-02-25 22:42:22', '2020-02-25 22:42:22'),
	(20, 'menu_items', 'title', 1, 'pt', 'Painel de Controle', '2020-02-25 22:42:22', '2020-02-25 22:42:22'),
	(21, 'menu_items', 'title', 2, 'pt', 'Media', '2020-02-25 22:42:22', '2020-02-25 22:42:22'),
	(22, 'menu_items', 'title', 12, 'pt', 'Publicações', '2020-02-25 22:42:22', '2020-02-25 22:42:22'),
	(23, 'menu_items', 'title', 3, 'pt', 'Utilizadores', '2020-02-25 22:42:22', '2020-02-25 22:42:22'),
	(24, 'menu_items', 'title', 11, 'pt', 'Categorias', '2020-02-25 22:42:22', '2020-02-25 22:42:22'),
	(25, 'menu_items', 'title', 13, 'pt', 'Páginas', '2020-02-25 22:42:22', '2020-02-25 22:42:22'),
	(26, 'menu_items', 'title', 4, 'pt', 'Funções', '2020-02-25 22:42:22', '2020-02-25 22:42:22'),
	(27, 'menu_items', 'title', 5, 'pt', 'Ferramentas', '2020-02-25 22:42:22', '2020-02-25 22:42:22'),
	(28, 'menu_items', 'title', 6, 'pt', 'Menus', '2020-02-25 22:42:22', '2020-02-25 22:42:22'),
	(29, 'menu_items', 'title', 7, 'pt', 'Base de dados', '2020-02-25 22:42:22', '2020-02-25 22:42:22'),
	(30, 'menu_items', 'title', 10, 'pt', 'Configurações', '2020-02-25 22:42:22', '2020-02-25 22:42:22');
/*!40000 ALTER TABLE `translations` ENABLE KEYS */;

-- Volcando estructura para tabla basquet.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) unsigned DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'users/default.png',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `api_token` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `settings` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  UNIQUE KEY `users_api_token_unique` (`api_token`),
  KEY `users_role_id_foreign` (`role_id`),
  CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla basquet.users: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `role_id`, `name`, `email`, `avatar`, `email_verified_at`, `password`, `api_token`, `remember_token`, `settings`, `created_at`, `updated_at`) VALUES
	(1, 1, 'Admin', 'admin@admin.com', 'users/default.png', NULL, '$2y$12$UPUNzjbZBVE5rUPCz1gkoOlO9Ntx44YvZuwkQTeKMYzylytowWFXu', NULL, 'LHsbGaFIx50onyqEJSS3oKvo0eB4c637Eqd4RQopf04gtJYv8JIz1LP6egPh', NULL, '2020-02-25 22:42:22', '2020-02-25 22:42:22'),
	(2, 3, 'Federico', 'leopoldofederico@gmail.com', 'users/default.png', NULL, '$2y$10$BKXaXjdDf3qyMC7xGxtWe.5Ts/uHAcC/vm2nd4kHl/sua7NAVbglC', NULL, 'AejLIB4lITYFBsUfNLTeAciaKsWXLBlaxk3QTIr8T80Ef5dGAQqFGz2tieZ5', '{"locale":"es"}', '2020-03-02 17:52:05', '2020-04-10 02:03:43'),
	(4, 2, 'Fulano de Tal', 'fpertile@fiduciariadelnorte.com.ar', 'users/default.png', NULL, '$2y$10$LKH3L5/0BBxFdsivxRsmtuAmiwVXxkx4D4V/ooI1kcW2nK9AglHNu', NULL, NULL, NULL, '2020-04-08 20:52:10', '2020-04-08 20:52:11'),
	(5, 2, 'Fulgencio', 'lfpertile@yahoo.com.ar', 'users/default.png', NULL, '$2y$10$O3MWCBVbTnbgI/PgT7ntjOgqt6NmIUyQ8AcPu09UrlXQk9rag59Uy', NULL, NULL, NULL, '2020-04-08 22:22:50', '2020-04-08 22:22:50');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

-- Volcando estructura para tabla basquet.user_roles
CREATE TABLE IF NOT EXISTS `user_roles` (
  `user_id` bigint(20) unsigned NOT NULL,
  `role_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `user_roles_user_id_index` (`user_id`),
  KEY `user_roles_role_id_index` (`role_id`),
  CONSTRAINT `user_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  CONSTRAINT `user_roles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla basquet.user_roles: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `user_roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_roles` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
