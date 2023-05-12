-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 94.23.90.14:3306
-- Czas generowania: 19 Kwi 2020, 17:18
-- Wersja serwera: 5.5.56-log
-- Wersja PHP: 7.4.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `db_52198`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `addon_account`
--

CREATE TABLE `addon_account` (
  `name` varchar(60) NOT NULL,
  `label` varchar(255) NOT NULL,
  `shared` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `addon_account`
--

INSERT INTO `addon_account` (`name`, `label`, `shared`) VALUES
('bank_savings', 'Bank Savings', 0),
('caution', 'Uwaga', 0),
('property_black_money', 'Mieszkanie na sprzedaz', 0),
('society_alfons', 'Alfons', 1),
('society_ambulance', 'EMS', 1),
('society_banker', 'Banker', 1),
('society_cardealer', 'Cardealer', 1),
('society_kasyno', 'kasyno', 1),
('society_mafia', 'Lertivo', 1),
('society_mecano', 'LSC', 1),
('society_police', 'LSPD', 1),
('society_psycho', 'Psycholog', 1),
('society_realestateagent', 'Agent immobilier', 1),
('society_taxi', 'Taxi', 1),
('society_vigne', 'Winiarnia', 1);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `addon_account_data`
--

CREATE TABLE `addon_account_data` (
  `id` int(11) NOT NULL,
  `account_name` varchar(255) DEFAULT NULL,
  `money` double NOT NULL,
  `owner` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `addon_account_data`
--

INSERT INTO `addon_account_data` (`id`, `account_name`, `money`, `owner`) VALUES
(1, 'society_ambulance', 1000, NULL),
(2, 'society_banker', 0, NULL),
(3, 'society_cardealer', 0, NULL),
(4, 'society_kasyno', 3000, NULL),
(5, 'society_mafia', 0, NULL),
(6, 'society_mecano', 4996, NULL),
(7, 'society_police', 4752, NULL),
(8, 'society_psycho', 0, NULL),
(9, 'society_realestateagent', 36250, NULL),
(10, 'society_taxi', 0, NULL),
(11, 'society_vigne', 0, NULL),
(12, 'caution', 0, 'steam:110000104eb808d'),
(13, 'property_black_money', 1345, 'steam:110000104eb808d'),
(14, 'bank_savings', 0, 'steam:110000104eb808d'),
(15, 'caution', 0, 'steam:110000114f63a7e'),
(16, 'bank_savings', 0, 'steam:110000114f63a7e'),
(17, 'property_black_money', 0, 'steam:110000114f63a7e'),
(18, 'caution', 0, 'steam:11000010fdc8544'),
(19, 'bank_savings', 0, 'steam:11000010fdc8544'),
(20, 'property_black_money', 0, 'steam:11000010fdc8544'),
(21, 'caution', 0, 'steam:11000010b79ecd4'),
(22, 'property_black_money', 0, 'steam:11000010b79ecd4'),
(23, 'bank_savings', 0, 'steam:11000010b79ecd4'),
(24, 'caution', 0, 'steam:110000111ee525f'),
(25, 'bank_savings', 0, 'steam:110000111ee525f'),
(26, 'property_black_money', 0, 'steam:110000111ee525f'),
(27, 'society_alfons', 5749, NULL);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `addon_inventory`
--

CREATE TABLE `addon_inventory` (
  `name` varchar(60) NOT NULL,
  `label` varchar(255) NOT NULL,
  `shared` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `addon_inventory`
--

INSERT INTO `addon_inventory` (`name`, `label`, `shared`) VALUES
('property', 'Mieszkanie', 0),
('society_alfons', 'Alfons', 1),
('society_ambulance', 'EMS', 1),
('society_cardealer', 'Cardealer', 1),
('society_kasyno', 'kasyno', 1),
('society_mafia', 'Lertivo', 1),
('society_mecano', 'LSC', 1),
('society_police', 'EMS', 1),
('society_psycho', 'Psycholog', 1),
('society_taxi', 'Taxi', 1),
('society_vigne', 'Winiarnia', 1);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `addon_inventory_items`
--

CREATE TABLE `addon_inventory_items` (
  `id` int(11) NOT NULL,
  `inventory_name` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `count` int(11) NOT NULL,
  `owner` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `addon_inventory_items`
--

INSERT INTO `addon_inventory_items` (`id`, `inventory_name`, `name`, `count`, `owner`) VALUES
(1, 'society_mecano', 'cola', 0, NULL),
(2, 'property', 'blackberry', 0, 'steam:110000104eb808d'),
(3, 'property', 'powiekszonymagazynek', 0, 'steam:110000104eb808d'),
(4, 'property', 'powerade', 1, 'steam:110000104eb808d'),
(5, 'property', 'karnet', 0, 'steam:110000104eb808d');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `baninfo`
--

CREATE TABLE `baninfo` (
  `id` int(11) NOT NULL,
  `license` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL,
  `identifier` varchar(25) COLLATE utf8mb4_bin DEFAULT NULL,
  `liveid` varchar(21) COLLATE utf8mb4_bin DEFAULT NULL,
  `xblid` varchar(21) COLLATE utf8mb4_bin DEFAULT NULL,
  `discord` varchar(30) COLLATE utf8mb4_bin DEFAULT NULL,
  `playerip` varchar(25) COLLATE utf8mb4_bin DEFAULT NULL,
  `playername` varchar(32) COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Zrzut danych tabeli `baninfo`
--

INSERT INTO `baninfo` (`id`, `license`, `identifier`, `liveid`, `xblid`, `discord`, `playerip`, `playername`) VALUES
(1, 'license:d6993df89691bb9c7ca8c5351563b0f98a86ce7f', 'steam:110000104eb808d', 'live:1055522535569222', 'xbl:2535416875077664', 'discord:695737500852945028', 'ip:51.91.21.135', 'Dario'),
(2, 'license:d6993df89691bb9c7ca8c5351563b0f98a86ce7f', 'steam:110000104eb808d', 'live:1055522535569222', 'xbl:2535416875077664', 'discord:695737500852945028', 'ip:51.91.21.135', 'Dario'),
(3, 'license:c6c74d7e7dea4d06bf5e7382056855740b711c47', 'steam:110000114f63a7e', 'live:844425244382961', 'xbl:2535458307857885', 'no info', 'ip:51.91.22.57', 'filo'),
(4, 'license:c6c74d7e7dea4d06bf5e7382056855740b711c47', 'steam:110000114f63a7e', 'live:844425244382961', 'xbl:2535458307857885', 'no info', 'ip:51.91.22.57', 'filo'),
(5, 'license:420eaff61b92d1024dfdb05aa8d307dd1a00ddbf', 'steam:11000010fdc8544', NULL, NULL, 'discord:412945553681285140', 'ip:178.235.147.162', 'Marcin'),
(6, 'license:420eaff61b92d1024dfdb05aa8d307dd1a00ddbf', 'steam:11000010fdc8544', NULL, NULL, 'discord:412945553681285140', 'ip:178.235.147.162', 'Marcin'),
(7, 'license:8b94be0ee303201075bb5d0a2726568ebc66d077', 'steam:110000111ee525f', 'live:985154141012605', 'xbl:2535426973245900', 'discord:457592929809203201', 'ip:89.64.17.247', 'Vicol'),
(8, 'license:8b94be0ee303201075bb5d0a2726568ebc66d077', 'steam:110000111ee525f', 'live:985154141012605', 'xbl:2535426973245900', 'discord:457592929809203201', 'ip:89.64.17.247', 'Vicol'),
(9, 'license:f91700810d68f34076c0b5f31a09877de0ef32e5', 'steam:11000010b79ecd4', 'live:844429068875746', 'xbl:2535431545849848', 'discord:411955728283205639', 'ip:89.64.17.247', 'QCK'),
(10, 'license:f91700810d68f34076c0b5f31a09877de0ef32e5', 'steam:11000010b79ecd4', 'live:844429068875746', 'xbl:2535431545849848', 'discord:411955728283205639', 'ip:89.64.17.247', 'QCK');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `banlist`
--

CREATE TABLE `banlist` (
  `license` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `identifier` varchar(25) COLLATE utf8mb4_bin DEFAULT NULL,
  `liveid` varchar(21) COLLATE utf8mb4_bin DEFAULT NULL,
  `xblid` varchar(21) COLLATE utf8mb4_bin DEFAULT NULL,
  `discord` varchar(30) COLLATE utf8mb4_bin DEFAULT NULL,
  `playerip` varchar(25) COLLATE utf8mb4_bin DEFAULT NULL,
  `targetplayername` varchar(32) COLLATE utf8mb4_bin DEFAULT NULL,
  `sourceplayername` varchar(32) COLLATE utf8mb4_bin DEFAULT NULL,
  `reason` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `timeat` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `expiration` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `permanent` int(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `banlisthistory`
--

CREATE TABLE `banlisthistory` (
  `id` int(11) NOT NULL,
  `license` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL,
  `identifier` varchar(25) COLLATE utf8mb4_bin DEFAULT NULL,
  `liveid` varchar(21) COLLATE utf8mb4_bin DEFAULT NULL,
  `xblid` varchar(21) COLLATE utf8mb4_bin DEFAULT NULL,
  `discord` varchar(30) COLLATE utf8mb4_bin DEFAULT NULL,
  `playerip` varchar(25) COLLATE utf8mb4_bin DEFAULT NULL,
  `targetplayername` varchar(32) COLLATE utf8mb4_bin DEFAULT NULL,
  `sourceplayername` varchar(32) COLLATE utf8mb4_bin DEFAULT NULL,
  `reason` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `timeat` int(11) NOT NULL,
  `added` varchar(40) COLLATE utf8mb4_bin NOT NULL,
  `expiration` int(11) NOT NULL,
  `permanent` int(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `billing`
--

CREATE TABLE `billing` (
  `id` int(11) NOT NULL,
  `identifier` varchar(255) NOT NULL,
  `sender` varchar(255) NOT NULL,
  `target_type` varchar(50) NOT NULL,
  `target` varchar(255) NOT NULL,
  `label` varchar(255) NOT NULL,
  `amount` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `cardealer_vehicles`
--

CREATE TABLE `cardealer_vehicles` (
  `id` int(11) NOT NULL,
  `vehicle` varchar(255) NOT NULL,
  `price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `characters`
--

CREATE TABLE `characters` (
  `id` int(11) NOT NULL,
  `identifier` varchar(255) NOT NULL,
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `dateofbirth` varchar(255) NOT NULL,
  `sex` varchar(1) NOT NULL DEFAULT 'M',
  `height` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `characters`
--

INSERT INTO `characters` (`id`, `identifier`, `firstname`, `lastname`, `dateofbirth`, `sex`, `height`) VALUES
(1, 'steam:110000104eb808d', 'Dariusz', 'Pruszkowski', '1975-07-10', 'm', '198'),
(2, 'steam:110000104eb808d', 'Dariusz', 'Pruszkowski', '1975-07-10', 'm', '198'),
(4, 'steam:110000114f63a7e', 'Adrian', 'Polarewski', '1995-01-12', 'm', '187'),
(5, 'steam:11000010b79ecd4', 'Henryk', 'Opalinski', '1980-08-28', 'm', '188'),
(6, 'steam:11000010b79ecd4', 'Henryk', 'Opalinski', '1970-08-28', 'm', '188'),
(7, 'steam:110000111ee525f', 'Adam', 'Beryl', '1985-08-28', 'm', '185'),
(8, 'steam:110000111ee525f', 'Adam', 'Berylowicz', '1985-08-28', 'm', '185'),
(9, 'steam:11000010fdc8544', 'Marek', 'Bocian', '1999.12.27', 'm', '190'),
(11, 'steam:11000010fdc8544', 'Marco', 'Verde Grossino', '1990.12.21', 'm', '190');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `datastore`
--

CREATE TABLE `datastore` (
  `name` varchar(60) NOT NULL,
  `label` varchar(255) NOT NULL,
  `shared` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `datastore`
--

INSERT INTO `datastore` (`name`, `label`, `shared`) VALUES
('property', 'Mieszkanie', 0),
('society_alfons', 'Alfons', 1),
('society_ambulance', 'EMS', 1),
('society_kasyno', 'kasyno', 1),
('society_mafia', 'Lertivo', 1),
('society_police', 'LSPD', 1),
('society_taxi', 'Taxi', 1),
('society_vigne', 'Winiarnia', 1),
('user_ears', 'Ears', 0),
('user_glasses', 'Glasses', 0),
('user_helmet', 'Helmet', 0),
('user_mask', 'Mask', 0);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `datastore_data`
--

CREATE TABLE `datastore_data` (
  `id` int(11) NOT NULL,
  `name` varchar(60) NOT NULL,
  `owner` varchar(60) DEFAULT NULL,
  `data` longtext
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `datastore_data`
--

INSERT INTO `datastore_data` (`id`, `name`, `owner`, `data`) VALUES
(1, 'society_ambulance', NULL, '{}'),
(2, 'society_kasyno', NULL, '{}'),
(3, 'society_mafia', NULL, '{}'),
(4, 'society_police', NULL, '{}'),
(5, 'society_taxi', NULL, '{}'),
(6, 'society_vigne', NULL, '{}'),
(7, 'user_ears', 'steam:110000104eb808d', '{}'),
(8, 'property', 'steam:110000104eb808d', '{\"dressing\":[{\"label\":\"darek_elegancik\",\"skin\":{\"makeup_2\":0,\"beard_3\":0,\"tshirt_1\":21,\"eyebrows_2\":0,\"bodyb_1\":0,\"eyebrows_1\":0,\"ears_2\":0,\"makeup_1\":0,\"eyebrows_3\":0,\"arms_2\":0,\"age_2\":10,\"watches_2\":1,\"torso_2\":0,\"tshirt_2\":0,\"helmet_1\":-1,\"blemishes_1\":0,\"chain_1\":0,\"pants_1\":28,\"chest_1\":0,\"lipstick_3\":0,\"decals_1\":0,\"makeup_4\":0,\"eye_color\":0,\"chest_3\":0,\"bracelets_2\":0,\"shoes_1\":10,\"ears_1\":-1,\"hair_1\":0,\"bproof_2\":0,\"bags_2\":0,\"mask_1\":0,\"decals_2\":0,\"beard_1\":0,\"blush_3\":0,\"blush_2\":0,\"beard_4\":0,\"complexion_1\":0,\"bracelets_1\":-1,\"age_1\":8,\"hair_color_1\":0,\"bodyb_2\":0,\"watches_1\":10,\"mask_2\":0,\"glasses_1\":5,\"hair_2\":0,\"sun_1\":0,\"beard_2\":0,\"sex\":0,\"lipstick_4\":0,\"helmet_2\":0,\"glasses_2\":1,\"moles_2\":0,\"shoes_2\":0,\"pants_2\":0,\"moles_1\":0,\"hair_color_2\":0,\"bags_1\":0,\"complexion_2\":0,\"blemishes_2\":0,\"skin\":30,\"face\":15,\"sun_2\":0,\"bproof_1\":0,\"lipstick_1\":0,\"blush_1\":0,\"chain_2\":0,\"arms\":33,\"lipstick_2\":0,\"chest_2\":0,\"torso_1\":30,\"makeup_3\":0,\"eyebrows_4\":0}}],\"weapons\":[{\"name\":\"WEAPON_HEAVYPISTOL\",\"ammo\":0},{\"name\":\"WEAPON_DAGGER\",\"ammo\":0}]}'),
(9, 'user_glasses', 'steam:110000104eb808d', '{\"skin\":{\"glasses_2\":1,\"glasses_1\":5},\"hasGlasses\":true}'),
(10, 'user_helmet', 'steam:110000104eb808d', '{}'),
(11, 'user_mask', 'steam:110000104eb808d', '{\"hasMask\":true,\"skin\":{\"mask_2\":1,\"mask_1\":56}}'),
(12, 'user_ears', 'steam:11000010fdc8544', '{}'),
(13, 'user_helmet', 'steam:11000010fdc8544', '{}'),
(14, 'user_glasses', 'steam:11000010fdc8544', '{}'),
(15, 'property', 'steam:11000010fdc8544', '{\"dressing\":[{\"skin\":{\"torso_2\":0,\"bproof_1\":0,\"eye_color\":0,\"makeup_2\":0,\"bracelets_2\":0,\"hair_color_1\":0,\"ears_2\":0,\"arms\":1,\"pants_1\":1,\"watches_2\":0,\"chest_2\":0,\"bags_2\":0,\"hair_2\":0,\"bags_1\":0,\"lipstick_4\":0,\"sun_1\":0,\"eyebrows_1\":0,\"mask_2\":0,\"makeup_3\":0,\"bproof_2\":0,\"torso_1\":166,\"sun_2\":0,\"face\":43,\"age_1\":0,\"shoes_2\":0,\"helmet_2\":0,\"blush_3\":0,\"lipstick_2\":0,\"beard_1\":0,\"helmet_1\":-1,\"skin\":4,\"makeup_4\":0,\"pants_2\":8,\"complexion_2\":0,\"complexion_1\":0,\"sex\":0,\"hair_1\":1,\"watches_1\":-1,\"chain_2\":0,\"makeup_1\":0,\"chest_3\":0,\"chest_1\":0,\"age_2\":0,\"blemishes_1\":0,\"moles_1\":0,\"blush_2\":0,\"chain_1\":0,\"hair_color_2\":0,\"bodyb_2\":0,\"tshirt_1\":23,\"beard_3\":0,\"glasses_1\":0,\"bodyb_1\":0,\"eyebrows_2\":0,\"ears_1\":-1,\"decals_2\":0,\"mask_1\":0,\"shoes_1\":10,\"beard_4\":0,\"beard_2\":0,\"blush_1\":0,\"lipstick_3\":0,\"lipstick_1\":0,\"eyebrows_4\":0,\"decals_1\":0,\"glasses_2\":0,\"bracelets_1\":-1,\"blemishes_2\":0,\"arms_2\":0,\"eyebrows_3\":0,\"tshirt_2\":1,\"moles_2\":0},\"label\":\"Mare1\"}]}'),
(16, 'user_mask', 'steam:11000010fdc8544', '{}'),
(17, 'property', 'steam:110000114f63a7e', '{}'),
(18, 'user_ears', 'steam:110000114f63a7e', '{}'),
(19, 'user_glasses', 'steam:110000114f63a7e', '{}'),
(20, 'user_helmet', 'steam:110000114f63a7e', '{}'),
(21, 'user_mask', 'steam:110000114f63a7e', '{}'),
(22, 'property', 'steam:11000010b79ecd4', '{}'),
(23, 'user_ears', 'steam:11000010b79ecd4', '{}'),
(24, 'user_helmet', 'steam:11000010b79ecd4', '{}'),
(25, 'user_glasses', 'steam:11000010b79ecd4', '{}'),
(26, 'user_mask', 'steam:11000010b79ecd4', '{}'),
(27, 'user_mask', 'steam:110000111ee525f', '{}'),
(28, 'user_helmet', 'steam:110000111ee525f', '{}'),
(29, 'property', 'steam:110000111ee525f', '{}'),
(30, 'user_ears', 'steam:110000111ee525f', '{}'),
(31, 'user_glasses', 'steam:110000111ee525f', '{}'),
(32, 'society_alfons', NULL, '{}');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `fine_types`
--

CREATE TABLE `fine_types` (
  `id` int(11) NOT NULL,
  `label` varchar(255) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `category` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `fine_types`
--

INSERT INTO `fine_types` (`id`, `label`, `amount`, `category`) VALUES
(1, 'Nadużywanie klaksonu', 300, 0),
(2, 'Przekroczenie lini ciągłej', 400, 0),
(3, 'Jechanie po złej stronie drogi', 2500, 0),
(4, 'Nieprawidłowe zawracanie', 2500, 0),
(5, 'Nielegalna jazda Off-road', 1700, 0),
(6, 'Niedostosowanie się do poleceń Policji', 300, 0),
(7, 'Nieprawidłowe zatrzymanie pojazdu', 1500, 0),
(8, 'Nieprawidłowe parkownie', 700, 0),
(9, 'Niezastosowanie się do ruchu prawostronnego (jazda lewym pasem)', 700, 0),
(10, 'Brak informacji o pojeździe', 900, 0),
(11, 'Niezastosowanie się do znaku SOTP', 1050, 0),
(12, 'Niezatrzymanie się na czerwonym świetle', 1300, 0),
(13, 'Przechodzenie w niedozwolonym miejscu', 1000, 0),
(14, 'Jazda nielegalnym pojazdem', 1000, 0),
(15, 'Brak prawa jazdy', 1500, 0),
(16, 'Ucieczka z miejsca zdarzenia', 800, 0),
(17, 'Przekroczenie prędkości < 10', 900, 0),
(18, 'Przekroczenie prędkości 10-20', 1200, 0),
(19, 'Przekroczenie prędkości 20-30', 1800, 0),
(20, 'Przekroczenie prędkości > 30', 3000, 0),
(21, 'Utrudnianie przemieszczania się', 1100, 1),
(22, 'Publiczne zgorszenie', 900, 1),
(23, 'Niepoprawne zachowanie', 900, 1),
(24, 'Utrudnianie postępowania', 1300, 1),
(25, 'Obraza cywilów', 750, 1),
(26, 'Obraza osobistości', 1100, 1),
(27, 'Groźby werbalne', 900, 1),
(28, 'Przeklinanie', 1500, 1),
(29, 'Dostarczanie fałszywych informacji', 2500, 1),
(30, 'Próba korupcji', 15000, 1),
(31, 'Wymachiwanie bronią w mieście', 1200, 2),
(32, 'Wymachiwanie niebezpieczną bronią w mieście', 3000, 2),
(33, 'Brak pozwolenia na broń', 6000, 2),
(34, 'Posiadanie nielegalnej broni', 7000, 2),
(35, 'Posiadanie narzędzi do włamań', 3000, 2),
(36, 'Złodziej - recydywista', 1800, 2),
(37, 'Rozprowadzanie nielegalnych substancji', 15000, 2),
(38, 'Wytwarzanie nielegalnych substancji', 15000, 2),
(39, 'Posiadanie zakazanych substancji', 6500, 2),
(40, 'Porwanie cywila', 15000, 2),
(41, 'Porwanie osobistości', 20000, 2),
(42, 'Rabunek', 6500, 2),
(43, 'Kradzież z bronią w ręku', 6500, 2),
(44, 'Napad na Bank', 15000, 2),
(45, 'Atak na cywila', 20000, 3),
(46, 'Atak na osobistość', 25000, 3),
(47, 'Próba morderstwa cywila', 15000, 3),
(48, 'Próba morderstwa osobistości', 25000, 3),
(49, 'Zabójstwo cywila z premedytacją', 10000, 3),
(50, 'Zabójstwo ważnej osobowości z premedytacją', 30000, 3),
(51, 'Nieumyślne spowodowanie śmierci', 10000, 3),
(52, 'Oszustwo', 20000, 2);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `fine_types_kasyno`
--

CREATE TABLE `fine_types_kasyno` (
  `id` int(11) NOT NULL,
  `label` varchar(255) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `category` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `fine_types_kasyno`
--

INSERT INTO `fine_types_kasyno` (`id`, `label`, `amount`, `category`) VALUES
(1, 'Rachunek', 3000, 0),
(2, 'Rachunek', 5000, 0),
(3, 'Rachunek', 10000, 1),
(4, 'Rachunek', 20000, 1),
(5, 'Rachunek', 50000, 2),
(6, 'Rachunek', 150000, 3),
(7, 'Rachunek', 350000, 3);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `fine_types_mafia`
--

CREATE TABLE `fine_types_mafia` (
  `id` int(11) NOT NULL,
  `label` varchar(255) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `category` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `fine_types_mafia`
--

INSERT INTO `fine_types_mafia` (`id`, `label`, `amount`, `category`) VALUES
(1, 'Haracz dla mafii', 3000, 0),
(2, 'Haracz dla mafii', 5000, 0),
(3, 'Haracz dla mafii', 10000, 0),
(4, 'Haracz dla mafii', 20000, 0),
(5, 'Haracz dla mafii', 50000, 0),
(6, 'Haracz dla mafii', 100000, 0),
(7, 'Haracz dla mafii', 150000, 0);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `glovebox_inventory`
--

CREATE TABLE `glovebox_inventory` (
  `id` int(11) NOT NULL,
  `plate` varchar(8) NOT NULL,
  `data` text NOT NULL,
  `owned` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `glovebox_inventory`
--

INSERT INTO `glovebox_inventory` (`id`, `plate`, `data`, `owned`) VALUES
(1, 'YSS 595 ', '{\"coffres\":[],\"weapons\":[]}', 1),
(6, 'LYM 522 ', '{\"coffres\":[]}', 1);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `items`
--

CREATE TABLE `items` (
  `name` varchar(50) NOT NULL,
  `label` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_roman_ci NOT NULL,
  `limit` int(11) NOT NULL DEFAULT '-1',
  `rare` int(11) NOT NULL DEFAULT '0',
  `can_remove` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `items`
--

INSERT INTO `items` (`name`, `label`, `limit`, `rare`, `can_remove`) VALUES
('airbag', 'Poduszka powietrzna', 7, 0, 1),
('bandage', 'Bandaż', 20, 0, 1),
('battery', 'Akumulator', 2, 0, 1),
('benzyna', 'Benzyna', 50, 0, 1),
('bimber_pooch', 'Butelka bimbru', 20, 0, 1),
('bking_bcwhopper', 'Bacon Cheese Whopper', 5, 0, 1),
('bking_bigking', 'Big King', 5, 0, 1),
('bking_cchicken', 'Crispy Chicken', 5, 0, 1),
('bking_chburger', 'Chicken Burger', 5, 0, 1),
('bking_dcburger', 'Double Cheeseburger', 5, 0, 1),
('bking_lchicken', 'Long Chicken', 5, 0, 1),
('bking_nuggets', 'Nuggetsy', 5, 0, 1),
('bking_whopper', 'Whopper', 5, 0, 1),
('bking_whopperj', 'Whopper Jr.', 5, 0, 1),
('blackberry', 'iPhone', 5, 0, 1),
('blowpipe', 'Palnik', 1, 0, 1),
('boomdlugie', 'Wygląd broni (boom)', 1, 0, 1),
('bread', 'Chleb', 5, 0, 1),
('carokit', 'Częsci blacharskie', 1, 0, 1),
('celownikdluga', 'Celownik (do karabinu)', 1, 0, 1),
('cigarett', 'Papieros', 20, 0, 1),
('clip', 'Magazynek', 5, 0, 1),
('cola', 'Coca Cola', 15, 0, 1),
('contract', 'Umowa sprzedaży', 5, 0, 1),
('cukier', 'Cukier', 50, 0, 1),
('czaszkidlugie', 'Wygląd broni (czaszki)', 1, 0, 1),
('diazepam', 'Diazepam', 50, 0, 1),
('dowod', 'Dowód osobisty', 1, 0, 1),
('fixkit', 'Zestaw naprawczy.', 1, 0, 1),
('fixtool', 'Repair Tools', 1, 0, 1),
('flashlight', 'Latarka do broni', 3, 0, 1),
('frytki', 'Frytki', 5, 0, 1),
('frytkixxl', 'Frytki XXL', 5, 0, 1),
('grip', 'Uchwyt do broni', 3, 0, 1),
('hamburger', 'Cheeseburger', 10, 0, 1),
('handcuff', 'Kajdanki', 3, 0, 1),
('haszysz', 'Konopia indyjska', 500, 0, 1),
('haszysz_pooch_high', 'Gram haszyszu (wysoka jakość)', 100, 0, 1),
('haszysz_pooch_low', 'Gram haszyszu (niska jakość)', 100, 0, 1),
('haszysz_pooch_medium', 'Gram haszyszu (średnia jakość)', 100, 0, 1),
('headbag', 'Worek', 3, 0, 1),
('heroina', 'Opiaty', 500, 0, 1),
('heroina_pooch_high', 'Gram heroiny (wysoka czystość)', 100, 0, 1),
('heroina_pooch_low', 'Gram heroiny (niska czystość)', 100, 0, 1),
('heroina_pooch_medium', 'Gram heroiny (średnia czystość)', 100, 0, 1),
('highradio', 'Radio samochodowe', 5, 0, 1),
('highrim', 'Felga samochodowa', 4, 0, 1),
('holografik', 'Celownik (holograficzny)', 1, 0, 1),
('hotdog', 'Hotdog', 10, 0, 1),
('kaje', 'Kajdanki', 3, 0, 1),
('kamizelka', 'Kamizelka', 3, 0, 1),
('karnet', 'Karnet na siłownie', 3, 0, 1),
('kastetbalas', 'Wygląd kastetu (ballas)', 1, 0, 1),
('kastetdiament', 'Wygląd kastetu (diamond)', 1, 0, 1),
('kastetdollar', 'Wygląd kastetu (dollar)', 1, 0, 1),
('kastethate', 'Wygląd kastetu (hate)', 1, 0, 1),
('kastetpimp', 'Wygląd kastetu (pimp)', 1, 0, 1),
('kastetpink', 'Wygląd kastetu (love)', 1, 0, 1),
('kastetplayer', 'Wygląd kastetu (player)', 1, 0, 1),
('kastetvagos', 'Wygląd kastetu (vagos)', 1, 0, 1),
('kfc_grander', 'Grander Texas', 5, 0, 1),
('kfc_kubelek11', 'Kubełek 11/11', 5, 0, 1),
('kfc_kubelekclassic', 'Kubełek Classic', 5, 0, 1),
('kfc_kubelekclassicxl', 'Kubełek Classic XL', 5, 0, 1),
('kfc_longer', 'Longer', 5, 0, 1),
('kfc_megapocket', 'Mega Pocket', 5, 0, 1),
('kfc_qurrito', 'Qurrito Grande', 5, 0, 1),
('kfc_twister', 'Twister', 5, 0, 1),
('kfc_zinger', 'Zinger', 5, 0, 1),
('kokaina', 'Liść kokainy', 500, 0, 1),
('kokaina_pooch_high', 'Gram kokainy (wysoka czystość)', 100, 0, 1),
('kokaina_pooch_low', 'Gram kokainy (niska czystość)', 100, 0, 1),
('kokaina_pooch_medium', 'Gram kokainy (średnia czystość)', 100, 0, 1),
('kompensator', 'Hamulec wylotowy', 1, 0, 1),
('kuflowe', 'Kuflowe Mocne', 10, 0, 1),
('largescope', 'Celownik (duży)', 1, 0, 1),
('lidokaina', 'Lidokaina', 50, 0, 1),
('lighter', 'Zapalniczka', 5, 0, 1),
('lody', 'Lody', 5, 0, 1),
('lowradio', 'Uszkodzone radio', 5, 0, 1),
('martini', 'Martini', 5, 0, 1),
('medikit', 'Apteczka', 5, 0, 1),
('mediumscope', 'Celownik (średni)', 1, 0, 1),
('meta', 'Metyloamina', 500, 0, 1),
('meta_pooch_high', 'Gram metamfetaminy (wysoka czystość)', 100, 0, 1),
('meta_pooch_low', 'Gram metamfetaminy (niska czystość)', 100, 0, 1),
('meta_pooch_medium', 'Gram metamfetaminy (średnia czystość)', 100, 0, 1),
('moet', 'Moet et Chandon', 5, 0, 1),
('MountedScope', 'Celownik (do pistoletu)', 1, 0, 1),
('pcp', 'Fencyklidyna (PCP)', 50, 0, 1),
('platin50', 'Wygląd do broni (pistol50 platinium)', 1, 0, 1),
('powerade', 'Powerade', 5, 0, 1),
('powiekszonymagazynek', 'Powiększony magazynek', 1, 0, 1),
('proszekdopieczenia', 'Proszek do pieczenia', 50, 0, 1),
('protein', 'Baton proteinowy', 5, 0, 1),
('repairkit', 'Zestaw naprawczy', 3, 0, 1),
('rest_obiadduzy', 'Duży zestaw obiadowy', 5, 0, 1),
('rest_obiadmaly', 'Mały zestaw obiadowy', 5, 0, 1),
('rest_obiadsredni', 'Średni zestaw obiadowy', 5, 0, 1),
('rozpuszczalnik', 'Rozpuszczalnik', 50, 0, 1),
('sandwich', 'Kanapka', 15, 0, 1),
('shark', 'Rekin', 1, 0, 1),
('silencieux', 'Tłumik do broni', 3, 0, 1),
('soda_oczyszczona', 'Soda oczyszczona', 50, 0, 1),
('sol', 'Sól', 50, 0, 1),
('sterydy', 'Hormon wzrostu', 200, 0, 1),
('sterydy_pooch_high', 'Opakowanie \"Testosterone Cypionate\"', 40, 0, 1),
('sterydy_pooch_low', 'Opakowanie \"Metanabol\"', 40, 0, 1),
('sterydy_pooch_medium', 'Opakowanie \"Omnadren\"', 40, 0, 1),
('stockrim', 'Porysowana felga', 4, 0, 1),
('tactitalmuzle', 'Taktyczny hamulec wylotowy', 1, 0, 1),
('tyton', 'Tytoń', 100, 0, 1),
('tyton_pooch', 'Karton papierosów', 20, 0, 1),
('vine', 'Butelka wina', 40, 0, 1),
('vipskinmotyl', 'Wygląd do broni (butterfly)', 1, 0, 1),
('water', 'Woda', 15, 0, 1),
('weed', 'weed', 5, 0, 1),
('whiskey', 'Jack Daniel\'s', 10, 0, 1),
('wino', 'Wino', 500, 0, 1),
('winogrono', 'Winogrono', 200, 0, 1),
('wizytowka', 'Wizytówka', 1, 0, 1),
('wooddlugie', 'Wygląd do broni (drewno - karabiny)', 1, 0, 1),
('woodheavyp', 'Wygląd do broni (drewno - pistolety)', 1, 0, 1),
('yusuf', 'Wygląd do broni (złoty)', 3, 0, 1),
('zebradlugie', 'Wygląd do broni (zebra)', 1, 0, 1),
('zlom', 'Złom', 100, 0, 1),
('zubr', 'Żubr', 10, 0, 1);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `jail`
--

CREATE TABLE `jail` (
  `identifier` varchar(100) NOT NULL,
  `jail_time` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `jobs`
--

CREATE TABLE `jobs` (
  `name` varchar(50) NOT NULL,
  `label` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_polish_ci DEFAULT NULL,
  `whitelisted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `jobs`
--

INSERT INTO `jobs` (`name`, `label`, `whitelisted`) VALUES
('alfons', 'Alfons', 0),
('ambulance', 'EMS', 1),
('banker', 'Banker', 1),
('cardealer', 'Cardealer', 1),
('gopostal', 'Kurier', 1),
('kasyno', 'Kasyno VEGAS', 1),
('mafia', 'Lertivo', 1),
('mecano', 'LSC', 1),
('police', 'LSPD', 1),
('psycho', 'Psycholog', 1),
('realestateagent', 'Agent immobilier', 1),
('taxi', 'Taxi', 1),
('unemployed', 'Bezrobotny', 0),
('vigne', 'Winiarnia', 1),
('zlom', 'Złomiarz', 0);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `job_grades`
--

CREATE TABLE `job_grades` (
  `id` int(11) NOT NULL,
  `job_name` varchar(50) DEFAULT NULL,
  `grade` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `label` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_polish_ci NOT NULL,
  `salary` int(11) NOT NULL,
  `skin_male` longtext NOT NULL,
  `skin_female` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `job_grades`
--

INSERT INTO `job_grades` (`id`, `job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`) VALUES
(1, 'unemployed', 0, 'unemployed', 'Na zasiłku', 50, '{}', '{}'),
(2, 'ambulance', 0, 'ambulance', 'Kadet', 2300, '{\"tshirt_2\":0,\"hair_color_1\":5,\"glasses_2\":3,\"shoes\":9,\"torso_2\":3,\"hair_color_2\":0,\"pants_1\":24,\"glasses_1\":4,\"hair_1\":2,\"sex\":0,\"decals_2\":0,\"tshirt_1\":15,\"helmet_1\":8,\"helmet_2\":0,\"arms\":92,\"face\":19,\"decals_1\":60,\"torso_1\":13,\"hair_2\":0,\"skin\":34,\"pants_2\":5}', '{\"tshirt_2\":3,\"decals_2\":0,\"glasses\":0,\"hair_1\":2,\"torso_1\":73,\"shoes\":1,\"hair_color_2\":0,\"glasses_1\":19,\"skin\":13,\"face\":6,\"pants_2\":5,\"tshirt_1\":75,\"pants_1\":37,\"helmet_1\":57,\"torso_2\":0,\"arms\":14,\"sex\":1,\"glasses_2\":0,\"decals_1\":0,\"hair_2\":0,\"helmet_2\":0,\"hair_color_1\":0}'),
(3, 'ambulance', 1, 'doctor', 'Kierowca ambulansu', 2500, '{\"tshirt_2\":0,\"hair_color_1\":5,\"glasses_2\":3,\"shoes\":9,\"torso_2\":3,\"hair_color_2\":0,\"pants_1\":24,\"glasses_1\":4,\"hair_1\":2,\"sex\":0,\"decals_2\":0,\"tshirt_1\":15,\"helmet_1\":8,\"helmet_2\":0,\"arms\":92,\"face\":19,\"decals_1\":60,\"torso_1\":13,\"hair_2\":0,\"skin\":34,\"pants_2\":5}', '{\"tshirt_2\":3,\"decals_2\":0,\"glasses\":0,\"hair_1\":2,\"torso_1\":73,\"shoes\":1,\"hair_color_2\":0,\"glasses_1\":19,\"skin\":13,\"face\":6,\"pants_2\":5,\"tshirt_1\":75,\"pants_1\":37,\"helmet_1\":57,\"torso_2\":0,\"arms\":14,\"sex\":1,\"glasses_2\":0,\"decals_1\":0,\"hair_2\":0,\"helmet_2\":0,\"hair_color_1\":0}'),
(4, 'ambulance', 2, 'chief_doctor', 'Ratownik medyczny', 2700, '{\"tshirt_2\":0,\"hair_color_1\":5,\"glasses_2\":3,\"shoes\":9,\"torso_2\":3,\"hair_color_2\":0,\"pants_1\":24,\"glasses_1\":4,\"hair_1\":2,\"sex\":0,\"decals_2\":0,\"tshirt_1\":15,\"helmet_1\":8,\"helmet_2\":0,\"arms\":92,\"face\":19,\"decals_1\":60,\"torso_1\":13,\"hair_2\":0,\"skin\":34,\"pants_2\":5}', '{\"tshirt_2\":3,\"decals_2\":0,\"glasses\":0,\"hair_1\":2,\"torso_1\":73,\"shoes\":1,\"hair_color_2\":0,\"glasses_1\":19,\"skin\":13,\"face\":6,\"pants_2\":5,\"tshirt_1\":75,\"pants_1\":37,\"helmet_1\":57,\"torso_2\":0,\"arms\":14,\"sex\":1,\"glasses_2\":0,\"decals_1\":0,\"hair_2\":0,\"helmet_2\":0,\"hair_color_1\":0}'),
(5, 'ambulance', 6, 'boss', 'Ordynator', 3700, '{\"tshirt_2\":0,\"hair_color_1\":5,\"glasses_2\":3,\"shoes\":9,\"torso_2\":3,\"hair_color_2\":0,\"pants_1\":24,\"glasses_1\":4,\"hair_1\":2,\"sex\":0,\"decals_2\":0,\"tshirt_1\":15,\"helmet_1\":8,\"helmet_2\":0,\"arms\":92,\"face\":19,\"decals_1\":60,\"torso_1\":13,\"hair_2\":0,\"skin\":34,\"pants_2\":5}', '{\"tshirt_2\":3,\"decals_2\":0,\"glasses\":0,\"hair_1\":2,\"torso_1\":73,\"shoes\":1,\"hair_color_2\":0,\"glasses_1\":19,\"skin\":13,\"face\":6,\"pants_2\":5,\"tshirt_1\":75,\"pants_1\":37,\"helmet_1\":57,\"torso_2\":0,\"arms\":14,\"sex\":1,\"glasses_2\":0,\"decals_1\":0,\"hair_2\":0,\"helmet_2\":0,\"hair_color_1\":0}'),
(6, 'banker', 0, 'advisor', 'Advisor', 10, '{}', '{}'),
(7, 'banker', 1, 'banker', 'Banker', 20, '{}', '{}'),
(8, 'banker', 2, 'business_banker', 'Business Banker', 30, '{}', '{}'),
(9, 'banker', 3, 'trader', 'Trader', 40, '{}', '{}'),
(10, 'banker', 4, 'boss', 'Boss', 0, '{}', '{}'),
(18, 'police', 0, 'recruit', 'Kadet', 1950, '{}', '{}'),
(19, 'police', 1, 'officer1', 'Officer st.1', 2000, '{}', '{}'),
(20, 'police', 4, 'sergeant1', 'Sierżant st.1', 2150, '{}', '{}'),
(21, 'police', 7, 'lieutenant1', 'Porucznik st.1', 2300, '{}', '{}'),
(22, 'police', 12, 'boss', 'Szef', 3000, '{}', '{}'),
(23, 'realestateagent', 0, 'location', 'Location', 10, '{}', '{}'),
(24, 'realestateagent', 1, 'vendeur', 'Vendeur', 25, '{}', '{}'),
(25, 'realestateagent', 2, 'gestion', 'Gestion', 40, '{}', '{}'),
(26, 'realestateagent', 3, 'boss', 'Patron', 0, '{}', '{}'),
(27, 'taxi', 0, 'recrue', 'Recrue', 12, '{\"hair_2\":0,\"hair_color_2\":0,\"torso_1\":32,\"bags_1\":0,\"helmet_2\":0,\"chain_2\":0,\"eyebrows_3\":0,\"makeup_3\":0,\"makeup_2\":0,\"tshirt_1\":31,\"makeup_1\":0,\"bags_2\":0,\"makeup_4\":0,\"eyebrows_4\":0,\"chain_1\":0,\"lipstick_4\":0,\"bproof_2\":0,\"hair_color_1\":0,\"decals_2\":0,\"pants_2\":0,\"age_2\":0,\"glasses_2\":0,\"ears_2\":0,\"arms\":27,\"lipstick_1\":0,\"ears_1\":-1,\"mask_2\":0,\"sex\":0,\"lipstick_3\":0,\"helmet_1\":-1,\"shoes_2\":0,\"beard_2\":0,\"beard_1\":0,\"lipstick_2\":0,\"beard_4\":0,\"glasses_1\":0,\"bproof_1\":0,\"mask_1\":0,\"decals_1\":1,\"hair_1\":0,\"eyebrows_2\":0,\"beard_3\":0,\"age_1\":0,\"tshirt_2\":0,\"skin\":0,\"torso_2\":0,\"eyebrows_1\":0,\"face\":0,\"shoes_1\":10,\"pants_1\":24}', '{\"hair_2\":0,\"hair_color_2\":0,\"torso_1\":57,\"bags_1\":0,\"helmet_2\":0,\"chain_2\":0,\"eyebrows_3\":0,\"makeup_3\":0,\"makeup_2\":0,\"tshirt_1\":38,\"makeup_1\":0,\"bags_2\":0,\"makeup_4\":0,\"eyebrows_4\":0,\"chain_1\":0,\"lipstick_4\":0,\"bproof_2\":0,\"hair_color_1\":0,\"decals_2\":0,\"pants_2\":1,\"age_2\":0,\"glasses_2\":0,\"ears_2\":0,\"arms\":21,\"lipstick_1\":0,\"ears_1\":-1,\"mask_2\":0,\"sex\":1,\"lipstick_3\":0,\"helmet_1\":-1,\"shoes_2\":0,\"beard_2\":0,\"beard_1\":0,\"lipstick_2\":0,\"beard_4\":0,\"glasses_1\":5,\"bproof_1\":0,\"mask_1\":0,\"decals_1\":1,\"hair_1\":0,\"eyebrows_2\":0,\"beard_3\":0,\"age_1\":0,\"tshirt_2\":0,\"skin\":0,\"torso_2\":0,\"eyebrows_1\":0,\"face\":0,\"shoes_1\":49,\"pants_1\":11}'),
(28, 'taxi', 1, 'novice', 'Novice', 24, '{\"hair_2\":0,\"hair_color_2\":0,\"torso_1\":32,\"bags_1\":0,\"helmet_2\":0,\"chain_2\":0,\"eyebrows_3\":0,\"makeup_3\":0,\"makeup_2\":0,\"tshirt_1\":31,\"makeup_1\":0,\"bags_2\":0,\"makeup_4\":0,\"eyebrows_4\":0,\"chain_1\":0,\"lipstick_4\":0,\"bproof_2\":0,\"hair_color_1\":0,\"decals_2\":0,\"pants_2\":0,\"age_2\":0,\"glasses_2\":0,\"ears_2\":0,\"arms\":27,\"lipstick_1\":0,\"ears_1\":-1,\"mask_2\":0,\"sex\":0,\"lipstick_3\":0,\"helmet_1\":-1,\"shoes_2\":0,\"beard_2\":0,\"beard_1\":0,\"lipstick_2\":0,\"beard_4\":0,\"glasses_1\":0,\"bproof_1\":0,\"mask_1\":0,\"decals_1\":1,\"hair_1\":0,\"eyebrows_2\":0,\"beard_3\":0,\"age_1\":0,\"tshirt_2\":0,\"skin\":0,\"torso_2\":0,\"eyebrows_1\":0,\"face\":0,\"shoes_1\":10,\"pants_1\":24}', '{\"hair_2\":0,\"hair_color_2\":0,\"torso_1\":57,\"bags_1\":0,\"helmet_2\":0,\"chain_2\":0,\"eyebrows_3\":0,\"makeup_3\":0,\"makeup_2\":0,\"tshirt_1\":38,\"makeup_1\":0,\"bags_2\":0,\"makeup_4\":0,\"eyebrows_4\":0,\"chain_1\":0,\"lipstick_4\":0,\"bproof_2\":0,\"hair_color_1\":0,\"decals_2\":0,\"pants_2\":1,\"age_2\":0,\"glasses_2\":0,\"ears_2\":0,\"arms\":21,\"lipstick_1\":0,\"ears_1\":-1,\"mask_2\":0,\"sex\":1,\"lipstick_3\":0,\"helmet_1\":-1,\"shoes_2\":0,\"beard_2\":0,\"beard_1\":0,\"lipstick_2\":0,\"beard_4\":0,\"glasses_1\":5,\"bproof_1\":0,\"mask_1\":0,\"decals_1\":1,\"hair_1\":0,\"eyebrows_2\":0,\"beard_3\":0,\"age_1\":0,\"tshirt_2\":0,\"skin\":0,\"torso_2\":0,\"eyebrows_1\":0,\"face\":0,\"shoes_1\":49,\"pants_1\":11}'),
(29, 'taxi', 2, 'experimente', 'Experimente', 36, '{\"hair_2\":0,\"hair_color_2\":0,\"torso_1\":26,\"bags_1\":0,\"helmet_2\":0,\"chain_2\":0,\"eyebrows_3\":0,\"makeup_3\":0,\"makeup_2\":0,\"tshirt_1\":57,\"makeup_1\":0,\"bags_2\":0,\"makeup_4\":0,\"eyebrows_4\":0,\"chain_1\":0,\"lipstick_4\":0,\"bproof_2\":0,\"hair_color_1\":0,\"decals_2\":0,\"pants_2\":4,\"age_2\":0,\"glasses_2\":0,\"ears_2\":0,\"arms\":11,\"lipstick_1\":0,\"ears_1\":-1,\"mask_2\":0,\"sex\":0,\"lipstick_3\":0,\"helmet_1\":-1,\"shoes_2\":0,\"beard_2\":0,\"beard_1\":0,\"lipstick_2\":0,\"beard_4\":0,\"glasses_1\":0,\"bproof_1\":0,\"mask_1\":0,\"decals_1\":0,\"hair_1\":0,\"eyebrows_2\":0,\"beard_3\":0,\"age_1\":0,\"tshirt_2\":0,\"skin\":0,\"torso_2\":0,\"eyebrows_1\":0,\"face\":0,\"shoes_1\":10,\"pants_1\":24}', '{\"hair_2\":0,\"hair_color_2\":0,\"torso_1\":57,\"bags_1\":0,\"helmet_2\":0,\"chain_2\":0,\"eyebrows_3\":0,\"makeup_3\":0,\"makeup_2\":0,\"tshirt_1\":38,\"makeup_1\":0,\"bags_2\":0,\"makeup_4\":0,\"eyebrows_4\":0,\"chain_1\":0,\"lipstick_4\":0,\"bproof_2\":0,\"hair_color_1\":0,\"decals_2\":0,\"pants_2\":1,\"age_2\":0,\"glasses_2\":0,\"ears_2\":0,\"arms\":21,\"lipstick_1\":0,\"ears_1\":-1,\"mask_2\":0,\"sex\":1,\"lipstick_3\":0,\"helmet_1\":-1,\"shoes_2\":0,\"beard_2\":0,\"beard_1\":0,\"lipstick_2\":0,\"beard_4\":0,\"glasses_1\":5,\"bproof_1\":0,\"mask_1\":0,\"decals_1\":1,\"hair_1\":0,\"eyebrows_2\":0,\"beard_3\":0,\"age_1\":0,\"tshirt_2\":0,\"skin\":0,\"torso_2\":0,\"eyebrows_1\":0,\"face\":0,\"shoes_1\":49,\"pants_1\":11}'),
(30, 'taxi', 3, 'uber', 'Uber', 48, '{\"hair_2\":0,\"hair_color_2\":0,\"torso_1\":26,\"bags_1\":0,\"helmet_2\":0,\"chain_2\":0,\"eyebrows_3\":0,\"makeup_3\":0,\"makeup_2\":0,\"tshirt_1\":57,\"makeup_1\":0,\"bags_2\":0,\"makeup_4\":0,\"eyebrows_4\":0,\"chain_1\":0,\"lipstick_4\":0,\"bproof_2\":0,\"hair_color_1\":0,\"decals_2\":0,\"pants_2\":4,\"age_2\":0,\"glasses_2\":0,\"ears_2\":0,\"arms\":11,\"lipstick_1\":0,\"ears_1\":-1,\"mask_2\":0,\"sex\":0,\"lipstick_3\":0,\"helmet_1\":-1,\"shoes_2\":0,\"beard_2\":0,\"beard_1\":0,\"lipstick_2\":0,\"beard_4\":0,\"glasses_1\":0,\"bproof_1\":0,\"mask_1\":0,\"decals_1\":0,\"hair_1\":0,\"eyebrows_2\":0,\"beard_3\":0,\"age_1\":0,\"tshirt_2\":0,\"skin\":0,\"torso_2\":0,\"eyebrows_1\":0,\"face\":0,\"shoes_1\":10,\"pants_1\":24}', '{\"hair_2\":0,\"hair_color_2\":0,\"torso_1\":57,\"bags_1\":0,\"helmet_2\":0,\"chain_2\":0,\"eyebrows_3\":0,\"makeup_3\":0,\"makeup_2\":0,\"tshirt_1\":38,\"makeup_1\":0,\"bags_2\":0,\"makeup_4\":0,\"eyebrows_4\":0,\"chain_1\":0,\"lipstick_4\":0,\"bproof_2\":0,\"hair_color_1\":0,\"decals_2\":0,\"pants_2\":1,\"age_2\":0,\"glasses_2\":0,\"ears_2\":0,\"arms\":21,\"lipstick_1\":0,\"ears_1\":-1,\"mask_2\":0,\"sex\":1,\"lipstick_3\":0,\"helmet_1\":-1,\"shoes_2\":0,\"beard_2\":0,\"beard_1\":0,\"lipstick_2\":0,\"beard_4\":0,\"glasses_1\":5,\"bproof_1\":0,\"mask_1\":0,\"decals_1\":1,\"hair_1\":0,\"eyebrows_2\":0,\"beard_3\":0,\"age_1\":0,\"tshirt_2\":0,\"skin\":0,\"torso_2\":0,\"eyebrows_1\":0,\"face\":0,\"shoes_1\":49,\"pants_1\":11}'),
(31, 'taxi', 4, 'boss', 'Patron', 0, '{\"hair_2\":0,\"hair_color_2\":0,\"torso_1\":29,\"bags_1\":0,\"helmet_2\":0,\"chain_2\":0,\"eyebrows_3\":0,\"makeup_3\":0,\"makeup_2\":0,\"tshirt_1\":31,\"makeup_1\":0,\"bags_2\":0,\"makeup_4\":0,\"eyebrows_4\":0,\"chain_1\":0,\"lipstick_4\":0,\"bproof_2\":0,\"hair_color_1\":0,\"decals_2\":0,\"pants_2\":4,\"age_2\":0,\"glasses_2\":0,\"ears_2\":0,\"arms\":1,\"lipstick_1\":0,\"ears_1\":-1,\"mask_2\":0,\"sex\":0,\"lipstick_3\":0,\"helmet_1\":-1,\"shoes_2\":0,\"beard_2\":0,\"beard_1\":0,\"lipstick_2\":0,\"beard_4\":0,\"glasses_1\":0,\"bproof_1\":0,\"mask_1\":0,\"decals_1\":0,\"hair_1\":0,\"eyebrows_2\":0,\"beard_3\":0,\"age_1\":0,\"tshirt_2\":0,\"skin\":0,\"torso_2\":4,\"eyebrows_1\":0,\"face\":0,\"shoes_1\":10,\"pants_1\":24}', '{\"hair_2\":0,\"hair_color_2\":0,\"torso_1\":57,\"bags_1\":0,\"helmet_2\":0,\"chain_2\":0,\"eyebrows_3\":0,\"makeup_3\":0,\"makeup_2\":0,\"tshirt_1\":38,\"makeup_1\":0,\"bags_2\":0,\"makeup_4\":0,\"eyebrows_4\":0,\"chain_1\":0,\"lipstick_4\":0,\"bproof_2\":0,\"hair_color_1\":0,\"decals_2\":0,\"pants_2\":1,\"age_2\":0,\"glasses_2\":0,\"ears_2\":0,\"arms\":21,\"lipstick_1\":0,\"ears_1\":-1,\"mask_2\":0,\"sex\":1,\"lipstick_3\":0,\"helmet_1\":-1,\"shoes_2\":0,\"beard_2\":0,\"beard_1\":0,\"lipstick_2\":0,\"beard_4\":0,\"glasses_1\":5,\"bproof_1\":0,\"mask_1\":0,\"decals_1\":1,\"hair_1\":0,\"eyebrows_2\":0,\"beard_3\":0,\"age_1\":0,\"tshirt_2\":0,\"skin\":0,\"torso_2\":0,\"eyebrows_1\":0,\"face\":0,\"shoes_1\":49,\"pants_1\":11}'),
(32, 'cardealer', 0, 'recruit', 'Recruit', 10, '{}', '{}'),
(33, 'cardealer', 1, 'novice', 'Novice', 25, '{}', '{}'),
(34, 'cardealer', 2, 'experienced', 'Experienced', 40, '{}', '{}'),
(35, 'cardealer', 3, 'boss', 'Boss', 0, '{}', '{}'),
(36, 'mecano', 0, 'recrue', 'Pomocnik', 1000, '{}', '{}'),
(37, 'mecano', 1, 'novice', 'Mechanik', 1200, '{}', '{}'),
(38, 'mecano', 2, 'experimente', 'Doświadczony', 1400, '{}', '{}'),
(39, 'mecano', 3, 'chief', 'Zastępca', 1600, '{}', '{}'),
(40, 'mecano', 4, 'boss', 'Szef', 1800, '{}', '{}'),
(50, 'mafia', 0, 'soldato', 'Soldato', 1000, '{}', '{}'),
(51, 'mafia', 2, 'capo', 'Caporegime', 1400, '{}', '{}'),
(52, 'mafia', 3, 'consigliere', 'Capobastone', 1600, '{}', '{}'),
(53, 'mafia', 4, 'boss', 'Don', 1800, '{}', '{}'),
(54, 'police', 2, 'officer2', 'Officer st.2', 2050, '{}', '{}'),
(55, 'police', 3, 'officer3', 'Officer st.3', 2100, '{}', '{}'),
(56, 'police', 5, 'sergeant1', 'Sierżant st.2', 2200, '{}', '{}'),
(57, 'police', 6, 'sergeant3', 'Sierżant st.3', 2250, '{}', '{}'),
(58, 'police', 8, 'lieutenant1', 'Porucznik st.2', 2350, '{}', '{}'),
(59, 'police', 9, 'lieutenant3', 'Porucznik st.3', 2400, '{}', '{}'),
(60, 'police', 10, 'kapitan', 'Kapitan', 2450, '{}', '{}'),
(61, 'police', 11, 'zboss', 'Zast.Szef', 2700, '{}', '{}'),
(62, 'ambulance', 3, 'lekarz', 'Lekarz', 2900, '{\"tshirt_2\":0,\"hair_color_1\":5,\"glasses_2\":3,\"shoes\":9,\"torso_2\":3,\"hair_color_2\":0,\"pants_1\":24,\"glasses_1\":4,\"hair_1\":2,\"sex\":0,\"decals_2\":0,\"tshirt_1\":15,\"helmet_1\":8,\"helmet_2\":0,\"arms\":92,\"face\":19,\"decals_1\":60,\"torso_1\":13,\"hair_2\":0,\"skin\":34,\"pants_2\":5}', '{\"tshirt_2\":3,\"decals_2\":0,\"glasses\":0,\"hair_1\":2,\"torso_1\":73,\"shoes\":1,\"hair_color_2\":0,\"glasses_1\":19,\"skin\":13,\"face\":6,\"pants_2\":5,\"tshirt_1\":75,\"pants_1\":37,\"helmet_1\":57,\"torso_2\":0,\"arms\":14,\"sex\":1,\"glasses_2\":0,\"decals_1\":0,\"hair_2\":0,\"helmet_2\":0,\"hair_color_1\":0}'),
(63, 'ambulance', 4, 'lekarzs', 'Lekarz Specjalista', 3200, '{\"tshirt_2\":0,\"hair_color_1\":5,\"glasses_2\":3,\"shoes\":9,\"torso_2\":3,\"hair_color_2\":0,\"pants_1\":24,\"glasses_1\":4,\"hair_1\":2,\"sex\":0,\"decals_2\":0,\"tshirt_1\":15,\"helmet_1\":8,\"helmet_2\":0,\"arms\":92,\"face\":19,\"decals_1\":60,\"torso_1\":13,\"hair_2\":0,\"skin\":34,\"pants_2\":5}', '{\"tshirt_2\":3,\"decals_2\":0,\"glasses\":0,\"hair_1\":2,\"torso_1\":73,\"shoes\":1,\"hair_color_2\":0,\"glasses_1\":19,\"skin\":13,\"face\":6,\"pants_2\":5,\"tshirt_1\":75,\"pants_1\":37,\"helmet_1\":57,\"torso_2\":0,\"arms\":14,\"sex\":1,\"glasses_2\":0,\"decals_1\":0,\"hair_2\":0,\"helmet_2\":0,\"hair_color_1\":0}'),
(64, 'ambulance', 5, 'zboss', 'Zast.Ordynatora', 3500, '{\"tshirt_2\":0,\"hair_color_1\":5,\"glasses_2\":3,\"shoes\":9,\"torso_2\":3,\"hair_color_2\":0,\"pants_1\":24,\"glasses_1\":4,\"hair_1\":2,\"sex\":0,\"decals_2\":0,\"tshirt_1\":15,\"helmet_1\":8,\"helmet_2\":0,\"arms\":92,\"face\":19,\"decals_1\":60,\"torso_1\":13,\"hair_2\":0,\"skin\":34,\"pants_2\":5}', '{\"tshirt_2\":3,\"decals_2\":0,\"glasses\":0,\"hair_1\":2,\"torso_1\":73,\"shoes\":1,\"hair_color_2\":0,\"glasses_1\":19,\"skin\":13,\"face\":6,\"pants_2\":5,\"tshirt_1\":75,\"pants_1\":37,\"helmet_1\":57,\"torso_2\":0,\"arms\":14,\"sex\":1,\"glasses_2\":0,\"decals_1\":0,\"hair_2\":0,\"helmet_2\":0,\"hair_color_1\":0}'),
(65, 'mafia', 1, 'porucznik', 'Porucznik', 1200, '{}', '{}'),
(86, 'vigne', 0, 'recrue', 'Rekrut', 1000, '{\"tshirt_1\":59,\"tshirt_2\":0,\"torso_1\":12,\"torso_2\":5,\"shoes_1\":7,\"shoes_2\":2,\"pants_1\":9, \"pants_2\":7, \"arms\":1, \"helmet_1\":11, \"helmet_2\":0,\"bags_1\":0,\"bags_2\":0,\"ears_1\":0,\"glasses_1\":0,\"ears_2\":0,\"glasses_2\":0}', '{\"tshirt_1\":0,\"tshirt_2\":0,\"torso_1\":56,\"torso_2\":0,\"shoes_1\":27,\"shoes_2\":0,\"pants_1\":36, \"pants_2\":0, \"arms\":63, \"helmet_1\":11, \"helmet_2\":0,\"bags_1\":0,\"bags_2\":0,\"ears_1\":0,\"glasses_1\":0,\"ears_2\":0,\"glasses_2\":0}'),
(87, 'vigne', 1, 'novice', 'Zbieracz', 1200, '{\"tshirt_1\":57,\"tshirt_2\":0,\"torso_1\":13,\"torso_2\":5,\"shoes_1\":7,\"shoes_2\":2,\"pants_1\":9, \"pants_2\":7, \"arms\":11, \"helmet_1\":11, \"helmet_2\":0,\"bags_1\":0,\"bags_2\":0,\"ears_1\":0,\"glasses_1\":0,\"ears_2\":0,\"glasses_2\":0}', '{\"tshirt_1\":0,\"tshirt_2\":0,\"torso_1\":56,\"torso_2\":0,\"shoes_1\":27,\"shoes_2\":0,\"pants_1\":36, \"pants_2\":0, \"arms\":63, \"helmet_1\":11, \"helmet_2\":0,\"bags_1\":0,\"bags_2\":0,\"ears_1\":0,\"glasses_1\":0,\"ears_2\":0,\"glasses_2\":0}'),
(88, 'vigne', 2, 'cdisenior', 'Kierownik', 1400, '{\"tshirt_1\":57,\"tshirt_2\":0,\"torso_1\":13,\"torso_2\":5,\"shoes_1\":7,\"shoes_2\":2,\"pants_1\":9, \"pants_2\":7, \"arms\":11, \"helmet_1\":11, \"helmet_2\":0,\"bags_1\":0,\"bags_2\":0,\"ears_1\":0,\"glasses_1\":0,\"ears_2\":0,\"glasses_2\":0}', '{\"tshirt_1\":0,\"tshirt_2\":0,\"torso_1\":56,\"torso_2\":0,\"shoes_1\":27,\"shoes_2\":0,\"pants_1\":36, \"pants_2\":0, \"arms\":63, \"helmet_1\":11, \"helmet_2\":0,\"bags_1\":0,\"bags_2\":0,\"ears_1\":0,\"glasses_1\":0,\"ears_2\":0,\"glasses_2\":0}'),
(89, 'vigne', 3, 'boss', 'Szef', 1600, '{\"tshirt_1\":57,\"tshirt_2\":0,\"torso_1\":13,\"torso_2\":5,\"shoes_1\":7,\"shoes_2\":2,\"pants_1\":9, \"pants_2\":7, \"arms\":11, \"helmet_1\":11, \"helmet_2\":0,\"bags_1\":0,\"bags_2\":0,\"ears_1\":0,\"glasses_1\":0,\"ears_2\":0,\"glasses_2\":0}', '{\"tshirt_1\":15,\"tshirt_2\":0,\"torso_1\":14,\"torso_2\":15,\"shoes_1\":12,\"shoes_2\":0,\"pants_1\":9, \"pants_2\":5, \"arms\":1, \"helmet_1\":11, \"helmet_2\":0,\"bags_1\":0,\"bags_2\":0,\"ears_1\":0,\"glasses_1\":0,\"ears_2\":0,\"glasses_2\":0}'),
(90, 'psycho', 0, 'employee', 'Pracownik', 1000, '{\"chest_2\":0,\"helmet_1\":7,\"chain_2\":0,\"beard_4\":0,\"moles_2\":0,\"pants_1\":24,\"mask_1\":0,\"bodyb_1\":0,\"eye_color\":0,\"bproof_2\":0,\"eyebrows_2\":0,\"pants_2\":5,\"blush_1\":0,\"hair_color_2\":0,\"eyebrows_1\":0,\"lipstick_2\":0,\"beard_1\":0,\"watches_1\":-1,\"watches_2\":0,\"complexion_2\":0,\"torso_1\":13,\"shoes_2\":3,\"mask_2\":0,\"complexion_1\":0,\"blush_3\":0,\"eyebrows_3\":0,\"chain_1\":0,\"makeup_1\":0,\"blemishes_1\":0,\"ears_1\":-1,\"skin\":0,\"chest_3\":0,\"chest_1\":0,\"lipstick_3\":0,\"arms\":0,\"bags_2\":0,\"blush_2\":0,\"shoes_1\":20,\"bracelets_1\":-1,\"torso_2\":0,\"helmet_2\":1,\"hair_color_1\":0,\"sun_1\":0,\"age_2\":0,\"face\":0,\"hair_2\":1,\"hair_1\":3,\"bags_1\":0,\"ears_2\":0,\"makeup_3\":0,\"bodyb_2\":0,\"makeup_4\":0,\"lipstick_1\":0,\"bproof_1\":0,\"beard_2\":0,\"sex\":0,\"bracelets_2\":0,\"decals_1\":0,\"sun_2\":0,\"blemishes_2\":0,\"beard_3\":0,\"makeup_2\":0,\"tshirt_2\":0,\"moles_1\":0,\"eyebrows_4\":0,\"lipstick_4\":0,\"decals_2\":0,\"arms_2\":0,\"tshirt_1\":15,\"age_1\":0}', '{\"chest_2\":0,\"helmet_1\":7,\"chain_2\":0,\"beard_4\":0,\"moles_2\":0,\"pants_1\":24,\"mask_1\":0,\"bodyb_1\":0,\"eye_color\":0,\"bproof_2\":0,\"eyebrows_2\":0,\"pants_2\":5,\"blush_1\":0,\"hair_color_2\":0,\"eyebrows_1\":0,\"lipstick_2\":0,\"beard_1\":0,\"watches_1\":-1,\"watches_2\":0,\"complexion_2\":0,\"torso_1\":13,\"shoes_2\":3,\"mask_2\":0,\"complexion_1\":0,\"blush_3\":0,\"eyebrows_3\":0,\"chain_1\":0,\"makeup_1\":0,\"blemishes_1\":0,\"ears_1\":-1,\"skin\":0,\"chest_3\":0,\"chest_1\":0,\"lipstick_3\":0,\"arms\":0,\"bags_2\":0,\"blush_2\":0,\"shoes_1\":20,\"bracelets_1\":-1,\"torso_2\":0,\"helmet_2\":1,\"hair_color_1\":0,\"sun_1\":0,\"age_2\":0,\"face\":0,\"hair_2\":1,\"hair_1\":3,\"bags_1\":0,\"ears_2\":0,\"makeup_3\":0,\"bodyb_2\":0,\"makeup_4\":0,\"lipstick_1\":0,\"bproof_1\":0,\"beard_2\":0,\"sex\":0,\"bracelets_2\":0,\"decals_1\":0,\"sun_2\":0,\"blemishes_2\":0,\"beard_3\":0,\"makeup_2\":0,\"tshirt_2\":0,\"moles_1\":0,\"eyebrows_4\":0,\"lipstick_4\":0,\"decals_2\":0,\"arms_2\":0,\"tshirt_1\":15,\"age_1\":0}'),
(91, 'psycho', 1, 'chef', 'Zastępca', 1200, '{\"chest_2\":0,\"helmet_1\":-1,\"chain_2\":0,\"beard_4\":0,\"moles_2\":0,\"pants_1\":24,\"mask_1\":0,\"bodyb_1\":0,\"eye_color\":0,\"bproof_2\":0,\"eyebrows_2\":0,\"pants_2\":5,\"blush_1\":0,\"hair_color_2\":0,\"eyebrows_1\":0,\"lipstick_2\":0,\"beard_1\":0,\"watches_1\":-1,\"watches_2\":0,\"complexion_2\":0,\"torso_1\":13,\"shoes_2\":3,\"mask_2\":0,\"glasses_2\":0,\"complexion_1\":0,\"blush_3\":0,\"eyebrows_3\":0,\"chain_1\":0,\"makeup_1\":0,\"blemishes_1\":0,\"ears_1\":-1,\"skin\":0,\"chest_3\":0,\"chest_1\":0,\"lipstick_3\":0,\"arms\":0,\"bags_2\":0,\"blush_2\":0,\"shoes_1\":20,\"bracelets_1\":-1,\"torso_2\":0,\"helmet_2\":1,\"hair_color_1\":0,\"sun_1\":0,\"age_2\":0,\"face\":0,\"hair_2\":1,\"hair_1\":3,\"bags_1\":0,\"ears_2\":0,\"makeup_3\":0,\"bodyb_2\":0,\"makeup_4\":0,\"lipstick_1\":0,\"bproof_1\":0,\"beard_2\":0,\"sex\":0,\"bracelets_2\":0,\"decals_1\":0,\"sun_2\":0,\"blemishes_2\":0,\"beard_3\":0,\"makeup_2\":0,\"tshirt_2\":0,\"moles_1\":0,\"eyebrows_4\":0,\"lipstick_4\":0,\"decals_2\":0,\"arms_2\":0,\"tshirt_1\":15,\"age_1\":0}', '{\"chest_2\":0,\"helmet_1\":-1,\"chain_2\":0,\"beard_4\":0,\"moles_2\":0,\"pants_1\":24,\"mask_1\":0,\"bodyb_1\":0,\"eye_color\":0,\"bproof_2\":0,\"eyebrows_2\":0,\"pants_2\":5,\"blush_1\":0,\"hair_color_2\":0,\"eyebrows_1\":0,\"lipstick_2\":0,\"beard_1\":0,\"watches_1\":-1,\"watches_2\":0,\"complexion_2\":0,\"torso_1\":13,\"shoes_2\":3,\"mask_2\":0,\"glasses_2\":0,\"complexion_1\":0,\"blush_3\":0,\"eyebrows_3\":0,\"chain_1\":0,\"makeup_1\":0,\"blemishes_1\":0,\"ears_1\":-1,\"skin\":0,\"chest_3\":0,\"chest_1\":0,\"lipstick_3\":0,\"arms\":0,\"bags_2\":0,\"blush_2\":0,\"shoes_1\":20,\"bracelets_1\":-1,\"torso_2\":0,\"helmet_2\":1,\"hair_color_1\":0,\"sun_1\":0,\"age_2\":0,\"face\":0,\"hair_2\":1,\"hair_1\":3,\"bags_1\":0,\"ears_2\":0,\"makeup_3\":0,\"bodyb_2\":0,\"makeup_4\":0,\"lipstick_1\":0,\"bproof_1\":0,\"beard_2\":0,\"sex\":0,\"bracelets_2\":0,\"decals_1\":0,\"sun_2\":0,\"blemishes_2\":0,\"beard_3\":0,\"makeup_2\":0,\"tshirt_2\":0,\"moles_1\":0,\"eyebrows_4\":0,\"lipstick_4\":0,\"decals_2\":0,\"arms_2\":0,\"tshirt_1\":15,\"age_1\":0}'),
(92, 'psycho', 2, 'boss', 'Szef', 1400, '{\"chest_2\":0,\"helmet_1\":-1,\"chain_2\":0,\"beard_4\":0,\"moles_2\":0,\"pants_1\":24,\"mask_1\":0,\"bodyb_1\":0,\"eye_color\":0,\"bproof_2\":0,\"eyebrows_2\":0,\"pants_2\":5,\"blush_1\":0,\"hair_color_2\":0,\"eyebrows_1\":0,\"lipstick_2\":0,\"beard_1\":0,\"watches_1\":-1,\"watches_2\":0,\"complexion_2\":0,\"torso_1\":13,\"shoes_2\":3,\"mask_2\":0,\"glasses_2\":0,\"complexion_1\":0,\"blush_3\":0,\"eyebrows_3\":0,\"chain_1\":0,\"makeup_1\":0,\"blemishes_1\":0,\"ears_1\":-1,\"skin\":0,\"chest_3\":0,\"chest_1\":0,\"lipstick_3\":0,\"arms\":0,\"bags_2\":0,\"blush_2\":0,\"shoes_1\":20,\"bracelets_1\":-1,\"torso_2\":0,\"helmet_2\":0,\"hair_color_1\":0,\"sun_1\":0,\"age_2\":0,\"face\":0,\"hair_2\":1,\"hair_1\":3,\"bags_1\":0,\"ears_2\":0,\"makeup_3\":0,\"bodyb_2\":0,\"makeup_4\":0,\"lipstick_1\":0,\"bproof_1\":0,\"beard_2\":0,\"sex\":0,\"bracelets_2\":0,\"decals_1\":0,\"sun_2\":0,\"blemishes_2\":0,\"beard_3\":0,\"makeup_2\":0,\"tshirt_2\":0,\"moles_1\":0,\"eyebrows_4\":0,\"lipstick_4\":0,\"decals_2\":0,\"arms_2\":0,\"tshirt_1\":15,\"age_1\":0}', '{\"chest_2\":0,\"helmet_1\":-1,\"chain_2\":0,\"beard_4\":0,\"moles_2\":0,\"pants_1\":24,\"mask_1\":0,\"bodyb_1\":0,\"eye_color\":0,\"bproof_2\":0,\"eyebrows_2\":0,\"pants_2\":5,\"blush_1\":0,\"hair_color_2\":0,\"eyebrows_1\":0,\"lipstick_2\":0,\"beard_1\":0,\"watches_1\":-1,\"watches_2\":0,\"complexion_2\":0,\"torso_1\":13,\"shoes_2\":3,\"mask_2\":0,\"glasses_2\":0,\"complexion_1\":0,\"blush_3\":0,\"eyebrows_3\":0,\"chain_1\":0,\"makeup_1\":0,\"blemishes_1\":0,\"ears_1\":-1,\"skin\":0,\"chest_3\":0,\"chest_1\":0,\"lipstick_3\":0,\"arms\":0,\"bags_2\":0,\"blush_2\":0,\"shoes_1\":20,\"bracelets_1\":-1,\"torso_2\":0,\"helmet_2\":0,\"hair_color_1\":0,\"sun_1\":0,\"age_2\":0,\"face\":0,\"hair_2\":1,\"hair_1\":3,\"bags_1\":0,\"ears_2\":0,\"makeup_3\":0,\"bodyb_2\":0,\"makeup_4\":0,\"lipstick_1\":0,\"bproof_1\":0,\"beard_2\":0,\"sex\":0,\"bracelets_2\":0,\"decals_1\":0,\"sun_2\":0,\"blemishes_2\":0,\"beard_3\":0,\"makeup_2\":0,\"tshirt_2\":0,\"moles_1\":0,\"eyebrows_4\":0,\"lipstick_4\":0,\"decals_2\":0,\"arms_2\":0,\"tshirt_1\":15,\"age_1\":0}'),
(102, 'zlom', 0, 'zlom', 'Pracownik', 200, '{}', '{}'),
(122, 'kasyno', 0, 'rekrut', 'Ochroniarz', 1000, '{}', '{}'),
(123, 'kasyno', 1, 'krupier', 'Krupier', 1200, '{}', '{}'),
(124, 'kasyno', 3, 'kierownik', 'Kierownik', 1600, '{}', '{}'),
(125, 'kasyno', 4, 'boss', 'Szef', 1800, '{}', '{}'),
(127, 'kasyno', 2, 'barman', 'Barman', 1400, '{}', '{}'),
(128, 'gopostal', 0, 'employee', 'Pracownik', 200, '{\"tshirt_1\":59,\"torso_1\":89,\"arms\":31,\"pants_1\":36,\"glasses_1\":19,\"decals_2\":0,\"hair_color_2\":0,\"helmet_2\":0,\"hair_color_1\":0,\"face\":2,\"glasses_2\":0,\"torso_2\":1,\"shoes\":35,\"hair_1\":0,\"skin\":0,\"sex\":0,\"glasses_1\":19,\"pants_2\":0,\"hair_2\":0,\"decals_1\":0,\"tshirt_2\":0,\"helmet_1\":5}', '{\"tshirt_1\":36,\"torso_1\":0,\"arms\":68,\"pants_1\":30,\"glasses_1\":15,\"decals_2\":0,\"hair_color_2\":0,\"helmet_2\":0,\"hair_color_1\":0,\"face\":27,\"glasses_2\":0,\"torso_2\":11,\"shoes\":26,\"hair_1\":5,\"skin\":0,\"sex\":1,\"glasses_1\":15,\"pants_2\":2,\"hair_2\":0,\"decals_1\":0,\"tshirt_2\":0,\"helmet_1\":19}'),
(134, 'alfons', 0, 'recrue', 'Recrue', 12, '{\"hair_2\":0,\"hair_color_2\":0,\"torso_1\":32,\"bags_1\":0,\"helmet_2\":0,\"chain_2\":0,\"eyebrows_3\":0,\"makeup_3\":0,\"makeup_2\":0,\"tshirt_1\":31,\"makeup_1\":0,\"bags_2\":0,\"makeup_4\":0,\"eyebrows_4\":0,\"chain_1\":0,\"lipstick_4\":0,\"bproof_2\":0,\"hair_color_1\":0,\"decals_2\":0,\"pants_2\":0,\"age_2\":0,\"glasses_2\":0,\"ears_2\":0,\"arms\":27,\"lipstick_1\":0,\"ears_1\":-1,\"mask_2\":0,\"sex\":0,\"lipstick_3\":0,\"helmet_1\":-1,\"shoes_2\":0,\"beard_2\":0,\"beard_1\":0,\"lipstick_2\":0,\"beard_4\":0,\"glasses_1\":0,\"bproof_1\":0,\"mask_1\":0,\"decals_1\":1,\"hair_1\":0,\"eyebrows_2\":0,\"beard_3\":0,\"age_1\":0,\"tshirt_2\":0,\"skin\":0,\"torso_2\":0,\"eyebrows_1\":0,\"face\":0,\"shoes_1\":10,\"pants_1\":24}', '{\"hair_2\":0,\"hair_color_2\":0,\"torso_1\":57,\"bags_1\":0,\"helmet_2\":0,\"chain_2\":0,\"eyebrows_3\":0,\"makeup_3\":0,\"makeup_2\":0,\"tshirt_1\":38,\"makeup_1\":0,\"bags_2\":0,\"makeup_4\":0,\"eyebrows_4\":0,\"chain_1\":0,\"lipstick_4\":0,\"bproof_2\":0,\"hair_color_1\":0,\"decals_2\":0,\"pants_2\":1,\"age_2\":0,\"glasses_2\":0,\"ears_2\":0,\"arms\":21,\"lipstick_1\":0,\"ears_1\":-1,\"mask_2\":0,\"sex\":1,\"lipstick_3\":0,\"helmet_1\":-1,\"shoes_2\":0,\"beard_2\":0,\"beard_1\":0,\"lipstick_2\":0,\"beard_4\":0,\"glasses_1\":5,\"bproof_1\":0,\"mask_1\":0,\"decals_1\":1,\"hair_1\":0,\"eyebrows_2\":0,\"beard_3\":0,\"age_1\":0,\"tshirt_2\":0,\"skin\":0,\"torso_2\":0,\"eyebrows_1\":0,\"face\":0,\"shoes_1\":49,\"pants_1\":11}'),
(135, 'alfons', 1, 'novice', 'Novice', 24, '{\"hair_2\":0,\"hair_color_2\":0,\"torso_1\":32,\"bags_1\":0,\"helmet_2\":0,\"chain_2\":0,\"eyebrows_3\":0,\"makeup_3\":0,\"makeup_2\":0,\"tshirt_1\":31,\"makeup_1\":0,\"bags_2\":0,\"makeup_4\":0,\"eyebrows_4\":0,\"chain_1\":0,\"lipstick_4\":0,\"bproof_2\":0,\"hair_color_1\":0,\"decals_2\":0,\"pants_2\":0,\"age_2\":0,\"glasses_2\":0,\"ears_2\":0,\"arms\":27,\"lipstick_1\":0,\"ears_1\":-1,\"mask_2\":0,\"sex\":0,\"lipstick_3\":0,\"helmet_1\":-1,\"shoes_2\":0,\"beard_2\":0,\"beard_1\":0,\"lipstick_2\":0,\"beard_4\":0,\"glasses_1\":0,\"bproof_1\":0,\"mask_1\":0,\"decals_1\":1,\"hair_1\":0,\"eyebrows_2\":0,\"beard_3\":0,\"age_1\":0,\"tshirt_2\":0,\"skin\":0,\"torso_2\":0,\"eyebrows_1\":0,\"face\":0,\"shoes_1\":10,\"pants_1\":24}', '{\"hair_2\":0,\"hair_color_2\":0,\"torso_1\":57,\"bags_1\":0,\"helmet_2\":0,\"chain_2\":0,\"eyebrows_3\":0,\"makeup_3\":0,\"makeup_2\":0,\"tshirt_1\":38,\"makeup_1\":0,\"bags_2\":0,\"makeup_4\":0,\"eyebrows_4\":0,\"chain_1\":0,\"lipstick_4\":0,\"bproof_2\":0,\"hair_color_1\":0,\"decals_2\":0,\"pants_2\":1,\"age_2\":0,\"glasses_2\":0,\"ears_2\":0,\"arms\":21,\"lipstick_1\":0,\"ears_1\":-1,\"mask_2\":0,\"sex\":1,\"lipstick_3\":0,\"helmet_1\":-1,\"shoes_2\":0,\"beard_2\":0,\"beard_1\":0,\"lipstick_2\":0,\"beard_4\":0,\"glasses_1\":5,\"bproof_1\":0,\"mask_1\":0,\"decals_1\":1,\"hair_1\":0,\"eyebrows_2\":0,\"beard_3\":0,\"age_1\":0,\"tshirt_2\":0,\"skin\":0,\"torso_2\":0,\"eyebrows_1\":0,\"face\":0,\"shoes_1\":49,\"pants_1\":11}'),
(136, 'alfons', 2, 'experimente', 'Experimente', 36, '{\"hair_2\":0,\"hair_color_2\":0,\"torso_1\":26,\"bags_1\":0,\"helmet_2\":0,\"chain_2\":0,\"eyebrows_3\":0,\"makeup_3\":0,\"makeup_2\":0,\"tshirt_1\":57,\"makeup_1\":0,\"bags_2\":0,\"makeup_4\":0,\"eyebrows_4\":0,\"chain_1\":0,\"lipstick_4\":0,\"bproof_2\":0,\"hair_color_1\":0,\"decals_2\":0,\"pants_2\":4,\"age_2\":0,\"glasses_2\":0,\"ears_2\":0,\"arms\":11,\"lipstick_1\":0,\"ears_1\":-1,\"mask_2\":0,\"sex\":0,\"lipstick_3\":0,\"helmet_1\":-1,\"shoes_2\":0,\"beard_2\":0,\"beard_1\":0,\"lipstick_2\":0,\"beard_4\":0,\"glasses_1\":0,\"bproof_1\":0,\"mask_1\":0,\"decals_1\":0,\"hair_1\":0,\"eyebrows_2\":0,\"beard_3\":0,\"age_1\":0,\"tshirt_2\":0,\"skin\":0,\"torso_2\":0,\"eyebrows_1\":0,\"face\":0,\"shoes_1\":10,\"pants_1\":24}', '{\"hair_2\":0,\"hair_color_2\":0,\"torso_1\":57,\"bags_1\":0,\"helmet_2\":0,\"chain_2\":0,\"eyebrows_3\":0,\"makeup_3\":0,\"makeup_2\":0,\"tshirt_1\":38,\"makeup_1\":0,\"bags_2\":0,\"makeup_4\":0,\"eyebrows_4\":0,\"chain_1\":0,\"lipstick_4\":0,\"bproof_2\":0,\"hair_color_1\":0,\"decals_2\":0,\"pants_2\":1,\"age_2\":0,\"glasses_2\":0,\"ears_2\":0,\"arms\":21,\"lipstick_1\":0,\"ears_1\":-1,\"mask_2\":0,\"sex\":1,\"lipstick_3\":0,\"helmet_1\":-1,\"shoes_2\":0,\"beard_2\":0,\"beard_1\":0,\"lipstick_2\":0,\"beard_4\":0,\"glasses_1\":5,\"bproof_1\":0,\"mask_1\":0,\"decals_1\":1,\"hair_1\":0,\"eyebrows_2\":0,\"beard_3\":0,\"age_1\":0,\"tshirt_2\":0,\"skin\":0,\"torso_2\":0,\"eyebrows_1\":0,\"face\":0,\"shoes_1\":49,\"pants_1\":11}'),
(137, 'alfons', 3, 'uber', 'Uber', 48, '{\"hair_2\":0,\"hair_color_2\":0,\"torso_1\":26,\"bags_1\":0,\"helmet_2\":0,\"chain_2\":0,\"eyebrows_3\":0,\"makeup_3\":0,\"makeup_2\":0,\"tshirt_1\":57,\"makeup_1\":0,\"bags_2\":0,\"makeup_4\":0,\"eyebrows_4\":0,\"chain_1\":0,\"lipstick_4\":0,\"bproof_2\":0,\"hair_color_1\":0,\"decals_2\":0,\"pants_2\":4,\"age_2\":0,\"glasses_2\":0,\"ears_2\":0,\"arms\":11,\"lipstick_1\":0,\"ears_1\":-1,\"mask_2\":0,\"sex\":0,\"lipstick_3\":0,\"helmet_1\":-1,\"shoes_2\":0,\"beard_2\":0,\"beard_1\":0,\"lipstick_2\":0,\"beard_4\":0,\"glasses_1\":0,\"bproof_1\":0,\"mask_1\":0,\"decals_1\":0,\"hair_1\":0,\"eyebrows_2\":0,\"beard_3\":0,\"age_1\":0,\"tshirt_2\":0,\"skin\":0,\"torso_2\":0,\"eyebrows_1\":0,\"face\":0,\"shoes_1\":10,\"pants_1\":24}', '{\"hair_2\":0,\"hair_color_2\":0,\"torso_1\":57,\"bags_1\":0,\"helmet_2\":0,\"chain_2\":0,\"eyebrows_3\":0,\"makeup_3\":0,\"makeup_2\":0,\"tshirt_1\":38,\"makeup_1\":0,\"bags_2\":0,\"makeup_4\":0,\"eyebrows_4\":0,\"chain_1\":0,\"lipstick_4\":0,\"bproof_2\":0,\"hair_color_1\":0,\"decals_2\":0,\"pants_2\":1,\"age_2\":0,\"glasses_2\":0,\"ears_2\":0,\"arms\":21,\"lipstick_1\":0,\"ears_1\":-1,\"mask_2\":0,\"sex\":1,\"lipstick_3\":0,\"helmet_1\":-1,\"shoes_2\":0,\"beard_2\":0,\"beard_1\":0,\"lipstick_2\":0,\"beard_4\":0,\"glasses_1\":5,\"bproof_1\":0,\"mask_1\":0,\"decals_1\":1,\"hair_1\":0,\"eyebrows_2\":0,\"beard_3\":0,\"age_1\":0,\"tshirt_2\":0,\"skin\":0,\"torso_2\":0,\"eyebrows_1\":0,\"face\":0,\"shoes_1\":49,\"pants_1\":11}'),
(138, 'alfons', 4, 'boss', 'Patron', 0, '{\"hair_2\":0,\"hair_color_2\":0,\"torso_1\":29,\"bags_1\":0,\"helmet_2\":0,\"chain_2\":0,\"eyebrows_3\":0,\"makeup_3\":0,\"makeup_2\":0,\"tshirt_1\":31,\"makeup_1\":0,\"bags_2\":0,\"makeup_4\":0,\"eyebrows_4\":0,\"chain_1\":0,\"lipstick_4\":0,\"bproof_2\":0,\"hair_color_1\":0,\"decals_2\":0,\"pants_2\":4,\"age_2\":0,\"glasses_2\":0,\"ears_2\":0,\"arms\":1,\"lipstick_1\":0,\"ears_1\":-1,\"mask_2\":0,\"sex\":0,\"lipstick_3\":0,\"helmet_1\":-1,\"shoes_2\":0,\"beard_2\":0,\"beard_1\":0,\"lipstick_2\":0,\"beard_4\":0,\"glasses_1\":0,\"bproof_1\":0,\"mask_1\":0,\"decals_1\":0,\"hair_1\":0,\"eyebrows_2\":0,\"beard_3\":0,\"age_1\":0,\"tshirt_2\":0,\"skin\":0,\"torso_2\":4,\"eyebrows_1\":0,\"face\":0,\"shoes_1\":10,\"pants_1\":24}', '{\"hair_2\":0,\"hair_color_2\":0,\"torso_1\":57,\"bags_1\":0,\"helmet_2\":0,\"chain_2\":0,\"eyebrows_3\":0,\"makeup_3\":0,\"makeup_2\":0,\"tshirt_1\":38,\"makeup_1\":0,\"bags_2\":0,\"makeup_4\":0,\"eyebrows_4\":0,\"chain_1\":0,\"lipstick_4\":0,\"bproof_2\":0,\"hair_color_1\":0,\"decals_2\":0,\"pants_2\":1,\"age_2\":0,\"glasses_2\":0,\"ears_2\":0,\"arms\":21,\"lipstick_1\":0,\"ears_1\":-1,\"mask_2\":0,\"sex\":1,\"lipstick_3\":0,\"helmet_1\":-1,\"shoes_2\":0,\"beard_2\":0,\"beard_1\":0,\"lipstick_2\":0,\"beard_4\":0,\"glasses_1\":5,\"bproof_1\":0,\"mask_1\":0,\"decals_1\":1,\"hair_1\":0,\"eyebrows_2\":0,\"beard_3\":0,\"age_1\":0,\"tshirt_2\":0,\"skin\":0,\"torso_2\":0,\"eyebrows_1\":0,\"face\":0,\"shoes_1\":49,\"pants_1\":11}');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `licenses`
--

CREATE TABLE `licenses` (
  `type` varchar(60) NOT NULL,
  `label` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `licenses`
--

INSERT INTO `licenses` (`type`, `label`) VALUES
('boat', 'Boat License'),
('dmv', 'Traffic Laws'),
('drive', 'kat.B'),
('drive_bike', 'kat.A'),
('drive_truck', 'kat.C'),
('weapon', 'Licencja na bron krotka'),
('weapon_long', 'Bron dluga'),
('weapon_taser', 'Taser');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `owned_properties`
--

CREATE TABLE `owned_properties` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` double NOT NULL,
  `rented` int(11) NOT NULL,
  `owner` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `owned_properties`
--

INSERT INTO `owned_properties` (`id`, `name`, `price`, `rented`, `owner`) VALUES
(1, 'LowEndApartment', 1250, 1, 'steam:110000104eb808d');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `owned_vehicles`
--

CREATE TABLE `owned_vehicles` (
  `id` int(55) NOT NULL,
  `owner` varchar(22) COLLATE utf8mb4_bin NOT NULL,
  `vehicle` longtext COLLATE utf8mb4_bin,
  `owner_type` int(2) NOT NULL DEFAULT '1',
  `state` int(4) NOT NULL DEFAULT '0',
  `plate` varchar(12) COLLATE utf8mb4_bin NOT NULL,
  `vehicleid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Zrzut danych tabeli `owned_vehicles`
--

INSERT INTO `owned_vehicles` (`id`, `owner`, `vehicle`, `owner_type`, `state`, `plate`, `vehicleid`) VALUES
(8, 'steam:110000104eb808d', '{\"modTank\":-1,\"modShifterLeavers\":-1,\"extras\":{\"1\":false},\"modRightFender\":-1,\"wheels\":0,\"modVanityPlate\":-1,\"modFrontWheels\":-1,\"plate\":\"MJV 170\",\"modEngineBlock\":-1,\"windowTint\":-1,\"color2\":0,\"plateIndex\":0,\"modTrunk\":-1,\"pearlescentColor\":0,\"modExhaust\":-1,\"modWindows\":-1,\"modHydrolic\":-1,\"modRoof\":-1,\"modArmor\":-1,\"modFender\":-1,\"neonColor\":[255,0,255],\"wheelColor\":156,\"modBrakes\":-1,\"modDoorSpeaker\":-1,\"modSpeakers\":-1,\"modSmokeEnabled\":1,\"modStruts\":-1,\"modAerials\":-1,\"modSpoilers\":-1,\"modFrontBumper\":-1,\"modAirFilter\":-1,\"modArchCover\":-1,\"modRearBumper\":-1,\"modTrimA\":-1,\"modSteeringWheel\":-1,\"model\":-532475078,\"modXenon\":false,\"modLivery\":-1,\"dirtLevel\":5.8826513290406,\"modHood\":-1,\"modTransmission\":-1,\"modAPlate\":-1,\"modEngine\":-1,\"tyreSmokeColor\":[255,255,255],\"modTurbo\":false,\"modBackWheels\":-1,\"modHorns\":-1,\"neonEnabled\":[false,false,false,false],\"health\":1000,\"modPlateHolder\":-1,\"modSuspension\":-1,\"modSideSkirt\":-1,\"modGrille\":-1,\"modDashboard\":-1,\"modFrame\":-1,\"modOrnaments\":-1,\"modSeats\":-1,\"color1\":0,\"modDial\":-1,\"modTrimB\":-1}', 1, 1, 'MJV 170', NULL),
(9, 'steam:110000104eb808d', '{\"modTank\":-1,\"pearlescentColor\":112,\"modHorns\":-1,\"wheels\":0,\"modSpeakers\":-1,\"modFrontBumper\":-1,\"modRightFender\":-1,\"model\":-252651765,\"modTrimB\":-1,\"modSideSkirt\":-1,\"modRoof\":-1,\"modHydrolic\":-1,\"color2\":27,\"modVanityPlate\":-1,\"modArmor\":-1,\"modTrimA\":-1,\"modBrakes\":-1,\"modEngine\":-1,\"modSteeringWheel\":-1,\"modBackWheels\":-1,\"modPlateHolder\":-1,\"modTrunk\":-1,\"windowTint\":-1,\"plate\":\"SKV 854\",\"modFrame\":-1,\"modFender\":-1,\"modDoorSpeaker\":-1,\"neonColor\":[255,0,255],\"modEngineBlock\":-1,\"modOrnaments\":-1,\"modSmokeEnabled\":1,\"modDial\":-1,\"extras\":{\"12\":true,\"11\":false},\"modExhaust\":-1,\"modXenon\":false,\"modArchCover\":-1,\"modSeats\":-1,\"color1\":111,\"modStruts\":-1,\"modWindows\":-1,\"wheelColor\":156,\"modRearBumper\":-1,\"modAerials\":-1,\"modLivery\":-1,\"modSpoilers\":-1,\"modSuspension\":-1,\"plateIndex\":3,\"dirtLevel\":0.62076336145402,\"modDashboard\":-1,\"modTransmission\":-1,\"modHood\":-1,\"modShifterLeavers\":-1,\"neonEnabled\":[false,false,false,false],\"modGrille\":-1,\"tyreSmokeColor\":[255,255,255],\"modTurbo\":false,\"modAirFilter\":-1,\"health\":1000,\"modFrontWheels\":-1,\"modAPlate\":-1}', 1, 1, 'SKV 854', NULL),
(10, 'steam:110000104eb808d', '{\"modFrontBumper\":-1,\"color1\":1,\"modTurbo\":false,\"modSuspension\":-1,\"modOrnaments\":-1,\"modSeats\":-1,\"neonEnabled\":[false,false,false,false],\"modDoorSpeaker\":-1,\"modGrille\":-1,\"health\":1000,\"neonColor\":[255,0,255],\"tyreSmokeColor\":[255,255,255],\"modTrimB\":-1,\"dirtLevel\":5.0,\"modAerials\":-1,\"modEngineBlock\":-1,\"modWindows\":-1,\"modRoof\":-1,\"modBrakes\":-1,\"modEngine\":-1,\"modLivery\":0,\"modArchCover\":-1,\"extras\":{\"1\":true},\"modExhaust\":-1,\"modRearBumper\":-1,\"modBackWheels\":-1,\"modFrontWheels\":-1,\"modRightFender\":-1,\"wheelColor\":156,\"modSpeakers\":-1,\"modXenon\":false,\"color2\":0,\"modSmokeEnabled\":1,\"modVanityPlate\":-1,\"modHorns\":-1,\"modHydrolic\":-1,\"modTrimA\":-1,\"plate\":\"SRV 054\",\"wheels\":0,\"modStruts\":-1,\"modHood\":-1,\"modPlateHolder\":-1,\"plateIndex\":4,\"modDial\":-1,\"modFrame\":-1,\"modShifterLeavers\":-1,\"modFender\":-1,\"modSteeringWheel\":-1,\"model\":-347502367,\"modTrunk\":-1,\"modSpoilers\":-1,\"modSideSkirt\":-1,\"pearlescentColor\":5,\"windowTint\":-1,\"modAirFilter\":-1,\"modTank\":-1,\"modAPlate\":-1,\"modTransmission\":-1,\"modArmor\":-1,\"modDashboard\":-1}', 1, 1, 'SRV 054', NULL),
(11, 'steam:110000104eb808d', '{\"modSteeringWheel\":-1,\"modTransmission\":2,\"modRightFender\":-1,\"modRearBumper\":-1,\"modSpoilers\":-1,\"modFrontBumper\":-1,\"modSmokeEnabled\":1,\"tyreSmokeColor\":[255,255,255],\"modArchCover\":-1,\"dirtLevel\":6.566032409668,\"modXenon\":1,\"extras\":{\"11\":false},\"modGrille\":-1,\"modFender\":-1,\"modHorns\":-1,\"wheels\":0,\"modAirFilter\":-1,\"plate\":\"OOG 077\",\"health\":997,\"wheelColor\":156,\"modHood\":-1,\"modSpeakers\":-1,\"modTrunk\":-1,\"modFrontWheels\":-1,\"modOrnaments\":-1,\"modBrakes\":2,\"modEngineBlock\":-1,\"modSuspension\":3,\"modEngine\":3,\"modSideSkirt\":-1,\"modLivery\":-1,\"pearlescentColor\":147,\"modStruts\":-1,\"modDoorSpeaker\":-1,\"modExhaust\":-1,\"color2\":147,\"modArmor\":4,\"modAPlate\":-1,\"modPlateHolder\":-1,\"modFrame\":-1,\"modVanityPlate\":-1,\"modTrimB\":-1,\"model\":1056539313,\"modDashboard\":-1,\"modDial\":-1,\"neonColor\":[255,0,255],\"modTrimA\":-1,\"modRoof\":-1,\"modSeats\":-1,\"modTurbo\":1,\"modAerials\":-1,\"modTank\":-1,\"windowTint\":5,\"modShifterLeavers\":-1,\"modBackWheels\":-1,\"neonEnabled\":[false,false,false,false],\"modHydrolic\":-1,\"modWindows\":-1,\"color1\":147,\"plateIndex\":1}', 1, 1, 'OOG 077', NULL),
(13, 'steam:110000104eb808d', '{\"modSuspension\":3,\"windowTint\":1,\"modBrakes\":0,\"modDial\":-1,\"modVanityPlate\":-1,\"wheelColor\":156,\"modArchCover\":-1,\"modFrontBumper\":-1,\"modFender\":-1,\"modDoorSpeaker\":-1,\"wheels\":3,\"modSeats\":-1,\"dirtLevel\":0.055397283285856,\"modAerials\":-1,\"modExhaust\":-1,\"modEngine\":3,\"modAirFilter\":-1,\"modTransmission\":2,\"modAPlate\":-1,\"plateIndex\":1,\"health\":1000,\"modHydrolic\":-1,\"modEngineBlock\":-1,\"modOrnaments\":-1,\"modGrille\":-1,\"pearlescentColor\":147,\"modTurbo\":1,\"modXenon\":1,\"modTank\":-1,\"extras\":{\"11\":true,\"2\":true},\"modTrunk\":-1,\"plate\":\"FWK 085\",\"model\":104532066,\"modTrimA\":-1,\"modPlateHolder\":-1,\"modSideSkirt\":-1,\"modLivery\":-1,\"modFrame\":-1,\"modArmor\":4,\"neonEnabled\":[false,false,false,false],\"modRightFender\":-1,\"modSmokeEnabled\":1,\"modSteeringWheel\":-1,\"modWindows\":-1,\"modSpeakers\":-1,\"modFrontWheels\":-1,\"modStruts\":-1,\"modTrimB\":-1,\"modHorns\":-1,\"modHood\":-1,\"modRoof\":-1,\"neonColor\":[255,0,255],\"tyreSmokeColor\":[255,255,255],\"modSpoilers\":-1,\"modShifterLeavers\":-1,\"modBackWheels\":-1,\"color1\":147,\"modRearBumper\":-1,\"modDashboard\":-1,\"color2\":0}', 1, 1, 'FWK 085', NULL),
(18, 'steam:110000104eb808d', '{\"modAerials\":-1,\"modDoorSpeaker\":-1,\"modTrunk\":-1,\"pearlescentColor\":134,\"modSideSkirt\":-1,\"modXenon\":false,\"modHydrolic\":-1,\"modHorns\":-1,\"neonColor\":[255,0,255],\"modPlateHolder\":-1,\"extras\":{\"10\":false,\"11\":true},\"modAPlate\":-1,\"modAirFilter\":-1,\"plate\":\"CBU 726\",\"modBackWheels\":-1,\"modHood\":-1,\"modVanityPlate\":-1,\"modSpeakers\":-1,\"modEngine\":-1,\"modOrnaments\":-1,\"plateIndex\":1,\"modRightFender\":-1,\"wheelColor\":156,\"modFrontBumper\":-1,\"modLivery\":-1,\"dirtLevel\":4.0345587730408,\"modArchCover\":-1,\"modRoof\":-1,\"modDial\":-1,\"modDashboard\":-1,\"modShifterLeavers\":-1,\"modTransmission\":-1,\"wheels\":0,\"model\":-103310860,\"tyreSmokeColor\":[255,255,255],\"modTrimB\":-1,\"modRearBumper\":-1,\"neonEnabled\":[false,false,false,false],\"modFender\":-1,\"modTurbo\":false,\"modTrimA\":-1,\"modFrame\":-1,\"modGrille\":-1,\"windowTint\":-1,\"modFrontWheels\":-1,\"color2\":2,\"modSpoilers\":-1,\"modBrakes\":-1,\"health\":999,\"modSmokeEnabled\":1,\"modSeats\":-1,\"color1\":2,\"modTank\":-1,\"modSuspension\":-1,\"modWindows\":-1,\"modStruts\":-1,\"modExhaust\":-1,\"modSteeringWheel\":-1,\"modArmor\":-1,\"modEngineBlock\":-1}', 1, 0, 'CBU 726', NULL),
(19, 'steam:11000010fdc8544', '{\"modVanityPlate\":-1,\"modTransmission\":-1,\"modRightFender\":-1,\"modRearBumper\":-1,\"modSpoilers\":-1,\"modEngine\":-1,\"pearlescentColor\":0,\"tyreSmokeColor\":[255,255,255],\"modArchCover\":-1,\"modStruts\":-1,\"modXenon\":false,\"extras\":[],\"modTrimB\":-1,\"modAerials\":-1,\"modHorns\":-1,\"wheels\":0,\"modAirFilter\":-1,\"plate\":\"UOG 941\",\"neonEnabled\":[false,false,false,false],\"wheelColor\":156,\"modSteeringWheel\":-1,\"neonColor\":[255,0,255],\"modTrunk\":-1,\"modFrontBumper\":-1,\"modOrnaments\":-1,\"modGrille\":-1,\"plateIndex\":0,\"modSuspension\":-1,\"model\":1840495621,\"modSideSkirt\":-1,\"modTurbo\":false,\"dirtLevel\":0.78898918628692,\"windowTint\":-1,\"modDoorSpeaker\":-1,\"modDashboard\":-1,\"color2\":2,\"modFender\":-1,\"modAPlate\":-1,\"modPlateHolder\":-1,\"modFrontWheels\":-1,\"modSmokeEnabled\":1,\"modHood\":-1,\"modFrame\":-1,\"modArmor\":-1,\"modDial\":-1,\"modTrimA\":-1,\"modLivery\":0,\"health\":1000,\"modHydrolic\":-1,\"modSpeakers\":-1,\"modExhaust\":-1,\"modTank\":-1,\"modBrakes\":-1,\"modShifterLeavers\":-1,\"modBackWheels\":-1,\"modRoof\":-1,\"modSeats\":-1,\"modWindows\":-1,\"color1\":112,\"modEngineBlock\":-1}', 1, 0, 'UOG 941', NULL),
(20, 'steam:110000104eb808d', '{\"modSmokeEnabled\":1,\"modShifterLeavers\":-1,\"extras\":[],\"modRightFender\":-1,\"modXenon\":1,\"modVanityPlate\":-1,\"modFrontWheels\":-1,\"plate\":\"EUI 325\",\"modEngineBlock\":-1,\"windowTint\":1,\"color2\":147,\"plateIndex\":3,\"modDoorSpeaker\":-1,\"modSpeakers\":-1,\"modEngine\":3,\"health\":1000,\"modHydrolic\":-1,\"modWindows\":-1,\"modBackWheels\":-1,\"modFender\":-1,\"modSeats\":-1,\"wheelColor\":156,\"modBrakes\":2,\"modTrimA\":-1,\"dirtLevel\":0.50430381298066,\"modTank\":-1,\"modStruts\":-1,\"modAerials\":-1,\"modSpoilers\":-1,\"modFrontBumper\":-1,\"modAirFilter\":-1,\"modArchCover\":-1,\"modRearBumper\":-1,\"modHood\":-1,\"modSteeringWheel\":-1,\"modSideSkirt\":-1,\"modHorns\":-1,\"modLivery\":-1,\"modTransmission\":2,\"model\":484432985,\"modDial\":-1,\"modAPlate\":-1,\"modRoof\":-1,\"tyreSmokeColor\":[255,255,255],\"modTurbo\":1,\"modTrunk\":-1,\"wheels\":7,\"neonEnabled\":[false,false,false,false],\"neonColor\":[255,0,255],\"modPlateHolder\":-1,\"modFrame\":-1,\"modExhaust\":-1,\"modGrille\":-1,\"modArmor\":4,\"pearlescentColor\":147,\"modOrnaments\":-1,\"modDashboard\":-1,\"color1\":12,\"modSuspension\":3,\"modTrimB\":-1}', 1, 1, 'EUI 325', NULL),
(23, 'steam:110000104eb808d', '{\"modBrakes\":-1,\"modAPlate\":-1,\"health\":1000,\"plateIndex\":3,\"modRoof\":-1,\"modFrontBumper\":-1,\"color2\":147,\"modSeats\":-1,\"pearlescentColor\":147,\"modTrunk\":-1,\"modSpoilers\":-1,\"modEngine\":-1,\"modStruts\":-1,\"modDial\":-1,\"modFender\":-1,\"modDoorSpeaker\":-1,\"model\":-580610645,\"modHood\":-1,\"modRearBumper\":-1,\"modShifterLeavers\":-1,\"extras\":[],\"dirtLevel\":4.8453030586242,\"modExhaust\":-1,\"modXenon\":1,\"modHorns\":-1,\"modPlateHolder\":-1,\"tyreSmokeColor\":[255,255,255],\"modFrame\":-1,\"modTank\":-1,\"modHydrolic\":-1,\"modArchCover\":-1,\"modGrille\":-1,\"modFrontWheels\":-1,\"windowTint\":1,\"modDashboard\":-1,\"modSmokeEnabled\":1,\"modTransmission\":-1,\"modLivery\":-1,\"modRightFender\":-1,\"modWindows\":-1,\"modTrimA\":-1,\"neonColor\":[255,0,255],\"modArmor\":-1,\"modSideSkirt\":-1,\"modAerials\":-1,\"modAirFilter\":-1,\"modSteeringWheel\":-1,\"neonEnabled\":[false,false,false,false],\"modTrimB\":-1,\"modSuspension\":-1,\"modSpeakers\":-1,\"modTurbo\":1,\"color1\":147,\"modBackWheels\":-1,\"wheels\":0,\"modEngineBlock\":-1,\"modVanityPlate\":-1,\"modOrnaments\":-1,\"wheelColor\":156,\"plate\":\"ZMO 446\"}', 1, 0, 'ZMO 446', NULL),
(24, 'steam:110000104eb808d', '{\"modSuspension\":-1,\"modSteeringWheel\":-1,\"modBackWheels\":-1,\"model\":329848940,\"modGrille\":-1,\"modOrnaments\":-1,\"modHorns\":-1,\"modFrontBumper\":-1,\"neonEnabled\":[false,false,false,false],\"modArmor\":-1,\"neonColor\":[255,0,255],\"modEngine\":-1,\"modLivery\":-1,\"modStruts\":-1,\"modDial\":-1,\"modAerials\":-1,\"modTrimA\":-1,\"modSeats\":-1,\"pearlescentColor\":70,\"modXenon\":false,\"color1\":75,\"modWindows\":-1,\"modEngineBlock\":-1,\"wheels\":0,\"modVanityPlate\":-1,\"modAirFilter\":-1,\"modRoof\":-1,\"modSpeakers\":-1,\"color2\":75,\"modSmokeEnabled\":1,\"modArchCover\":-1,\"modShifterLeavers\":-1,\"plateIndex\":0,\"modPlateHolder\":-1,\"modDashboard\":-1,\"modFrame\":-1,\"modSideSkirt\":-1,\"modFrontWheels\":-1,\"windowTint\":-1,\"plate\":\"WPR 580\",\"health\":998,\"modRearBumper\":-1,\"modTrunk\":-1,\"tyreSmokeColor\":[255,255,255],\"dirtLevel\":4.1630673408508,\"modSpoilers\":-1,\"wheelColor\":156,\"modExhaust\":-1,\"modTurbo\":false,\"modBrakes\":-1,\"extras\":{\"1\":false},\"modTank\":-1,\"modRightFender\":-1,\"modFender\":-1,\"modTrimB\":-1,\"modTransmission\":-1,\"modHydrolic\":-1,\"modDoorSpeaker\":-1,\"modHood\":-1,\"modAPlate\":-1}', 1, 1, 'WPR 580', NULL),
(25, 'steam:110000114f63a7e', '{\"modSuspension\":-1,\"modSteeringWheel\":-1,\"modWindows\":-1,\"modSpeakers\":-1,\"modGrille\":-1,\"modOrnaments\":-1,\"modTrimB\":-1,\"modFrontBumper\":-1,\"neonEnabled\":[false,false,false,false],\"modArmor\":-1,\"modPlateHolder\":-1,\"modEngine\":-1,\"modLivery\":0,\"modTank\":-1,\"modDial\":-1,\"dirtLevel\":4.1491513252258,\"modTrimA\":-1,\"modSeats\":-1,\"pearlescentColor\":2,\"modXenon\":false,\"modVanityPlate\":-1,\"modTransmission\":-1,\"plateIndex\":0,\"modDashboard\":-1,\"modTrunk\":-1,\"modHorns\":-1,\"modRoof\":-1,\"modStruts\":-1,\"color2\":120,\"modAirFilter\":-1,\"modArchCover\":-1,\"modShifterLeavers\":-1,\"modBackWheels\":-1,\"modFrontWheels\":-1,\"plate\":\"MMX 588\",\"modFrame\":-1,\"modSideSkirt\":-1,\"modAerials\":-1,\"windowTint\":-1,\"modSpoilers\":-1,\"health\":946,\"modRearBumper\":-1,\"model\":1916667959,\"tyreSmokeColor\":[255,255,255],\"modEngineBlock\":-1,\"modDoorSpeaker\":-1,\"modHood\":-1,\"modExhaust\":-1,\"modTurbo\":false,\"modBrakes\":-1,\"extras\":{\"2\":true,\"1\":true},\"wheelColor\":112,\"modRightFender\":-1,\"modFender\":-1,\"neonColor\":[255,0,255],\"color1\":1,\"modHydrolic\":-1,\"modAPlate\":-1,\"modSmokeEnabled\":1,\"wheels\":5}', 1, 1, 'MMX 588', NULL),
(26, 'steam:110000114f63a7e', '{\"color1\":12,\"modSpeakers\":-1,\"wheels\":0,\"modSeats\":-1,\"modTank\":-1,\"modEngineBlock\":-1,\"windowTint\":-1,\"modTurbo\":false,\"modAerials\":-1,\"extras\":{\"10\":false,\"11\":false,\"12\":true},\"modDashboard\":-1,\"modXenon\":false,\"modSpoilers\":-1,\"modVanityPlate\":-1,\"modRightFender\":-1,\"modOrnaments\":-1,\"tyreSmokeColor\":[255,255,255],\"modTransmission\":-1,\"modSmokeEnabled\":1,\"modFrame\":-1,\"health\":1000,\"modLivery\":0,\"modAirFilter\":-1,\"modSideSkirt\":-1,\"modPlateHolder\":-1,\"modTrimB\":-1,\"modRoof\":-1,\"dirtLevel\":5.6437454223632,\"neonColor\":[255,0,255],\"modArmor\":-1,\"modRearBumper\":-1,\"modSteeringWheel\":-1,\"modDial\":-1,\"modShifterLeavers\":-1,\"color2\":1,\"modBackWheels\":-1,\"plateIndex\":3,\"neonEnabled\":[false,false,false,false],\"modHood\":-1,\"pearlescentColor\":3,\"modFrontWheels\":-1,\"modWindows\":-1,\"modDoorSpeaker\":-1,\"modExhaust\":-1,\"modSuspension\":-1,\"model\":542147885,\"modFender\":-1,\"modTrimA\":-1,\"modGrille\":-1,\"modTrunk\":-1,\"modBrakes\":-1,\"modStruts\":-1,\"plate\":\"PJA 395\",\"modFrontBumper\":-1,\"modHorns\":-1,\"modArchCover\":-1,\"wheelColor\":0,\"modHydrolic\":-1,\"modAPlate\":-1,\"modEngine\":-1}', 1, 0, 'PJA 395', NULL);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `phone_app_chat`
--

CREATE TABLE `phone_app_chat` (
  `id` int(11) NOT NULL,
  `channel` varchar(20) NOT NULL,
  `message` varchar(255) NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `phone_calls`
--

CREATE TABLE `phone_calls` (
  `id` int(11) NOT NULL,
  `owner` varchar(10) NOT NULL COMMENT 'Num tel proprio',
  `num` varchar(10) NOT NULL COMMENT 'Num reférence du contact',
  `incoming` int(11) NOT NULL COMMENT 'Défini si on est à l''origine de l''appels',
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `accepts` int(11) NOT NULL COMMENT 'Appels accepter ou pas'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `phone_calls`
--

INSERT INTO `phone_calls` (`id`, `owner`, `num`, `incoming`, `time`, `accepts`) VALUES
(1, '124', '222', 1, '2020-03-27 13:24:54', 0),
(2, '124', '222', 1, '2020-03-27 13:45:27', 0),
(3, '124', '222', 1, '2020-03-30 00:29:29', 0),
(4, '124', '222', 1, '2020-03-30 00:40:39', 0),
(5, '124', '222', 1, '2020-03-30 00:50:00', 0),
(6, '124', '222', 1, '2020-03-30 00:51:19', 0),
(7, '124', '222', 1, '2020-03-30 00:51:34', 0),
(8, '666', '666', 0, '2020-04-08 21:46:13', 0),
(9, '666', '666', 1, '2020-04-08 21:46:13', 0);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `phone_messages`
--

CREATE TABLE `phone_messages` (
  `id` int(11) NOT NULL,
  `transmitter` varchar(10) NOT NULL,
  `receiver` varchar(10) NOT NULL,
  `message` varchar(255) NOT NULL DEFAULT '0',
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `isRead` int(11) NOT NULL DEFAULT '0',
  `owner` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `phone_messages`
--

INSERT INTO `phone_messages` (`id`, `transmitter`, `receiver`, `message`, `time`, `isRead`, `owner`) VALUES
(179, '666', '666', 'gowno', '2020-04-08 21:46:39', 1, 0),
(180, '666', '666', 'gowno', '2020-04-08 21:46:39', 1, 1);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `phone_users_contacts`
--

CREATE TABLE `phone_users_contacts` (
  `id` int(11) NOT NULL,
  `identifier` varchar(60) CHARACTER SET utf8mb4 DEFAULT NULL,
  `number` varchar(10) CHARACTER SET utf8mb4 DEFAULT NULL,
  `display` varchar(64) CHARACTER SET utf8mb4 NOT NULL DEFAULT '-1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `phone_users_contacts`
--

INSERT INTO `phone_users_contacts` (`id`, `identifier`, `number`, `display`) VALUES
(1, '666', '12345', 'Nowy kontakt');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `playersTattoos`
--

CREATE TABLE `playersTattoos` (
  `id` int(11) NOT NULL,
  `identifier` varchar(255) NOT NULL,
  `tattoos` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `properties`
--

CREATE TABLE `properties` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `entering` varchar(255) DEFAULT NULL,
  `exit` varchar(255) DEFAULT NULL,
  `inside` varchar(255) DEFAULT NULL,
  `outside` varchar(255) DEFAULT NULL,
  `ipls` varchar(255) DEFAULT '[]',
  `gateway` varchar(255) DEFAULT NULL,
  `is_single` int(11) DEFAULT NULL,
  `is_room` int(11) DEFAULT NULL,
  `is_gateway` int(11) DEFAULT NULL,
  `room_menu` varchar(255) DEFAULT NULL,
  `price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `properties`
--

INSERT INTO `properties` (`id`, `name`, `label`, `entering`, `exit`, `inside`, `outside`, `ipls`, `gateway`, `is_single`, `is_room`, `is_gateway`, `room_menu`, `price`) VALUES
(1, 'WhispymoundDrive', 'Manhattan - West Harlem', '{\"y\":2019.4509277344,\"z\":17.861442565918,\"x\":-262.062}', '{\"y\":1345.5084228516,\"z\":44.046096801758,\"x\":334.22891235352}', '{\"y\":1345.5084228516,\"z\":44.046096801758,\"x\":334.22891235352}', '{\"y\":2019.4509277344,\"z\":17.861442565918,\"x\":-262.062}', '[]', NULL, 1, 1, 0, '{\"x\":332.43524169922,\"y\":1350.0681152344,\"z\":44.046119689941}', 1100000),
(2, 'NorthConkerAvenue2045', 'Brooklyn - Dyker Heights', '{\"y\":150.7391204834,\"z\":18.266862869263,\"x\":1215.8620605469}', '{\"y\":1345.5084228516,\"z\":44.046096801758,\"x\":334.22891235352}', '{\"y\":1345.5084228516,\"z\":45.046096801758,\"x\":334.22891235352}', '{\"y\":150.7391204834,\"z\":18.266862869263,\"x\":1215.8620605469}', '[]', NULL, 1, 1, 0, '{\"x\":332.43524169922,\"y\":1350.0681152344,\"z\":44.046119689941}', 500000),
(3, 'RichardMajesticApt2', 'Brooklyn - Borough Park', '{\"y\":380.70642089844,\"z\":34.927143096924,\"x\":1403.2937011719}', '{\"y\":1345.5084228516,\"z\":44.046096801758,\"x\":334.22891235352}', '{\"y\":1345.5084228516,\"z\":45.046096801758,\"x\":334.22891235352}', '{\"y\":380.70642089844,\"z\":34.927143096924,\"x\":1403.2937011719}', '[]', NULL, 1, 1, 0, '{\"x\":332.43524169922,\"y\":1350.0681152344,\"z\":44.046119689941}', 400000),
(4, 'NorthConkerAvenue2044', 'Bronx - Kingsbridge', '{\"y\":1876.6677246094,\"z\":8.9053249359131,\"x\":652.07067871094}', '{\"y\":1345.5084228516,\"z\":44.046096801758,\"x\":334.22891235352}', '{\"y\":1345.5084228516,\"z\":45.046096801758,\"x\":334.22891235352}', '{\"y\":1876.6677246094,\"z\":8.9053249359131,\"x\":652.07067871094}', '[]', NULL, 1, 1, 0, '{\"x\":332.43524169922,\"y\":1350.0681152344,\"z\":44.046119689941}', 350000),
(5, 'WildOatsDrive', 'Bronx - Throgs Neck', '{\"y\":2262.2236328125,\"z\":9.7480611801,\"x\":1603.8870849609}', '{\"y\":1345.5084228516,\"z\":44.046096801758,\"x\":334.22891235352}', '{\"y\":1345.5084228516,\"z\":45.046096801758,\"x\":334.22891235352}', '{\"y\":2262.2236328125,\"z\":9.7480611801,\"x\":1603.8870849609}', '[]', NULL, 1, 1, 0, '{\"x\":332.43524169922,\"y\":1350.0681152344,\"z\":44.046119689941}', 50000),
(6, 'HillcrestAvenue2862', 'Manhattan - Lenox Hill', '{\"y\":1150.3458251953,\"z\":13.713,\"x\":350.98425292969}', '{\"y\":1345.5084228516,\"z\":44.046096801758,\"x\":334.22891235352}', '{\"y\":1345.5084228516,\"z\":44.046096801758,\"x\":334.22891235352}', '{\"y\":1150.3458251953,\"z\":13.713,\"x\":350.98425292969}', '[]', NULL, 1, 1, 0, '{\"x\":332.43524169922,\"y\":1350.0681152344,\"z\":44.046119689941}', 1500000),
(7, 'LowEndApartment', 'Manhattan - Lower Manhattan', '{\"y\":-183.981674,\"z\":14.202451,\"x\":226.0137}', '{\"y\":1345.5084228516,\"z\":44.046096801758,\"x\":334.22891235352}', '{\"y\":1345.5084228516,\"z\":45.046096801758,\"x\":334.22891235352}', '{\"y\":-183.981674,\"z\":14.202451,\"x\":226.0137}', '[]', NULL, 1, 1, 0, '{\"x\":332.43524169922,\"y\":1350.0681152344,\"z\":44.046119689941}', 850000),
(8, 'MadWayneThunder', 'Manhattan - Harlem', '{\"y\":1679.80639,\"z\":13.7679,\"x\":-63.4515419}', '{\"y\":1345.5084228516,\"z\":44.046096801758,\"x\":334.22891235352}', '{\"y\":1345.5084228516,\"z\":44.046096801758,\"x\":334.22891235352}', '{\"y\":1679.80639,\"z\":13.7679,\"x\":-63.4515419}', '[]', NULL, 1, 1, 0, '{\"x\":332.43524169922,\"y\":1350.0681152344,\"z\":44.046119689941}', 1200000),
(9, 'HillcrestAvenue2874', 'Manhattan - Upper Manhattan', '{\"y\":1881.67175,\"z\":20.09117,\"x\":135.82473}', '{\"y\":1345.5084228516,\"z\":44.046096801758,\"x\":334.22891235352}', '{\"y\":1345.5084228516,\"z\":45.046096801758,\"x\":334.22891235352}', '{\"y\":1881.67175,\"z\":21.09117,\"x\":135.82473}', '[]', NULL, 1, 1, 0, '{\"x\":332.43524169922,\"y\":1350.0681152344,\"z\":44.046119689941}', 900000),
(10, 'HillcrestAvenue2868', 'Manhattan - Midtown Manhattan', '{\"y\":646.61663,\"z\":18.3575077,\"x\":-37.03642272949}', '{\"y\":1345.5084228516,\"z\":44.046096801758,\"x\":334.22891235352}', '{\"y\":1345.5084228516,\"z\":44.046096801758,\"x\":334.22891235352}', '{\"y\":646.61663,\"z\":19.3575077,\"x\":-37.03642272949}', '[]', NULL, 1, 1, 0, '{\"x\":332.43524169922,\"y\":1350.0681152344,\"z\":44.046119689941}', 1500000),
(11, 'TinselTowersApt12', 'New Jersey - The Heights', '{\"y\":1563.23486,\"z\":18.566926,\"x\":-1068.45483}', '{\"y\":1345.5084228516,\"z\":44.046096801758,\"x\":334.22891235352}', '{\"y\":1345.5084228516,\"z\":45.046096801758,\"x\":334.22891235352}', '{\"y\":1563.23486,\"z\":18.566926,\"x\":-1068.45483}', '[]', NULL, 1, 1, 0, '{\"x\":332.43524169922,\"y\":1350.0681152344,\"z\":44.046119689941}', 150000),
(12, 'MiltonDrive', 'New Jersey - Greenville', '{\"y\":873.6574,\"z\":24.4914,\"x\":-1356.88964}', '{\"y\":1345.5084228516,\"z\":44.046096801758,\"x\":334.22891235352}', '{\"y\":1345.5084228516,\"z\":44.046096801758,\"x\":334.22891235352}', '{\"y\":873.6574,\"z\":24.4914,\"x\":-1356.88964}', '[]', NULL, 1, 1, 0, '{\"x\":332.43524169922,\"y\":1350.0681152344,\"z\":44.046119689941}', 1700000),
(13, 'Modern1Apartment', 'Appartement Moderne 1', NULL, '{\"x\":-784.194,\"y\":323.636,\"z\":210.997}', '{\"x\":-779.751,\"y\":323.385,\"z\":210.997}', NULL, '[\"apa_v_mp_h_01_a\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-766.661,\"y\":327.672,\"z\":210.396}', 1300000),
(14, 'Modern2Apartment', 'Appartement Moderne 2', NULL, '{\"x\":-786.8663,\"y\":315.764,\"z\":186.913}', '{\"x\":-781.808,\"y\":315.866,\"z\":186.913}', NULL, '[\"apa_v_mp_h_01_c\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-795.735,\"y\":326.757,\"z\":186.313}', 1300000),
(15, 'Modern3Apartment', 'Appartement Moderne 3', NULL, '{\"x\":-774.012,\"y\":342.042,\"z\":195.686}', '{\"x\":-779.057,\"y\":342.063,\"z\":195.686}', NULL, '[\"apa_v_mp_h_01_b\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-765.386,\"y\":330.782,\"z\":195.08}', 1300000),
(16, 'Mody1Apartment', 'Appartement Mode 1', NULL, '{\"x\":-784.194,\"y\":323.636,\"z\":210.997}', '{\"x\":-779.751,\"y\":323.385,\"z\":210.997}', NULL, '[\"apa_v_mp_h_02_a\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-766.615,\"y\":327.878,\"z\":210.396}', 1300000),
(17, 'Mody2Apartment', 'Appartement Mode 2', NULL, '{\"x\":-786.8663,\"y\":315.764,\"z\":186.913}', '{\"x\":-781.808,\"y\":315.866,\"z\":186.913}', NULL, '[\"apa_v_mp_h_02_c\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-795.297,\"y\":327.092,\"z\":186.313}', 1300000),
(18, 'Mody3Apartment', 'Appartement Mode 3', NULL, '{\"x\":-774.012,\"y\":342.042,\"z\":195.686}', '{\"x\":-779.057,\"y\":342.063,\"z\":195.686}', NULL, '[\"apa_v_mp_h_02_b\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-765.303,\"y\":330.932,\"z\":195.085}', 1300000),
(19, 'Vibrant1Apartment', 'Appartement Vibrant 1', NULL, '{\"x\":-784.194,\"y\":323.636,\"z\":210.997}', '{\"x\":-779.751,\"y\":323.385,\"z\":210.997}', NULL, '[\"apa_v_mp_h_03_a\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-765.885,\"y\":327.641,\"z\":210.396}', 1300000),
(20, 'Vibrant2Apartment', 'Appartement Vibrant 2', NULL, '{\"x\":-786.8663,\"y\":315.764,\"z\":186.913}', '{\"x\":-781.808,\"y\":315.866,\"z\":186.913}', NULL, '[\"apa_v_mp_h_03_c\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-795.607,\"y\":327.344,\"z\":186.313}', 1300000),
(21, 'Vibrant3Apartment', 'Appartement Vibrant 3', NULL, '{\"x\":-774.012,\"y\":342.042,\"z\":195.686}', '{\"x\":-779.057,\"y\":342.063,\"z\":195.686}', NULL, '[\"apa_v_mp_h_03_b\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-765.525,\"y\":330.851,\"z\":195.085}', 1300000),
(22, 'Sharp1Apartment', 'Appartement Persan 1', NULL, '{\"x\":-784.194,\"y\":323.636,\"z\":210.997}', '{\"x\":-779.751,\"y\":323.385,\"z\":210.997}', NULL, '[\"apa_v_mp_h_04_a\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-766.527,\"y\":327.89,\"z\":210.396}', 1300000),
(23, 'Sharp2Apartment', 'Appartement Persan 2', NULL, '{\"x\":-786.8663,\"y\":315.764,\"z\":186.913}', '{\"x\":-781.808,\"y\":315.866,\"z\":186.913}', NULL, '[\"apa_v_mp_h_04_c\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-795.642,\"y\":326.497,\"z\":186.313}', 1300000),
(24, 'Sharp3Apartment', 'Appartement Persan 3', NULL, '{\"x\":-774.012,\"y\":342.042,\"z\":195.686}', '{\"x\":-779.057,\"y\":342.063,\"z\":195.686}', NULL, '[\"apa_v_mp_h_04_b\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-765.503,\"y\":331.318,\"z\":195.085}', 1300000),
(25, 'Monochrome1Apartment', 'Appartement Monochrome 1', NULL, '{\"x\":-784.194,\"y\":323.636,\"z\":210.997}', '{\"x\":-779.751,\"y\":323.385,\"z\":210.997}', NULL, '[\"apa_v_mp_h_05_a\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-766.289,\"y\":328.086,\"z\":210.396}', 1300000),
(26, 'Monochrome2Apartment', 'Appartement Monochrome 2', NULL, '{\"x\":-786.8663,\"y\":315.764,\"z\":186.913}', '{\"x\":-781.808,\"y\":315.866,\"z\":186.913}', NULL, '[\"apa_v_mp_h_05_c\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-795.692,\"y\":326.762,\"z\":186.313}', 1300000),
(27, 'Monochrome3Apartment', 'Appartement Monochrome 3', NULL, '{\"x\":-774.012,\"y\":342.042,\"z\":195.686}', '{\"x\":-779.057,\"y\":342.063,\"z\":195.686}', NULL, '[\"apa_v_mp_h_05_b\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-765.094,\"y\":330.976,\"z\":195.085}', 1300000),
(28, 'Seductive1Apartment', 'Appartement Séduisant 1', NULL, '{\"x\":-784.194,\"y\":323.636,\"z\":210.997}', '{\"x\":-779.751,\"y\":323.385,\"z\":210.997}', NULL, '[\"apa_v_mp_h_06_a\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-766.263,\"y\":328.104,\"z\":210.396}', 1300000),
(29, 'Seductive2Apartment', 'Appartement Séduisant 2', NULL, '{\"x\":-786.8663,\"y\":315.764,\"z\":186.913}', '{\"x\":-781.808,\"y\":315.866,\"z\":186.913}', NULL, '[\"apa_v_mp_h_06_c\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-795.655,\"y\":326.611,\"z\":186.313}', 1300000),
(30, 'Seductive3Apartment', 'Appartement Séduisant 3', NULL, '{\"x\":-774.012,\"y\":342.042,\"z\":195.686}', '{\"x\":-779.057,\"y\":342.063,\"z\":195.686}', NULL, '[\"apa_v_mp_h_06_b\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-765.3,\"y\":331.414,\"z\":195.085}', 1300000),
(31, 'Regal1Apartment', 'Appartement Régal 1', NULL, '{\"x\":-784.194,\"y\":323.636,\"z\":210.997}', '{\"x\":-779.751,\"y\":323.385,\"z\":210.997}', NULL, '[\"apa_v_mp_h_07_a\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-765.956,\"y\":328.257,\"z\":210.396}', 1300000),
(32, 'Regal2Apartment', 'Appartement Régal 2', NULL, '{\"x\":-786.8663,\"y\":315.764,\"z\":186.913}', '{\"x\":-781.808,\"y\":315.866,\"z\":186.913}', NULL, '[\"apa_v_mp_h_07_c\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-795.545,\"y\":326.659,\"z\":186.313}', 1300000),
(33, 'Regal3Apartment', 'Appartement Régal 3', NULL, '{\"x\":-774.012,\"y\":342.042,\"z\":195.686}', '{\"x\":-779.057,\"y\":342.063,\"z\":195.686}', NULL, '[\"apa_v_mp_h_07_b\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-765.087,\"y\":331.429,\"z\":195.123}', 1300000),
(34, 'Aqua1Apartment', 'Appartement Aqua 1', NULL, '{\"x\":-784.194,\"y\":323.636,\"z\":210.997}', '{\"x\":-779.751,\"y\":323.385,\"z\":210.997}', NULL, '[\"apa_v_mp_h_08_a\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-766.187,\"y\":328.47,\"z\":210.396}', 1300000),
(35, 'Aqua2Apartment', 'Appartement Aqua 2', NULL, '{\"x\":-786.8663,\"y\":315.764,\"z\":186.913}', '{\"x\":-781.808,\"y\":315.866,\"z\":186.913}', NULL, '[\"apa_v_mp_h_08_c\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-795.658,\"y\":326.563,\"z\":186.313}', 1300000),
(36, 'Aqua3Apartment', 'Appartement Aqua 3', NULL, '{\"x\":-774.012,\"y\":342.042,\"z\":195.686}', '{\"x\":-779.057,\"y\":342.063,\"z\":195.686}', NULL, '[\"apa_v_mp_h_08_b\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-765.287,\"y\":331.084,\"z\":195.086}', 1300000),
(37, 'IntegrityWay', '4 Integrity Way', NULL, NULL, NULL, '{\"x\":-54.178,\"y\":-583.762,\"z\":35.798}', '[]', NULL, 0, 0, 1, NULL, 0),
(38, 'IntegrityWay28', '4 Integrity Way - Apt 28', NULL, '{\"x\":-31.409,\"y\":-594.927,\"z\":79.03}', '{\"x\":-26.098,\"y\":-596.909,\"z\":79.03}', NULL, '[]', 'IntegrityWay', 0, 1, 0, '{\"x\":-11.923,\"y\":-597.083,\"z\":78.43}', 1700000),
(39, 'IntegrityWay30', '4 Integrity Way - Apt 30', NULL, '{\"x\":-17.702,\"y\":-588.524,\"z\":89.114}', '{\"x\":-16.21,\"y\":-582.569,\"z\":89.114}', NULL, '[]', 'IntegrityWay', 0, 1, 0, '{\"x\":-26.327,\"y\":-588.384,\"z\":89.123}', 1700000),
(40, 'DellPerroHeights', 'Dell Perro Heights', NULL, NULL, NULL, '{\"x\":-1440.022,\"y\":-548.696,\"z\":33.74}', '[]', NULL, 0, 0, 1, NULL, 0),
(41, 'DellPerroHeightst4', 'Dell Perro Heights - Apt 28', NULL, '{\"x\":-1452.125,\"y\":-540.591,\"z\":73.044}', '{\"x\":-1455.435,\"y\":-535.79,\"z\":73.044}', NULL, '[]', 'DellPerroHeights', 0, 1, 0, '{\"x\":-1467.058,\"y\":-527.571,\"z\":72.443}', 1700000),
(42, 'DellPerroHeightst7', 'Dell Perro Heights - Apt 30', NULL, '{\"x\":-1451.562,\"y\":-523.535,\"z\":55.928}', '{\"x\":-1456.02,\"y\":-519.209,\"z\":55.929}', NULL, '[]', 'DellPerroHeights', 0, 1, 0, '{\"x\":-1457.026,\"y\":-530.219,\"z\":55.937}', 1700000),
(45, 'QueensRichmondHill', 'Queens - Richmond Hill', '{\"y\":1092.34936362305,\"z\":29.13977,\"x\":1933.86425265625}', '{\"y\":-444.21896362305,\"z\":149.95895385742,\"x\":-901.14697265625}', '{\"y\":-444.21896362305,\"z\":149.95895385742,\"x\":-901.14697265625}', '{\"y\":1092.34936362305,\"z\":29.13977,\"x\":1933.86425265625}', '[]', NULL, 1, 1, 0, '{\"x\":-913.17926025391,\"y\":-440.89556884766,\"z\":149.9645690918}', 1400000);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `rented_vehicles`
--

CREATE TABLE `rented_vehicles` (
  `vehicle` varchar(60) NOT NULL,
  `plate` varchar(12) NOT NULL,
  `player_name` varchar(255) NOT NULL,
  `base_price` int(11) NOT NULL,
  `rent_price` int(11) NOT NULL,
  `owner` varchar(22) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `shops`
--

CREATE TABLE `shops` (
  `id` int(11) NOT NULL,
  `store` varchar(100) NOT NULL,
  `item` varchar(100) NOT NULL,
  `price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `shops`
--

INSERT INTO `shops` (`id`, `store`, `item`, `price`) VALUES
(93, 'CBell', 'kfc_grander', 30),
(94, 'CBell', 'kfc_kubelek11', 50),
(95, 'CBell', 'kfc_kubelekclassic', 40),
(96, 'CBell', 'kfc_kubelekclassicxl', 60),
(97, 'CBell', 'kfc_longer', 10),
(98, 'CBell', 'kfc_megapocket', 15),
(99, 'CBell', 'kfc_qurrito', 15),
(100, 'CBell', 'kfc_twister', 10),
(101, 'CBell', 'kfc_zinger', 10),
(102, 'CBell', 'cola', 5),
(103, 'CBell', 'frytki', 5),
(104, 'CBell', 'frytkixxl', 10),
(105, 'CBell', 'lody', 5),
(106, 'CBell', 'water', 3),
(107, 'BKing', 'bking_bcwhopper', 30),
(108, 'BKing', 'bking_bigking', 50),
(109, 'BKing', 'bking_cchicken', 25),
(110, 'BKing', 'bking_chburger', 25),
(111, 'BKing', 'bking_dcburger', 20),
(112, 'BKing', 'bking_lchicken', 20),
(113, 'BKing', 'bking_nuggets', 15),
(114, 'BKing', 'bking_whopper', 15),
(115, 'BKing', 'bking_whopperj', 10),
(116, 'BKing', 'cola', 5),
(117, 'BKing', 'frytki', 5),
(118, 'BKing', 'frytkixxl', 15),
(119, 'BKing', 'hamburger', 10),
(120, 'BKing', 'lody', 5),
(121, 'BKing', 'water', 3),
(122, 'Narzedzia', 'blackberry', 500),
(123, 'Narzedzia', 'contract', 20),
(124, 'Narzedzia', 'headbag', 300),
(125, 'Narzedzia', 'kaje', 2500),
(126, 'Narzedzia', 'lighter', 50),
(127, 'Narzedzia', 'repairkit', 500),
(128, 'Monopolowy', 'bread', 3),
(129, 'Monopolowy', 'cigarett', 1),
(130, 'Narzedzia', 'clip', 500),
(131, 'Monopolowy', 'contract', 10),
(132, 'Monopolowy', 'hotdog', 15),
(133, 'Monopolowy', 'cola', 5),
(134, 'Monopolowy', 'lighter', 15),
(135, 'Monopolowy', 'kuflowe', 2),
(136, 'Monopolowy', 'lody', 5),
(137, 'Monopolowy', 'martini', 70),
(138, 'Monopolowy', 'moet', 250),
(139, 'Monopolowy', 'sandwich', 15),
(140, 'Monopolowy', 'water', 6),
(141, 'Monopolowy', 'zubr', 4),
(142, 'Restauracja', 'rest_obiadduzy', 100),
(143, 'Restauracja', 'rest_obiadmaly', 50),
(144, 'Restauracja', 'rest_obiadsredni', 75),
(145, 'Restauracja', 'cola', 20),
(146, 'Restauracja', 'water', 10),
(147, 'Monopolowy', 'whiskey', 130),
(148, 'Narzedzia', 'rozpuszczalnik', 50),
(149, 'Narzedzia', 'benzyna', 25),
(150, 'Monopolowy', 'soda_oczyszczona', 10),
(151, 'Monopolowy', 'cukier', 5),
(152, 'Monopolowy', 'sol', 5),
(153, 'Monopolowy', 'proszekdopieczenia', 5);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `society_moneywash`
--

CREATE TABLE `society_moneywash` (
  `id` int(11) NOT NULL,
  `identifier` varchar(60) NOT NULL,
  `society` varchar(60) NOT NULL,
  `amount` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `truck_inventory`
--

CREATE TABLE `truck_inventory` (
  `id` int(11) NOT NULL,
  `item` varchar(100) NOT NULL,
  `itemt` varchar(100) NOT NULL,
  `count` int(11) NOT NULL,
  `plate` varchar(8) NOT NULL,
  `name` varchar(255) NOT NULL,
  `owned` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `trunk_inventory`
--

CREATE TABLE `trunk_inventory` (
  `id` int(11) NOT NULL,
  `plate` varchar(8) NOT NULL,
  `data` text NOT NULL,
  `owned` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `twitter_accounts`
--

CREATE TABLE `twitter_accounts` (
  `id` int(11) NOT NULL,
  `username` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT '0',
  `password` varchar(50) COLLATE utf8mb4_bin NOT NULL DEFAULT '0',
  `avatar_url` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `twitter_likes`
--

CREATE TABLE `twitter_likes` (
  `id` int(11) NOT NULL,
  `authorId` int(11) DEFAULT NULL,
  `tweetId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `twitter_tweets`
--

CREATE TABLE `twitter_tweets` (
  `id` int(11) NOT NULL,
  `authorId` int(11) NOT NULL,
  `realUser` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `likes` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `identifier` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL,
  `license` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL,
  `money` int(11) DEFAULT NULL,
  `name` varchar(50) COLLATE utf8mb4_bin DEFAULT '',
  `isDead` int(11) NOT NULL DEFAULT '0',
  `skin` longtext COLLATE utf8mb4_bin,
  `job` varchar(50) COLLATE utf8mb4_bin DEFAULT 'unemployed',
  `job_grade` int(11) DEFAULT '0',
  `loadout` longtext COLLATE utf8mb4_bin,
  `position` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `bank` int(11) DEFAULT NULL,
  `permission_level` int(11) DEFAULT NULL,
  `group` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL,
  `is_dead` tinyint(1) DEFAULT '0',
  `insuranceDate` varchar(12) COLLATE utf8mb4_bin NOT NULL DEFAULT '0',
  `firstname` varchar(50) COLLATE utf8mb4_bin DEFAULT '',
  `lastname` varchar(50) COLLATE utf8mb4_bin DEFAULT '',
  `dateofbirth` varchar(25) COLLATE utf8mb4_bin DEFAULT '',
  `sex` varchar(10) COLLATE utf8mb4_bin DEFAULT '',
  `height` varchar(5) COLLATE utf8mb4_bin DEFAULT '',
  `phone_number` int(11) DEFAULT NULL,
  `battery` varchar(255) COLLATE utf8mb4_bin DEFAULT '100',
  `last_property` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `status` longtext COLLATE utf8mb4_bin,
  `tattoos` varchar(5000) COLLATE utf8mb4_bin DEFAULT '{}',
  `pet` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `skills` longtext COLLATE utf8mb4_bin
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Zrzut danych tabeli `users`
--

INSERT INTO `users` (`id`, `identifier`, `license`, `money`, `name`, `isDead`, `skin`, `job`, `job_grade`, `loadout`, `position`, `bank`, `permission_level`, `group`, `is_dead`, `insuranceDate`, `firstname`, `lastname`, `dateofbirth`, `sex`, `height`, `phone_number`, `battery`, `last_property`, `status`, `tattoos`, `pet`, `skills`) VALUES
(1, 'steam:110000104eb808d', 'license:edb34895aef65aca4c3c4371a3a9f9323498749e', 69579, 'Dario', 0, '{\"mask_1\":0,\"glasses_1\":5,\"mask_2\":0,\"complexion_1\":0,\"bproof_1\":0,\"lipstick_3\":0,\"blemishes_1\":0,\"blush_1\":0,\"face\":15,\"chain_1\":0,\"blemishes_2\":0,\"complexion_2\":0,\"arms\":33,\"makeup_1\":0,\"beard_3\":0,\"eyebrows_3\":0,\"bodyb_1\":0,\"shoes_2\":0,\"hair_2\":0,\"makeup_3\":0,\"age_2\":10,\"bproof_2\":0,\"glasses_2\":1,\"eyebrows_4\":0,\"lipstick_2\":0,\"sun_2\":0,\"pants_1\":28,\"lipstick_4\":0,\"skin\":30,\"torso_1\":30,\"makeup_2\":0,\"torso_2\":0,\"watches_2\":1,\"moles_2\":0,\"beard_4\":0,\"helmet_1\":-1,\"beard_1\":0,\"eyebrows_2\":0,\"bracelets_1\":-1,\"chest_1\":0,\"eye_color\":0,\"sex\":0,\"decals_2\":0,\"bracelets_2\":0,\"blush_2\":0,\"sun_1\":0,\"watches_1\":10,\"shoes_1\":10,\"hair_color_2\":0,\"arms_2\":0,\"makeup_4\":0,\"ears_1\":-1,\"hair_color_1\":0,\"decals_1\":0,\"bags_1\":0,\"chest_3\":0,\"tshirt_2\":0,\"pants_2\":0,\"lipstick_1\":0,\"beard_2\":0,\"hair_1\":0,\"moles_1\":0,\"eyebrows_1\":0,\"bags_2\":0,\"ears_2\":0,\"chain_2\":0,\"bodyb_2\":0,\"helmet_2\":0,\"age_1\":8,\"tshirt_1\":21,\"blush_3\":0,\"chest_2\":0}', 'kasyno', 4, '[{\"components\":[\"clip_default\"],\"ammo\":0,\"label\":\"Mini smg\",\"name\":\"WEAPON_MINISMG\"},{\"components\":[],\"ammo\":35,\"label\":\"Double-Action Revolver\",\"name\":\"WEAPON_DOUBLEACTION\"}]', '{\"x\":2884.4000000004,\"z\":6.2000000000008,\"y\":831.0}', 1505150, 3, 'superadmin', 0, '0', 'Dariusz', 'Pruszkowski', '1975-07-10', 'm', '198', 666, NULL, NULL, '[{\"name\":\"hunger\",\"val\":670700,\"percent\":67.07},{\"name\":\"thirst\",\"val\":753025,\"percent\":75.3025}]', '{}', '', '{\"Stamina\":88.300000000058,\"Strength\":88.300000000058}'),
(2, 'steam:11000010fdc8544', 'license:420eaff61b92d1024dfdb05aa8d307dd1a00ddbf', 0, 'Marcin', 0, '{\"bracelets_1\":-1,\"glasses_2\":0,\"beard_4\":0,\"sex\":0,\"bodyb_2\":0,\"chest_2\":0,\"mask_1\":0,\"blemishes_2\":0,\"chest_1\":0,\"blemishes_1\":0,\"helmet_1\":-1,\"arms\":33,\"shoes_1\":10,\"lipstick_2\":0,\"age_2\":10,\"eyebrows_1\":5,\"eyebrows_4\":23,\"chest_3\":0,\"age_1\":11,\"ears_1\":-1,\"bracelets_2\":0,\"blush_3\":0,\"hair_2\":0,\"chain_2\":0,\"beard_2\":10,\"bproof_2\":0,\"complexion_1\":0,\"pants_1\":1,\"beard_1\":2,\"torso_2\":0,\"pants_2\":8,\"moles_1\":0,\"eyebrows_2\":10,\"lipstick_1\":0,\"makeup_4\":0,\"hair_color_1\":0,\"bodyb_1\":0,\"hair_1\":0,\"makeup_3\":0,\"bags_2\":0,\"bproof_1\":0,\"eye_color\":0,\"watches_1\":-1,\"lipstick_3\":0,\"tshirt_2\":1,\"hair_color_2\":0,\"makeup_2\":0,\"glasses_1\":0,\"beard_3\":0,\"sun_1\":0,\"watches_2\":0,\"sun_2\":0,\"helmet_2\":0,\"blush_2\":0,\"decals_1\":0,\"skin\":4,\"arms_2\":0,\"shoes_2\":0,\"complexion_2\":0,\"decals_2\":0,\"blush_1\":0,\"makeup_1\":0,\"lipstick_4\":0,\"mask_2\":0,\"torso_1\":166,\"bags_1\":0,\"face\":43,\"eyebrows_3\":58,\"ears_2\":0,\"moles_2\":0,\"tshirt_1\":23,\"chain_1\":0}', 'kasyno', 4, '[{\"ammo\":0,\"label\":\"Kij golfowy\",\"components\":[],\"name\":\"WEAPON_GOLFCLUB\"},{\"ammo\":245,\"label\":\"Pistolet\",\"components\":[\"clip_default\"],\"name\":\"WEAPON_PISTOL\"},{\"ammo\":245,\"label\":\"Glock 17\",\"components\":[\"clip_default\"],\"name\":\"WEAPON_COMBATPISTOL\"},{\"ammo\":245,\"label\":\"Pistol .50\",\"components\":[\"clip_default\"],\"name\":\"WEAPON_PISTOL50\"},{\"ammo\":245,\"label\":\"Heavy pistol\",\"components\":[\"clip_default\"],\"name\":\"WEAPON_HEAVYPISTOL\"},{\"ammo\":11,\"label\":\"Karabin\",\"components\":[],\"name\":\"WEAPON_RAILGUN\"},{\"ammo\":17,\"label\":\"Compact launcher\",\"components\":[],\"name\":\"WEAPON_COMPACTLAUNCHER\"}]', '{\"x\":2611.0,\"z\":5.7999999999992,\"y\":423.59999999998}', 360728, 0, 'superadmin', 0, '0', 'Marco', 'Verde Grossino', '1990.12.21', 'm', '190', 997, NULL, NULL, '[{\"name\":\"hunger\",\"val\":487400,\"percent\":48.74},{\"name\":\"thirst\",\"val\":490550,\"percent\":49.055}]', '{}', '', '{\"Strength\":0,\"Stamina\":0}'),
(3, 'steam:110000114f63a7e', 'license:c6c74d7e7dea4d06bf5e7382056855740b711c47', 1, 'filo', 0, '{\"hair_color_2\":0,\"sun_2\":0,\"ears_1\":-1,\"shoes_1\":10,\"shoes_2\":0,\"beard_1\":10,\"blush_1\":0,\"decals_1\":0,\"face\":42,\"chain_2\":0,\"ears_2\":0,\"sex\":0,\"torso_2\":0,\"tshirt_1\":0,\"pants_2\":0,\"beard_2\":10,\"makeup_1\":0,\"makeup_4\":0,\"lipstick_2\":0,\"decals_2\":0,\"glasses_2\":0,\"hair_color_1\":0,\"lipstick_4\":0,\"skin\":5,\"eyebrows_3\":0,\"bodyb_1\":0,\"torso_1\":62,\"bproof_2\":0,\"blush_3\":0,\"watches_1\":-1,\"arms_2\":0,\"chain_1\":92,\"chest_2\":0,\"makeup_2\":0,\"makeup_3\":0,\"eyebrows_1\":30,\"chest_1\":0,\"moles_1\":0,\"bproof_1\":0,\"glasses_1\":0,\"complexion_2\":0,\"hair_1\":0,\"eyebrows_2\":10,\"helmet_1\":-1,\"bracelets_2\":0,\"moles_2\":0,\"chest_3\":0,\"eyebrows_4\":0,\"blemishes_2\":0,\"blush_2\":0,\"arms\":46,\"lipstick_1\":0,\"helmet_2\":0,\"age_2\":7,\"bodyb_2\":0,\"bags_1\":0,\"bags_2\":0,\"watches_2\":0,\"complexion_1\":0,\"eye_color\":0,\"beard_4\":0,\"pants_1\":10,\"sun_1\":0,\"age_1\":5,\"mask_2\":0,\"mask_1\":0,\"hair_2\":0,\"blemishes_1\":0,\"beard_3\":0,\"bracelets_1\":-1,\"tshirt_2\":2,\"lipstick_3\":0}', 'unemployed', 0, '[{\"label\":\"Pistolet\",\"ammo\":14,\"components\":[\"clip_default\"],\"name\":\"WEAPON_PISTOL\"}]', '{\"y\":1668.2000000002,\"z\":14.8,\"x\":279.0}', 15700, 0, 'superadmin', 0, '0', 'Adrian', 'Polarewski', '1995-01-12', 'm', '187', 8008, NULL, NULL, '[{\"name\":\"hunger\",\"percent\":46.13,\"val\":461300},{\"name\":\"thirst\",\"percent\":59.5975,\"val\":595975}]', '{}', '', '{\"Stamina\":0.34999999999836,\"Strength\":0}'),
(4, 'steam:11000010b79ecd4', 'license:f91700810d68f34076c0b5f31a09877de0ef32e5', 0, 'QCK', 0, '{\"sun_2\":0,\"blush_3\":0,\"pants_2\":0,\"lipstick_3\":0,\"blush_2\":0,\"makeup_2\":0,\"beard_4\":0,\"hair_1\":9,\"arms_2\":0,\"moles_1\":0,\"decals_1\":0,\"chain_1\":0,\"makeup_1\":0,\"makeup_4\":0,\"bracelets_1\":-1,\"pants_1\":28,\"mask_1\":0,\"ears_1\":-1,\"watches_2\":0,\"watches_1\":-1,\"shoes_1\":10,\"beard_1\":0,\"arms\":11,\"chest_2\":0,\"mask_2\":0,\"bproof_2\":0,\"hair_2\":6,\"bodyb_2\":0,\"bracelets_2\":0,\"moles_2\":0,\"torso_2\":2,\"torso_1\":26,\"glasses_2\":0,\"age_2\":0,\"decals_2\":0,\"beard_2\":0,\"lipstick_4\":0,\"makeup_3\":0,\"glasses_1\":0,\"ears_2\":0,\"blush_1\":0,\"sun_1\":0,\"lipstick_2\":0,\"bags_1\":0,\"face\":13,\"eyebrows_3\":0,\"beard_3\":0,\"eyebrows_4\":0,\"skin\":1,\"bags_2\":0,\"chain_2\":0,\"chest_3\":0,\"age_1\":0,\"eye_color\":0,\"eyebrows_2\":0,\"complexion_2\":0,\"hair_color_1\":0,\"tshirt_1\":15,\"helmet_1\":-1,\"hair_color_2\":0,\"bproof_1\":0,\"complexion_1\":0,\"blemishes_1\":0,\"eyebrows_1\":0,\"helmet_2\":0,\"sex\":0,\"lipstick_1\":0,\"blemishes_2\":0,\"tshirt_2\":0,\"chest_1\":0,\"shoes_2\":0,\"bodyb_1\":0}', 'unemployed', 0, '[]', '{\"x\":1302.0,\"y\":376.0,\"z\":33.800000000002}', 113470, 0, 'superadmin', 0, '0', 'Henryk', 'Opalinski', '1970-08-28', 'm', '188', 6316, NULL, NULL, '[{\"name\":\"hunger\",\"percent\":41.55,\"val\":415500},{\"name\":\"thirst\",\"percent\":43.6625,\"val\":436625},{\"name\":\"drunk\",\"percent\":0.0,\"val\":0}]', '{}', '', '{\"Strength\":8.1999999999978,\"Stamina\":18.200000000001}'),
(5, 'steam:110000111ee525f', 'license:8b94be0ee303201075bb5d0a2726568ebc66d077', 0, 'Vicol', 0, '{\"bodyb_1\":0,\"shoes_1\":12,\"bproof_2\":0,\"arms_2\":0,\"sun_1\":0,\"chest_2\":0,\"eye_color\":0,\"complexion_1\":0,\"tshirt_2\":2,\"face\":9,\"glasses_2\":0,\"sex\":0,\"blush_2\":0,\"beard_2\":10,\"decals_1\":0,\"eyebrows_4\":0,\"bodyb_2\":0,\"bags_2\":0,\"lipstick_2\":0,\"mask_2\":0,\"bracelets_2\":0,\"bracelets_1\":-1,\"moles_2\":0,\"watches_2\":0,\"tshirt_1\":0,\"beard_1\":2,\"mask_1\":0,\"pants_2\":0,\"torso_2\":0,\"ears_1\":-1,\"blemishes_1\":0,\"makeup_1\":0,\"chest_1\":0,\"makeup_3\":0,\"age_1\":12,\"makeup_2\":0,\"hair_color_2\":0,\"makeup_4\":0,\"lipstick_3\":0,\"moles_1\":0,\"helmet_1\":-1,\"eyebrows_2\":0,\"watches_1\":-1,\"beard_4\":0,\"bags_1\":0,\"skin\":10,\"decals_2\":0,\"pants_1\":7,\"blemishes_2\":0,\"sun_2\":0,\"hair_2\":0,\"blush_3\":0,\"complexion_2\":0,\"torso_1\":166,\"glasses_1\":0,\"hair_1\":0,\"chest_3\":0,\"eyebrows_1\":0,\"lipstick_4\":0,\"arms\":32,\"beard_3\":0,\"blush_1\":0,\"ears_2\":0,\"shoes_2\":6,\"helmet_2\":0,\"chain_2\":0,\"hair_color_1\":0,\"age_2\":10,\"eyebrows_3\":0,\"chain_1\":51,\"bproof_1\":0,\"lipstick_1\":0}', 'unemployed', 0, '[]', '{\"z\":14.400000000002,\"y\":630.6000000001,\"x\":58.0}', 61050, 0, 'superadmin', 0, '0', 'Adam', 'Berylowicz', '1985-08-28', 'm', '185', 8431, NULL, NULL, '[{\"percent\":49.01,\"name\":\"hunger\",\"val\":490100},{\"percent\":49.2575,\"name\":\"thirst\",\"val\":492575},{\"percent\":0.0,\"name\":\"drunk\",\"val\":0}]', '{}', '', '{\"Stamina\":11.749999999993,\"Strength\":1.7500000000018}');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `users_cards`
--

CREATE TABLE `users_cards` (
  `identifier` varchar(555) NOT NULL,
  `number` varchar(555) NOT NULL,
  `label` varchar(555) NOT NULL,
  `has` tinyint(1) NOT NULL DEFAULT '1',
  `owner` tinyint(1) NOT NULL DEFAULT '0',
  `abonament` tinyint(1) NOT NULL DEFAULT '0',
  `price` varchar(555) NOT NULL,
  `stan` varchar(555) NOT NULL,
  `internet` varchar(555) NOT NULL DEFAULT '0',
  `actived` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `users_cards`
--

INSERT INTO `users_cards` (`identifier`, `number`, `label`, `has`, `owner`, `abonament`, `price`, `stan`, `internet`, `actived`) VALUES
('steam:110000104eb808d', '124-1923', 'SIM #124-1923', 1, 1, 0, '0', '50', '0', 1);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `user_accounts`
--

CREATE TABLE `user_accounts` (
  `id` int(11) NOT NULL,
  `identifier` varchar(22) NOT NULL,
  `name` varchar(50) NOT NULL,
  `money` double NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `user_accounts`
--

INSERT INTO `user_accounts` (`id`, `identifier`, `name`, `money`) VALUES
(1, 'steam:110000104eb808d', 'black_money', 30909),
(2, 'steam:11000010fdc8544', 'black_money', 31440),
(3, 'steam:110000114f63a7e', 'black_money', 0),
(4, 'steam:11000010b79ecd4', 'black_money', 0),
(5, 'steam:110000111ee525f', 'black_money', 0);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `user_contacts`
--

CREATE TABLE `user_contacts` (
  `id` int(11) NOT NULL,
  `identifier` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `number` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `user_inventory`
--

CREATE TABLE `user_inventory` (
  `id` int(11) NOT NULL,
  `identifier` varchar(22) NOT NULL,
  `item` varchar(50) NOT NULL,
  `count` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `user_inventory`
--

INSERT INTO `user_inventory` (`id`, `identifier`, `item`, `count`) VALUES
(1, 'steam:110000104eb808d', 'grip', 0),
(2, 'steam:110000104eb808d', 'blowpipe', 0),
(3, 'steam:110000104eb808d', 'yusuf', 0),
(4, 'steam:110000104eb808d', 'meta_pooch_high', 0),
(5, 'steam:110000104eb808d', 'carokit', 0),
(6, 'steam:110000104eb808d', 'whiskey', 0),
(7, 'steam:110000104eb808d', 'fixtool', 0),
(8, 'steam:110000104eb808d', 'highradio', 0),
(9, 'steam:110000104eb808d', 'martini', 0),
(10, 'steam:110000104eb808d', 'winogrono', 0),
(11, 'steam:110000104eb808d', 'moet', 0),
(12, 'steam:110000104eb808d', 'flashlight', 0),
(13, 'steam:110000104eb808d', 'hamburger', 0),
(14, 'steam:110000104eb808d', 'zlom', 0),
(15, 'steam:110000104eb808d', 'zubr', 0),
(16, 'steam:110000104eb808d', 'blackberry', 1),
(17, 'steam:110000104eb808d', 'heroina_pooch_high', 0),
(18, 'steam:110000104eb808d', 'dowod', 1),
(19, 'steam:110000104eb808d', 'kokaina_pooch_high', 0),
(20, 'steam:110000104eb808d', 'wizytowka', 1),
(21, 'steam:110000104eb808d', 'wino', 0),
(22, 'steam:110000104eb808d', 'weed', 0),
(23, 'steam:110000104eb808d', 'headbag', 0),
(24, 'steam:110000104eb808d', 'water', 0),
(25, 'steam:110000104eb808d', 'heroina', 0),
(26, 'steam:110000104eb808d', 'battery', 0),
(27, 'steam:110000104eb808d', 'handcuff', 0),
(28, 'steam:110000104eb808d', 'tyton_pooch', 0),
(29, 'steam:110000104eb808d', 'vine', 0),
(30, 'steam:110000104eb808d', 'tyton', 0),
(31, 'steam:110000104eb808d', 'fixkit', 0),
(32, 'steam:110000104eb808d', 'bread', 0),
(33, 'steam:110000104eb808d', 'stockrim', 0),
(34, 'steam:110000104eb808d', 'meta_pooch_medium', 0),
(35, 'steam:110000104eb808d', 'repairkit', 0),
(36, 'steam:110000104eb808d', 'medikit', 0),
(37, 'steam:110000104eb808d', 'meta_pooch_low', 0),
(38, 'steam:110000104eb808d', 'cola', 0),
(39, 'steam:110000104eb808d', 'silencieux', 0),
(40, 'steam:110000104eb808d', 'highrim', 0),
(41, 'steam:110000104eb808d', 'meta', 0),
(42, 'steam:110000104eb808d', 'shark', 0),
(43, 'steam:110000104eb808d', 'haszysz_pooch_high', 0),
(44, 'steam:110000104eb808d', 'kokaina_pooch_medium', 0),
(45, 'steam:110000104eb808d', 'lighter', 0),
(46, 'steam:110000104eb808d', 'haszysz_pooch_low', 0),
(47, 'steam:110000104eb808d', 'lowradio', 0),
(48, 'steam:110000104eb808d', 'cigarett', 0),
(49, 'steam:110000104eb808d', 'airbag', 0),
(50, 'steam:110000104eb808d', 'kaje', 0),
(51, 'steam:110000104eb808d', 'kokaina', 50),
(52, 'steam:110000104eb808d', 'bandage', 0),
(53, 'steam:110000104eb808d', 'hotdog', 0),
(54, 'steam:110000104eb808d', 'haszysz_pooch_medium', 0),
(55, 'steam:110000104eb808d', 'kokaina_pooch_low', 0),
(56, 'steam:110000104eb808d', 'contract', 0),
(57, 'steam:110000104eb808d', 'clip', 0),
(58, 'steam:110000104eb808d', 'kuflowe', 0),
(59, 'steam:110000104eb808d', 'haszysz', 0),
(60, 'steam:110000104eb808d', 'heroina_pooch_medium', 0),
(61, 'steam:110000104eb808d', 'kamizelka', 0),
(62, 'steam:110000104eb808d', 'heroina_pooch_low', 0),
(63, 'steam:110000104eb808d', 'sandwich', 0),
(64, 'steam:110000114f63a7e', 'zlom', 0),
(65, 'steam:110000114f63a7e', 'martini', 0),
(66, 'steam:110000114f63a7e', 'haszysz_pooch_medium', 0),
(67, 'steam:110000114f63a7e', 'sandwich', 0),
(68, 'steam:110000114f63a7e', 'yusuf', 0),
(69, 'steam:110000114f63a7e', 'blackberry', 0),
(70, 'steam:110000114f63a7e', 'handcuff', 0),
(71, 'steam:110000114f63a7e', 'contract', 0),
(72, 'steam:110000114f63a7e', 'wizytowka', 1),
(73, 'steam:110000114f63a7e', 'silencieux', 0),
(74, 'steam:110000114f63a7e', 'winogrono', 0),
(75, 'steam:110000114f63a7e', 'wino', 0),
(76, 'steam:110000114f63a7e', 'whiskey', 0),
(77, 'steam:110000114f63a7e', 'weed', 0),
(78, 'steam:110000114f63a7e', 'hamburger', 0),
(79, 'steam:110000114f63a7e', 'moet', 0),
(80, 'steam:110000114f63a7e', 'heroina', 0),
(81, 'steam:110000114f63a7e', 'blowpipe', 0),
(82, 'steam:110000114f63a7e', 'tyton', 0),
(83, 'steam:110000114f63a7e', 'fixtool', 0),
(84, 'steam:110000114f63a7e', 'kamizelka', 0),
(85, 'steam:110000114f63a7e', 'kokaina', 0),
(86, 'steam:110000114f63a7e', 'stockrim', 0),
(87, 'steam:110000114f63a7e', 'vine', 0),
(88, 'steam:110000114f63a7e', 'meta_pooch_low', 0),
(89, 'steam:110000114f63a7e', 'heroina_pooch_medium', 0),
(90, 'steam:110000114f63a7e', 'tyton_pooch', 0),
(91, 'steam:110000114f63a7e', 'battery', 0),
(92, 'steam:110000114f63a7e', 'kuflowe', 0),
(93, 'steam:110000114f63a7e', 'cigarett', 0),
(94, 'steam:110000114f63a7e', 'haszysz_pooch_low', 0),
(95, 'steam:110000114f63a7e', 'meta_pooch_medium', 0),
(96, 'steam:110000114f63a7e', 'shark', 0),
(97, 'steam:110000114f63a7e', 'haszysz_pooch_high', 0),
(98, 'steam:110000114f63a7e', 'water', 0),
(99, 'steam:110000114f63a7e', 'meta_pooch_high', 0),
(100, 'steam:110000114f63a7e', 'clip', 0),
(101, 'steam:110000114f63a7e', 'meta', 0),
(102, 'steam:110000114f63a7e', 'dowod', 1),
(103, 'steam:110000114f63a7e', 'kokaina_pooch_low', 0),
(104, 'steam:110000114f63a7e', 'grip', 0),
(105, 'steam:110000114f63a7e', 'cola', 0),
(106, 'steam:110000114f63a7e', 'zubr', 0),
(107, 'steam:110000114f63a7e', 'headbag', 0),
(108, 'steam:110000114f63a7e', 'lowradio', 0),
(109, 'steam:110000114f63a7e', 'kokaina_pooch_high', 0),
(110, 'steam:110000114f63a7e', 'lighter', 0),
(111, 'steam:110000114f63a7e', 'heroina_pooch_low', 0),
(112, 'steam:110000114f63a7e', 'carokit', 0),
(113, 'steam:110000114f63a7e', 'highrim', 0),
(114, 'steam:110000114f63a7e', 'kokaina_pooch_medium', 0),
(115, 'steam:110000114f63a7e', 'airbag', 0),
(116, 'steam:110000114f63a7e', 'hotdog', 0),
(117, 'steam:110000114f63a7e', 'bandage', 0),
(118, 'steam:110000114f63a7e', 'highradio', 0),
(119, 'steam:110000114f63a7e', 'fixkit', 0),
(120, 'steam:110000114f63a7e', 'haszysz', 0),
(121, 'steam:110000114f63a7e', 'bread', 0),
(122, 'steam:110000114f63a7e', 'medikit', 0),
(123, 'steam:110000114f63a7e', 'kaje', 0),
(124, 'steam:110000114f63a7e', 'flashlight', 0),
(125, 'steam:110000114f63a7e', 'repairkit', 0),
(126, 'steam:110000114f63a7e', 'heroina_pooch_high', 0),
(127, 'steam:11000010fdc8544', 'haszysz_pooch_medium', 0),
(128, 'steam:11000010fdc8544', 'martini', 0),
(129, 'steam:11000010fdc8544', 'zlom', 0),
(130, 'steam:11000010fdc8544', 'sandwich', 0),
(131, 'steam:11000010fdc8544', 'yusuf', 0),
(132, 'steam:11000010fdc8544', 'blackberry', 0),
(133, 'steam:11000010fdc8544', 'handcuff', 0),
(134, 'steam:11000010fdc8544', 'contract', 0),
(135, 'steam:11000010fdc8544', 'wizytowka', 1),
(136, 'steam:11000010fdc8544', 'blowpipe', 0),
(137, 'steam:11000010fdc8544', 'silencieux', 0),
(138, 'steam:11000010fdc8544', 'winogrono', 0),
(139, 'steam:11000010fdc8544', 'wino', 0),
(140, 'steam:11000010fdc8544', 'whiskey', 0),
(141, 'steam:11000010fdc8544', 'weed', 0),
(142, 'steam:11000010fdc8544', 'hamburger', 0),
(143, 'steam:11000010fdc8544', 'moet', 0),
(144, 'steam:11000010fdc8544', 'heroina', 0),
(145, 'steam:11000010fdc8544', 'tyton', 0),
(146, 'steam:11000010fdc8544', 'fixtool', 0),
(147, 'steam:11000010fdc8544', 'kamizelka', 0),
(148, 'steam:11000010fdc8544', 'kokaina', 68),
(149, 'steam:11000010fdc8544', 'stockrim', 0),
(150, 'steam:11000010fdc8544', 'vine', 0),
(151, 'steam:11000010fdc8544', 'meta_pooch_low', 0),
(152, 'steam:11000010fdc8544', 'heroina_pooch_medium', 0),
(153, 'steam:11000010fdc8544', 'tyton_pooch', 0),
(154, 'steam:11000010fdc8544', 'battery', 0),
(155, 'steam:11000010fdc8544', 'kuflowe', 0),
(156, 'steam:11000010fdc8544', 'cigarett', 0),
(157, 'steam:11000010fdc8544', 'haszysz_pooch_low', 0),
(158, 'steam:11000010fdc8544', 'meta_pooch_medium', 0),
(159, 'steam:11000010fdc8544', 'shark', 0),
(160, 'steam:11000010fdc8544', 'haszysz_pooch_high', 0),
(161, 'steam:11000010fdc8544', 'water', 0),
(162, 'steam:11000010fdc8544', 'clip', 0),
(163, 'steam:11000010fdc8544', 'meta_pooch_high', 0),
(164, 'steam:11000010fdc8544', 'meta', 0),
(165, 'steam:11000010fdc8544', 'dowod', 1),
(166, 'steam:11000010fdc8544', 'kokaina_pooch_low', 0),
(167, 'steam:11000010fdc8544', 'grip', 0),
(168, 'steam:11000010fdc8544', 'cola', 0),
(169, 'steam:11000010fdc8544', 'medikit', 0),
(170, 'steam:11000010fdc8544', 'zubr', 0),
(171, 'steam:11000010fdc8544', 'headbag', 0),
(172, 'steam:11000010fdc8544', 'lowradio', 0),
(173, 'steam:11000010fdc8544', 'kokaina_pooch_high', 0),
(174, 'steam:11000010fdc8544', 'lighter', 0),
(175, 'steam:11000010fdc8544', 'heroina_pooch_low', 0),
(176, 'steam:11000010fdc8544', 'highrim', 0),
(177, 'steam:11000010fdc8544', 'carokit', 0),
(178, 'steam:11000010fdc8544', 'kokaina_pooch_medium', 0),
(179, 'steam:11000010fdc8544', 'airbag', 0),
(180, 'steam:11000010fdc8544', 'hotdog', 0),
(181, 'steam:11000010fdc8544', 'bandage', 0),
(182, 'steam:11000010fdc8544', 'highradio', 0),
(183, 'steam:11000010fdc8544', 'fixkit', 0),
(184, 'steam:11000010fdc8544', 'haszysz', 0),
(185, 'steam:11000010fdc8544', 'bread', 0),
(186, 'steam:11000010fdc8544', 'heroina_pooch_high', 0),
(187, 'steam:11000010fdc8544', 'kaje', 1),
(188, 'steam:11000010fdc8544', 'flashlight', 0),
(189, 'steam:11000010fdc8544', 'repairkit', 0),
(190, 'steam:110000111ee525f', 'haszysz_pooch_medium', 0),
(191, 'steam:110000111ee525f', 'martini', 0),
(192, 'steam:110000111ee525f', 'zlom', 0),
(193, 'steam:110000111ee525f', 'sandwich', 0),
(194, 'steam:110000111ee525f', 'yusuf', 0),
(195, 'steam:110000111ee525f', 'blackberry', 0),
(196, 'steam:110000111ee525f', 'handcuff', 0),
(197, 'steam:110000111ee525f', 'contract', 0),
(198, 'steam:110000111ee525f', 'wizytowka', 1),
(199, 'steam:110000111ee525f', 'blowpipe', 0),
(200, 'steam:110000111ee525f', 'whiskey', 0),
(201, 'steam:110000111ee525f', 'weed', 0),
(202, 'steam:110000111ee525f', 'winogrono', 0),
(203, 'steam:110000111ee525f', 'wino', 0),
(204, 'steam:110000111ee525f', 'silencieux', 0),
(205, 'steam:110000111ee525f', 'fixtool', 0),
(206, 'steam:110000111ee525f', 'moet', 0),
(207, 'steam:110000111ee525f', 'heroina', 0),
(208, 'steam:110000111ee525f', 'kamizelka', 0),
(209, 'steam:110000111ee525f', 'kokaina', 0),
(210, 'steam:110000111ee525f', 'stockrim', 0),
(211, 'steam:110000111ee525f', 'vine', 0),
(212, 'steam:110000111ee525f', 'meta_pooch_low', 0),
(213, 'steam:110000111ee525f', 'heroina_pooch_medium', 0),
(214, 'steam:110000111ee525f', 'tyton', 0),
(215, 'steam:110000111ee525f', 'tyton_pooch', 0),
(216, 'steam:110000111ee525f', 'battery', 0),
(217, 'steam:110000111ee525f', 'kuflowe', 0),
(218, 'steam:110000111ee525f', 'cigarett', 0),
(219, 'steam:110000111ee525f', 'haszysz_pooch_low', 0),
(220, 'steam:110000111ee525f', 'meta_pooch_medium', 0),
(221, 'steam:110000111ee525f', 'shark', 0),
(222, 'steam:110000111ee525f', 'haszysz_pooch_high', 0),
(223, 'steam:110000111ee525f', 'hamburger', 0),
(224, 'steam:110000111ee525f', 'water', 0),
(225, 'steam:110000111ee525f', 'clip', 0),
(226, 'steam:110000111ee525f', 'meta_pooch_high', 0),
(227, 'steam:110000111ee525f', 'meta', 0),
(228, 'steam:110000111ee525f', 'dowod', 1),
(229, 'steam:110000111ee525f', 'kokaina_pooch_low', 0),
(230, 'steam:110000111ee525f', 'grip', 0),
(231, 'steam:110000111ee525f', 'cola', 0),
(232, 'steam:110000111ee525f', 'medikit', 0),
(233, 'steam:110000111ee525f', 'zubr', 0),
(234, 'steam:110000111ee525f', 'headbag', 0),
(235, 'steam:110000111ee525f', 'lowradio', 0),
(236, 'steam:110000111ee525f', 'kokaina_pooch_high', 0),
(237, 'steam:110000111ee525f', 'lighter', 0),
(238, 'steam:110000111ee525f', 'heroina_pooch_low', 0),
(239, 'steam:110000111ee525f', 'highrim', 0),
(240, 'steam:110000111ee525f', 'carokit', 0),
(241, 'steam:110000111ee525f', 'kokaina_pooch_medium', 0),
(242, 'steam:110000111ee525f', 'airbag', 0),
(243, 'steam:110000111ee525f', 'hotdog', 0),
(244, 'steam:110000111ee525f', 'bandage', 0),
(245, 'steam:110000111ee525f', 'highradio', 0),
(246, 'steam:110000111ee525f', 'fixkit', 0),
(247, 'steam:110000111ee525f', 'haszysz', 0),
(248, 'steam:110000111ee525f', 'bread', 0),
(249, 'steam:110000111ee525f', 'heroina_pooch_high', 0),
(250, 'steam:110000111ee525f', 'kaje', 0),
(251, 'steam:110000111ee525f', 'flashlight', 0),
(252, 'steam:110000111ee525f', 'repairkit', 0),
(253, 'steam:11000010b79ecd4', 'haszysz_pooch_medium', 0),
(254, 'steam:11000010b79ecd4', 'martini', 0),
(255, 'steam:11000010b79ecd4', 'zlom', 0),
(256, 'steam:11000010b79ecd4', 'sandwich', 0),
(257, 'steam:11000010b79ecd4', 'yusuf', 0),
(258, 'steam:11000010b79ecd4', 'handcuff', 0),
(259, 'steam:11000010b79ecd4', 'contract', 0),
(260, 'steam:11000010b79ecd4', 'blowpipe', 0),
(261, 'steam:11000010b79ecd4', 'silencieux', 0),
(262, 'steam:11000010b79ecd4', 'winogrono', 0),
(263, 'steam:11000010b79ecd4', 'wino', 0),
(264, 'steam:11000010b79ecd4', 'wizytowka', 1),
(265, 'steam:11000010b79ecd4', 'whiskey', 0),
(266, 'steam:11000010b79ecd4', 'weed', 0),
(267, 'steam:11000010b79ecd4', 'hamburger', 0),
(268, 'steam:11000010b79ecd4', 'moet', 0),
(269, 'steam:11000010b79ecd4', 'heroina', 0),
(270, 'steam:11000010b79ecd4', 'tyton', 0),
(271, 'steam:11000010b79ecd4', 'blackberry', 0),
(272, 'steam:11000010b79ecd4', 'kamizelka', 0),
(273, 'steam:11000010b79ecd4', 'kokaina', 0),
(274, 'steam:11000010b79ecd4', 'stockrim', 0),
(275, 'steam:11000010b79ecd4', 'fixtool', 0),
(276, 'steam:11000010b79ecd4', 'vine', 0),
(277, 'steam:11000010b79ecd4', 'meta_pooch_low', 0),
(278, 'steam:11000010b79ecd4', 'heroina_pooch_medium', 0),
(279, 'steam:11000010b79ecd4', 'tyton_pooch', 0),
(280, 'steam:11000010b79ecd4', 'kuflowe', 0),
(281, 'steam:11000010b79ecd4', 'cigarett', 0),
(282, 'steam:11000010b79ecd4', 'haszysz_pooch_low', 0),
(283, 'steam:11000010b79ecd4', 'meta_pooch_medium', 0),
(284, 'steam:11000010b79ecd4', 'shark', 0),
(285, 'steam:11000010b79ecd4', 'haszysz_pooch_high', 0),
(286, 'steam:11000010b79ecd4', 'water', 0),
(287, 'steam:11000010b79ecd4', 'clip', 0),
(288, 'steam:11000010b79ecd4', 'meta_pooch_high', 0),
(289, 'steam:11000010b79ecd4', 'meta', 0),
(290, 'steam:11000010b79ecd4', 'dowod', 1),
(291, 'steam:11000010b79ecd4', 'kokaina_pooch_low', 0),
(292, 'steam:11000010b79ecd4', 'grip', 0),
(293, 'steam:11000010b79ecd4', 'cola', 0),
(294, 'steam:11000010b79ecd4', 'medikit', 0),
(295, 'steam:11000010b79ecd4', 'zubr', 0),
(296, 'steam:11000010b79ecd4', 'headbag', 0),
(297, 'steam:11000010b79ecd4', 'lowradio', 0),
(298, 'steam:11000010b79ecd4', 'kokaina_pooch_high', 0),
(299, 'steam:11000010b79ecd4', 'lighter', 0),
(300, 'steam:11000010b79ecd4', 'heroina_pooch_low', 0),
(301, 'steam:11000010b79ecd4', 'highrim', 0),
(302, 'steam:11000010b79ecd4', 'carokit', 0),
(303, 'steam:11000010b79ecd4', 'kokaina_pooch_medium', 0),
(304, 'steam:11000010b79ecd4', 'airbag', 0),
(305, 'steam:11000010b79ecd4', 'hotdog', 0),
(306, 'steam:11000010b79ecd4', 'bandage', 0),
(307, 'steam:11000010b79ecd4', 'highradio', 0),
(308, 'steam:11000010b79ecd4', 'fixkit', 0),
(309, 'steam:11000010b79ecd4', 'haszysz', 0),
(310, 'steam:11000010b79ecd4', 'bread', 0),
(311, 'steam:11000010b79ecd4', 'heroina_pooch_high', 0),
(312, 'steam:11000010b79ecd4', 'kaje', 0),
(313, 'steam:11000010b79ecd4', 'battery', 0),
(314, 'steam:11000010b79ecd4', 'flashlight', 0),
(315, 'steam:11000010b79ecd4', 'repairkit', 0),
(316, 'steam:110000104eb808d', 'kastetdollar', 0),
(317, 'steam:110000104eb808d', 'celownikdluga', 0),
(318, 'steam:110000104eb808d', 'kastethate', 0),
(319, 'steam:110000104eb808d', 'kastetbalas', 0),
(320, 'steam:110000104eb808d', 'mediumscope', 0),
(321, 'steam:110000104eb808d', 'holografik', 0),
(322, 'steam:110000104eb808d', 'zebradlugie', 0),
(323, 'steam:110000104eb808d', 'kastetpimp', 0),
(324, 'steam:110000104eb808d', 'woodheavyp', 0),
(325, 'steam:110000104eb808d', 'wooddlugie', 0),
(326, 'steam:110000104eb808d', 'MountedScope', 0),
(327, 'steam:110000104eb808d', 'platin50', 0),
(328, 'steam:110000104eb808d', 'kastetdiament', 0),
(329, 'steam:110000104eb808d', 'vipskinmotyl', 0),
(330, 'steam:110000104eb808d', 'kastetplayer', 0),
(331, 'steam:110000104eb808d', 'czaszkidlugie', 0),
(332, 'steam:110000104eb808d', 'tactitalmuzle', 0),
(333, 'steam:110000104eb808d', 'kompensator', 0),
(334, 'steam:110000104eb808d', 'kastetvagos', 0),
(335, 'steam:110000104eb808d', 'kastetpink', 0),
(336, 'steam:110000104eb808d', 'boomdlugie', 0),
(337, 'steam:110000104eb808d', 'largescope', 0),
(338, 'steam:110000104eb808d', 'powiekszonymagazynek', 1),
(339, 'steam:110000114f63a7e', 'kastetdollar', 0),
(340, 'steam:110000114f63a7e', 'celownikdluga', 0),
(341, 'steam:110000114f63a7e', 'kastethate', 0),
(342, 'steam:110000114f63a7e', 'kastetbalas', 0),
(343, 'steam:110000114f63a7e', 'mediumscope', 0),
(344, 'steam:110000114f63a7e', 'holografik', 0),
(345, 'steam:110000114f63a7e', 'kastetpimp', 0),
(346, 'steam:110000114f63a7e', 'woodheavyp', 0),
(347, 'steam:110000114f63a7e', 'wooddlugie', 0),
(348, 'steam:110000114f63a7e', 'MountedScope', 0),
(349, 'steam:110000114f63a7e', 'platin50', 0),
(350, 'steam:110000114f63a7e', 'kastetdiament', 0),
(351, 'steam:110000114f63a7e', 'vipskinmotyl', 0),
(352, 'steam:110000114f63a7e', 'kastetplayer', 0),
(353, 'steam:110000114f63a7e', 'zebradlugie', 0),
(354, 'steam:110000114f63a7e', 'czaszkidlugie', 0),
(355, 'steam:110000114f63a7e', 'tactitalmuzle', 0),
(356, 'steam:110000114f63a7e', 'kompensator', 0),
(357, 'steam:110000114f63a7e', 'kastetpink', 0),
(358, 'steam:110000114f63a7e', 'boomdlugie', 0),
(359, 'steam:110000114f63a7e', 'kastetvagos', 0),
(360, 'steam:110000114f63a7e', 'largescope', 0),
(361, 'steam:110000114f63a7e', 'powiekszonymagazynek', 0),
(362, 'steam:11000010fdc8544', 'holografik', 0),
(363, 'steam:11000010fdc8544', 'largescope', 0),
(364, 'steam:11000010fdc8544', 'platin50', 0),
(365, 'steam:11000010fdc8544', 'kastetplayer', 0),
(366, 'steam:11000010fdc8544', 'kastetdiament', 0),
(367, 'steam:11000010fdc8544', 'kastetbalas', 0),
(368, 'steam:11000010fdc8544', 'kastetpink', 0),
(369, 'steam:11000010fdc8544', 'tactitalmuzle', 0),
(370, 'steam:11000010fdc8544', 'kastetpimp', 0),
(371, 'steam:11000010fdc8544', 'kastethate', 0),
(372, 'steam:11000010fdc8544', 'mediumscope', 0),
(373, 'steam:11000010fdc8544', 'zebradlugie', 0),
(374, 'steam:11000010fdc8544', 'vipskinmotyl', 0),
(375, 'steam:11000010fdc8544', 'powiekszonymagazynek', 0),
(376, 'steam:11000010fdc8544', 'wooddlugie', 0),
(377, 'steam:11000010fdc8544', 'kastetdollar', 0),
(378, 'steam:11000010fdc8544', 'boomdlugie', 0),
(379, 'steam:11000010fdc8544', 'kastetvagos', 0),
(380, 'steam:11000010fdc8544', 'MountedScope', 0),
(381, 'steam:11000010fdc8544', 'celownikdluga', 0),
(382, 'steam:11000010fdc8544', 'czaszkidlugie', 0),
(383, 'steam:11000010fdc8544', 'woodheavyp', 0),
(384, 'steam:11000010fdc8544', 'kompensator', 0),
(385, 'steam:110000111ee525f', 'kastetpink', 0),
(386, 'steam:110000111ee525f', 'kastetbalas', 0),
(387, 'steam:110000111ee525f', 'holografik', 0),
(388, 'steam:110000111ee525f', 'kastetvagos', 0),
(389, 'steam:110000111ee525f', 'celownikdluga', 0),
(390, 'steam:110000111ee525f', 'czaszkidlugie', 0),
(391, 'steam:110000111ee525f', 'kastetplayer', 0),
(392, 'steam:110000111ee525f', 'kompensator', 0),
(393, 'steam:110000111ee525f', 'tactitalmuzle', 0),
(394, 'steam:110000111ee525f', 'zebradlugie', 0),
(395, 'steam:110000111ee525f', 'woodheavyp', 0),
(396, 'steam:110000111ee525f', 'wooddlugie', 0),
(397, 'steam:110000111ee525f', 'kastetpimp', 0),
(398, 'steam:110000111ee525f', 'kastetdiament', 0),
(399, 'steam:110000111ee525f', 'kastetdollar', 0),
(400, 'steam:110000111ee525f', 'platin50', 0),
(401, 'steam:110000111ee525f', 'MountedScope', 0),
(402, 'steam:110000111ee525f', 'kastethate', 0),
(403, 'steam:110000111ee525f', 'mediumscope', 0),
(404, 'steam:110000111ee525f', 'largescope', 0),
(405, 'steam:110000111ee525f', 'powiekszonymagazynek', 0),
(406, 'steam:110000111ee525f', 'boomdlugie', 0),
(407, 'steam:110000111ee525f', 'vipskinmotyl', 0),
(408, 'steam:110000104eb808d', 'karnet', 0),
(409, 'steam:110000104eb808d', 'powerade', 0),
(410, 'steam:110000104eb808d', 'protein', 0),
(411, 'steam:11000010fdc8544', 'karnet', 0),
(412, 'steam:11000010fdc8544', 'powerade', 1),
(413, 'steam:11000010fdc8544', 'protein', 0),
(414, 'steam:110000114f63a7e', 'karnet', 0),
(415, 'steam:110000114f63a7e', 'powerade', 0),
(416, 'steam:110000114f63a7e', 'protein', 0),
(417, 'steam:110000111ee525f', 'karnet', 0),
(418, 'steam:110000111ee525f', 'protein', 0),
(419, 'steam:110000111ee525f', 'powerade', 0),
(420, 'steam:110000104eb808d', 'sterydy_pooch_high', 0),
(421, 'steam:110000104eb808d', 'sterydy', 0),
(422, 'steam:110000104eb808d', 'sterydy_pooch_medium', 0),
(423, 'steam:110000104eb808d', 'sterydy_pooch_low', 0),
(424, 'steam:11000010fdc8544', 'sterydy_pooch_medium', 0),
(425, 'steam:11000010fdc8544', 'sterydy_pooch_low', 0),
(426, 'steam:11000010fdc8544', 'sterydy', 0),
(427, 'steam:11000010fdc8544', 'sterydy_pooch_high', 0),
(428, 'steam:110000111ee525f', 'sterydy_pooch_high', 0),
(429, 'steam:110000111ee525f', 'sterydy_pooch_medium', 0),
(430, 'steam:110000111ee525f', 'sterydy_pooch_low', 0),
(431, 'steam:110000111ee525f', 'sterydy', 0),
(432, 'steam:110000114f63a7e', 'sterydy_pooch_high', 0),
(433, 'steam:110000114f63a7e', 'sterydy_pooch_medium', 0),
(434, 'steam:110000114f63a7e', 'sterydy_pooch_low', 0),
(435, 'steam:110000114f63a7e', 'sterydy', 0),
(436, 'steam:11000010b79ecd4', 'woodheavyp', 0),
(437, 'steam:11000010b79ecd4', 'sterydy_pooch_low', 0),
(438, 'steam:11000010b79ecd4', 'kastethate', 0),
(439, 'steam:11000010b79ecd4', 'kastetvagos', 0),
(440, 'steam:11000010b79ecd4', 'holografik', 0),
(441, 'steam:11000010b79ecd4', 'boomdlugie', 0),
(442, 'steam:11000010b79ecd4', 'mediumscope', 0),
(443, 'steam:11000010b79ecd4', 'celownikdluga', 0),
(444, 'steam:11000010b79ecd4', 'powerade', 0),
(445, 'steam:11000010b79ecd4', 'MountedScope', 0),
(446, 'steam:11000010b79ecd4', 'sterydy_pooch_medium', 0),
(447, 'steam:11000010b79ecd4', 'protein', 0),
(448, 'steam:11000010b79ecd4', 'kastetpink', 0),
(449, 'steam:11000010b79ecd4', 'sterydy_pooch_high', 0),
(450, 'steam:11000010b79ecd4', 'zebradlugie', 0),
(451, 'steam:11000010b79ecd4', 'kastetpimp', 0),
(452, 'steam:11000010b79ecd4', 'wooddlugie', 0),
(453, 'steam:11000010b79ecd4', 'kompensator', 0),
(454, 'steam:11000010b79ecd4', 'kastetdollar', 0),
(455, 'steam:11000010b79ecd4', 'platin50', 0),
(456, 'steam:11000010b79ecd4', 'karnet', 0),
(457, 'steam:11000010b79ecd4', 'vipskinmotyl', 0),
(458, 'steam:11000010b79ecd4', 'kastetplayer', 0),
(459, 'steam:11000010b79ecd4', 'tactitalmuzle', 0),
(460, 'steam:11000010b79ecd4', 'sterydy', 0),
(461, 'steam:11000010b79ecd4', 'kastetbalas', 0),
(462, 'steam:11000010b79ecd4', 'largescope', 0),
(463, 'steam:11000010b79ecd4', 'powiekszonymagazynek', 0),
(464, 'steam:11000010b79ecd4', 'czaszkidlugie', 0),
(465, 'steam:11000010b79ecd4', 'kastetdiament', 0),
(466, 'steam:110000104eb808d', 'kfc_megapocket', 0),
(467, 'steam:110000104eb808d', 'bking_chburger', 0),
(468, 'steam:110000104eb808d', 'bking_whopperj', 0),
(469, 'steam:110000104eb808d', 'rest_obiadmaly', 0),
(470, 'steam:110000104eb808d', 'kfc_kubelekclassic', 0),
(471, 'steam:110000104eb808d', 'kfc_twister', 0),
(472, 'steam:110000104eb808d', 'kfc_zinger', 0),
(473, 'steam:110000104eb808d', 'bking_dcburger', 0),
(474, 'steam:110000104eb808d', 'kfc_kubelek11', 0),
(475, 'steam:110000104eb808d', 'rest_obiadsredni', 0),
(476, 'steam:110000104eb808d', 'bking_lchicken', 0),
(477, 'steam:110000104eb808d', 'bking_nuggets', 0),
(478, 'steam:110000104eb808d', 'bking_cchicken', 0),
(479, 'steam:110000104eb808d', 'bking_bcwhopper', 0),
(480, 'steam:110000104eb808d', 'lody', 0),
(481, 'steam:110000104eb808d', 'kfc_longer', 0),
(482, 'steam:110000104eb808d', 'kfc_qurrito', 0),
(483, 'steam:110000104eb808d', 'bking_bigking', 0),
(484, 'steam:110000104eb808d', 'kfc_kubelekclassicxl', 0),
(485, 'steam:110000104eb808d', 'bking_whopper', 0),
(486, 'steam:110000104eb808d', 'frytki', 0),
(487, 'steam:110000104eb808d', 'rest_obiadduzy', 0),
(488, 'steam:110000104eb808d', 'kfc_grander', 0),
(489, 'steam:110000104eb808d', 'frytkixxl', 0),
(490, 'steam:11000010fdc8544', 'kfc_kubelekclassic', 0),
(491, 'steam:11000010fdc8544', 'bking_lchicken', 0),
(492, 'steam:11000010fdc8544', 'frytkixxl', 0),
(493, 'steam:11000010fdc8544', 'bking_nuggets', 0),
(494, 'steam:11000010fdc8544', 'rest_obiadmaly', 0),
(495, 'steam:11000010fdc8544', 'bking_whopperj', 0),
(496, 'steam:11000010fdc8544', 'bking_bcwhopper', 0),
(497, 'steam:11000010fdc8544', 'kfc_zinger', 0),
(498, 'steam:11000010fdc8544', 'kfc_grander', 0),
(499, 'steam:11000010fdc8544', 'bking_dcburger', 0),
(500, 'steam:11000010fdc8544', 'bking_chburger', 0),
(501, 'steam:11000010fdc8544', 'bking_bigking', 0),
(502, 'steam:11000010fdc8544', 'kfc_kubelekclassicxl', 0),
(503, 'steam:11000010fdc8544', 'rest_obiadsredni', 0),
(504, 'steam:11000010fdc8544', 'bking_whopper', 0),
(505, 'steam:11000010fdc8544', 'rest_obiadduzy', 0),
(506, 'steam:11000010fdc8544', 'kfc_qurrito', 0),
(507, 'steam:11000010fdc8544', 'lody', 0),
(508, 'steam:11000010fdc8544', 'kfc_megapocket', 0),
(509, 'steam:11000010fdc8544', 'bking_cchicken', 0),
(510, 'steam:11000010fdc8544', 'kfc_longer', 0),
(511, 'steam:11000010fdc8544', 'kfc_kubelek11', 0),
(512, 'steam:11000010fdc8544', 'kfc_twister', 0),
(513, 'steam:11000010fdc8544', 'frytki', 0),
(514, 'steam:110000114f63a7e', 'kfc_kubelekclassic', 0),
(515, 'steam:110000114f63a7e', 'bking_lchicken', 0),
(516, 'steam:110000114f63a7e', 'frytkixxl', 0),
(517, 'steam:110000114f63a7e', 'bking_nuggets', 0),
(518, 'steam:110000114f63a7e', 'rest_obiadmaly', 0),
(519, 'steam:110000114f63a7e', 'bking_whopperj', 0),
(520, 'steam:110000114f63a7e', 'bking_dcburger', 0),
(521, 'steam:110000114f63a7e', 'bking_bcwhopper', 0),
(522, 'steam:110000114f63a7e', 'kfc_zinger', 0),
(523, 'steam:110000114f63a7e', 'kfc_grander', 0),
(524, 'steam:110000114f63a7e', 'bking_chburger', 0),
(525, 'steam:110000114f63a7e', 'bking_bigking', 0),
(526, 'steam:110000114f63a7e', 'kfc_kubelekclassicxl', 0),
(527, 'steam:110000114f63a7e', 'rest_obiadsredni', 0),
(528, 'steam:110000114f63a7e', 'bking_whopper', 0),
(529, 'steam:110000114f63a7e', 'rest_obiadduzy', 0),
(530, 'steam:110000114f63a7e', 'kfc_qurrito', 0),
(531, 'steam:110000114f63a7e', 'lody', 0),
(532, 'steam:110000114f63a7e', 'kfc_megapocket', 0),
(533, 'steam:110000114f63a7e', 'bking_cchicken', 0),
(534, 'steam:110000114f63a7e', 'kfc_longer', 0),
(535, 'steam:110000114f63a7e', 'kfc_kubelek11', 0),
(536, 'steam:110000114f63a7e', 'kfc_twister', 0),
(537, 'steam:110000114f63a7e', 'frytki', 0),
(538, 'steam:11000010b79ecd4', 'rest_obiadsredni', 0),
(539, 'steam:11000010b79ecd4', 'frytkixxl', 0),
(540, 'steam:11000010b79ecd4', 'kfc_twister', 0),
(541, 'steam:11000010b79ecd4', 'kfc_megapocket', 0),
(542, 'steam:11000010b79ecd4', 'bking_bigking', 0),
(543, 'steam:11000010b79ecd4', 'kfc_kubelek11', 0),
(544, 'steam:11000010b79ecd4', 'bking_dcburger', 0),
(545, 'steam:11000010b79ecd4', 'bking_nuggets', 0),
(546, 'steam:11000010b79ecd4', 'kfc_longer', 0),
(547, 'steam:11000010b79ecd4', 'bking_lchicken', 0),
(548, 'steam:11000010b79ecd4', 'rest_obiadmaly', 0),
(549, 'steam:11000010b79ecd4', 'kfc_zinger', 0),
(550, 'steam:11000010b79ecd4', 'bking_cchicken', 0),
(551, 'steam:11000010b79ecd4', 'lody', 0),
(552, 'steam:11000010b79ecd4', 'kfc_grander', 0),
(553, 'steam:11000010b79ecd4', 'kfc_qurrito', 0),
(554, 'steam:11000010b79ecd4', 'frytki', 0),
(555, 'steam:11000010b79ecd4', 'kfc_kubelekclassic', 0),
(556, 'steam:11000010b79ecd4', 'bking_chburger', 0),
(557, 'steam:11000010b79ecd4', 'rest_obiadduzy', 0),
(558, 'steam:11000010b79ecd4', 'bking_whopper', 0),
(559, 'steam:11000010b79ecd4', 'bking_whopperj', 0),
(560, 'steam:11000010b79ecd4', 'bking_bcwhopper', 0),
(561, 'steam:11000010b79ecd4', 'kfc_kubelekclassicxl', 0),
(562, 'steam:110000104eb808d', 'bimber_pooch', 0),
(563, 'steam:11000010fdc8544', 'bimber_pooch', 0),
(564, 'steam:110000114f63a7e', 'bimber_pooch', 0),
(565, 'steam:11000010b79ecd4', 'bimber_pooch', 0),
(566, 'steam:110000104eb808d', 'pcp', 95),
(567, 'steam:110000104eb808d', 'sol', 99),
(568, 'steam:110000104eb808d', 'diazepam', 100),
(569, 'steam:110000104eb808d', 'rozpuszczalnik', 34),
(570, 'steam:110000104eb808d', 'proszekdopieczenia', 100),
(571, 'steam:110000104eb808d', 'benzyna', 34),
(572, 'steam:110000104eb808d', 'soda_oczyszczona', 100),
(573, 'steam:110000104eb808d', 'lidokaina', 100),
(574, 'steam:110000104eb808d', 'cukier', 95),
(575, 'steam:11000010fdc8544', 'soda_oczyszczona', 0),
(576, 'steam:11000010fdc8544', 'benzyna', 0),
(577, 'steam:11000010fdc8544', 'sol', 0),
(578, 'steam:11000010fdc8544', 'proszekdopieczenia', 0),
(579, 'steam:11000010fdc8544', 'rozpuszczalnik', 0),
(580, 'steam:11000010fdc8544', 'pcp', 5),
(581, 'steam:11000010fdc8544', 'lidokaina', 0),
(582, 'steam:11000010fdc8544', 'cukier', 5),
(583, 'steam:11000010fdc8544', 'diazepam', 0),
(584, 'steam:110000114f63a7e', 'diazepam', 0),
(585, 'steam:110000114f63a7e', 'proszekdopieczenia', 0),
(586, 'steam:110000114f63a7e', 'rozpuszczalnik', 0),
(587, 'steam:110000114f63a7e', 'lidokaina', 0),
(588, 'steam:110000114f63a7e', 'soda_oczyszczona', 0),
(589, 'steam:110000114f63a7e', 'pcp', 0),
(590, 'steam:110000114f63a7e', 'sol', 0),
(591, 'steam:110000114f63a7e', 'benzyna', 0),
(592, 'steam:110000114f63a7e', 'cukier', 0);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `user_licenses`
--

CREATE TABLE `user_licenses` (
  `id` int(11) NOT NULL,
  `type` varchar(60) NOT NULL,
  `owner` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `user_parkings`
--

CREATE TABLE `user_parkings` (
  `id` int(11) NOT NULL,
  `identifier` varchar(60) COLLATE utf8mb4_bin DEFAULT NULL,
  `vehicle` longtext COLLATE utf8mb4_bin,
  `plate` varchar(10) COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Zrzut danych tabeli `user_parkings`
--

INSERT INTO `user_parkings` (`id`, `identifier`, `vehicle`, `plate`) VALUES
(96, 'steam:110000104eb808d', '{\"extras\":{\"10\":false,\"12\":false,\"11\":true},\"plateIndex\":1,\"modBackWheels\":-1,\"modHood\":-1,\"modSteeringWheel\":-1,\"modHydrolic\":-1,\"modFender\":-1,\"modXenon\":1,\"modHorns\":-1,\"modBrakes\":2,\"modFrame\":-1,\"modPlateHolder\":-1,\"modShifterLeavers\":-1,\"wheelColor\":12,\"modTrimA\":-1,\"modEngine\":3,\"health\":1000,\"modWindows\":-1,\"modEngineBlock\":-1,\"modAerials\":-1,\"modLivery\":-1,\"modSeats\":-1,\"color1\":12,\"tyreSmokeColor\":[255,255,255],\"model\":-1743316013,\"modTransmission\":2,\"dirtLevel\":0.0068625430576504,\"modDashboard\":-1,\"modVanityPlate\":-1,\"color2\":12,\"modRearBumper\":-1,\"modRightFender\":-1,\"modStruts\":-1,\"modDoorSpeaker\":-1,\"plate\":\"CGC 854\",\"modSpoilers\":-1,\"modAirFilter\":-1,\"modTurbo\":1,\"modSpeakers\":-1,\"modSideSkirt\":-1,\"modArmor\":4,\"modArchCover\":-1,\"modGrille\":-1,\"modRoof\":-1,\"modTrimB\":-1,\"modAPlate\":-1,\"windowTint\":1,\"modFrontWheels\":2,\"neonColor\":[255,0,255],\"modSmokeEnabled\":1,\"modTrunk\":-1,\"modTank\":-1,\"modFrontBumper\":-1,\"modExhaust\":-1,\"modSuspension\":3,\"wheels\":4,\"modDial\":-1,\"neonEnabled\":[false,false,false,false],\"modOrnaments\":-1,\"pearlescentColor\":111}', 'CGC 854');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `user_sim`
--

CREATE TABLE `user_sim` (
  `id` int(11) NOT NULL,
  `identifier` varchar(555) NOT NULL,
  `number` varchar(555) NOT NULL,
  `label` varchar(555) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `vehicles`
--

CREATE TABLE `vehicles` (
  `name` varchar(60) NOT NULL,
  `model` varchar(60) NOT NULL,
  `price` int(11) NOT NULL,
  `category` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `vehicles`
--

INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
('BMW M760i', '17m760i', 990000, 'sedans'),
('Audi A3 Sedan', '2015a3', 999999, 'sedans'),
('BMW 440i XDrive', '440i', 999999, 'coupes'),
('Ferrari 488 GTS', '488', 1450000, 'sports'),
('Porsche 718', '718', 350000, 'sports'),
('Porsche 911 Turbo S', '911turbos', 1245000, 'sports'),
('Audi A6 Avant', 'a6avant', 999999, 'sedans'),
('Adder', 'adder', 500000, 'super'),
('Akuma', 'AKUMA', 11500, 'motorcycles'),
('Alpha', 'alpha', 155000, 'sports'),
('Mercedes AMG GTS', 'amggt', 2070000, 'super'),
('Ardent', 'ardent', 75000, 'sportsclassics'),
('Asea', 'asea', 20000, 'sedans'),
('Autarch', 'autarch', 480000, 'super'),
('Avarus', 'avarus', 27000, 'motorcycles'),
('Bagger', 'bagger', 19500, 'motorcycles'),
('Baller', 'baller2', 110000, 'suvs'),
('Baller Sport', 'baller3', 150000, 'suvs'),
('Banshee', 'banshee', 267000, 'sports'),
('Banshee 900R', 'banshee2', 310000, 'super'),
('Bati 801', 'bati', 30000, 'motorcycles'),
('Bati 801RR', 'bati2', 34500, 'motorcycles'),
('Bestia GTS', 'bestiagts', 320000, 'sports'),
('BF400', 'bf400', 20000, 'motorcycles'),
('Bf Injection', 'bfinjection', 50000, 'offroad'),
('Bifta', 'bifta', 70000, 'offroad'),
('Bison', 'bison', 150000, 'vans'),
('Blade', 'blade', 42500, 'muscle'),
('Blazer', 'blazer', 12500, 'offroad'),
('Blazer Sport', 'blazer4', 17000, 'offroad'),
('Blista', 'blista', 47500, 'compacts'),
('BMW M5 E39', 'bmwe39', 395000, 'sedans'),
('BMW M8', 'bmwm8', 999999, 'super'),
('BRABUS 700 G63 AMG 6x6', 'brabus700', 999999, 'offroad'),
('Brioso R/A', 'brioso', 45000, 'compacts'),
('Buccaneer', 'buccaneer', 60000, 'muscle'),
('Buccaneer Rider', 'buccaneer2', 75000, 'muscle'),
('Buffalo', 'buffalo', 100000, 'sports'),
('Buffalo S', 'buffalo2', 110000, 'sports'),
('Bullet', 'bullet', 175000, 'super'),
('Burrito', 'burrito3', 85000, 'vans'),
('Camper', 'camper', 82000, 'vans'),
('Carbonizzare', 'carbonizzare', 275000, 'sports'),
('Carbon RS', 'carbonrs', 30000, 'motorcycles'),
('Casco', 'casco', 57500, 'sportsclassics'),
('Cavalcade', 'cavalcade2', 115000, 'suvs'),
('Cheetah', 'cheetah', 375000, 'super'),
('Chino', 'chino', 95000, 'muscle'),
('Chino Luxe', 'chino2', 105000, 'muscle'),
('Cliffhanger', 'cliffhanger', 40000, 'motorcycles'),
('Mercedes Benz CLS 2015', 'cls2015', 1000000, 'sedans'),
('Cognoscenti Cabrio', 'cogcabrio', 200000, 'coupes'),
('Cognoscenti', 'cognoscenti', 170000, 'sedans'),
('Comet', 'comet2', 220000, 'sports'),
('Comet 5', 'comet5', 270000, 'sports'),
('Contender', 'contender', 175000, 'suvs'),
('Bentley Continental GT', 'contgt13', 999999, 'super'),
('Cyclone', 'cyclone', 300000, 'super'),
('Daemon', 'daemon', 31000, 'motorcycles'),
('Daemon High', 'daemon2', 33500, 'motorcycles'),
('Dominator', 'dominator', 200000, 'muscle'),
('Double T', 'double', 28000, 'motorcycles'),
('Dubsta 6x6', 'dubsta3', 395000, 'offroad'),
('BMW E34 M5 Touring', 'e34touring', 135000, 'sedans'),
('Mercedes-Benz E400', 'e400', 999999, 'sports'),
('BMW M3 E46', 'e46', 220000, 'sedans'),
('Mercedes-Benz E63 AMG', 'e63amg', 850000, 'sedans'),
('Elegy', 'elegy2', 170000, 'sports'),
('Emperor', 'emperor', 45000, 'sedans'),
('Enduro', 'enduro', 15500, 'motorcycles'),
('Entity XF', 'entityxf', 405000, 'super'),
('Esskey', 'esskey', 25000, 'motorcycles'),
('Exemplar', 'exemplar', 200000, 'coupes'),
('F620', 'f620', 180000, 'coupes'),
('Ferrari 812 Superfast', 'f812', 1750000, 'sports'),
('Faction', 'faction', 75000, 'muscle'),
('Faction Rider', 'faction2', 95000, 'muscle'),
('Faggio', 'faggio', 5000, 'motorcycles'),
('Vespa', 'faggio2', 7000, 'motorcycles'),
('Felon', 'felon', 140000, 'coupes'),
('Felon GT', 'felon2', 155000, 'coupes'),
('Feltzer', 'feltzer2', 150000, 'sports'),
('FMJ', 'fmj', 510000, 'super'),
('Jaguar F-pace', 'fpace2017', 999999, 'suvs'),
('Fhantom', 'fq2', 157000, 'suvs'),
('Fugitive', 'fugitive', 167000, 'sedans'),
('Furore GT', 'furoregt', 235000, 'sports'),
('Fusilade', 'fusilade', 190000, 'sports'),
('Mercedes-Benz G65 AMG', 'g65amg', 2250000, 'suvs'),
('Gargoyle', 'gargoyle', 35500, 'motorcycles'),
('Gauntlet', 'gauntlet', 155000, 'muscle'),
('Gang Burrito', 'gburrito', 175000, 'vans'),
('Burrito', 'gburrito2', 185000, 'vans'),
('Grabger', 'granger', 145000, 'suvs'),
('Ferrari 599 GTO', 'gto', 1800000, 'sports'),
('Guardian', 'guardian', 300000, 'offroad'),
('Hakuchou', 'hakuchou', 50000, 'motorcycles'),
('Hexer', 'hexer', 20000, 'motorcycles'),
('Huntley S', 'huntley', 160000, 'suvs'),
('Infernus', 'infernus', 350000, 'super'),
('Intruder', 'intruder', 95000, 'sedans'),
('Issi', 'issi2', 70000, 'compacts'),
('Jackal', 'jackal', 138000, 'coupes'),
('Jester', 'jester', 385000, 'sports'),
('Kamacho', 'kamacho', 175000, 'offroad'),
('Khamelion', 'khamelion', 224000, 'sports'),
('Kuruma', 'kuruma', 135000, 'sports'),
('Landstalker', 'landstalker', 110000, 'suvs'),
('RE-7B', 'le7b', 325000, 'super'),
('Lamborghini Huracan', 'lp580', 2580000, 'sports'),
('BMW M2 F22', 'm2f22', 475000, 'coupes'),
('BMW M3 (F80)', 'm3f80', 999999, 'sports'),
('BMW M5 F10', 'm516', 999999, 'sedans'),
('BMW M5E60', 'm5e60', 550000, 'sedans'),
('BMW M5 F90', 'm5f90', 670000, 'sedans'),
('Mercedes-Benz A-Class', 'macla', 999999, 'sports'),
('Manana', 'manana', 128000, 'sportsclassics'),
('Massacro', 'massacro', 215000, 'sports'),
('Mesa', 'mesa', 145000, 'suvs'),
('Minivan', 'minivan', 57000, 'vans'),
('Moonbeam', 'moonbeam', 100000, 'vans'),
('Maserati Quattroporte GTS', 'mqgts', 350000, 'sedans'),
('Nemesis', 'nemesis', 530000, 'motorcycles'),
('Neon', 'neon', 220000, 'sports'),
('9F', 'ninef', 290000, 'sports'),
('9F Cabrio', 'ninef2', 300000, 'sports'),
('Oracle XS', 'oracle2', 125000, 'coupes'),
('Osiris', 'osiris', 395000, 'super'),
('Paradise', 'paradise', 105000, 'vans'),
('Pariah', 'pariah', 210000, 'sports'),
('Patriot', 'patriot', 170000, 'suvs'),
('Penumbra', 'penumbra', 130000, 'sports'),
('Pfister', 'pfister811', 355000, 'super'),
('Phoenix', 'phoenix', 95000, 'muscle'),
('Prairie', 'prairie', 90000, 'compacts'),
('Premier', 'premier', 70000, 'sedans'),
('Primo Custom', 'primo2', 85000, 'sedans'),
('Porsche Panamera Turbo S', 'pturismo', 1900000, 'sedans'),
('Audi R8', 'r820', 999999, 'super'),
('Rapid GT', 'rapidgt', 235000, 'sports'),
('Koenigsegg Regera', 'regera', 2800000, 'super'),
('Revolter', 'revolter', 195000, 'sports'),
('Rocoto', 'rocoto', 115000, 'suvs'),
('Rumpo', 'rumpo', 120000, 'vans'),
('Rumpo Trail', 'rumpo3', 300000, 'vans'),
('Mercedes Benz S63W222', 's63w222', 1780000, 'sedans'),
('Sanchez Sport', 'sanchez2', 20000, 'motorcycles'),
('Sanctus', 'sanctus', 100000, 'motorcycles'),
('Sandking', 'sandking', 140000, 'offroad'),
('SC 1', 'sc1', 370000, 'super'),
('Schafter', 'schafter2', 130000, 'sedans'),
('Seminole', 'seminole', 85000, 'suvs'),
('Sentinel', 'sentinel', 170000, 'coupes'),
('Seven 70', 'seven70', 290000, 'sports'),
('Audi SQ7', 'sq72016', 680000, 'suvs'),
('Sultan', 'sultan', 140000, 'sports'),
('Sultan RS', 'sultanrs', 155000, 'super'),
('Super Diamond', 'superd', 150000, 'sedans'),
('Surano', 'surano', 275000, 'sports'),
('T20', 't20', 420000, 'super'),
('Thrust', 'thrust', 24000, 'motorcycles'),
('Turismo R', 'turismor', 500000, 'super'),
('Tyrus', 'tyrus', 200000, 'super'),
('Vacca', 'vacca', 290000, 'super'),
('Vader', 'vader', 28000, 'motorcycles'),
('Range-Rover Velar', 'velar', 999999, 'suvs'),
('Virgo', 'virgo', 80000, 'muscle'),
('Visione', 'visione', 700000, 'super'),
('Voodoo', 'voodoo', 140000, 'muscle'),
('Mercedes-Benz W210', 'w210', 300000, 'sedans'),
('Washington', 'washington', 115000, 'sedans'),
('Windsor Drop', 'windsor2', 230000, 'coupes'),
('Woflsbane', 'wolfsbane', 24000, 'motorcycles'),
('Rolls Royce Wraith', 'Wraith', 1400000, 'sports'),
('BMW X5 E53', 'x5e53', 400000, 'suvs'),
('BMW X6M', 'x6m', 675000, 'suvs'),
('Youga', 'youga', 120000, 'vans'),
('Zentorno', 'zentorno', 680000, 'super'),
('Zion', 'zion', 155000, 'coupes');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `vehicle_categories`
--

CREATE TABLE `vehicle_categories` (
  `name` varchar(60) NOT NULL,
  `label` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `vehicle_categories`
--

INSERT INTO `vehicle_categories` (`name`, `label`) VALUES
('compacts', 'Kompakty'),
('coupes', 'Coupe'),
('motorcycles', 'Motocykle'),
('muscle', 'Muscle'),
('offroad', 'Off Road'),
('sedans', 'Sedan'),
('sports', 'Sport'),
('sportsclassics', 'Sports Classic'),
('super', 'Super'),
('suvs', 'SUV'),
('vans', 'Van');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `vehicle_sold`
--

CREATE TABLE `vehicle_sold` (
  `client` varchar(50) NOT NULL,
  `model` varchar(50) NOT NULL,
  `plate` varchar(50) NOT NULL,
  `soldby` varchar(50) NOT NULL,
  `date` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `vogel_ciuchy`
--

CREATE TABLE `vogel_ciuchy` (
  `identifier` varchar(50) DEFAULT NULL,
  `bag` int(11) NOT NULL DEFAULT '0',
  `bag2` int(11) NOT NULL DEFAULT '0',
  `tshirt` int(11) NOT NULL DEFAULT '0',
  `tshirt2` int(11) NOT NULL DEFAULT '0',
  `torso` int(11) NOT NULL DEFAULT '0',
  `torso2` int(11) NOT NULL DEFAULT '0',
  `legs` int(11) NOT NULL DEFAULT '0',
  `legs2` int(11) NOT NULL DEFAULT '0',
  `shoes` int(11) NOT NULL DEFAULT '0',
  `shoes2` int(11) NOT NULL DEFAULT '0',
  `arms` int(11) NOT NULL DEFAULT '0',
  `chain` int(11) NOT NULL DEFAULT '0',
  `chain2` int(11) NOT NULL DEFAULT '0',
  `mask` int(11) NOT NULL DEFAULT '0',
  `mask2` int(11) NOT NULL DEFAULT '0',
  `decals` int(11) NOT NULL DEFAULT '0',
  `decals2` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `vogel_ciuchy`
--

INSERT INTO `vogel_ciuchy` (`identifier`, `bag`, `bag2`, `tshirt`, `tshirt2`, `torso`, `torso2`, `legs`, `legs2`, `shoes`, `shoes2`, `arms`, `chain`, `chain2`, `mask`, `mask2`, `decals`, `decals2`) VALUES
('steam:110000104eb808d', 41, 0, 21, 0, 30, 0, 28, 0, 10, 0, 33, 0, 0, 0, 0, 0, 0),
('steam:110000104eb808d', 41, 0, 21, 0, 30, 0, 28, 0, 10, 0, 33, 0, 0, 0, 0, 0, 0),
('steam:110000111ee525f', 0, 0, 0, 2, 166, 0, 7, 0, 12, 6, 32, 51, 0, 0, 0, 0, 0),
('steam:110000111ee525f', 0, 0, 0, 2, 166, 0, 7, 0, 12, 6, 32, 51, 0, 0, 0, 0, 0),
('steam:11000010fdc8544', 0, 0, 23, 1, 166, 0, 1, 8, 10, 0, 33, 0, 0, 0, 0, 0, 0),
('steam:11000010fdc8544', 0, 0, 23, 1, 166, 0, 1, 8, 10, 0, 33, 0, 0, 0, 0, 0, 0),
('steam:110000114f63a7e', 0, 0, 0, 2, 62, 0, 10, 0, 10, 0, 46, 92, 0, 0, 0, 0, 0),
('steam:110000114f63a7e', 0, 0, 0, 2, 62, 0, 10, 0, 10, 0, 46, 92, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `weashops`
--

CREATE TABLE `weashops` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `item` varchar(255) NOT NULL,
  `price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `weashops`
--

INSERT INTO `weashops` (`id`, `name`, `item`, `price`) VALUES
(2, 'BlackWeashop', 'WEAPON_COMBATPISTOL', 20000),
(3, 'GunShop', 'WEAPON_FLASHLIGHT', 300),
(5, 'GunShop', 'WEAPON_MACHETE', 2000),
(7, 'GunShop', 'WEAPON_BAT', 500),
(12, 'BlackWeashop', 'WEAPON_PUMPSHOTGUN', 300000),
(13, 'BlackWeashop', 'WEAPON_ASSAULTRIFLE', 500000),
(20, 'GunShop', 'WEAPON_KNIFE', 600),
(21, 'GunShop', 'WEAPON_HAMMER', 250),
(23, 'GunShop', 'WEAPON_HATCHET', 600),
(24, 'GunShop', 'WEAPON_SWITCHBLADE', 700),
(25, 'GunShop', 'WEAPON_BALL', 100),
(26, 'GunShop', 'WEAPON_COMBATPISTOL', 35000),
(27, 'BlackWeashop', 'WEAPON_HEAVYSNIPER', 1000000),
(28, 'BlackWeashop', 'WEAPON_MICROSMG', 200000),
(29, 'GunShop', 'WEAPON_PISTOL', 20000);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `whitelist`
--

CREATE TABLE `whitelist` (
  `identifier` varchar(60) NOT NULL,
  `nick` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `whitelist`
--

INSERT INTO `whitelist` (`identifier`, `nick`) VALUES
('steam:110000104eb808d', 'Vogel'),
('steam:11000010b79ecd4', 'MagiK Key-Drop.pl'),
('steam:11000010fdc8544', 'stolar'),
('steam:110000111ee525f', 'vicol'),
('steam:110000114f63a7e', 'dudek');

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `addon_account`
--
ALTER TABLE `addon_account`
  ADD PRIMARY KEY (`name`);

--
-- Indeksy dla tabeli `addon_account_data`
--
ALTER TABLE `addon_account_data`
  ADD PRIMARY KEY (`id`),
  ADD KEY `owner` (`owner`);

--
-- Indeksy dla tabeli `addon_inventory`
--
ALTER TABLE `addon_inventory`
  ADD PRIMARY KEY (`name`);

--
-- Indeksy dla tabeli `addon_inventory_items`
--
ALTER TABLE `addon_inventory_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `owner` (`owner`);

--
-- Indeksy dla tabeli `baninfo`
--
ALTER TABLE `baninfo`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `banlist`
--
ALTER TABLE `banlist`
  ADD PRIMARY KEY (`license`);

--
-- Indeksy dla tabeli `banlisthistory`
--
ALTER TABLE `banlisthistory`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `billing`
--
ALTER TABLE `billing`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `cardealer_vehicles`
--
ALTER TABLE `cardealer_vehicles`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `characters`
--
ALTER TABLE `characters`
  ADD PRIMARY KEY (`id`),
  ADD KEY `identifier` (`identifier`);

--
-- Indeksy dla tabeli `datastore`
--
ALTER TABLE `datastore`
  ADD PRIMARY KEY (`name`);

--
-- Indeksy dla tabeli `datastore_data`
--
ALTER TABLE `datastore_data`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_datastore_owner_name` (`owner`,`name`),
  ADD KEY `index_datastore_name` (`name`),
  ADD KEY `owner` (`owner`);

--
-- Indeksy dla tabeli `fine_types`
--
ALTER TABLE `fine_types`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `fine_types_kasyno`
--
ALTER TABLE `fine_types_kasyno`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `fine_types_mafia`
--
ALTER TABLE `fine_types_mafia`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `glovebox_inventory`
--
ALTER TABLE `glovebox_inventory`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `plate` (`plate`);

--
-- Indeksy dla tabeli `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`name`);

--
-- Indeksy dla tabeli `jail`
--
ALTER TABLE `jail`
  ADD PRIMARY KEY (`identifier`);

--
-- Indeksy dla tabeli `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`name`);

--
-- Indeksy dla tabeli `job_grades`
--
ALTER TABLE `job_grades`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `licenses`
--
ALTER TABLE `licenses`
  ADD PRIMARY KEY (`type`);

--
-- Indeksy dla tabeli `owned_properties`
--
ALTER TABLE `owned_properties`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `owned_vehicles`
--
ALTER TABLE `owned_vehicles`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `phone_app_chat`
--
ALTER TABLE `phone_app_chat`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `phone_calls`
--
ALTER TABLE `phone_calls`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `phone_messages`
--
ALTER TABLE `phone_messages`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `phone_users_contacts`
--
ALTER TABLE `phone_users_contacts`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `playersTattoos`
--
ALTER TABLE `playersTattoos`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `properties`
--
ALTER TABLE `properties`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `rented_vehicles`
--
ALTER TABLE `rented_vehicles`
  ADD PRIMARY KEY (`plate`);

--
-- Indeksy dla tabeli `shops`
--
ALTER TABLE `shops`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `society_moneywash`
--
ALTER TABLE `society_moneywash`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `truck_inventory`
--
ALTER TABLE `truck_inventory`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `item` (`item`,`plate`),
  ADD UNIQUE KEY `item_2` (`item`,`plate`);

--
-- Indeksy dla tabeli `trunk_inventory`
--
ALTER TABLE `trunk_inventory`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `plate` (`plate`);

--
-- Indeksy dla tabeli `twitter_accounts`
--
ALTER TABLE `twitter_accounts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indeksy dla tabeli `twitter_likes`
--
ALTER TABLE `twitter_likes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_twitter_likes_twitter_accounts` (`authorId`),
  ADD KEY `FK_twitter_likes_twitter_tweets` (`tweetId`);

--
-- Indeksy dla tabeli `twitter_tweets`
--
ALTER TABLE `twitter_tweets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_twitter_tweets_twitter_accounts` (`authorId`);

--
-- Indeksy dla tabeli `users`
--
ALTER TABLE `users`
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `identifier` (`identifier`),
  ADD KEY `license` (`license`);

--
-- Indeksy dla tabeli `user_accounts`
--
ALTER TABLE `user_accounts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `identifier` (`identifier`);

--
-- Indeksy dla tabeli `user_contacts`
--
ALTER TABLE `user_contacts`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `user_inventory`
--
ALTER TABLE `user_inventory`
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `identifier` (`identifier`);

--
-- Indeksy dla tabeli `user_licenses`
--
ALTER TABLE `user_licenses`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `user_parkings`
--
ALTER TABLE `user_parkings`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `user_sim`
--
ALTER TABLE `user_sim`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `vehicles`
--
ALTER TABLE `vehicles`
  ADD PRIMARY KEY (`model`);

--
-- Indeksy dla tabeli `vehicle_categories`
--
ALTER TABLE `vehicle_categories`
  ADD PRIMARY KEY (`name`);

--
-- Indeksy dla tabeli `vehicle_sold`
--
ALTER TABLE `vehicle_sold`
  ADD PRIMARY KEY (`plate`);

--
-- Indeksy dla tabeli `weashops`
--
ALTER TABLE `weashops`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `whitelist`
--
ALTER TABLE `whitelist`
  ADD PRIMARY KEY (`identifier`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT dla tabeli `addon_account_data`
--
ALTER TABLE `addon_account_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT dla tabeli `addon_inventory_items`
--
ALTER TABLE `addon_inventory_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT dla tabeli `baninfo`
--
ALTER TABLE `baninfo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT dla tabeli `banlisthistory`
--
ALTER TABLE `banlisthistory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `billing`
--
ALTER TABLE `billing`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT dla tabeli `cardealer_vehicles`
--
ALTER TABLE `cardealer_vehicles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `characters`
--
ALTER TABLE `characters`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT dla tabeli `datastore_data`
--
ALTER TABLE `datastore_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT dla tabeli `fine_types`
--
ALTER TABLE `fine_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT dla tabeli `fine_types_kasyno`
--
ALTER TABLE `fine_types_kasyno`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT dla tabeli `fine_types_mafia`
--
ALTER TABLE `fine_types_mafia`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT dla tabeli `glovebox_inventory`
--
ALTER TABLE `glovebox_inventory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT dla tabeli `job_grades`
--
ALTER TABLE `job_grades`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=139;

--
-- AUTO_INCREMENT dla tabeli `owned_properties`
--
ALTER TABLE `owned_properties`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT dla tabeli `owned_vehicles`
--
ALTER TABLE `owned_vehicles`
  MODIFY `id` int(55) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT dla tabeli `phone_app_chat`
--
ALTER TABLE `phone_app_chat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `phone_calls`
--
ALTER TABLE `phone_calls`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT dla tabeli `phone_messages`
--
ALTER TABLE `phone_messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=181;

--
-- AUTO_INCREMENT dla tabeli `phone_users_contacts`
--
ALTER TABLE `phone_users_contacts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT dla tabeli `playersTattoos`
--
ALTER TABLE `playersTattoos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `properties`
--
ALTER TABLE `properties`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT dla tabeli `shops`
--
ALTER TABLE `shops`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=154;

--
-- AUTO_INCREMENT dla tabeli `society_moneywash`
--
ALTER TABLE `society_moneywash`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT dla tabeli `truck_inventory`
--
ALTER TABLE `truck_inventory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT dla tabeli `trunk_inventory`
--
ALTER TABLE `trunk_inventory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT dla tabeli `twitter_accounts`
--
ALTER TABLE `twitter_accounts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT dla tabeli `twitter_likes`
--
ALTER TABLE `twitter_likes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=137;

--
-- AUTO_INCREMENT dla tabeli `twitter_tweets`
--
ALTER TABLE `twitter_tweets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=170;

--
-- AUTO_INCREMENT dla tabeli `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT dla tabeli `user_accounts`
--
ALTER TABLE `user_accounts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT dla tabeli `user_contacts`
--
ALTER TABLE `user_contacts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `user_inventory`
--
ALTER TABLE `user_inventory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=593;

--
-- AUTO_INCREMENT dla tabeli `user_licenses`
--
ALTER TABLE `user_licenses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `user_parkings`
--
ALTER TABLE `user_parkings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=98;

--
-- AUTO_INCREMENT dla tabeli `user_sim`
--
ALTER TABLE `user_sim`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=107;

--
-- AUTO_INCREMENT dla tabeli `weashops`
--
ALTER TABLE `weashops`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `twitter_likes`
--
ALTER TABLE `twitter_likes`
  ADD CONSTRAINT `FK_twitter_likes_twitter_accounts` FOREIGN KEY (`authorId`) REFERENCES `twitter_accounts` (`id`),
  ADD CONSTRAINT `FK_twitter_likes_twitter_tweets` FOREIGN KEY (`tweetId`) REFERENCES `twitter_tweets` (`id`) ON DELETE CASCADE;

--
-- Ograniczenia dla tabeli `twitter_tweets`
--
ALTER TABLE `twitter_tweets`
  ADD CONSTRAINT `FK_twitter_tweets_twitter_accounts` FOREIGN KEY (`authorId`) REFERENCES `twitter_accounts` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
