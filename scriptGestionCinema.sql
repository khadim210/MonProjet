/** Script de creation de la Base de Données GestCinema **/

-- Creation de l'Utilisateur admin
CREATE USER IF NOT EXISTS admin@"localhost"  -- login@Machine
	identified by "Passer2025" ;  -- Mot de passe

-- Creation de la base de Base de Données
DROP DATABASE IF EXISTS GestCinema ; 
CREATE DATABASE GestCinema ; 

-- Privileges de l'Utilisateur admin
GRANT ALL PRIVILEGES on Gestcinema.* to admin@"localhost";


/** Creation des Tables de la base de données **/ 
USE GestCinema ; 

-- Creation de la table Realisateur
CREATE TABLE  Realisateur( 
	NoReal integer primary key, 
	Nom varchar(50), 
	Prenom varchar(50), 
	DateN date, 
	DateM date,
	Nationalite varchar(100),
	Biographie text );

-- Creation de la table Genre
CREATE TABLE Genre (
	reff char(10) primary key ); 
 
-- Creation de la table Client 
CREATE TABLE Client(
	NoClient integer auto_increment primary key , 
	Nom varchar(50),
	Prenom varchar(50), 
	Adresse varchar(200), 
	Tel integer );

-- Creation de la table Acteur
CREATE TABLE Acteur(
	NoAct integer auto_increment primary key, 
	Nom varchar(50), 
	Prenom varchar(50), 
	DateN date, 
	DateM date, 
	Nationalite varchar(100), 
	Biographie text );

-- Creation de la table Film
CREATE TABLE Film(
	NoFilm integer auto_increment primary key, 
	TitreFr varchar(200), 
	TitreO varchar(100), 
	annee integer default 2000, 
	type varchar(100),
	Duree integer, 
	Histoire text, 
	Commentaire text ) ; 

-- Creation de la table Exemplaire
CREATE TABLE Exemplaire(
	NoExp integer auto_increment primary key, 
	Dispo boolean, 
	NoFilm integer REFERENCES Film(NoFilm),
	NoCli integer REFERENCES Client(NoCli),
	DateEmprunt Date ); 

/** Gestion des relation n a n **/

-- Creation de la table a_mis_en_scene
CREATE TABLE a_mis_en_scene(
	NoReal integer REFERENCES Realisateur(NoReal),
	NoFilm integer REFERENCEs Film(NoFilm), 
	PRIMARY KEY(NoReal, NoFilm) ); 

-- Creation de la table joue_dans
CREATE TABLE joue_dans(
	NoAct integer REFERENCES Acteur(NoAct), 
	NoFilm integer REFERENCEs Film(NoFilm), 
	PRIMARY KEY(NoAct, NoFilm) ); 

-- Creation de la table est_de
CREATE TABLE est_de(
	NoFilm integer REFERENCES Film(NoFilm),
	reff char(10) REFERENCES Genre(reff), 
	Primary Key (NoFilm, reff) ); 

/** Fin du Script de Creation **/
