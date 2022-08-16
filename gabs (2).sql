-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  mar. 16 août 2022 à 09:04
-- Version du serveur :  10.4.10-MariaDB
-- Version de PHP :  7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `gabs`
--

-- --------------------------------------------------------

--
-- Structure de la table `absence`
--

DROP TABLE IF EXISTS `absence`;
CREATE TABLE IF NOT EXISTS `absence` (
  `id_absence` int(11) NOT NULL AUTO_INCREMENT,
  `id_seance` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `justifiee` tinyint(1) NOT NULL,
  `comm_abs` text DEFAULT NULL,
  PRIMARY KEY (`id_absence`),
  KEY `FK_Avoir` (`id_seance`),
  KEY `FK_concerne` (`id_user`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `absence`
--

INSERT INTO `absence` (`id_absence`, `id_seance`, `id_user`, `justifiee`, `comm_abs`) VALUES
(2, 1, 4, 1, 'malade'),
(3, 1, 6, 0, NULL),
(4, 5, 6, 1, NULL),
(5, 12, 4, 0, NULL),
(24, 1, 2, 1, 'nonnnn'),
(25, 15, 2, 0, 'Fuck you'),
(26, 17, 2, 1, ''),
(27, 18, 6, 1, 'maladie');

-- --------------------------------------------------------

--
-- Structure de la table `admin`
--

DROP TABLE IF EXISTS `admin`;
CREATE TABLE IF NOT EXISTS `admin` (
  `id_user` int(11) NOT NULL,
  `nom_admin` varchar(30) DEFAULT NULL,
  `prenom_admin` varchar(30) DEFAULT NULL,
  `email_admin` varchar(30) NOT NULL,
  PRIMARY KEY (`id_user`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `admin`
--

INSERT INTO `admin` (`id_user`, `nom_admin`, `prenom_admin`, `email_admin`) VALUES
(31, 'ALI SABAN', 'Abobaker', 'abobakerali165@gmail.com');

-- --------------------------------------------------------

--
-- Structure de la table `affecter`
--

DROP TABLE IF EXISTS `affecter`;
CREATE TABLE IF NOT EXISTS `affecter` (
  `id_user` int(11) NOT NULL,
  `id_module` int(11) NOT NULL,
  PRIMARY KEY (`id_user`,`id_module`),
  KEY `FK_affecter2` (`id_module`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `affecter`
--

INSERT INTO `affecter` (`id_user`, `id_module`) VALUES
(3, 1),
(3, 2),
(3, 3),
(3, 4),
(3, 5),
(3, 6),
(3, 9),
(5, 2),
(5, 3),
(8, 3),
(8, 4),
(8, 5),
(9, 4),
(9, 5),
(28, 2);

-- --------------------------------------------------------

--
-- Structure de la table `backup`
--

DROP TABLE IF EXISTS `backup`;
CREATE TABLE IF NOT EXISTS `backup` (
  `backup_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `backup_name` varchar(255) NOT NULL,
  `backup_location` varchar(255) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`backup_id`),
  UNIQUE KEY `backup_name_UNIQUE` (`backup_name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `backup`
--

INSERT INTO `backup` (`backup_id`, `backup_name`, `backup_location`, `created_date`) VALUES
(3, '72c848ff48eda75879b2967d089f7447_site.tar.gz', 'backups/sites/', '2016-04-23 20:18:05');

-- --------------------------------------------------------

--
-- Structure de la table `enseignant`
--

DROP TABLE IF EXISTS `enseignant`;
CREATE TABLE IF NOT EXISTS `enseignant` (
  `id_user` int(11) NOT NULL,
  `nom_ens` varchar(25) NOT NULL,
  `prenom_ens` varchar(25) NOT NULL,
  `adresse_ens` varchar(30) DEFAULT NULL,
  `ville_ens` varchar(30) DEFAULT NULL,
  `photo_ens` text DEFAULT NULL,
  `email_ens` varchar(25) NOT NULL,
  `phone_ens` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id_user`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `enseignant`
--

INSERT INTO `enseignant` (`id_user`, `nom_ens`, `prenom_ens`, `adresse_ens`, `ville_ens`, `photo_ens`, `email_ens`, `phone_ens`) VALUES
(1, 'FAMAM', 'FAMAM', 'Far-Asm-Med-Abou-Med', 'Djibouti', 'img/ens/8g278257254g17872h254.jpg', 'Fama_iad@gmail.com', '123456'),
(3, 'Bahdon', 'Bahdon', 'Adresse dalal', 'Casa', 'img/ens/8g278257254g17872h254.jpg', 'bahdon@gmail.com', '77766543'),
(5, 'Hassan Djilal', 'Mahdi', 'Quartier 6', 'Djibouti-ville', 'img/ens/8g278257254g17872h254.jpg', 'mahdi@gmail.com', '77655332'),
(8, 'ALI', 'Raho', 'Quartier 7', 'djibouti', 'img/ens/87245375g4582427f872.jpg', 'raho@gmail.com', '77453574'),
(9, 'Ahmed', 'Faiza', 'London', 'Djibouti', 'img/ens/718752425a72452475155.jpg', 'faiza@gmail.com', '77716677'),
(28, 'Maitre', 'Maitre', 'maitre', 'maitre', 'img/ens/8g278257254g17872h254.jpg', 'maitre@gmail.com', '2222222');

-- --------------------------------------------------------

--
-- Structure de la table `etudiant`
--

DROP TABLE IF EXISTS `etudiant`;
CREATE TABLE IF NOT EXISTS `etudiant` (
  `id_user` int(11) NOT NULL,
  `CNE` int(11) NOT NULL,
  `nom_etu` varchar(25) NOT NULL,
  `prenom_etu` varchar(25) NOT NULL,
  `date_naiss_etu` date DEFAULT NULL,
  `ville_naiss_etu` varchar(30) DEFAULT NULL,
  `adresse_etu` varchar(50) DEFAULT NULL,
  `ville_etu` varchar(30) DEFAULT NULL,
  `photo_etu` text DEFAULT NULL,
  `email_etu` varchar(30) NOT NULL,
  `phone_etu` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id_user`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `etudiant`
--

INSERT INTO `etudiant` (`id_user`, `CNE`, `nom_etu`, `prenom_etu`, `date_naiss_etu`, `ville_naiss_etu`, `adresse_etu`, `ville_etu`, `photo_etu`, `email_etu`, `phone_etu`) VALUES
(2, 1985858585, 'ALI SABAN', 'Abobaker', '1998-05-14', 'Djibouti', 'Cité-Barwaqo', 'DJIBOUTI', 'img/etu/abouaker.jpeg', 'abobakerali165@gmail.com', '77224947'),
(4, 1155774466, 'Hassan Ibrahim', 'Ibrahim', '1999-12-16', 'Dire Dawa', 'Balbala', 'Djibouti', 'img/etu/ibro.jpg', 'ibro@gmail.com', '77811126'),
(6, 1254879652, 'Yahye Djama', 'Amin', '1998-04-11', 'Djibouti', 'Balbala T9', 'Tetouan', 'img/etu/amin.jpg', 'amin@gmail.com', '778293332'),
(11, 88556324, 'Mohamed', 'Abdikarim', '1999-12-05', 'Djibouti', 'Balbala', 'Djibouti-ville', 'img/etu/abdikarim.jpg', 'abdikarim@gmail.com', '77665433'),
(12, 10224578, 'Abdillahi', 'Ali', '2000-02-15', 'djibouti', 'Djibouti-ville', 'djibouti', 'img/etu/ali.jpg', 'ali@gmail.com', '+25377825454'),
(21, 2147483647, 'Ahmed Ali', 'Asma', '1997-04-12', 'Djibouti-ville', 'Haya', 'Djibouti-ville', 'img/ens/6261571bc9b2e11d8.jpg', 'amatharam@gmail.com', '77543223'),
(35, 23456789, 'ALI', 'ABDALLAH', '2022-08-16', 'Djibouti-ville', 'Salut les', 'Djibouti-ville', NULL, 'abdallahalimohamed@icloud.com', '0778293332');

-- --------------------------------------------------------

--
-- Structure de la table `etudier`
--

DROP TABLE IF EXISTS `etudier`;
CREATE TABLE IF NOT EXISTS `etudier` (
  `id_user` int(11) NOT NULL,
  `id_module` int(11) NOT NULL,
  PRIMARY KEY (`id_user`,`id_module`),
  KEY `FK_Etudier2` (`id_module`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `etudier`
--

INSERT INTO `etudier` (`id_user`, `id_module`) VALUES
(2, 1),
(2, 2),
(2, 6),
(2, 9),
(4, 1),
(4, 2),
(4, 3),
(4, 4),
(6, 1),
(6, 3),
(6, 4),
(6, 5),
(6, 6),
(11, 9);

-- --------------------------------------------------------

--
-- Structure de la table `module`
--

DROP TABLE IF EXISTS `module`;
CREATE TABLE IF NOT EXISTS `module` (
  `id_module` int(11) NOT NULL AUTO_INCREMENT,
  `intitule_module` varchar(30) NOT NULL,
  PRIMARY KEY (`id_module`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `module`
--

INSERT INTO `module` (`id_module`, `intitule_module`) VALUES
(1, 'PHP'),
(2, 'JAVA'),
(3, 'Anglais'),
(4, 'Gestion de Projet'),
(5, 'Csharp'),
(6, 'PLSQL'),
(9, 'Asp.net'),
(11, 'Asma'),
(12, 'Abobaker');

-- --------------------------------------------------------

--
-- Structure de la table `seance`
--

DROP TABLE IF EXISTS `seance`;
CREATE TABLE IF NOT EXISTS `seance` (
  `id_seance` int(11) NOT NULL AUTO_INCREMENT,
  `id_module` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `date_seance` date NOT NULL,
  `heure_debut` time DEFAULT NULL,
  `heure_fin` time DEFAULT NULL,
  `type_seance` varchar(15) NOT NULL,
  PRIMARY KEY (`id_seance`),
  KEY `FK_Enseigne` (`id_user`),
  KEY `FK_Occupe` (`id_module`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `seance`
--

INSERT INTO `seance` (`id_seance`, `id_module`, `id_user`, `date_seance`, `heure_debut`, `heure_fin`, `type_seance`) VALUES
(1, 1, 3, '2016-04-03', '13:30:00', '15:00:00', 'Cours'),
(2, 1, 3, '2016-04-07', '08:30:00', '10:00:00', 'TP'),
(3, 1, 3, '2016-04-11', '10:30:00', '12:00:00', 'Cours'),
(4, 2, 5, '2016-04-05', '10:30:00', '12:00:00', 'Cours'),
(5, 2, 5, '2016-04-07', '08:30:00', '10:00:00', 'TP'),
(6, 3, 5, '2016-04-06', '13:30:00', '15:00:00', 'Cours'),
(7, 3, 8, '2016-04-06', '15:30:00', '17:00:00', 'TD'),
(8, 4, 8, '2016-04-01', '15:30:00', '17:00:00', 'Cours'),
(9, 4, 9, '2016-04-02', '13:30:00', '15:00:00', 'Cours'),
(10, 5, 8, '2016-04-02', '08:30:00', '10:00:00', 'TD'),
(11, 5, 9, '2016-04-03', '10:30:00', '12:00:00', 'Cours'),
(12, 6, 3, '2016-03-01', '10:30:00', '12:00:00', 'Cours'),
(13, 6, 3, '2016-03-03', '08:30:00', '10:00:00', 'TP'),
(14, 6, 3, '2015-05-05', '08:30:00', '10:00:00', 'TP'),
(15, 1, 3, '2022-07-11', '19:33:00', '23:38:00', 'TD'),
(16, 6, 3, '2022-07-01', '17:23:00', '20:26:00', 'Cours'),
(17, 2, 28, '2022-07-23', '20:17:00', '22:17:00', 'Cours'),
(18, 6, 3, '2022-07-21', '20:11:00', '21:11:00', 'TP'),
(19, 3, 3, '2022-07-21', '20:20:00', '21:21:00', 'Cours');

-- --------------------------------------------------------

--
-- Structure de la table `session`
--

DROP TABLE IF EXISTS `session`;
CREATE TABLE IF NOT EXISTS `session` (
  `session_id` varchar(45) NOT NULL,
  `ip_address` varchar(20) NOT NULL,
  `user_agent` varchar(255) NOT NULL,
  `last_activity` int(10) UNSIGNED NOT NULL,
  `user_data` text NOT NULL,
  PRIMARY KEY (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id_user` int(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `type_user` varchar(20) NOT NULL,
  `access` tinyint(1) NOT NULL,
  PRIMARY KEY (`id_user`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id_user`, `login`, `password`, `type_user`, `access`) VALUES
(1, 'admin', '202cb962ac59075b964b07152d234b70', 'enseignant', 1),
(2, 'abou1230', '202cb962ac59075b964b07152d234b70', 'etudiant', 1),
(3, 'bahdon', '202cb962ac59075b964b07152d234b70', 'enseignant', 1),
(4, 'ibro', '202cb962ac59075b964b07152d234b70', 'etudiant', 1),
(5, 'Mahdi', '202cb962ac59075b964b07152d234b70', 'enseignant', 1),
(6, 'amin', '202cb962ac59075b964b07152d234b70', 'etudiant', 1),
(8, 'raho', '202cb962ac59075b964b07152d234b70', 'enseignant', 1),
(9, 'himiko', '202cb962ac59075b964b07152d234b70', 'enseignant', 0),
(11, 'abdi', '202cb962ac59075b964b07152d234b70', 'etudiant', 1),
(12, 'ali', '202cb962ac59075b964b07152d234b70', 'etudiant', 1),
(21, 'asma', '202cb962ac59075b964b07152d234b70', 'etudiant', 1),
(27, 'FARAH', '123', 'enseignant', 1),
(28, 'Maitre', '202cb962ac59075b964b07152d234b70', 'enseignant', 1),
(29, 'dfgs', '202cb962ac59075b964b07152d234b70', 'etudiant', 1),
(31, 'abou', '202cb962ac59075b964b07152d234b70', 'admin', 1),
(34, 'mahdDF', '202cb962ac59075b964b07152d234b70', 'etudiant', 1),
(35, 'mahdDFSD', '202cb962ac59075b964b07152d234b70', 'etudiant', 1);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `absence`
--
ALTER TABLE `absence`
  ADD CONSTRAINT `FK_Avoir` FOREIGN KEY (`id_seance`) REFERENCES `seance` (`id_seance`),
  ADD CONSTRAINT `FK_concerne` FOREIGN KEY (`id_user`) REFERENCES `etudiant` (`id_user`);

--
-- Contraintes pour la table `admin`
--
ALTER TABLE `admin`
  ADD CONSTRAINT `FK_Inheritance_3` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`);

--
-- Contraintes pour la table `affecter`
--
ALTER TABLE `affecter`
  ADD CONSTRAINT `FK_affecter` FOREIGN KEY (`id_user`) REFERENCES `enseignant` (`id_user`),
  ADD CONSTRAINT `FK_affecter2` FOREIGN KEY (`id_module`) REFERENCES `module` (`id_module`);

--
-- Contraintes pour la table `enseignant`
--
ALTER TABLE `enseignant`
  ADD CONSTRAINT `FK_Inheritance_1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`);

--
-- Contraintes pour la table `etudiant`
--
ALTER TABLE `etudiant`
  ADD CONSTRAINT `FK_Inheritance_2` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`);

--
-- Contraintes pour la table `etudier`
--
ALTER TABLE `etudier`
  ADD CONSTRAINT `FK_Etudier` FOREIGN KEY (`id_user`) REFERENCES `etudiant` (`id_user`),
  ADD CONSTRAINT `FK_Etudier2` FOREIGN KEY (`id_module`) REFERENCES `module` (`id_module`);

--
-- Contraintes pour la table `seance`
--
ALTER TABLE `seance`
  ADD CONSTRAINT `FK_Enseigne` FOREIGN KEY (`id_user`) REFERENCES `enseignant` (`id_user`),
  ADD CONSTRAINT `FK_Occupe` FOREIGN KEY (`id_module`) REFERENCES `module` (`id_module`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
