-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Czas generowania: 23 Maj 2019, 21:50
-- Wersja serwera: 10.0.38-MariaDB-0ubuntu0.16.04.1
-- Wersja PHP: 7.0.33-0ubuntu0.16.04.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `paczka`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `kaiser_ciuchy`
--

CREATE TABLE `kaiser_ciuchy` (
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

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
