-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 29. Jun 2023 um 22:45
-- Server-Version: 10.4.28-MariaDB
-- PHP-Version: 8.1.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `attractionland`
--
CREATE DATABASE IF NOT EXISTS `attractionland` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `attractionland`;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `attraction`
--

DROP TABLE IF EXISTS `attraction`;
CREATE TABLE `attraction` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `location` varchar(255) NOT NULL,
  `country` varchar(255) NOT NULL,
  `user_id_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Daten für Tabelle `attraction`
--

INSERT INTO `attraction` (`id`, `name`, `location`, `country`, `user_id_id`) VALUES
(1, 'Eiffel Tower', 'Paris', 'France', 1),
(2, 'Brandenburger Tor', 'Berlin', 'Germany', 1),
(3, 'Motherland Monument', 'Kyiv', 'Ukraine', 1),
(4, 'Tiannamen Square', 'Beijing', 'China', 2),
(5, 'Gateway Arch', 'St. Louis', 'USA', 2);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `doctrine_migration_versions`
--

DROP TABLE IF EXISTS `doctrine_migration_versions`;
CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Daten für Tabelle `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20230629182920', '2023-06-29 20:29:36', 67),
('DoctrineMigrations\\Version20230629183153', '2023-06-29 20:32:03', 13),
('DoctrineMigrations\\Version20230629195002', '2023-06-29 21:50:41', 171);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `messenger_messages`
--

DROP TABLE IF EXISTS `messenger_messages`;
CREATE TABLE `messenger_messages` (
  `id` bigint(20) NOT NULL,
  `body` longtext NOT NULL,
  `headers` longtext NOT NULL,
  `queue_name` varchar(190) NOT NULL,
  `created_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `available_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `delivered_at` datetime DEFAULT NULL COMMENT '(DC2Type:datetime_immutable)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(180) NOT NULL,
  `roles` longtext NOT NULL COMMENT '(DC2Type:json)',
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Daten für Tabelle `user`
--

INSERT INTO `user` (`id`, `username`, `roles`, `password`) VALUES
(1, 'Travelier', '[\"ROLE_ADMIN\"]', '$2y$13$P.ysDDO9Muk7qCYmVKfHb.E4aZp5grxZECFTKlduvtXSir8Ohb21W'),
(2, 'Cavy', '[\"ROLE_ADMIN\"]', '$2y$13$zdSNacwh49ann6.omiMMhewXT.kP1lj0K6VCUWCvvL/EtQnHwDBNq'),
(3, 'Rondo', '[\"ROLE_MEMBER\"]', '$2y$13$eTkthWlC0zu42edyTxqmzuaM.WXpCDaIadEMt.baIEpW1B4ILepS.');

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `attraction`
--
ALTER TABLE `attraction`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_D503E6B89D86650F` (`user_id_id`);

--
-- Indizes für die Tabelle `doctrine_migration_versions`
--
ALTER TABLE `doctrine_migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Indizes für die Tabelle `messenger_messages`
--
ALTER TABLE `messenger_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_75EA56E0FB7336F0` (`queue_name`),
  ADD KEY `IDX_75EA56E0E3BD61CE` (`available_at`),
  ADD KEY `IDX_75EA56E016BA31DB` (`delivered_at`);

--
-- Indizes für die Tabelle `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_8D93D649F85E0677` (`username`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `attraction`
--
ALTER TABLE `attraction`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT für Tabelle `messenger_messages`
--
ALTER TABLE `messenger_messages`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `attraction`
--
ALTER TABLE `attraction`
  ADD CONSTRAINT `FK_D503E6B89D86650F` FOREIGN KEY (`user_id_id`) REFERENCES `user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
