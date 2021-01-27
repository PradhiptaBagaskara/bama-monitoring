-- --------------------------------------------------------
-- Host:                         localhost
-- Versi server:                 5.7.24 - MySQL Community Server (GPL)
-- OS Server:                    Win64
-- HeidiSQL Versi:               10.2.0.5599
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- membuang struktur untuk table koperasi_ngetos.backend_access_log
DROP TABLE IF EXISTS `backend_access_log`;
CREATE TABLE IF NOT EXISTS `backend_access_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `ip_address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Membuang data untuk tabel koperasi_ngetos.backend_access_log: ~7 rows (lebih kurang)
/*!40000 ALTER TABLE `backend_access_log` DISABLE KEYS */;
INSERT INTO `backend_access_log` (`id`, `user_id`, `ip_address`, `created_at`, `updated_at`) VALUES
	(1, 1, '127.0.0.1', '2021-01-08 14:05:24', '2021-01-08 14:05:24'),
	(2, 2, '::1', '2021-01-26 01:19:57', '2021-01-26 01:19:57'),
	(3, 2, '::1', '2021-01-26 01:31:08', '2021-01-26 01:31:08'),
	(4, 2, '::1', '2021-01-26 22:37:12', '2021-01-26 22:37:12'),
	(5, 3, '127.0.0.1', '2021-01-26 22:44:31', '2021-01-26 22:44:31'),
	(6, 3, '127.0.0.1', '2021-01-27 14:55:08', '2021-01-27 14:55:08'),
	(7, 1, '127.0.0.1', '2021-01-27 15:03:15', '2021-01-27 15:03:15');
/*!40000 ALTER TABLE `backend_access_log` ENABLE KEYS */;

-- membuang struktur untuk table koperasi_ngetos.backend_users
DROP TABLE IF EXISTS `backend_users`;
CREATE TABLE IF NOT EXISTS `backend_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `login` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `activation_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `persist_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reset_password_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `permissions` text COLLATE utf8mb4_unicode_ci,
  `is_activated` tinyint(1) NOT NULL DEFAULT '0',
  `role_id` int(10) unsigned DEFAULT NULL,
  `activated_at` timestamp NULL DEFAULT NULL,
  `last_login` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `login_unique` (`login`),
  UNIQUE KEY `email_unique` (`email`),
  KEY `act_code_index` (`activation_code`),
  KEY `reset_code_index` (`reset_password_code`),
  KEY `admin_role_index` (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Membuang data untuk tabel koperasi_ngetos.backend_users: ~3 rows (lebih kurang)
/*!40000 ALTER TABLE `backend_users` DISABLE KEYS */;
INSERT INTO `backend_users` (`id`, `first_name`, `last_name`, `login`, `email`, `password`, `activation_code`, `persist_code`, `reset_password_code`, `permissions`, `is_activated`, `role_id`, `activated_at`, `last_login`, `created_at`, `updated_at`, `deleted_at`, `is_superuser`) VALUES
	(1, 'Admin', 'Person', 'admin', 'admin@domain.tld', '$2y$10$hywn.9VRhn3I2JowZX./a.52EgmJunX6L5MZlsoaSVSRbRpP2fNBW', NULL, '$2y$10$RuORPFNM13MEYuTBtIfLN.02xPWE3xzskr4s0q8ZRkNgz6Gt7LGue', NULL, '', 1, 2, NULL, '2021-01-27 15:03:15', '2021-01-06 19:01:51', '2021-01-27 15:03:15', NULL, 1),
	(2, 'Ormawa', 'Test', 'ormawa', 'ormawa@mail.com', '$2y$10$z62TBaiWRvExsJb2DSaLFent1tEEwyOzLwhbJ6YHiDiMLrnaPvZ/K', NULL, '$2y$10$LGTCboKXS.GsFiOuhpHb7.K46b8GTLQviZglxQmLgb8z6ur890LRO', NULL, '', 0, 4, NULL, '2021-01-26 22:37:11', '2021-01-26 01:19:36', '2021-01-26 22:37:11', NULL, 0),
	(3, 'Bama', 'Admin', 'bama', 'bama@mail.com', '$2y$10$MyqaypNhvhUThyYSDzID7ezXvoqTXi9mKFDMCi5Ar8STkhNIX1IJK', NULL, NULL, NULL, '', 0, 3, NULL, '2021-01-27 14:55:07', '2021-01-26 22:44:05', '2021-01-27 15:03:11', NULL, 0);
/*!40000 ALTER TABLE `backend_users` ENABLE KEYS */;

-- membuang struktur untuk table koperasi_ngetos.backend_users_groups
DROP TABLE IF EXISTS `backend_users_groups`;
CREATE TABLE IF NOT EXISTS `backend_users_groups` (
  `user_id` int(10) unsigned NOT NULL,
  `user_group_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`user_group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Membuang data untuk tabel koperasi_ngetos.backend_users_groups: ~1 rows (lebih kurang)
/*!40000 ALTER TABLE `backend_users_groups` DISABLE KEYS */;
INSERT INTO `backend_users_groups` (`user_id`, `user_group_id`) VALUES
	(1, 1);
/*!40000 ALTER TABLE `backend_users_groups` ENABLE KEYS */;

-- membuang struktur untuk table koperasi_ngetos.backend_user_groups
DROP TABLE IF EXISTS `backend_user_groups`;
CREATE TABLE IF NOT EXISTS `backend_user_groups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `is_new_user_default` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_unique` (`name`),
  KEY `code_index` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Membuang data untuk tabel koperasi_ngetos.backend_user_groups: ~1 rows (lebih kurang)
/*!40000 ALTER TABLE `backend_user_groups` DISABLE KEYS */;
INSERT INTO `backend_user_groups` (`id`, `name`, `created_at`, `updated_at`, `code`, `description`, `is_new_user_default`) VALUES
	(1, 'Owners', '2021-01-06 19:01:50', '2021-01-06 19:01:50', 'owners', 'Default group for website owners.', 0);
/*!40000 ALTER TABLE `backend_user_groups` ENABLE KEYS */;

-- membuang struktur untuk table koperasi_ngetos.backend_user_preferences
DROP TABLE IF EXISTS `backend_user_preferences`;
CREATE TABLE IF NOT EXISTS `backend_user_preferences` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `namespace` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `group` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `item` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `user_item_index` (`user_id`,`namespace`,`group`,`item`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Membuang data untuk tabel koperasi_ngetos.backend_user_preferences: ~2 rows (lebih kurang)
/*!40000 ALTER TABLE `backend_user_preferences` DISABLE KEYS */;
INSERT INTO `backend_user_preferences` (`id`, `user_id`, `namespace`, `group`, `item`, `value`) VALUES
	(1, 1, 'backend', 'backend', 'preferences', '{"locale":"id","fallback_locale":"en","timezone":"UTC","editor_font_size":"12","editor_word_wrap":"fluid","editor_code_folding":"manual","editor_tab_size":"4","editor_theme":"twilight","editor_show_invisibles":"0","editor_highlight_active_line":"1","editor_use_hard_tabs":"0","editor_show_gutter":"1","editor_auto_closing":"0","editor_autocompletion":"manual","editor_enable_snippets":"0","editor_display_indent_guides":"0","editor_show_print_margin":"0","user_id":1}'),
	(2, 2, 'backend', 'reportwidgets', 'dashboard', '{"welcome":{"class":"Backend\\\\ReportWidgets\\\\Welcome","sortOrder":"50","configuration":{"ocWidgetWidth":7}},"systemStatus":{"class":"System\\\\ReportWidgets\\\\Status","sortOrder":"60","configuration":{"title":"System status","ocWidgetWidth":7,"ocWidgetNewRow":null}}}');
/*!40000 ALTER TABLE `backend_user_preferences` ENABLE KEYS */;

-- membuang struktur untuk table koperasi_ngetos.backend_user_roles
DROP TABLE IF EXISTS `backend_user_roles`;
CREATE TABLE IF NOT EXISTS `backend_user_roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `permissions` text COLLATE utf8mb4_unicode_ci,
  `is_system` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `role_unique` (`name`),
  KEY `role_code_index` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Membuang data untuk tabel koperasi_ngetos.backend_user_roles: ~4 rows (lebih kurang)
