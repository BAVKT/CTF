-- Création base de donnée
CREATE DATABASE IF NOT EXISTS `ipipost`;
use `ipipost`;

-- Création de la table contenant les informations des formations
CREATE TABLE IF NOT EXISTS `formations`(
  `id` INTEGER(11) NOT NULL AUTO_INCREMENT,
  `titre` VARCHAR(128) NOT NULL,
  `niveau` VARCHAR(128) NOT NULL,
  `url` VARCHAR(128) NOT NULL,
  PRIMARY KEY(`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8;

-- Création de la table contenant les informations de l'api
CREATE TABLE IF NOT EXISTS `api`(
  `id` INTEGER(11) NOT NULL AUTO_INCREMENT,
  `key` VARCHAR(128) NOT NULL,
  PRIMARY KEY(`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8;

-- Création de l'utilisateur
CREATE USER 'ipi_user'@'localhost' IDENTIFIED BY 'pTYx-2GZiMjgwZj@wMTAy_zYwMGJb' ;
GRANT SELECT ON ipipost.formations TO 'ipi_user'@'localhost' ;
GRANT SELECT ON ipipost.api TO 'ipi_user'@'localhost' ;

-- Remplissage de la base de donnée
INSERT INTO `formations` values (1,'Technicien Support Utilisateurs','BAC+0','http://www.ipi-ecoles.com/technicien-support-utilisateurs/');
INSERT INTO `formations` values (2,'CPMI – Cycle préparatoire aux métiers de l’informatique (accessible sans le Bac)','BAC+0','http://www.ipi-ecoles.com/informatique-sans-bac/');
INSERT INTO `formations` values (3,'Technicien Supérieur en Technologies Numériques','BAC+2','http://www.ipi-ecoles.com/technicien-superieur-en-technologies-numeriques/');
INSERT INTO `formations` values (4,'Administrateur Systèmes et Réseaux','BAC+3','http://www.ipi-ecoles.com/administrateur-systemes-reseaux/');
INSERT INTO `formations` values (5,'Bachelor Développeur d’Applications','BAC+3','http://www.ipi-ecoles.com/bachelor-developpeur-dapplications/');
INSERT INTO `formations` values (6,'Chef de Projet Réseaux et Sécurité','BAC+5','http://www.ipi-ecoles.com/chef-de-projet-reseaux-et-securite/');
INSERT INTO `formations` values (7,'Chef de Projet Ingénierie Logicielle','BAC+5','http://www.ipi-ecoles.com/chef-de-projet-ingenierie-logicielle/');

-- A modifier si tu le souhaite
INSERT INTO `api` values (0,'CFLAG{::InjectionSQL@@localH0ST::()}');

-- Injection : ' UNION ALL SELECT `key`,NULL FROM ipipost.api ;-- ++
