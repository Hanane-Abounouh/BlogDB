BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "Role" (
	"id_role"	integer AUTO_INCREMENT,
	"nom"	VARCHAR(50),
	PRIMARY KEY("id_role")
);
CREATE TABLE IF NOT EXISTS "Utilisateur" (
	"id_utilisateur"	integer AUTO_INCREMENT,
	"nom"	VARCHAR(100),
	"email"	VARCHAR(100) UNIQUE,
	"mot_de_passe"	VARCHAR(100),
	"id_role"	integer,
	PRIMARY KEY("id_utilisateur"),
	FOREIGN KEY("id_role") REFERENCES "Role"("id_role")
);
CREATE TABLE IF NOT EXISTS "Catégorie" (
	"id_categorie"	integer AUTO_INCREMENT,
	"nom"	VARCHAR(100) UNIQUE,
	"parent_id_categorie"	integer,
	PRIMARY KEY("id_categorie"),
	FOREIGN KEY("parent_id_categorie") REFERENCES "Catégorie"("id_categorie")
);
CREATE TABLE IF NOT EXISTS "Article" (
	"id_article"	integer AUTO_INCREMENT,
	"titre"	VARCHAR(200),
	"contenu"	TEXT,
	"date_publication"	DATE,
	"id_categorie"	integer,
	"id_utilisateur"	integer,
	FOREIGN KEY("id_utilisateur") REFERENCES "Utilisateur"("id_utilisateur"),
	PRIMARY KEY("id_article"),
	FOREIGN KEY("id_categorie") REFERENCES "Catégorie"("id_categorie")
);
CREATE TABLE IF NOT EXISTS "Commentaire" (
	"id_commentaire"	integer AUTO_INCREMENT,
	"contenu"	TEXT,
	"date_creation"	DATE,
	"id_article"	integer,
	"id_utilisateur"	integer,
	FOREIGN KEY("id_article") REFERENCES "Article"("id_article"),
	FOREIGN KEY("id_utilisateur") REFERENCES "Utilisateur"("id_utilisateur"),
	PRIMARY KEY("id_commentaire")
);
INSERT INTO "Role" VALUES (NULL,'Admin');
INSERT INTO "Role" VALUES (NULL,'Utilisateur');
INSERT INTO "Utilisateur" VALUES (NULL,'Hanane','hanane@example.com','password123',1);
INSERT INTO "Utilisateur" VALUES (NULL,'Marwa','marwa@example.com','password456',2);
INSERT INTO "Catégorie" VALUES (NULL,'Technologie',NULL);
INSERT INTO "Catégorie" VALUES (NULL,'Gadgets',1);
INSERT INTO "Article" VALUES (NULL,'Gadgets de 2024','Contenu sur les derniers gadgets.','2024-02-01',2,2);
INSERT INTO "Commentaire" VALUES (NULL,'Ceci est un autre commentaire.','2024-02-10',2,1);
COMMIT;
