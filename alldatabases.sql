-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 4d4d71817f62
-- Generation Time: Jun 29, 2020 at 08:52 AM
-- Server version: 10.4.13-MariaDB-1:10.4.13+maria~bionic
-- PHP Version: 7.4.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `datas`
--
CREATE DATABASE IF NOT EXISTS `datas` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `datas`;

-- --------------------------------------------------------

--
-- Table structure for table `appartments`
--

CREATE TABLE `appartments` (
  `ID` int(9) NOT NULL,
  `floor` varchar(2) NOT NULL,
  `location` varchar(10) NOT NULL,
  `last_change` date NOT NULL,
  `light_power` varchar(5) NOT NULL,
  `light_brand` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `appartments`
--

INSERT INTO `appartments` (`ID`, `floor`, `location`, `last_change`, `light_power`, `light_brand`) VALUES
(1, '0', 'gauche', '2020-03-03', '25W', 'Osram'),
(2, '0', 'droite', '2019-12-02', '15W', 'Philipps'),
(3, '1', 'gauche', '2020-03-21', '10W', 'GE-Lighting'),
(4, '1', 'droite', '2020-06-03', '15W', 'Philipps'),
(5, '2', 'fond', '2019-07-07', '10W', 'Osram'),
(6, '2', 'gauche', '2020-06-05', '15W', 'GE-Lighting'),
(7, '3', 'gauche', '2020-06-21', '25W', 'Philipps'),
(8, '3', 'droite', '2020-03-09', '10W', 'Osram'),
(9, '3', 'fond', '2020-06-01', '15W', 'GE-Lighting'),
(10, '4', 'droite', '2020-02-06', '25W', 'Philipps'),
(11, '4', 'gauche', '2020-04-06', '15W', 'GE-Lighting'),
(12, '4', 'fond', '2019-10-10', '25W', 'Philipps');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `appartments`
--
ALTER TABLE `appartments`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `appartments`
--
ALTER TABLE `appartments`
  MODIFY `ID` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- Database: `locations`
--
CREATE DATABASE IF NOT EXISTS `locations` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `locations`;

-- --------------------------------------------------------

--
-- Table structure for table `appartement`
--

CREATE TABLE `appartement` (
  `id` int(11) NOT NULL,
  `adresse` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `cp` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `ville` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `etage` varchar(2) COLLATE utf8_unicode_ci NOT NULL,
  `proprietaire_id` int(11) NOT NULL,
  `type` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `appartement`
--

INSERT INTO `appartement` (`id`, `adresse`, `cp`, `ville`, `etage`, `proprietaire_id`, `type`) VALUES
(1, '3 rue des fusées', '89300', 'Nevers', '2', 1, 1),
(2, '2 rue des jardins', '25000', 'Besançon', '2', 1, 2),
(3, '15 rue de la programmation', '75000', 'Paris', '6', 2, 2),
(4, '14 rue des nuages', '39100', 'Dole', '11', 1, 3),
(5, '7 rue de la plume', '25000', 'Besançon', '2', 1, 4),
(6, '18 chemin des vignes', '70000', 'Vesoul', '2', 2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `proprietaire`
--

CREATE TABLE `proprietaire` (
  `id` int(11) NOT NULL,
  `nom` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `prenom` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ville` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `proprietaire`
--

INSERT INTO `proprietaire` (`id`, `nom`, `prenom`, `ville`) VALUES
(1, 'Debot', 'Boris', ''),
(2, 'Lapostolle', 'Victor', '');

-- --------------------------------------------------------

--
-- Table structure for table `type_appart`
--

CREATE TABLE `type_appart` (
  `ID` int(2) NOT NULL,
  `type` varchar(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `type_appart`
--

INSERT INTO `type_appart` (`ID`, `type`) VALUES
(1, 'F1'),
(2, 'F2'),
(3, 'F3'),
(4, 'F4'),
(5, 'F5'),
(6, 'F6');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `appartement`
--
ALTER TABLE `appartement`
  ADD PRIMARY KEY (`id`),
  ADD KEY `proprietaire_id` (`proprietaire_id`),
  ADD KEY `type` (`type`);

--
-- Indexes for table `proprietaire`
--
ALTER TABLE `proprietaire`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `type_appart`
--
ALTER TABLE `type_appart`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `appartement`
--
ALTER TABLE `appartement`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `proprietaire`
--
ALTER TABLE `proprietaire`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `type_appart`
--
ALTER TABLE `type_appart`
  MODIFY `ID` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `appartement`
--
ALTER TABLE `appartement`
  ADD CONSTRAINT `appartement_ibfk_1` FOREIGN KEY (`proprietaire_id`) REFERENCES `proprietaire` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `appartement_ibfk_2` FOREIGN KEY (`type`) REFERENCES `type_appart` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
