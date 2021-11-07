CREATE DATABASE IF NOT EXISTS Foody;

DROP TABLE IF EXISTS client;
CREATE TABLE IF NOT EXISTS client (
	CodeCli VARCHAR(5) NOT NULL PRIMARY KEY,
    Societe VARCHAR(45) NOT NULL,
    Contact VARCHAR(45) NOT NULL,
    Fonction VARCHAR(45) NOT NULL,
    Adresse VARCHAR(150),
    Ville VARCHAR(25),
    Region VARCHAR(25),
    CodePostal VARCHAR(10),
    Pays VARCHAR(25),
    Tel VARCHAR(25),
    Fax VARCHAR(25)
);

DROP TABLE IF EXISTS messager;
CREATE TABLE IF NOT EXISTS messager (
	NoMess INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    NomMess VARCHAR(45) NOT NULL,
    Tel VARCHAR(20)
);

DROP TABLE IF EXISTS employe;
CREATE TABLE IF NOT EXISTS employe (
    NoEmp INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Nom VARCHAR(45) NOT NULL,
    Prenom VARCHAR(45) NOT NULL,
    Fonction VARCHAR(45) ,
    TitreCourtoisie VARCHAR(45),
    DateNaissance DATETIME,
    DateEmbauche DATETIME ,
    Adresse VARCHAR(150),
    Ville VARCHAR(45),
    Region VARCHAR(45),
    CodePostal VARCHAR(20),
    Pays VARCHAR(45),
    TelDom VARCHAR(20) ,
    Extension VARCHAR(45),
    RendCompteA INT,
    FOREIGN KEY (NoEmp) REFERENCES employe(NoEmp)
);

DROP TABLE IF EXISTS commande;
CREATE TABLE IF NOT EXISTS commande (
	NoCom INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    CodeCli VARCHAR(10),
    NoEmp INT,
    DateCom DATETIME,
    ALivAvant DATETIME,
    DateEnv DATETIME,
    NoMess INT,
    Port FLOAT,
    Destinataire VARCHAR(45),
    AdrLiv VARCHAR(150),
    VilleLiv VARCHAR(45),
    RegionLiv VARCHAR(45),
    CodePostalLiv VARCHAR(20),
    PaysLiv VARCHAR(45),
    FOREIGN KEY (NoMess) REFERENCES messager(NoMess),
    FOREIGN KEY (NoEmp) REFERENCES employe(NoEmpl),
    FOREIGN KEY (CodeCli) REFERENCES client(CodeCli)
);

DROP TABLE IF EXISTS detailcommande;
CREATE TABLE IF NOT EXISTS detailcommande (
	NoCom INT NOT NULL,
    RefProd INT NOT NULL,
    PrixUnit FLOAT NOT NULL,
    Qte INT NOT NULL,
    Remise FLOAT NOT NULL,
    PRIMARY KEY (NoCom, RefProd),
    FOREIGN KEY (NoCom) REFERENCES commande(NoCom),
    FOREIGN KEY (RefProd) REFERENCES produit(RefProd)
);

DROP TABLE IF EXISTS categorie;
CREATE TABLE IF NOT EXISTS categorie (
    CodeCateg INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    NomCateg VARCHAR(15) NOT NULL,
    Descriptionn VARCHAR(255)
);

DROP TABLE IF EXISTS fournisseur;
CREATE TABLE IF NOT EXISTS fournisseur (
    NoFour INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Societe VARCHAR(45) NOT NULL,
    Contact VARCHAR(45),
    Fonction VARCHAR(45),
    Adresse VARCHAR(150),
    Ville VARCHAR(45),
    Region VARCHAR(45),
    CodePostal VARCHAR(20),
    Pays VARCHAR(45),
    Tel VARCHAR(20),
    Fax VARCHAR(20),
    PageAccueil VARCHAR(45)
);

DROP TABLE IF EXISTS produit;
CREATE TABLE IF NOT EXISTS produit (
    RefProd INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    NomProd VARCHAR(45) NOT NULL,
    NoFour INT,
    CodeCateg INT,
    QteParUnit VARCHAR(20),
    PrixUnit FLOAT,
    UnitesStock INT,
    UnitesCom INT,
    NiveauReap INT,
    Indisponible INT,
    FOREIGN KEY (CodeCateg) REFERENCES categorie(CodeCateg),
    FOREIGN KEY (NoFour) REFERENCES fournisseur(NoFour)
);







	