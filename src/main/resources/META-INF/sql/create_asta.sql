CREATE SCHEMA IF NOT EXISTS ASTA_DB;
USE ASTA_DB;

CREATE TABLE Entreprise(RaisonSocial VARCHAR(255) PRIMARY KEY, Adresse VARCHAR(255), InfosAcces VARCHAR(100));

CREATE TABLE Utilisateur(Email VARCHAR(100) PRIMARY KEY, MotDePasse VARCHAR(100), Prenom VARCHAR(50), Nom VARCHAR(50), Tel VARCHAR(20));

CREATE TABLE Tuteur(Email VARCHAR(100) PRIMARY KEY, Poste VARCHAR(100), Remarque VARCHAR(200), FOREIGN KEY(Email) REFERENCES Utilisateur(Email));

CREATE TABLE Apprenti(Email VARCHAR(100) PRIMARY KEY, Programme VARCHAR(50), Majeure VARCHAR(100), Annee VARCHAR(50), Archiver BOOLEAN, EmailTuteur VARCHAR(100), FOREIGN KEY(Email) REFERENCES Utilisateur(Email), FOREIGN KEY(EmailTuteur) REFERENCES Tuteur(Email), FOREIGN KEY(Email) REFERENCES Utilisateur(Email));

CREATE TABLE Mission(Apprenti VARCHAR(100) PRIMARY KEY, Entreprise VARCHAR(255), Description VARCHAR(255), Cigref VARCHAR(255), Commentaire VARCHAR(255), FeedbackApprenti VARCHAR(255), EvaluationApprenti VARCHAR(10), FOREIGN KEY(Apprenti) REFERENCES Apprenti(Email), FOREIGN KEY(Entreprise) REFERENCES Entreprise(RaisonSocial));

CREATE TABLE Visite(Apprenti VARCHAR(100) NOT NULL, Date VARCHAR(100) NOT NULL, Format VARCHAR(50), CompteRendu VARCHAR(200), FOREIGN KEY (Apprenti) REFERENCES Apprenti (Email), PRIMARY KEY(Apprenti, Date));

CREATE TABLE Evaluation(ID_Evaluation INT PRIMARY KEY, Apprenti VARCHAR(100), Sujet VARCHAR(255), Date DATE, Note INT, Commentaire VARCHAR(200), Type_Evaluation VARCHAR(255), FOREIGN KEY (Apprenti) REFERENCES Apprenti (Email));