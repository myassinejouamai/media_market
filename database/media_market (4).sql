-- phpMyAdmin SQL Dump

-- version 5.1.0

-- https://www.phpmyadmin.net/

--

-- Hôte : 127.0.0.1

-- Généré le : lun. 04 juil. 2022 à 23:13

-- Version du serveur :  10.4.19-MariaDB

-- Version de PHP : 8.0.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";

START TRANSACTION;

SET time_zone = "+00:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */

;

/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */

;

/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */

;

/*!40101 SET NAMES utf8mb4 */

;

--

-- Base de données : `media_market`

--

-- --------------------------------------------------------

--

-- Structure de la table `categories`

--

CREATE TABLE
    `categories` (
        `id` int(11) NOT NULL,
        `nom` varchar(150) DEFAULT NULL
    ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

--

-- Déchargement des données de la table `categories`

--

INSERT INTO
    `categories` (`id`, `nom`)
VALUES (1, 'Ordinateur Portable'), (2, 'Ordinateur Bureau'), (3, 'Téléphones'), (4, 'Tablettes'), (5, 'Montres');

-- --------------------------------------------------------

--

-- Structure de la table `couleurs`

--

CREATE TABLE
    `couleurs` (
        `id` int(11) NOT NULL,
        `nom` varchar(150) DEFAULT NULL
    ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

--

-- Déchargement des données de la table `couleurs`

--

INSERT INTO
    `couleurs` (`id`, `nom`)
VALUES (1, 'blue'), (2, 'red'), (3, 'black'), (4, 'white'), (5, 'yellow'), (6, 'gray'), (7, 'green'), (8, 'purple'), (9, 'orange'), (10, 'pink');

-- --------------------------------------------------------

--

-- Structure de la table `coupon_code`

--

CREATE TABLE
    `coupon_code` (
        `id` int(11) NOT NULL,
        `nom` varchar(30) DEFAULT NULL,
        `montant` double(10, 2) NOT NULL DEFAULT 0.00,
        `activated` tinyint(1) NOT NULL DEFAULT 1
    ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

--

-- Déchargement des données de la table `coupon_code`

--

INSERT INTO
    `coupon_code` (
        `id`,
        `nom`,
        `montant`,
        `activated`
    )
VALUES (1, 'test', 0.00, 1), (2, 'abobakr', 1000.00, 0), (3, 'centre', 10.00, 1), (4, 'shein', 1500.00, 1), (5, 'mehdi', 50.00, 1);

-- --------------------------------------------------------

--

-- Structure de la table `marques`

--

CREATE TABLE
    `marques` (
        `id` int(11) NOT NULL,
        `nom` varchar(20) DEFAULT NULL
    ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

--

-- Déchargement des données de la table `marques`

--

INSERT INTO
    `marques` (`id`, `nom`)
VALUES (1, 'appel'), (2, 'samsunge'), (3, 'hp'), (4, 'asus'), (5, 'dell'), (6, 'msi'), (7, 'razer'), (8, 'lenovo'), (22, 'razer'), (39, 'ciel');

-- --------------------------------------------------------

--

-- Structure de la table `migrations`

--

CREATE TABLE
    `migrations` (
        `id` int(10) UNSIGNED NOT NULL,
        `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
        `batch` int(11) NOT NULL
    ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

-- --------------------------------------------------------

--

-- Structure de la table `products`

--

CREATE TABLE
    `products` (
        `id` int(11) NOT NULL,
        `nom` varchar(150) DEFAULT NULL,
        `reference` varchar(60) DEFAULT NULL,
        `prix` double(11, 2) NOT NULL DEFAULT 0.00,
        `ancien_prix` double(11, 2) NOT NULL DEFAULT 0.00,
        `marque_id` int(11) DEFAULT NULL,
        `categorie_id` int(11) DEFAULT NULL,
        `couleur_id` int(11) DEFAULT NULL,
        `activated` tinyint(1) NOT NULL DEFAULT 0
    ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

--

-- Déchargement des données de la table `products`

--

INSERT INTO
    `products` (
        `id`,
        `nom`,
        `reference`,
        `prix`,
        `ancien_prix`,
        `marque_id`,
        `categorie_id`,
        `couleur_id`,
        `activated`
    )
VALUES (
        1,
        'Apple iMac 24\" (Puce M1 8CPU/8GPU/8Go/512Go SSD) - Rose',
        'PROD08886',
        22999.00,
        23990.00,
        1,
        2,
        10,
        1
    ), (
        2,
        'Apple iMac 24\" (Puce M1 8CPU/8GPU/8Go/512 Go SSD) - Bleu',
        'PROD08886',
        22999.00,
        23990.00,
        1,
        2,
        1,
        1
    ), (
        3,
        'Apple iPhone 13 Pro Max (128GO) - Bleu Alpin',
        'PROD01379',
        14999.00,
        15290.00,
        1,
        3,
        1,
        1
    ), (
        4,
        'Apple iPhone 13 Pro Max (128GO) - Doré',
        'PROD01379',
        14999.00,
        15290.00,
        1,
        3,
        5,
        1
    ), (
        5,
        'apple imac 24&quot; (puce m1 8cpu/8gpu/8go/512go ssd) - vert',
        'prod08886',
        22999.00,
        23990.00,
        1,
        2,
        7,
        1
    ), (
        6,
        'apple imac 24&quot; (puce m1 8cpu/8gpu/8go/512go ssd) - jaune',
        'prod08886',
        22690.00,
        23990.00,
        1,
        2,
        5,
        1
    );

-- --------------------------------------------------------

--

-- Structure de la table `product_images`

--

CREATE TABLE
    `product_images` (
        `id` int(11) NOT NULL,
        `product_id` int(11) DEFAULT NULL,
        `nom` varchar(100) DEFAULT NULL,
        `ranking` tinyint(4) NOT NULL DEFAULT 1
    ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

--

-- Déchargement des données de la table `product_images`

--

INSERT INTO
    `product_images` (
        `id`,
        `product_id`,
        `nom`,
        `ranking`
    )
VALUES (1, 1, '11626-2MsZBeqi.jpg', 1), (
        2,
        1,
        '023768EA-DE02-892B-310E-55B18B8581FE.jpg',
        2
    ), (
        3,
        1,
        '1D609E4F-BD95-FC97-9C45-AC4E28830295.jpg',
        3
    ), (4, 2, '11930-5ooYkGmk.jpg', 1), (
        5,
        2,
        '0E25A3E6-DAA5-D3FF-7052-F1E6626B573F.jpg',
        2
    ), (6, 3, '11589-D20GiliT.jpg', 1), (
        7,
        3,
        '06D9F02F-F006-22F1-1347-BD796934B1DE.jpg',
        2
    ), (
        8,
        3,
        '12EB1A76-5A86-E4EF-5FE1-6EFCAA6D0425.jpg',
        3
    ), (
        9,
        3,
        '48AF08E9-A709-7672-50AE-E4F9074AB22F.jpg',
        4
    ), (
        10,
        3,
        '48C42401-38B8-FD21-585E-6707AFEAC339.jpg',
        5
    ), (11, 4, '11590-ydEW7iBK.jpg', 1), (
        12,
        4,
        '0B903AC8-140C-5C31-75B1-FF1FBCB9DBB6.jpg',
        2
    ), (
        13,
        5,
        'E3EA4A5B-5512-00A9-2BDB-D2DF20258EAB.jpg',
        1
    ), (
        14,
        5,
        '6247378A-DF6C-7B72-C18D-048860F7DE15.jpg',
        2
    ), (
        15,
        5,
        'FF1479D7-A044-8168-EBAD-848AB97E213C.jpg',
        3
    ), (16, 6, '11938-TFrj8YLb.jpg', 1), (
        17,
        6,
        '5BDBF4EE-C512-76AF-BFB9-AB0B2DFFE944.jpg',
        2
    ), (
        18,
        6,
        'A19BD3D1-0608-2DE8-8EAE-37EA51F6BD4E.jpg',
        3
    );

-- --------------------------------------------------------

--

-- Structure de la table `roles`

--

CREATE TABLE
    `roles` (
        `id` int(11) NOT NULL,
        `nom` varchar(20) DEFAULT NULL
    ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

--

-- Déchargement des données de la table `roles`

--

INSERT INTO
    `roles` (`id`, `nom`)
VALUES (1, 'admin'), (2, 'fournisseur'), (3, 'client'), (4, 'commercial');

-- --------------------------------------------------------

--

-- Structure de la table `status_commande`

--

CREATE TABLE
    `status_commande` (
        `id` int(11) NOT NULL,
        `nom` varchar(30) DEFAULT NULL
    ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

--

-- Déchargement des données de la table `status_commande`

--

INSERT INTO
    `status_commande` (`id`, `nom`)
VALUES (1, 'en attente'), (2, 'en cours'), (3, 'livree'), (4, 'retour');

-- --------------------------------------------------------

--

-- Structure de la table `users`

--

CREATE TABLE
    `users` (
        `id` int(11) NOT NULL,
        `prenom` varchar(150) DEFAULT NULL,
        `nom` varchar(150) DEFAULT NULL,
        `telephone` varchar(20) DEFAULT NULL,
        `email` varchar(150) DEFAULT NULL,
        `password` varchar(150) DEFAULT NULL,
        `role_id` int(11) DEFAULT NULL,
        `activated` tinyint(1) NOT NULL DEFAULT 1
    ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

--

-- Déchargement des données de la table `users`

--

INSERT INTO
    `users` (
        `id`,
        `prenom`,
        `nom`,
        `telephone`,
        `email`,
        `password`,
        `role_id`,
        `activated`
    )
VALUES (
        1,
        'othmane',
        'mdi',
        '0606060606',
        'othmane@gmail.com',
        '$2y$10$RG7XksMHbKIICIyhYOVG6.caDWVgyQC5pXYkC3TnCgTfL4rvQSqAK',
        1,
        1
    ), (
        15,
        'maryam',
        'bouchouaruti',
        '066554685',
        'maryam@gmail.com',
        '123456',
        3,
        1
    ), (
        16,
        'ciel',
        'cocacola',
        '0539935544',
        'cocacola@gmail.com',
        '123456',
        2,
        0
    ), (
        18,
        'oumaima',
        'oumaima',
        '0655447788',
        'oumaima@gmail.com',
        '123456',
        3,
        1
    );

--

-- Index pour les tables déchargées

--

--

-- Index pour la table `categories`

--

ALTER TABLE `categories` ADD PRIMARY KEY (`id`);

--

-- Index pour la table `couleurs`

--

ALTER TABLE `couleurs` ADD PRIMARY KEY (`id`);

--

-- Index pour la table `coupon_code`

--

ALTER TABLE `coupon_code` ADD PRIMARY KEY (`id`);

--

-- Index pour la table `marques`

--

ALTER TABLE `marques` ADD PRIMARY KEY (`id`);

--

-- Index pour la table `migrations`

--

ALTER TABLE `migrations` ADD PRIMARY KEY (`id`);

--

-- Index pour la table `products`

--

ALTER TABLE `products`
ADD PRIMARY KEY (`id`),
ADD
    KEY `marque_id` (`marque_id`),
ADD
    KEY `categorie_id` (`categorie_id`),
ADD
    KEY `couleur_id` (`couleur_id`);

--

-- Index pour la table `product_images`

--

ALTER TABLE `product_images`
ADD PRIMARY KEY (`id`),
ADD
    KEY `product_id` (`product_id`);

--

-- Index pour la table `roles`

--

ALTER TABLE `roles` ADD PRIMARY KEY (`id`);

--

-- Index pour la table `status_commande`

--

ALTER TABLE `status_commande` ADD PRIMARY KEY (`id`);

--

-- Index pour la table `users`

--

ALTER TABLE `users`
ADD PRIMARY KEY (`id`),
ADD
    KEY `users_ibfk_1` (`role_id`);

--

-- AUTO_INCREMENT pour les tables déchargées

--

--

-- AUTO_INCREMENT pour la table `categories`

--

ALTER TABLE
    `categories` MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,
    AUTO_INCREMENT = 8;

--

-- AUTO_INCREMENT pour la table `couleurs`

--

ALTER TABLE
    `couleurs` MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,
    AUTO_INCREMENT = 14;

--

-- AUTO_INCREMENT pour la table `coupon_code`

--

ALTER TABLE
    `coupon_code` MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,
    AUTO_INCREMENT = 6;

--

-- AUTO_INCREMENT pour la table `marques`

--

ALTER TABLE
    `marques` MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,
    AUTO_INCREMENT = 42;

--

-- AUTO_INCREMENT pour la table `migrations`

--

ALTER TABLE
    `migrations` MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--

-- AUTO_INCREMENT pour la table `products`

--

ALTER TABLE
    `products` MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,
    AUTO_INCREMENT = 7;

--

-- AUTO_INCREMENT pour la table `product_images`

--

ALTER TABLE
    `product_images` MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,
    AUTO_INCREMENT = 19;

--

-- AUTO_INCREMENT pour la table `roles`

--

ALTER TABLE
    `roles` MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,
    AUTO_INCREMENT = 9;

--

-- AUTO_INCREMENT pour la table `status_commande`

--

ALTER TABLE
    `status_commande` MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,
    AUTO_INCREMENT = 5;

--

-- AUTO_INCREMENT pour la table `users`

--

ALTER TABLE
    `users` MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,
    AUTO_INCREMENT = 19;

--

-- Contraintes pour les tables déchargées

--

--

-- Contraintes pour la table `products`

--

ALTER TABLE `products`
ADD
    CONSTRAINT `products_ibfk_1` FOREIGN KEY (`marque_id`) REFERENCES `marques` (`id`) ON UPDATE CASCADE,
ADD
    CONSTRAINT `products_ibfk_2` FOREIGN KEY (`categorie_id`) REFERENCES `categories` (`id`) ON UPDATE CASCADE,
ADD
    CONSTRAINT `products_ibfk_3` FOREIGN KEY (`couleur_id`) REFERENCES `couleurs` (`id`) ON UPDATE CASCADE;

--

-- Contraintes pour la table `product_images`

--

ALTER TABLE `product_images`
ADD
    CONSTRAINT `product_images_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON UPDATE CASCADE;

--

-- Contraintes pour la table `users`

--

ALTER TABLE `users`
ADD
    CONSTRAINT `users_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON UPDATE CASCADE;

COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */

;

/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */

;

/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */

;