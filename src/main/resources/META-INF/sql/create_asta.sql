CREATE SCHEMA IF NOT EXISTS ASTA_DB;
USE ASTA_DB;

CREATE TABLE Utilisateur(Email VARCHAR(100) PRIMARY KEY, MotDePasse VARCHAR(100),Prenom VARCHAR(50), Nom VARCHAR(50), Tel VARCHAR(20));

CREATE TABLE Tuteur(Email VARCHAR(100) PRIMARY KEY, MotDePasse VARCHAR(100),Prenom VARCHAR(50), Nom VARCHAR(50), Tel VARCHAR(20), Poste VARCHAR(100), Remarque VARCHAR(200), FOREIGN KEY(Email, MotDePasse, Prenom, Nom, Tel) REFERENCES Utilisateur(Email, MotDePasse, Prenom, Nom, Tel));

CREATE TABLE Apprenti(Email VARCHAR(100) PRIMARY KEY, MotDePasse VARCHAR(100),Prenom VARCHAR(50), Nom VARCHAR(50), Tel VARCHAR(20), Programme VARCHAR(50), Majeure VARCHAR(100), Annee VARCHAR(50), Archiver BOOLEAN, EmailTuteur VARCHAR(100), FOREIGN KEY(Email, MotDePasse, Prenom, Nom, Tel) REFERENCES Utilisateur(Email, MotDePasse, Prenom, Nom, Tel), FOREIGN KEY(EmailTuteur) REFERENCES Tuteur(Email));
