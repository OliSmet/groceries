-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le : mer. 13 sep. 2023 à 10:19
-- Version du serveur : 5.7.31
-- Version de PHP : 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `grocery_data`
--

-- --------------------------------------------------------

--
-- Structure de la table `groceries_list`
--

CREATE TABLE `groceries_list` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `grocery_quantities`
--

CREATE TABLE `grocery_quantities` (
  `id` int(11) NOT NULL,
  `grocery_id` int(11) NOT NULL,
  `ingredient_id` int(11) NOT NULL,
  `quantity` float NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `ingredients`
--

CREATE TABLE `ingredients` (
  `id` int(11) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `shelf_id` int(11) NOT NULL,
  `mesure_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `ingredients`
--

INSERT INTO `ingredients` (`id`, `name`, `shelf_id`, `mesure_id`) VALUES
(1, 'Tomates fraiches', 6, 1),
(2, 'Spagettis', 13, 3),
(3, 'Pommes de terre', 6, 1),
(4, 'bières', 16, 3),
(5, 'Semoule', 13, 2),
(6, 'Aubergines', 6, 3),
(7, 'Courgettes', 6, 3),
(8, 'Carottes', 6, 3),
(9, 'Oignons', 6, 3),
(10, 'Concentré de tomate', 5, 3),
(11, 'Tomates pelées', 5, 3),
(12, 'Pois-chiches', 5, 3),
(13, 'Coriandre', 6, 3),
(14, 'Navets', 6, 3),
(15, 'Celeri', 6, 3),
(16, 'Poivrons', 6, 3),
(17, 'Butternut', 6, 3),
(18, 'Patate-douces', 6, 3);

-- --------------------------------------------------------

--
-- Structure de la table `ingredients_relations`
--

CREATE TABLE `ingredients_relations` (
  `id` int(11) NOT NULL,
  `ingredients_id` int(11) NOT NULL,
  `recipe_id` int(11) NOT NULL,
  `quantity` float NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `ingredients_relations`
--

INSERT INTO `ingredients_relations` (`id`, `ingredients_id`, `recipe_id`, `quantity`) VALUES
(1, 13, 5, 1),
(2, 13, 6, 1),
(3, 1, 7, 4);

-- --------------------------------------------------------

--
-- Structure de la table `mesures_type`
--

CREATE TABLE `mesures_type` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `label` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `mesures_type`
--

INSERT INTO `mesures_type` (`id`, `name`, `label`) VALUES
(1, 'Kilogrammes', 'Kg'),
(2, 'Grammes', 'g'),
(3, 'Pièces', 'pcs'),
(4, 'Litre', 'L');

-- --------------------------------------------------------

--
-- Structure de la table `recipe`
--

CREATE TABLE `recipe` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `recipe`
--

INSERT INTO `recipe` (`id`, `name`) VALUES
(1, 'bolognaise'),
(3, 'dfgg'),
(4, 'sdfff'),
(5, ''),
(6, 'sdf'),
(7, 'sdf');

-- --------------------------------------------------------

--
-- Structure de la table `shelves`
--

CREATE TABLE `shelves` (
  `id` int(11) NOT NULL,
  `name` varchar(510) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `importance` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `shelves`
--

INSERT INTO `shelves` (`id`, `name`, `importance`) VALUES
(1, 'boulangerie - pâtisserie', 2),
(2, 'boucherie - charcuterie', 1),
(3, 'produits laitiers', 1),
(4, 'poissonerie', 1),
(5, 'conserves', 2),
(6, 'fruits et légumes', 1),
(7, 'fruits secs', 2),
(10, 'produits laitiers', 2),
(11, 'produits sucrés', 3),
(12, 'desserts frais', 2),
(13, 'produits secs', 2),
(14, 'épicerie', 2),
(15, 'surgelés', 5),
(16, 'alcool', 4),
(17, 'boissons', 4),
(18, 'produits ménagers', 4),
(19, 'salle de bain', 4),
(20, 'soins - hygiène', 4),
(21, 'aliments pour bébés', 3),
(22, 'sauces', 3),
(23, 'animalerie', 4),
(24, 'textiles', 4),
(25, 'divers', 4);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `groceries_list`
--
ALTER TABLE `groceries_list`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `ingredients`
--
ALTER TABLE `ingredients`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `ingredients_relations`
--
ALTER TABLE `ingredients_relations`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `mesures_type`
--
ALTER TABLE `mesures_type`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `recipe`
--
ALTER TABLE `recipe`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `groceries_list`
--
ALTER TABLE `groceries_list`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `ingredients`
--
ALTER TABLE `ingredients`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT pour la table `ingredients_relations`
--
ALTER TABLE `ingredients_relations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `mesures_type`
--
ALTER TABLE `mesures_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `recipe`
--
ALTER TABLE `recipe`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