/*!40000 ALTER TABLE `backend_user_roles` DISABLE KEYS */;
INSERT INTO `backend_user_roles` (`id`, `name`, `code`, `description`, `permissions`, `is_system`, `created_at`, `updated_at`) VALUES
	(1, 'Publisher', 'publisher', 'Site editor with access to publishing tools.', '', 1, '2021-01-06 19:01:50', '2021-01-06 19:01:50'),
	(2, 'Developer', 'developer', 'Site administrator with access to developer tools.', '', 1, '2021-01-06 19:01:50', '2021-01-06 19:01:50'),
	(3, 'admin', 'admin', 'Admin Role', '{"rainlab.blog.manage_settings":"1","rainlab.blog.access_publish":"1","rainlab.blog.access_import_export":"1","rainlab.blog.access_other_posts":"1","rainlab.blog.access_categories":"1","rainlab.blog.access_posts":"1","backend.access_dashboard":"1","backend.manage_users":"1","backend.manage_branding":"1","media.manage_media":"1","backend.manage_default_dashboard":"1","bama.ormawa.access_admin":"1"}', 0, '2021-01-26 01:14:49', '2021-01-26 01:16:55'),
	(4, 'ormawa', 'ormawa', 'Role untuk ormawa', '{"backend.access_dashboard":"1","bama.ormawa.access_users":"1"}', 0, '2021-01-26 01:16:42', '2021-01-27 04:41:27');
/*!40000 ALTER TABLE `backend_user_roles` ENABLE KEYS */;

-- membuang struktur untuk table koperasi_ngetos.backend_user_throttle
DROP TABLE IF EXISTS `backend_user_throttle`;
CREATE TABLE IF NOT EXISTS `backend_user_throttle` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned DEFAULT NULL,
  `ip_address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attempts` int(11) NOT NULL DEFAULT '0',
  `last_attempt_at` timestamp NULL DEFAULT NULL,
  `is_suspended` tinyint(1) NOT NULL DEFAULT '0',
  `suspended_at` timestamp NULL DEFAULT NULL,
  `is_banned` tinyint(1) NOT NULL DEFAULT '0',
  `banned_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `backend_user_throttle_user_id_index` (`user_id`),
  KEY `backend_user_throttle_ip_address_index` (`ip_address`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Membuang data untuk tabel koperasi_ngetos.backend_user_throttle: ~3 rows (lebih kurang)
/*!40000 ALTER TABLE `backend_user_throttle` DISABLE KEYS */;
INSERT INTO `backend_user_throttle` (`id`, `user_id`, `ip_address`, `attempts`, `last_attempt_at`, `is_suspended`, `suspended_at`, `is_banned`, `banned_at`) VALUES
	(1, 1, '127.0.0.1', 0, NULL, 0, NULL, 0, NULL),
	(2, 2, NULL, 0, NULL, 0, NULL, 0, NULL),
	(3, 3, '127.0.0.1', 0, NULL, 0, NULL, 0, NULL);
/*!40000 ALTER TABLE `backend_user_throttle` ENABLE KEYS */;

-- membuang struktur untuk table koperasi_ngetos.bama_ormawa_kegiatan
DROP TABLE IF EXISTS `bama_ormawa_kegiatan`;
CREATE TABLE IF NOT EXISTS `bama_ormawa_kegiatan` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nama` text COLLATE utf8mb4_unicode_ci,
  `deskripsi` text COLLATE utf8mb4_unicode_ci,
  `status` int(11) DEFAULT '0',
  `reason` text COLLATE utf8mb4_unicode_ci,
  `user_id` int(11) DEFAULT NULL,
  `anggaran` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `anggaran_acc` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Membuang data untuk tabel koperasi_ngetos.bama_ormawa_kegiatan: ~1 rows (lebih kurang)
/*!40000 ALTER TABLE `bama_ormawa_kegiatan` DISABLE KEYS */;
INSERT INTO `bama_ormawa_kegiatan` (`id`, `nama`, `deskripsi`, `status`, `reason`, `user_id`, `anggaran`, `created_at`, `updated_at`, `anggaran_acc`) VALUES
	(1, 'naam keg', NULL, 0, NULL, 2, NULL, '2021-01-25 23:02:23', '2021-01-26 02:20:28', NULL);
/*!40000 ALTER TABLE `bama_ormawa_kegiatan` ENABLE KEYS */;

-- membuang struktur untuk table koperasi_ngetos.bama_ormawa_laporan
DROP TABLE IF EXISTS `bama_ormawa_laporan`;
CREATE TABLE IF NOT EXISTS `bama_ormawa_laporan` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `kegiatan_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `dilihat` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `Index` (`kegiatan_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Membuang data untuk tabel koperasi_ngetos.bama_ormawa_laporan: ~1 rows (lebih kurang)
/*!40000 ALTER TABLE `bama_ormawa_laporan` DISABLE KEYS */;
INSERT INTO `bama_ormawa_laporan` (`id`, `title`, `description`, `kegiatan_id`, `created_at`, `updated_at`, `dilihat`) VALUES
	(1, 'title', '<p>test</p>', 1, '2021-01-25 23:58:15', '2021-01-27 04:43:39', 1);
/*!40000 ALTER TABLE `bama_ormawa_laporan` ENABLE KEYS */;

