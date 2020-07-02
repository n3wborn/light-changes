-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : mariadb
-- Généré le : jeu. 02 juil. 2020 à 18:36
-- Version du serveur :  10.4.13-MariaDB-1:10.4.13+maria~focal
-- Version de PHP : 7.4.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `datas`
--

-- --------------------------------------------------------

--
-- Structure de la table `appartments`
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
-- Déchargement des données de la table `appartments`
--

INSERT INTO `appartments` (`ID`, `floor`, `location`, `last_change`, `light_power`, `light_brand`) VALUES
(3, '10', 'gauche', '2020-07-14', '40W', 'Osram'),
(7, '3', 'gauche', '2020-06-21', '25W', 'Philipps'),
(9, '10', 'gauche', '2020-07-14', '45W', 'Osram'),
(11, '2', 'fond', '2020-07-10', '50W', 'Osram'),
(13, '6', 'gauche', '2020-07-02', '40W', 'GE-Lightings'),
(14, '6', 'droite', '2020-07-31', '40W', 'Philipps'),
(16, '10', 'gauche', '2020-07-02', '25W', 'GE-lightings'),
(19, '9', 'fond', '2020-07-16', '50W', 'Philipps');

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `ID` int(3) NOT NULL,
  `login` varchar(100) NOT NULL,
  `passwd` varchar(60) NOT NULL COMMENT 'create_passwd() salted hashes'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`ID`, `login`, `passwd`) VALUES
(1, 'admin', '$2y$10$njOT.D47/2WV1G7ua/JWpuIPVNAFIVXso4mfw7TxHGdgQVwF1JoQy');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `appartments`
--
ALTER TABLE `appartments`
  ADD PRIMARY KEY (`ID`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `appartments`
--
ALTER TABLE `appartments`
  MODIFY `ID` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `ID` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
