-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: fd9c3c72d354
-- Generation Time: Jun 26, 2020 at 08:54 AM
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
-- Database: `ligths`
--

-- --------------------------------------------------------

--
-- Table structure for table `ampoules`
--

CREATE TABLE `ampoules` (
  `ID` int(9) NOT NULL,
  `marque` varchar(20) NOT NULL,
  `puissance` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ampoules`
--

INSERT INTO `ampoules` (`ID`, `marque`, `puissance`) VALUES
(1, 'Philips', '15W'),
(2, 'Sylvania', '20W'),
(3, 'Osram', '25W'),
(4, 'GE-Lighting', '20W');

-- --------------------------------------------------------

--
-- Table structure for table `appartments`
--

CREATE TABLE `appartments` (
  `ID` int(9) NOT NULL,
  `etage` varchar(2) NOT NULL,
  `position` varchar(10) NOT NULL,
  `changement` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `appartments`
--

INSERT INTO `appartments` (`ID`, `etage`, `position`, `changement`) VALUES
(1, '0', 'gauche', '2020-03-03'),
(2, '0', 'droite', '2019-12-02'),
(3, '1', 'gauche', '2020-03-21'),
(4, '1', 'droite', '2020-06-03'),
(5, '2', 'fond', '2019-07-07'),
(6, '2', 'gauche', '2020-06-05'),
(7, '3', 'gauche', '2020-06-21'),
(8, '3', 'droite', '2020-03-09'),
(9, '3', 'fond', '2020-06-01'),
(10, '4', 'droite', '2020-02-06'),
(11, '4', 'gauche', '2020-04-06'),
(12, '4', 'fond', '2019-10-10');

-- --------------------------------------------------------

--
-- Table structure for table `proprietaires`
--

CREATE TABLE `proprietaires` (
  `ID` int(9) NOT NULL,
  `nom` varchar(100) NOT NULL,
  `prenom` varchar(100) NOT NULL,
  `appartment_id` int(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `proprietaires`
--

INSERT INTO `proprietaires` (`ID`, `nom`, `prenom`, `appartment_id`) VALUES
(3, 'Tesla', 'Nikolas', 1),
(4, 'Einstein', 'Albert', 2),
(5, 'de Lavoisier', 'Antoine', 3),
(6, 'Pascal', 'Blaise', 4),
(7, 'Mendeleiev', 'Dimitri', 5),
(8, 'Schrodinger', 'Erwin', 6),
(9, 'Galilée', 'Galiléo', 9),
(10, 'Newton', 'Isaac', 8);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ampoules`
--
ALTER TABLE `ampoules`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `appartments`
--
ALTER TABLE `appartments`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `proprietaires`
--
ALTER TABLE `proprietaires`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ampoules`
--
ALTER TABLE `ampoules`
  MODIFY `ID` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `appartments`
--
ALTER TABLE `appartments`
  MODIFY `ID` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `proprietaires`
--
ALTER TABLE `proprietaires`
  MODIFY `ID` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `proprietaires`
--
ALTER TABLE `proprietaires`
  ADD CONSTRAINT `proprietaires_ibfk_1` FOREIGN KEY (`appartment_id`) REFERENCES `appartments` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
