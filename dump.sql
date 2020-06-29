-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 4d4d71817f62
-- Generation Time: Jun 29, 2020 at 08:53 AM
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
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
