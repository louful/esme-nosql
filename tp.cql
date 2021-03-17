#TP1 REIBER LOUIS CASSANDRA

#Exercice 1

#Création du KEYSPACE

CREATE KEYSPACE elections
    WITH REPLICATION = {'class': 'SimpleStrategy', 'replication_factor' : 1};


#Rentre dans mon KEYSPACE


USE elections;

#Création des tables 

CREATE TABLE administre  (
	Nom_A text Primary KEY,
	Prenom_A text,
	Adresse text,
	NIN varint,


);


CREATE TABLE candidat  (
	Nom_P text PRIMARY KEY,
	Prenom_P text,
	Parti_politique text,
	nbr_vote int,

);


CREATE TABLE Vote  (
	Nom_A text,
	Nom_P text,
	PRIMARY KEY(Nom_A, Nom_P)
);


#Création de la table pour mettre parti_politique en clé primaire

CREATE TABLE Candidat (
    Nom_P text ,
    Prenom_P text,
    Parti_politique text,
    nbr_vote int ,
  PRIMARY KEY (parti_politique,nbr_vote,nom_P),
) WITH CLUSTERING ORDER BY (nbr_vote desc);


#Check la table candidat

SELECT * FROM Candidat; 



SELECT * FROM Candidat WHERE nbr_vote ORDER BY ASC;

#Modifier la table candidat

ALTER TABLE Candidat...

INSERT INTO Candidat (Nom_P , Prenom_P , Parti_politique , nbr_vote)
VALUES ('toto1', 'tôt', 'A', 1);

INSERT INTO Candidat (Nom_P , Prenom_P , Parti_politique , nbr_vote)
VALUES ('toto2', 'tôtt', 'B', 2);

INSERT INTO Candidat (Nom_P , Prenom_P , Parti_politique , nbr_vote)
VALUES ('toto33', 'tôttt', 'C', 5);

INSERT INTO Candidat (Nom_P , Prenom_P , Parti_politique , nbr_vote)
VALUES ('toto4', 'tôtttt', 'A', 4);


INSERT INTO Candidat (Nom_P , Prenom_P , Parti_politique , nbr_vote)
VALUES ('titi1', 'tôt', 'A', 1);

INSERT INTO Candidat (Nom_P , Prenom_P , Parti_politique , nbr_vote)
VALUES ('titi2', 'tôtt', 'B', 2);

INSERT INTO Candidat (Nom_P , Prenom_P , Parti_politique , nbr_vote)
VALUES ('titi3', 'tôttt', 'C', 3);

INSERT INTO Candidat (Nom_P , Prenom_P , Parti_politique , nbr_vote)
VALUES ('titi4', 'tôtttt', 'A', 4);


#Création de l'index pour parti politique
CREATE INDEX ipp ON Candidat(parti_politique);


#Question 1 avec plusieurs commandes :

SELECT sum(nbr_vote) FROM Candidat WHERE parti_politique = 'A';
SELECT sum(nbr_vote) FROM Candidat WHERE parti_politique = 'B';
SELECT sum(nbr_vote) FROM Candidat WHERE parti_politique = 'C';

#Question 1 avec une commande:


SELECT  parti_politique, sum(nbr_vote) FROM candidat GROUP BY parti_politique ;

#Question 1 avec ORDER BY qui ne marche pas 

Select  parti_politique, sum(nbr_vote) FROM candidat  GROUP BY parti_politique ORDER BY sum(nbr_vote) DESC LIMIT 1;

#Question 2 :


SELECT MAX (nbr_vote),Nom_P,Prenom_P FROM candidat;

SELECT nom_P FROM candidat ORDER by sum(nbr_vote); 

#Question 3 avec plusieurs commandes


SELECT MAX (nbr_vote),Nom_P,Prenom_P,Parti_politique FROM candidat;
SELECT  parti_politique, sum(nbr_vote) FROM candidat GROUP BY parti_politique ;



#Exercice 2 

#Création de la table pour chaque gagnant de commune

CREATE TABLE gagnant_Candidat_commune (
    Nom_C text ,
    Prenom_C text,
    Parti_politique text,
    nbr_vote int ,
    commune text ,
  PRIMARY KEY (parti_politique,nbr_vote),
) WITH CLUSTERING ORDER BY (nbr_vote desc); #pour faire order by 

#Insertion des candidats

INSERT INTO gagnant_Candidat_commune (Nom_C , Prenom_C , Parti_politique , nbr_vote, commune)
VALUES ('titi1', 'tôt', 'A', 5, 'Saintremylescheuvreuse');

INSERT INTO gagnant_Candidat_commune (Nom_C , Prenom_C , Parti_politique , nbr_vote, commune)
VALUES ('titi2', 'tôtt', 'B', 3, 'Cheuvreuse');

INSERT INTO gagnant_Candidat_commune (Nom_C , Prenom_C , Parti_politique , nbr_vote, commune)
VALUES ('titi3', 'tôttt', 'C', 2, 'Boulaylestrous');

INSERT INTO gagnant_Candidat_commune (Nom_C , Prenom_C , Parti_politique , nbr_vote, commune)
VALUES ('titi4', 'tôtttt', 'A', 4, 'Versailles');

#Question 1 ( sans afficher la ville Versailles :( )

SELECT parti_politique , commune , sum(nbr_vote) FROM gagnant_Candidat_commune GROUP BY  parti_politique;


#Question 2 


SELECT parti_politique , commune , sum(nbr_vote) FROM gagnant_Candidat_commune GROUP BY  parti_politique;