-- membuang struktur untuk table koperasi_ngetos.cache
DROP TABLE IF EXISTS `cache`;
CREATE TABLE IF NOT EXISTS `cache` (
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int(11) NOT NULL,
  UNIQUE KEY `cache_key_unique` (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Membuang data untuk tabel koperasi_ngetos.cache: ~0 rows (lebih kurang)
/*!40000 ALTER TABLE `cache` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache` ENABLE KEYS */;

-- membuang struktur untuk table koperasi_ngetos.cms_theme_data
DROP TABLE IF EXISTS `cms_theme_data`;
CREATE TABLE IF NOT EXISTS `cms_theme_data` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `theme` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `data` mediumtext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cms_theme_data_theme_index` (`theme`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Membuang data untuk tabel koperasi_ngetos.cms_theme_data: ~2 rows (lebih kurang)
/*!40000 ALTER TABLE `cms_theme_data` DISABLE KEYS */;
INSERT INTO `cms_theme_data` (`id`, `theme`, `data`, `created_at`, `updated_at`) VALUES
	(1, 'baba-adminlte', '{"site_name":"AdminLTE 2.4","login_title":"<b>Admin<\\/b>LTE 2.4"}', '2021-01-24 14:38:52', '2021-01-24 14:38:52'),
	(2, 'vreedom18-bingo', '{"site__title":"BAMA","site__description":"BAMA Universitas Muhammadiyah Ponorogo"}', '2021-01-24 16:22:03', '2021-01-24 16:22:32');
/*!40000 ALTER TABLE `cms_theme_data` ENABLE KEYS */;

-- membuang struktur untuk table koperasi_ngetos.cms_theme_logs
DROP TABLE IF EXISTS `cms_theme_logs`;
CREATE TABLE IF NOT EXISTS `cms_theme_logs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `theme` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `template` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `old_template` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  `old_content` longtext COLLATE utf8mb4_unicode_ci,
  `user_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cms_theme_logs_type_index` (`type`),
  KEY `cms_theme_logs_theme_index` (`theme`),
  KEY `cms_theme_logs_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Membuang data untuk tabel koperasi_ngetos.cms_theme_logs: ~0 rows (lebih kurang)
/*!40000 ALTER TABLE `cms_theme_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_theme_logs` ENABLE KEYS */;

-- membuang struktur untuk table koperasi_ngetos.cms_theme_templates
DROP TABLE IF EXISTS `cms_theme_templates`;
CREATE TABLE IF NOT EXISTS `cms_theme_templates` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `source` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `path` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_size` int(10) unsigned NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cms_theme_templates_source_index` (`source`),
  KEY `cms_theme_templates_path_index` (`path`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Membuang data untuk tabel koperasi_ngetos.cms_theme_templates: ~0 rows (lebih kurang)
/*!40000 ALTER TABLE `cms_theme_templates` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_theme_templates` ENABLE KEYS */;

-- membuang struktur untuk table koperasi_ngetos.deferred_bindings
DROP TABLE IF EXISTS `deferred_bindings`;
CREATE TABLE IF NOT EXISTS `deferred_bindings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `master_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `master_field` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slave_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slave_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `session_key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_bind` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `deferred_bindings_master_type_index` (`master_type`),
  KEY `deferred_bindings_master_field_index` (`master_field`),
  KEY `deferred_bindings_slave_type_index` (`slave_type`),
  KEY `deferred_bindings_slave_id_index` (`slave_id`),
  KEY `deferred_bindings_session_key_index` (`session_key`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Membuang data untuk tabel koperasi_ngetos.deferred_bindings: ~0 rows (lebih kurang)
/*!40000 ALTER TABLE `deferred_bindings` DISABLE KEYS */;
/*!40000 ALTER TABLE `deferred_bindings` ENABLE KEYS */;

-- membuang struktur untuk table koperasi_ngetos.failed_jobs
DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci,
  `failed_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Membuang data untuk tabel koperasi_ngetos.failed_jobs: ~0 rows (lebih kurang)
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;

-- membuang struktur untuk table koperasi_ngetos.jobs
DROP TABLE IF EXISTS `jobs`;
CREATE TABLE IF NOT EXISTS `jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint(3) unsigned NOT NULL,
  `reserved_at` int(10) unsigned DEFAULT NULL,
  `available_at` int(10) unsigned NOT NULL,
  `created_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_reserved_at_index` (`queue`,`reserved_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Membuang data untuk tabel koperasi_ngetos.jobs: ~0 rows (lebih kurang)
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;

-- membuang struktur untuk table koperasi_ngetos.migrations
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Membuang data untuk tabel koperasi_ngetos.migrations: ~40 rows (lebih kurang)
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(1, '2013_10_01_000001_Db_Deferred_Bindings', 1),
	(2, '2013_10_01_000002_Db_System_Files', 1),
	(3, '2013_10_01_000003_Db_System_Plugin_Versions', 1),
	(4, '2013_10_01_000004_Db_System_Plugin_History', 1),
	(5, '2013_10_01_000005_Db_System_Settings', 1),
	(6, '2013_10_01_000006_Db_System_Parameters', 1),
	(7, '2013_10_01_000007_Db_System_Add_Disabled_Flag', 1),
	(8, '2013_10_01_000008_Db_System_Mail_Templates', 1),
	(9, '2013_10_01_000009_Db_System_Mail_Layouts', 1),
	(10, '2014_10_01_000010_Db_Jobs', 1),
	(11, '2014_10_01_000011_Db_System_Event_Logs', 1),
	(12, '2014_10_01_000012_Db_System_Request_Logs', 1),
	(13, '2014_10_01_000013_Db_System_Sessions', 1),
	(14, '2015_10_01_000014_Db_System_Mail_Layout_Rename', 1),
	(15, '2015_10_01_000015_Db_System_Add_Frozen_Flag', 1),
	(16, '2015_10_01_000016_Db_Cache', 1),
	(17, '2015_10_01_000017_Db_System_Revisions', 1),
	(18, '2015_10_01_000018_Db_FailedJobs', 1),
	(19, '2016_10_01_000019_Db_System_Plugin_History_Detail_Text', 1),
	(20, '2016_10_01_000020_Db_System_Timestamp_Fix', 1),
	(21, '2017_08_04_121309_Db_Deferred_Bindings_Add_Index_Session', 1),
	(22, '2017_10_01_000021_Db_System_Sessions_Update', 1),
	(23, '2017_10_01_000022_Db_Jobs_FailedJobs_Update', 1),
	(24, '2017_10_01_000023_Db_System_Mail_Partials', 1),
	(25, '2017_10_23_000024_Db_System_Mail_Layouts_Add_Options_Field', 1),
	(26, '2013_10_01_000001_Db_Backend_Users', 2),
	(27, '2013_10_01_000002_Db_Backend_User_Groups', 2),
	(28, '2013_10_01_000003_Db_Backend_Users_Groups', 2),
	(29, '2013_10_01_000004_Db_Backend_User_Throttle', 2),
	(30, '2014_01_04_000005_Db_Backend_User_Preferences', 2),
	(31, '2014_10_01_000006_Db_Backend_Access_Log', 2),
	(32, '2014_10_01_000007_Db_Backend_Add_Description_Field', 2),
	(33, '2015_10_01_000008_Db_Backend_Add_Superuser_Flag', 2),
	(34, '2016_10_01_000009_Db_Backend_Timestamp_Fix', 2),
	(35, '2017_10_01_000010_Db_Backend_User_Roles', 2),
	(36, '2018_12_16_000011_Db_Backend_Add_Deleted_At', 2),
	(37, '2014_10_01_000001_Db_Cms_Theme_Data', 3),
	(38, '2016_10_01_000002_Db_Cms_Timestamp_Fix', 3),
	(39, '2017_10_01_000003_Db_Cms_Theme_Logs', 3),
	(40, '2018_11_01_000001_Db_Cms_Theme_Templates', 3);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;

-- membuang struktur untuk table koperasi_ngetos.rainlab_blog_categories
DROP TABLE IF EXISTS `rainlab_blog_categories`;
CREATE TABLE IF NOT EXISTS `rainlab_blog_categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `parent_id` int(10) unsigned DEFAULT NULL,
  `nest_left` int(11) DEFAULT NULL,
  `nest_right` int(11) DEFAULT NULL,
  `nest_depth` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `rainlab_blog_categories_slug_index` (`slug`),
  KEY `rainlab_blog_categories_parent_id_index` (`parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Membuang data untuk tabel koperasi_ngetos.rainlab_blog_categories: ~1 rows (lebih kurang)
/*!40000 ALTER TABLE `rainlab_blog_categories` DISABLE KEYS */;
INSERT INTO `rainlab_blog_categories` (`id`, `name`, `slug`, `code`, `description`, `parent_id`, `nest_left`, `nest_right`, `nest_depth`, `created_at`, `updated_at`) VALUES
	(1, 'Uncategorized', 'uncategorized', NULL, NULL, NULL, 1, 2, 0, '2021-01-24 17:24:08', '2021-01-24 17:24:08');
/*!40000 ALTER TABLE `rainlab_blog_categories` ENABLE KEYS */;

-- membuang struktur untuk table koperasi_ngetos.rainlab_blog_posts
DROP TABLE IF EXISTS `rainlab_blog_posts`;
CREATE TABLE IF NOT EXISTS `rainlab_blog_posts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned DEFAULT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `excerpt` text COLLATE utf8mb4_unicode_ci,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  `content_html` longtext COLLATE utf8mb4_unicode_ci,
  `published_at` timestamp NULL DEFAULT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `metadata` mediumtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `rainlab_blog_posts_user_id_index` (`user_id`),
  KEY `rainlab_blog_posts_slug_index` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Membuang data untuk tabel koperasi_ngetos.rainlab_blog_posts: ~1 rows (lebih kurang)
/*!40000 ALTER TABLE `rainlab_blog_posts` DISABLE KEYS */;
INSERT INTO `rainlab_blog_posts` (`id`, `user_id`, `title`, `slug`, `excerpt`, `content`, `content_html`, `published_at`, `published`, `created_at`, `updated_at`, `metadata`) VALUES
	(1, 1, 'First blog post', 'first-blog-post', 'The first ever blog post is here. It might be a good idea to update this post with some more relevant content.', 'This is your first ever **blog post**! It might be a good idea to update this post with some more relevant content.\n\nYou can edit this content by selecting **Blog** from the administration back-end menu.\n\n*Enjoy the good times!*', '<p>This is your first ever <strong>blog post</strong>! It might be a good idea to update this post with some more relevant content.</p>\n<p>You can edit this content by selecting <strong>Blog</strong> from the administration back-end menu.</p>\n<p><em>Enjoy the good times!</em></p>', '2021-01-24 17:24:08', 1, '2021-01-24 17:24:08', '2021-01-24 17:24:08', NULL);
/*!40000 ALTER TABLE `rainlab_blog_posts` ENABLE KEYS */;

-- membuang struktur untuk table koperasi_ngetos.rainlab_blog_posts_categories
DROP TABLE IF EXISTS `rainlab_blog_posts_categories`;
CREATE TABLE IF NOT EXISTS `rainlab_blog_posts_categories` (
  `post_id` int(10) unsigned NOT NULL,
  `category_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`post_id`,`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Membuang data untuk tabel koperasi_ngetos.rainlab_blog_posts_categories: ~0 rows (lebih kurang)
/*!40000 ALTER TABLE `rainlab_blog_posts_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `rainlab_blog_posts_categories` ENABLE KEYS */;

-- membuang struktur untuk table koperasi_ngetos.rainlab_translate_attributes
DROP TABLE IF EXISTS `rainlab_translate_attributes`;
CREATE TABLE IF NOT EXISTS `rainlab_translate_attributes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attribute_data` mediumtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `rainlab_translate_attributes_locale_index` (`locale`),
  KEY `rainlab_translate_attributes_model_id_index` (`model_id`),
  KEY `rainlab_translate_attributes_model_type_index` (`model_type`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Membuang data untuk tabel koperasi_ngetos.rainlab_translate_attributes: ~5 rows (lebih kurang)
/*!40000 ALTER TABLE `rainlab_translate_attributes` DISABLE KEYS */;
INSERT INTO `rainlab_translate_attributes` (`id`, `locale`, `model_id`, `model_type`, `attribute_data`) VALUES
	(1, 'de', '1', 'OFFLINE\\Mall\\Models\\OrderState', '{"name":"Neu"}'),
	(2, 'de', '2', 'OFFLINE\\Mall\\Models\\OrderState', '{"name":"Wird bearbeitet"}'),
	(3, 'de', '3', 'OFFLINE\\Mall\\Models\\OrderState', '{"name":"Reklamiert"}'),
	(4, 'de', '4', 'OFFLINE\\Mall\\Models\\OrderState', '{"name":"Storniert"}'),
	(5, 'de', '5', 'OFFLINE\\Mall\\Models\\OrderState', '{"name":"Abgeschlossen"}');
/*!40000 ALTER TABLE `rainlab_translate_attributes` ENABLE KEYS */;

-- membuang struktur untuk table koperasi_ngetos.rainlab_translate_indexes
DROP TABLE IF EXISTS `rainlab_translate_indexes`;
CREATE TABLE IF NOT EXISTS `rainlab_translate_indexes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `item` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `rainlab_translate_indexes_locale_index` (`locale`),
  KEY `rainlab_translate_indexes_model_id_index` (`model_id`),
  KEY `rainlab_translate_indexes_model_type_index` (`model_type`),
  KEY `rainlab_translate_indexes_item_index` (`item`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Membuang data untuk tabel koperasi_ngetos.rainlab_translate_indexes: ~0 rows (lebih kurang)
/*!40000 ALTER TABLE `rainlab_translate_indexes` DISABLE KEYS */;
/*!40000 ALTER TABLE `rainlab_translate_indexes` ENABLE KEYS */;

-- membuang struktur untuk table koperasi_ngetos.rainlab_translate_locales
DROP TABLE IF EXISTS `rainlab_translate_locales`;
CREATE TABLE IF NOT EXISTS `rainlab_translate_locales` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT '0',
  `is_enabled` tinyint(1) NOT NULL DEFAULT '0',
  `sort_order` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `rainlab_translate_locales_code_index` (`code`),
  KEY `rainlab_translate_locales_name_index` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Membuang data untuk tabel koperasi_ngetos.rainlab_translate_locales: ~1 rows (lebih kurang)
/*!40000 ALTER TABLE `rainlab_translate_locales` DISABLE KEYS */;
INSERT INTO `rainlab_translate_locales` (`id`, `code`, `name`, `is_default`, `is_enabled`, `sort_order`) VALUES
	(1, 'en', 'English', 1, 1, 1);
/*!40000 ALTER TABLE `rainlab_translate_locales` ENABLE KEYS */;

-- membuang struktur untuk table koperasi_ngetos.rainlab_translate_messages
DROP TABLE IF EXISTS `rainlab_translate_messages`;
CREATE TABLE IF NOT EXISTS `rainlab_translate_messages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message_data` mediumtext COLLATE utf8mb4_unicode_ci,
  `found` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `rainlab_translate_messages_code_index` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Membuang data untuk tabel koperasi_ngetos.rainlab_translate_messages: ~0 rows (lebih kurang)
/*!40000 ALTER TABLE `rainlab_translate_messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `rainlab_translate_messages` ENABLE KEYS */;

-- membuang struktur untuk table koperasi_ngetos.sessions
DROP TABLE IF EXISTS `sessions`;
CREATE TABLE IF NOT EXISTS `sessions` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` text COLLATE utf8mb4_unicode_ci,
  `last_activity` int(11) DEFAULT NULL,
  `user_id` int(10) unsigned DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  UNIQUE KEY `sessions_id_unique` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Membuang data untuk tabel koperasi_ngetos.sessions: ~0 rows (lebih kurang)
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;

-- membuang struktur untuk table koperasi_ngetos.system_event_logs
DROP TABLE IF EXISTS `system_event_logs`;
CREATE TABLE IF NOT EXISTS `system_event_logs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `level` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` text COLLATE utf8mb4_unicode_ci,
  `details` mediumtext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `system_event_logs_level_index` (`level`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Membuang data untuk tabel koperasi_ngetos.system_event_logs: ~0 rows (lebih kurang)
/*!40000 ALTER TABLE `system_event_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `system_event_logs` ENABLE KEYS */;

-- membuang struktur untuk table koperasi_ngetos.system_files
DROP TABLE IF EXISTS `system_files`;
CREATE TABLE IF NOT EXISTS `system_files` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `disk_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_size` int(11) NOT NULL,
  `content_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `field` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attachment_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attachment_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_public` tinyint(1) NOT NULL DEFAULT '1',
  `sort_order` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `system_files_field_index` (`field`),
  KEY `system_files_attachment_id_index` (`attachment_id`),
  KEY `system_files_attachment_type_index` (`attachment_type`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Membuang data untuk tabel koperasi_ngetos.system_files: ~5 rows (lebih kurang)
/*!40000 ALTER TABLE `system_files` DISABLE KEYS */;
INSERT INTO `system_files` (`id`, `disk_name`, `file_name`, `file_size`, `content_type`, `title`, `description`, `field`, `attachment_id`, `attachment_type`, `is_public`, `sort_order`, `created_at`, `updated_at`) VALUES
	(1, '5ffd68997cd0b741113980.jpg', '_DSC0125.JPG', 3982401, 'image/jpeg', NULL, NULL, 'images', '1', 'mall.imageset', 1, 1, '2021-01-12 09:15:05', '2021-01-12 09:15:14'),
	(2, '5ffd68a032618507828539.png', '410-4107210_glitch-png.png', 1174699, 'image/png', NULL, NULL, 'images', '1', 'mall.imageset', 1, 2, '2021-01-12 09:15:12', '2021-01-12 09:15:14'),
	(3, '600dadb74bffe898393371.png', '1517449362-logo-unmuh-1912-(2).png', 245735, 'image/png', NULL, NULL, 'logo', '6', 'Backend\\Models\\BrandSetting', 1, 3, '2021-01-24 17:26:15', '2021-01-24 17:27:04'),
	(4, '600dadc19c317877607548.png', '1517449362-logo-unmuh-1912-(2).png', 245735, 'image/png', NULL, NULL, 'favicon', '6', 'Backend\\Models\\BrandSetting', 1, 4, '2021-01-24 17:26:25', '2021-01-24 17:27:04'),
	(5, '6010bf815ed1f223222419.docx', '1 UAS ASD - BINAR WANANDI PUTRA 20533322 PROSUS.docx', 81572, 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', NULL, NULL, 'file', '1', 'Bama\\Ormawa\\Models\\Laporan', 1, 5, '2021-01-27 01:18:57', '2021-01-27 01:18:59');
/*!40000 ALTER TABLE `system_files` ENABLE KEYS */;

-- membuang struktur untuk table koperasi_ngetos.system_mail_layouts
DROP TABLE IF EXISTS `system_mail_layouts`;
CREATE TABLE IF NOT EXISTS `system_mail_layouts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content_html` text COLLATE utf8mb4_unicode_ci,
  `content_text` text COLLATE utf8mb4_unicode_ci,
  `content_css` text COLLATE utf8mb4_unicode_ci,
  `is_locked` tinyint(1) NOT NULL DEFAULT '0',
  `options` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Membuang data untuk tabel koperasi_ngetos.system_mail_layouts: ~2 rows (lebih kurang)
/*!40000 ALTER TABLE `system_mail_layouts` DISABLE KEYS */;
INSERT INTO `system_mail_layouts` (`id`, `name`, `code`, `content_html`, `content_text`, `content_css`, `is_locked`, `options`, `created_at`, `updated_at`) VALUES
	(1, 'Default layout', 'default', '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">\n<html xmlns="http://www.w3.org/1999/xhtml">\n<head>\n    <meta name="viewport" content="width=device-width, initial-scale=1.0" />\n    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />\n</head>\n<body>\n    <style type="text/css" media="screen">\n        {{ brandCss|raw }}\n        {{ css|raw }}\n    </style>\n\n    <table class="wrapper layout-default" width="100%" cellpadding="0" cellspacing="0">\n\n        <!-- Header -->\n        {% partial \'header\' body %}\n            {{ subject|raw }}\n        {% endpartial %}\n\n        <tr>\n            <td align="center">\n                <table class="content" width="100%" cellpadding="0" cellspacing="0">\n                    <!-- Email Body -->\n                    <tr>\n                        <td class="body" width="100%" cellpadding="0" cellspacing="0">\n                            <table class="inner-body" align="center" width="570" cellpadding="0" cellspacing="0">\n                                <!-- Body content -->\n                                <tr>\n                                    <td class="content-cell">\n                                        {{ content|raw }}\n                                    </td>\n                                </tr>\n                            </table>\n                        </td>\n                    </tr>\n                </table>\n            </td>\n        </tr>\n\n        <!-- Footer -->\n        {% partial \'footer\' body %}\n            &copy; {{ "now"|date("Y") }} {{ appName }}. All rights reserved.\n        {% endpartial %}\n\n    </table>\n\n</body>\n</html>', '{{ content|raw }}', '@media only screen and (max-width: 600px) {\n    .inner-body {\n        width: 100% !important;\n    }\n\n    .footer {\n        width: 100% !important;\n    }\n}\n\n@media only screen and (max-width: 500px) {\n    .button {\n        width: 100% !important;\n    }\n}', 1, NULL, '2021-01-06 19:01:50', '2021-01-06 19:01:50'),
	(2, 'System layout', 'system', '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">\n<html xmlns="http://www.w3.org/1999/xhtml">\n<head>\n    <meta name="viewport" content="width=device-width, initial-scale=1.0" />\n    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />\n</head>\n<body>\n    <style type="text/css" media="screen">\n        {{ brandCss|raw }}\n        {{ css|raw }}\n    </style>\n\n    <table class="wrapper layout-system" width="100%" cellpadding="0" cellspacing="0">\n        <tr>\n            <td align="center">\n                <table class="content" width="100%" cellpadding="0" cellspacing="0">\n                    <!-- Email Body -->\n                    <tr>\n                        <td class="body" width="100%" cellpadding="0" cellspacing="0">\n                            <table class="inner-body" align="center" width="570" cellpadding="0" cellspacing="0">\n                                <!-- Body content -->\n                                <tr>\n                                    <td class="content-cell">\n                                        {{ content|raw }}\n\n                                        <!-- Subcopy -->\n                                        {% partial \'subcopy\' body %}\n                                            **This is an automatic message. Please do not reply to it.**\n                                        {% endpartial %}\n                                    </td>\n                                </tr>\n                            </table>\n                        </td>\n                    </tr>\n                </table>\n            </td>\n        </tr>\n    </table>\n\n</body>\n</html>', '{{ content|raw }}\n\n\n---\nThis is an automatic message. Please do not reply to it.', '@media only screen and (max-width: 600px) {\n    .inner-body {\n        width: 100% !important;\n    }\n\n    .footer {\n        width: 100% !important;\n    }\n}\n\n@media only screen and (max-width: 500px) {\n    .button {\n        width: 100% !important;\n    }\n}', 1, NULL, '2021-01-06 19:01:50', '2021-01-06 19:01:50');
/*!40000 ALTER TABLE `system_mail_layouts` ENABLE KEYS */;

-- membuang struktur untuk table koperasi_ngetos.system_mail_partials
DROP TABLE IF EXISTS `system_mail_partials`;
CREATE TABLE IF NOT EXISTS `system_mail_partials` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content_html` text COLLATE utf8mb4_unicode_ci,
  `content_text` text COLLATE utf8mb4_unicode_ci,
  `is_custom` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Membuang data untuk tabel koperasi_ngetos.system_mail_partials: ~0 rows (lebih kurang)
/*!40000 ALTER TABLE `system_mail_partials` DISABLE KEYS */;
/*!40000 ALTER TABLE `system_mail_partials` ENABLE KEYS */;

-- membuang struktur untuk table koperasi_ngetos.system_mail_templates
DROP TABLE IF EXISTS `system_mail_templates`;
CREATE TABLE IF NOT EXISTS `system_mail_templates` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `content_html` text COLLATE utf8mb4_unicode_ci,
  `content_text` text COLLATE utf8mb4_unicode_ci,
  `layout_id` int(11) DEFAULT NULL,
  `is_custom` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `system_mail_templates_layout_id_index` (`layout_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Membuang data untuk tabel koperasi_ngetos.system_mail_templates: ~0 rows (lebih kurang)
/*!40000 ALTER TABLE `system_mail_templates` DISABLE KEYS */;
/*!40000 ALTER TABLE `system_mail_templates` ENABLE KEYS */;

-- membuang struktur untuk table koperasi_ngetos.system_parameters
DROP TABLE IF EXISTS `system_parameters`;
CREATE TABLE IF NOT EXISTS `system_parameters` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `namespace` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `group` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `item` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `item_index` (`namespace`,`group`,`item`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Membuang data untuk tabel koperasi_ngetos.system_parameters: ~6 rows (lebih kurang)
/*!40000 ALTER TABLE `system_parameters` DISABLE KEYS */;
INSERT INTO `system_parameters` (`id`, `namespace`, `group`, `item`, `value`) VALUES
	(1, 'system', 'update', 'count', '0'),
	(2, 'system', 'core', 'hash', '"09e97b374096a78701452e3faa8ceba1"'),
	(3, 'system', 'core', 'build', '"471"'),
	(4, 'system', 'update', 'retry', '1611786156'),
	(5, 'system', 'theme', 'history', '{"Responsiv.Flat":"responsiv-flat","OFFLINE.oc-mall-theme":"offline-oc-mall-theme","BABA.adminlte":"baba-adminlte","Vreedom18.bingo":"vreedom18-bingo"}'),
	(6, 'cms', 'theme', 'active', '"vreedom18-bingo"');
/*!40000 ALTER TABLE `system_parameters` ENABLE KEYS */;

-- membuang struktur untuk table koperasi_ngetos.system_plugin_history
DROP TABLE IF EXISTS `system_plugin_history`;
CREATE TABLE IF NOT EXISTS `system_plugin_history` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `version` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `detail` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `system_plugin_history_code_index` (`code`),
  KEY `system_plugin_history_type_index` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=830 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Membuang data untuk tabel koperasi_ngetos.system_plugin_history: ~156 rows (lebih kurang)
/*!40000 ALTER TABLE `system_plugin_history` DISABLE KEYS */;
INSERT INTO `system_plugin_history` (`id`, `code`, `type`, `version`, `detail`, `created_at`) VALUES
	(1, 'October.Demo', 'comment', '1.0.1', 'First version of Demo', '2021-01-06 19:01:50'),
	(107, 'RainLab.Translate', 'script', '1.0.1', 'create_messages_table.php', '2021-01-12 09:09:24'),
	(108, 'RainLab.Translate', 'script', '1.0.1', 'create_attributes_table.php', '2021-01-12 09:09:24'),
	(109, 'RainLab.Translate', 'script', '1.0.1', 'create_locales_table.php', '2021-01-12 09:09:24'),
	(110, 'RainLab.Translate', 'comment', '1.0.1', 'First version of Translate', '2021-01-12 09:09:24'),
	(111, 'RainLab.Translate', 'comment', '1.0.2', 'Languages and Messages can now be deleted.', '2021-01-12 09:09:24'),
	(112, 'RainLab.Translate', 'comment', '1.0.3', 'Minor updates for latest October release.', '2021-01-12 09:09:24'),
	(113, 'RainLab.Translate', 'comment', '1.0.4', 'Locale cache will clear when updating a language.', '2021-01-12 09:09:24'),
	(114, 'RainLab.Translate', 'comment', '1.0.5', 'Add Spanish language and fix plugin config.', '2021-01-12 09:09:24'),
	(115, 'RainLab.Translate', 'comment', '1.0.6', 'Minor improvements to the code.', '2021-01-12 09:09:24'),
	(116, 'RainLab.Translate', 'comment', '1.0.7', 'Fixes major bug where translations are skipped entirely!', '2021-01-12 09:09:24'),
	(117, 'RainLab.Translate', 'comment', '1.0.8', 'Minor bug fixes.', '2021-01-12 09:09:24'),
	(118, 'RainLab.Translate', 'comment', '1.0.9', 'Fixes an issue where newly created models lose their translated values.', '2021-01-12 09:09:24'),
	(119, 'RainLab.Translate', 'comment', '1.0.10', 'Minor fix for latest build.', '2021-01-12 09:09:24'),
	(120, 'RainLab.Translate', 'comment', '1.0.11', 'Fix multilingual rich editor when used in stretch mode.', '2021-01-12 09:09:24'),
	(121, 'RainLab.Translate', 'comment', '1.1.0', 'Introduce compatibility with RainLab.Pages plugin.', '2021-01-12 09:09:24'),
	(122, 'RainLab.Translate', 'comment', '1.1.1', 'Minor UI fix to the language picker.', '2021-01-12 09:09:24'),
	(123, 'RainLab.Translate', 'comment', '1.1.2', 'Add support for translating Static Content files.', '2021-01-12 09:09:24'),
	(124, 'RainLab.Translate', 'comment', '1.1.3', 'Improved support for the multilingual rich editor.', '2021-01-12 09:09:24'),
	(125, 'RainLab.Translate', 'comment', '1.1.4', 'Adds new multilingual markdown editor.', '2021-01-12 09:09:24'),
	(126, 'RainLab.Translate', 'comment', '1.1.5', 'Minor update to the multilingual control API.', '2021-01-12 09:09:24'),
	(127, 'RainLab.Translate', 'comment', '1.1.6', 'Minor improvements in the message editor.', '2021-01-12 09:09:24'),
	(128, 'RainLab.Translate', 'comment', '1.1.7', 'Fixes bug not showing content when first loading multilingual textarea controls.', '2021-01-12 09:09:24'),
	(129, 'RainLab.Translate', 'comment', '1.2.0', 'CMS pages now support translating the URL.', '2021-01-12 09:09:24'),
	(130, 'RainLab.Translate', 'comment', '1.2.1', 'Minor update in the rich editor and code editor language control position.', '2021-01-12 09:09:24'),
	(131, 'RainLab.Translate', 'comment', '1.2.2', 'Static Pages now support translating the URL.', '2021-01-12 09:09:24'),
	(132, 'RainLab.Translate', 'comment', '1.2.3', 'Fixes Rich Editor when inserting a page link.', '2021-01-12 09:09:24'),
	(133, 'RainLab.Translate', 'script', '1.2.4', 'create_indexes_table.php', '2021-01-12 09:09:24'),
	(134, 'RainLab.Translate', 'comment', '1.2.4', 'Translatable attributes can now be declared as indexes.', '2021-01-12 09:09:24'),
	(135, 'RainLab.Translate', 'comment', '1.2.5', 'Adds new multilingual repeater form widget.', '2021-01-12 09:09:24'),
	(136, 'RainLab.Translate', 'comment', '1.2.6', 'Fixes repeater usage with static pages plugin.', '2021-01-12 09:09:24'),
	(137, 'RainLab.Translate', 'comment', '1.2.7', 'Fixes placeholder usage with static pages plugin.', '2021-01-12 09:09:24'),
	(138, 'RainLab.Translate', 'comment', '1.2.8', 'Improvements to code for latest October build compatibility.', '2021-01-12 09:09:24'),
	(139, 'RainLab.Translate', 'comment', '1.2.9', 'Fixes context for translated strings when used with Static Pages.', '2021-01-12 09:09:24'),
	(140, 'RainLab.Translate', 'comment', '1.2.10', 'Minor UI fix to the multilingual repeater.', '2021-01-12 09:09:24'),
	(141, 'RainLab.Translate', 'comment', '1.2.11', 'Fixes translation not working with partials loaded via AJAX.', '2021-01-12 09:09:24'),
	(142, 'RainLab.Translate', 'comment', '1.2.12', 'Add support for translating the new grouped repeater feature.', '2021-01-12 09:09:24'),
	(143, 'RainLab.Translate', 'comment', '1.3.0', 'Added search to the translate messages page.', '2021-01-12 09:09:24'),
	(144, 'RainLab.Translate', 'script', '1.3.1', 'builder_table_update_rainlab_translate_locales.php', '2021-01-12 09:09:24'),
	(145, 'RainLab.Translate', 'script', '1.3.1', 'seed_all_tables.php', '2021-01-12 09:09:24'),
	(146, 'RainLab.Translate', 'comment', '1.3.1', 'Added reordering to languages', '2021-01-12 09:09:24'),
	(147, 'RainLab.Translate', 'comment', '1.3.2', 'Improved compatibility with RainLab.Pages, added ability to scan Mail Messages for translatable variables.', '2021-01-12 09:09:24'),
	(148, 'RainLab.Translate', 'comment', '1.3.3', 'Fix to the locale picker session handling in Build 420 onwards.', '2021-01-12 09:09:24'),
	(149, 'RainLab.Translate', 'comment', '1.3.4', 'Add alternate hreflang elements and adds prefixDefaultLocale setting.', '2021-01-12 09:09:24'),
	(150, 'RainLab.Translate', 'comment', '1.3.5', 'Fix MLRepeater bug when switching locales.', '2021-01-12 09:09:25'),
	(151, 'RainLab.Translate', 'comment', '1.3.6', 'Fix Middleware to use the prefixDefaultLocale setting introduced in 1.3.4', '2021-01-12 09:09:25'),
	(152, 'RainLab.Translate', 'comment', '1.3.7', 'Fix config reference in LocaleMiddleware', '2021-01-12 09:09:25'),
	(153, 'RainLab.Translate', 'comment', '1.3.8', 'Keep query string when switching locales', '2021-01-12 09:09:25'),
	(154, 'RainLab.Translate', 'comment', '1.4.0', 'Add importer and exporter for messages', '2021-01-12 09:09:25'),
	(155, 'RainLab.Translate', 'comment', '1.4.1', 'Updated Hungarian translation. Added Arabic translation. Fixed issue where default texts are overwritten by import. Fixed issue where the language switcher for repeater fields would overlap with the first repeater row.', '2021-01-12 09:09:25'),
	(156, 'RainLab.Translate', 'comment', '1.4.2', 'Add multilingual MediaFinder', '2021-01-12 09:09:25'),
	(157, 'RainLab.Translate', 'comment', '1.4.3', '!!! Please update OctoberCMS to Build 444 before updating this plugin. Added ability to translate CMS Pages fields (e.g. title, description, meta-title, meta-description)', '2021-01-12 09:09:25'),
	(158, 'RainLab.Translate', 'comment', '1.4.4', 'Minor improvements to compatibility with Laravel framework.', '2021-01-12 09:09:25'),
	(159, 'RainLab.Translate', 'comment', '1.4.5', 'Fixed issue when using the language switcher', '2021-01-12 09:09:25'),
	(160, 'RainLab.Translate', 'comment', '1.5.0', 'Compatibility fix with Build 451', '2021-01-12 09:09:25'),
	(161, 'RainLab.Translate', 'comment', '1.6.0', 'Make File Upload widget properties translatable. Merge Repeater core changes into MLRepeater widget. Add getter method to retrieve original translate data.', '2021-01-12 09:09:25'),
	(162, 'RainLab.Translate', 'comment', '1.6.1', 'Add ability for models to provide translated computed data, add option to disable locale prefix routing', '2021-01-12 09:09:25'),
	(163, 'RainLab.Translate', 'comment', '1.6.2', 'Implement localeUrl filter, add per-locale theme configuration support', '2021-01-12 09:09:25'),
	(164, 'RainLab.Translate', 'comment', '1.6.3', 'Add eager loading for translations, restore support for accessors & mutators', '2021-01-12 09:09:25'),
	(165, 'RainLab.Translate', 'comment', '1.6.4', 'Fixes PHP 7.4 compatibility', '2021-01-12 09:09:25'),
	(166, 'RainLab.Translate', 'comment', '1.6.5', 'Fixes compatibility issue when other plugins use a custom model morph map', '2021-01-12 09:09:25'),
	(167, 'RainLab.Translate', 'script', '1.6.6', 'migrate_morphed_attributes.php', '2021-01-12 09:09:25'),
	(168, 'RainLab.Translate', 'comment', '1.6.6', 'Introduce migration to patch existing translations using morph map', '2021-01-12 09:09:25'),
	(169, 'RainLab.Translate', 'script', '1.6.7', 'migrate_morphed_indexes.php', '2021-01-12 09:09:25'),
	(170, 'RainLab.Translate', 'comment', '1.6.7', 'Introduce migration to patch existing indexes using morph map', '2021-01-12 09:09:25'),
	(171, 'RainLab.Translate', 'comment', '1.6.8', 'Add support for transOrderBy; Add translation support for ThemeData; Update russian localization.', '2021-01-12 09:09:25'),
	(172, 'RainLab.Translate', 'comment', '1.6.9', 'Clear Static Page menu cache after saving the model; CSS fix for Text/Textarea input fields language selector.', '2021-01-12 09:09:25'),
	(173, 'RainLab.Translate', 'script', '1.6.10', 'update_messages_table.php', '2021-01-12 09:09:25'),
	(174, 'RainLab.Translate', 'comment', '1.6.10', 'Add option to purge deleted messages when scanning messages', '2021-01-12 09:09:25'),
	(175, 'RainLab.Translate', 'comment', '1.6.10', 'Add Scan error column on Messages page', '2021-01-12 09:09:25'),
	(176, 'RainLab.Translate', 'comment', '1.6.10', 'Fix translations that were lost when clicking locale twice while holding ctrl key', '2021-01-12 09:09:25'),
	(177, 'RainLab.Translate', 'comment', '1.6.10', 'Fix error with nested fields default locale value', '2021-01-12 09:09:25'),
	(178, 'RainLab.Translate', 'comment', '1.6.10', 'Escape Message translate params value', '2021-01-12 09:09:25'),
	(179, 'RainLab.Translate', 'comment', '1.7.0', '!!! Breaking change for the Message::trans() method (params are now escaped)', '2021-01-12 09:09:25'),
	(180, 'RainLab.Translate', 'comment', '1.7.0', 'fix message translation documentation', '2021-01-12 09:09:25'),
	(181, 'RainLab.Translate', 'comment', '1.7.0', 'fix string translation key for scan errors column header', '2021-01-12 09:09:25'),
	(182, 'RainLab.Translate', 'comment', '1.7.1', 'Fix YAML issue with previous tag/release.', '2021-01-12 09:09:25'),
	(183, 'RainLab.Translate', 'comment', '1.7.2', 'Fix regex when "|_" filter is followed by another filter', '2021-01-12 09:09:25'),
	(184, 'RainLab.Translate', 'comment', '1.7.2', 'Try locale without country before returning default translation', '2021-01-12 09:09:25'),
	(185, 'RainLab.Translate', 'comment', '1.7.2', 'Allow exporting default locale', '2021-01-12 09:09:25'),
	(186, 'RainLab.Translate', 'comment', '1.7.2', 'Fire \'rainlab.translate.themeScanner.afterScan\' event in the theme scanner for extendability', '2021-01-12 09:09:25'),
	(187, 'RainLab.Translate', 'comment', '1.7.3', 'Make plugin ready for Laravel 6 update', '2021-01-12 09:09:25'),
	(188, 'RainLab.Translate', 'comment', '1.7.3', 'Add support for translating RainLab.Pages MenuItem properties (requires RainLab.Pages v1.3.6)', '2021-01-12 09:09:25'),
	(189, 'RainLab.Translate', 'comment', '1.7.3', 'Restore multilingual button position for textarea', '2021-01-12 09:09:25'),
	(190, 'RainLab.Translate', 'comment', '1.7.3', 'Fix translatableAttributes', '2021-01-12 09:09:25'),
	(191, 'RainLab.Translate', 'comment', '1.7.4', 'Faster version of transWhere', '2021-01-12 09:09:25'),
	(192, 'RainLab.Translate', 'comment', '1.7.4', 'Mail templates/views can now be localized', '2021-01-12 09:09:25'),
	(193, 'RainLab.Translate', 'comment', '1.7.4', 'Fix messages table layout on mobile', '2021-01-12 09:09:25'),
	(194, 'RainLab.Translate', 'comment', '1.7.4', 'Fix scopeTransOrderBy duplicates', '2021-01-12 09:09:25'),
	(195, 'RainLab.Translate', 'comment', '1.7.4', 'Polish localization updates', '2021-01-12 09:09:25'),
	(196, 'RainLab.Translate', 'comment', '1.7.4', 'Turkish localization updates', '2021-01-12 09:09:25'),
	(197, 'RainLab.Translate', 'comment', '1.7.4', 'Add Greek language localization', '2021-01-12 09:09:25'),
	(650, 'Bama.Ormawa', 'comment', '1.0.1', 'Initialize plugin.', '2021-01-24 15:41:33'),
	(651, 'Bama.Ormawa', 'script', '1.0.2', 'builder_table_create_bama_ormawa_kegiatan.php', '2021-01-24 15:45:03'),
	(652, 'Bama.Ormawa', 'comment', '1.0.2', 'Created table bama_ormawa_kegiatan', '2021-01-24 15:45:03'),
	(653, 'Bama.Ormawa', 'script', '1.0.3', 'builder_table_create_bama_ormawa_laporan.php', '2021-01-24 15:50:55'),
	(654, 'Bama.Ormawa', 'comment', '1.0.3', 'Created table bama_ormawa_laporan', '2021-01-24 15:50:55'),
	(771, 'RainLab.Blog', 'script', '1.0.1', 'create_posts_table.php', '2021-01-24 17:24:08'),
	(772, 'RainLab.Blog', 'script', '1.0.1', 'create_categories_table.php', '2021-01-24 17:24:08'),
	(773, 'RainLab.Blog', 'script', '1.0.1', 'seed_all_tables.php', '2021-01-24 17:24:08'),
	(774, 'RainLab.Blog', 'comment', '1.0.1', 'Initialize plugin.', '2021-01-24 17:24:08'),
	(775, 'RainLab.Blog', 'comment', '1.0.2', 'Added the processed HTML content column to the posts table.', '2021-01-24 17:24:08'),
	(776, 'RainLab.Blog', 'comment', '1.0.3', 'Category component has been merged with Posts component.', '2021-01-24 17:24:08'),
	(777, 'RainLab.Blog', 'comment', '1.0.4', 'Improvements to the Posts list management UI.', '2021-01-24 17:24:08'),
	(778, 'RainLab.Blog', 'comment', '1.0.5', 'Removes the Author column from blog post list.', '2021-01-24 17:24:08'),
	(779, 'RainLab.Blog', 'comment', '1.0.6', 'Featured images now appear in the Post component.', '2021-01-24 17:24:08'),
	(780, 'RainLab.Blog', 'comment', '1.0.7', 'Added support for the Static Pages menus.', '2021-01-24 17:24:08'),
	(781, 'RainLab.Blog', 'comment', '1.0.8', 'Added total posts to category list.', '2021-01-24 17:24:08'),
	(782, 'RainLab.Blog', 'comment', '1.0.9', 'Added support for the Sitemap plugin.', '2021-01-24 17:24:08'),
	(783, 'RainLab.Blog', 'comment', '1.0.10', 'Added permission to prevent users from seeing posts they did not create.', '2021-01-24 17:24:08'),
	(784, 'RainLab.Blog', 'comment', '1.0.11', 'Deprecate "idParam" component property in favour of "slug" property.', '2021-01-24 17:24:08'),
	(785, 'RainLab.Blog', 'comment', '1.0.12', 'Fixes issue where images cannot be uploaded caused by latest Markdown library.', '2021-01-24 17:24:08'),
	(786, 'RainLab.Blog', 'comment', '1.0.13', 'Fixes problem with providing pages to Sitemap and Pages plugins.', '2021-01-24 17:24:08'),
	(787, 'RainLab.Blog', 'comment', '1.0.14', 'Add support for CSRF protection feature added to core.', '2021-01-24 17:24:08'),
	(788, 'RainLab.Blog', 'comment', '1.1.0', 'Replaced the Post editor with the new core Markdown editor.', '2021-01-24 17:24:08'),
	(789, 'RainLab.Blog', 'comment', '1.1.1', 'Posts can now be imported and exported.', '2021-01-24 17:24:08'),
	(790, 'RainLab.Blog', 'comment', '1.1.2', 'Posts are no longer visible if the published date has not passed.', '2021-01-24 17:24:08'),
	(791, 'RainLab.Blog', 'comment', '1.1.3', 'Added a New Post shortcut button to the blog menu.', '2021-01-24 17:24:08'),
	(792, 'RainLab.Blog', 'script', '1.2.0', 'categories_add_nested_fields.php', '2021-01-24 17:24:08'),
	(793, 'RainLab.Blog', 'comment', '1.2.0', 'Categories now support nesting.', '2021-01-24 17:24:08'),
	(794, 'RainLab.Blog', 'comment', '1.2.1', 'Post slugs now must be unique.', '2021-01-24 17:24:08'),
	(795, 'RainLab.Blog', 'comment', '1.2.2', 'Fixes issue on new installs.', '2021-01-24 17:24:08'),
	(796, 'RainLab.Blog', 'comment', '1.2.3', 'Minor user interface update.', '2021-01-24 17:24:08'),
	(797, 'RainLab.Blog', 'script', '1.2.4', 'update_timestamp_nullable.php', '2021-01-24 17:24:08'),
	(798, 'RainLab.Blog', 'comment', '1.2.4', 'Database maintenance. Updated all timestamp columns to be nullable.', '2021-01-24 17:24:08'),
	(799, 'RainLab.Blog', 'comment', '1.2.5', 'Added translation support for blog posts.', '2021-01-24 17:24:08'),
	(800, 'RainLab.Blog', 'comment', '1.2.6', 'The published field can now supply a time with the date.', '2021-01-24 17:24:08'),
	(801, 'RainLab.Blog', 'comment', '1.2.7', 'Introduced a new RSS feed component.', '2021-01-24 17:24:08'),
	(802, 'RainLab.Blog', 'comment', '1.2.8', 'Fixes issue with translated `content_html` attribute on blog posts.', '2021-01-24 17:24:08'),
	(803, 'RainLab.Blog', 'comment', '1.2.9', 'Added translation support for blog categories.', '2021-01-24 17:24:08'),
	(804, 'RainLab.Blog', 'comment', '1.2.10', 'Added translation support for post slugs.', '2021-01-24 17:24:08'),
	(805, 'RainLab.Blog', 'comment', '1.2.11', 'Fixes bug where excerpt is not translated.', '2021-01-24 17:24:08'),
	(806, 'RainLab.Blog', 'comment', '1.2.12', 'Description field added to category form.', '2021-01-24 17:24:08'),
	(807, 'RainLab.Blog', 'comment', '1.2.13', 'Improved support for Static Pages menus, added a blog post and all blog posts.', '2021-01-24 17:24:08'),
	(808, 'RainLab.Blog', 'comment', '1.2.14', 'Added post exception property to the post list component, useful for showing related posts.', '2021-01-24 17:24:08'),
	(809, 'RainLab.Blog', 'comment', '1.2.15', 'Back-end navigation sort order updated.', '2021-01-24 17:24:08'),
	(810, 'RainLab.Blog', 'comment', '1.2.16', 'Added `nextPost` and `previousPost` to the blog post component.', '2021-01-24 17:24:08'),
	(811, 'RainLab.Blog', 'comment', '1.2.17', 'Improved the next and previous logic to sort by the published date.', '2021-01-24 17:24:08'),
	(812, 'RainLab.Blog', 'comment', '1.2.18', 'Minor change to internals.', '2021-01-24 17:24:08'),
	(813, 'RainLab.Blog', 'comment', '1.2.19', 'Improved support for Build 420+', '2021-01-24 17:24:09'),
	(814, 'RainLab.Blog', 'script', '1.3.0', 'posts_add_metadata.php', '2021-01-24 17:24:09'),
	(815, 'RainLab.Blog', 'comment', '1.3.0', 'Added metadata column for plugins to store data in', '2021-01-24 17:24:09'),
	(816, 'RainLab.Blog', 'comment', '1.3.1', 'Fixed metadata column not being jsonable', '2021-01-24 17:24:09'),
	(817, 'RainLab.Blog', 'comment', '1.3.2', 'Allow custom slug name for components, add 404 handling for missing blog posts, allow exporting of blog images.', '2021-01-24 17:24:09'),
	(818, 'RainLab.Blog', 'comment', '1.3.3', 'Fixed \'excluded categories\' filter from being run when value is empty.', '2021-01-24 17:24:09'),
	(819, 'RainLab.Blog', 'comment', '1.3.4', 'Allow post author to be specified. Improved translations.', '2021-01-24 17:24:09'),
	(820, 'RainLab.Blog', 'comment', '1.3.5', 'Fixed missing user info from breaking initial seeder in migrations. Fixed a PostgreSQL issue with blog exports.', '2021-01-24 17:24:09'),
	(821, 'RainLab.Blog', 'comment', '1.3.6', 'Improved French translations.', '2021-01-24 17:24:09'),
	(822, 'RainLab.Blog', 'comment', '1.4.0', 'Stability improvements. Rollback custom slug names for components', '2021-01-24 17:24:09'),
	(823, 'RainLab.Blog', 'comment', '1.4.1', 'Fixes potential security issue with unsafe Markdown. Allow blog bylines to be translated.', '2021-01-24 17:24:09'),
	(824, 'RainLab.Blog', 'comment', '1.4.2', 'Fix 404 redirects for missing blog posts. Assign current category to the listed posts when using the Posts component on a page with the category parameter available.', '2021-01-24 17:24:09'),
	(825, 'RainLab.Blog', 'comment', '1.4.3', 'Fixes incompatibility with locale switching when plugin is used in conjunction with the Translate plugin. Fixes undefined category error.', '2021-01-24 17:24:09'),
	(826, 'Bama.Ormawa', 'script', '1.0.4', 'builder_table_update_bama_ormawa_kegiatan.php', '2021-01-25 21:55:25'),
	(827, 'Bama.Ormawa', 'comment', '1.0.4', 'Updated table bama_ormawa_kegiatan', '2021-01-25 21:55:25'),
	(828, 'Bama.Ormawa', 'script', '1.0.5', 'builder_table_update_bama_ormawa_laporan.php', '2021-01-27 01:25:54'),
	(829, 'Bama.Ormawa', 'comment', '1.0.5', 'Updated table bama_ormawa_laporan', '2021-01-27 01:25:54');
/*!40000 ALTER TABLE `system_plugin_history` ENABLE KEYS */;

-- membuang struktur untuk table koperasi_ngetos.system_plugin_versions
DROP TABLE IF EXISTS `system_plugin_versions`;
CREATE TABLE IF NOT EXISTS `system_plugin_versions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `version` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `is_disabled` tinyint(1) NOT NULL DEFAULT '0',
  `is_frozen` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `system_plugin_versions_code_index` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Membuang data untuk tabel koperasi_ngetos.system_plugin_versions: ~4 rows (lebih kurang)
/*!40000 ALTER TABLE `system_plugin_versions` DISABLE KEYS */;
INSERT INTO `system_plugin_versions` (`id`, `code`, `version`, `created_at`, `is_disabled`, `is_frozen`) VALUES
	(1, 'October.Demo', '1.0.1', '2021-01-06 19:01:50', 0, 0),
	(5, 'RainLab.Translate', '1.7.4', '2021-01-12 09:09:25', 0, 0),
	(11, 'Bama.Ormawa', '1.0.5', '2021-01-27 01:25:54', 0, 0),
	(13, 'RainLab.Blog', '1.4.3', '2021-01-24 17:24:09', 0, 0);
/*!40000 ALTER TABLE `system_plugin_versions` ENABLE KEYS */;

-- membuang struktur untuk table koperasi_ngetos.system_request_logs
DROP TABLE IF EXISTS `system_request_logs`;
CREATE TABLE IF NOT EXISTS `system_request_logs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `status_code` int(11) DEFAULT NULL,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `referer` text COLLATE utf8mb4_unicode_ci,
  `count` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Membuang data untuk tabel koperasi_ngetos.system_request_logs: ~0 rows (lebih kurang)
/*!40000 ALTER TABLE `system_request_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `system_request_logs` ENABLE KEYS */;

-- membuang struktur untuk table koperasi_ngetos.system_revisions
DROP TABLE IF EXISTS `system_revisions`;
CREATE TABLE IF NOT EXISTS `system_revisions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned DEFAULT NULL,
  `field` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cast` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `old_value` text COLLATE utf8mb4_unicode_ci,
  `new_value` text COLLATE utf8mb4_unicode_ci,
  `revisionable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revisionable_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `system_revisions_revisionable_id_revisionable_type_index` (`revisionable_id`,`revisionable_type`),
  KEY `system_revisions_user_id_index` (`user_id`),
  KEY `system_revisions_field_index` (`field`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Membuang data untuk tabel koperasi_ngetos.system_revisions: ~0 rows (lebih kurang)
/*!40000 ALTER TABLE `system_revisions` DISABLE KEYS */;
/*!40000 ALTER TABLE `system_revisions` ENABLE KEYS */;

-- membuang struktur untuk table koperasi_ngetos.system_settings
DROP TABLE IF EXISTS `system_settings`;
CREATE TABLE IF NOT EXISTS `system_settings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `item` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `system_settings_item_index` (`item`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Membuang data untuk tabel koperasi_ngetos.system_settings: ~6 rows (lebih kurang)
/*!40000 ALTER TABLE `system_settings` DISABLE KEYS */;
INSERT INTO `system_settings` (`id`, `item`, `value`) VALUES
	(1, 'offline_mall_settings', '{"enabled":"1","moderated":"1","allow_anonymous":"1","use_state":"1","admin_email":"","index_driver":"database","product_page":"product","category_page":"category","address_page":"address","checkout_page":"checkout","account_page":"myaccount","cart_page":"cart","redirect_to_cart":"0","order_start":"","group_search_results_by_product":"0","shipping_selection_before_payment":"0"}'),
	(2, 'system_mail_settings', '{"send_mode":"log","sender_name":"OctoberCMS","sender_email":"noreply@domain.tld","sendmail_path":"\\/usr\\/sbin\\/sendmail -bs","smtp_address":"smtp.mailgun.org","smtp_port":"587","smtp_user":"","smtp_password":"","smtp_authorization":"0","smtp_encryption":"tls","mailgun_domain":"","mailgun_secret":"","mandrill_secret":"","ses_key":"","ses_secret":"","ses_region":"","sparkpost_secret":""}'),
	(3, 'rainlab_builder_settings', '{"author_name":"BAMA","author_namespace":"Bama"}'),
	(4, 'indikator_news_settings', '{"click_tracking":"0","email_view_tracking":"0","newsletter_double_opt_in":"0","show_posts":["1","3"],"statistic_show_posts":"1","statistic_show_mails":"1","statistic_show_longest_posts":"1","statistic_show_shortest_posts":"1","fields_slug":"1","fields_category":"0","fields_tags":"0","fields_author":"0","fields_seo":"0"}'),
	(5, 'cms_maintenance_settings', '{"is_enabled":"1","cms_page":"404.htm","theme_map":{"vreedom18-bingo":"404.htm"}}'),
	(6, 'backend_brand_settings', '{"app_name":"BAMA Universitas Muhammadiyah Ponorogo","app_tagline":"Login untuk mengakses","primary_color":"#4f5458","secondary_color":"#708598","accent_color":"#27ae60","menu_mode":"inline","custom_css":""}');
/*!40000 ALTER TABLE `system_settings` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
