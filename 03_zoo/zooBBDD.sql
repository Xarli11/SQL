CREATE SEQUENCE cont_zoo_id;
CREATE TABLE IF NOT EXISTS zoo(
	id_zoo int NOT NULL DEFAULT nextval('cont_zoo_id'),
	tamaño int NOT NULL,
	presupuesto_anual int NOT NULL,
	nombre character varying(50) NOT NULL,
	pais character varying(50) NOT NULL,	
	CONSTRAINT PK_zoo PRIMARY KEY (id_zoo)
);
CREATE SEQUENCE cont_animal_id;
CREATE TABLE IF NOT EXISTS animal(
	id_animal integer NOT NULL DEFAULT nextval('cont_animal_id'),
	id_zoo integer NOT NULL,
	id_especie integer NOT NULL,
	ano_nacimiento integer NOT NULL,
	continente character varying(30) NOT NULL,
	sexo character(1) NOT NULL,
	pais_origen character varying(30) NOT NULL,
	CONSTRAINT PK_animal PRIMARY KEY (id_animal),
	CONSTRAINT FK_animal_zoo FOREIGN KEY (id_zoo)
	REFERENCES zoo(id_zoo),
	CONSTRAINT FK_animal_especie FOREIGN KEY(id_especie)
	REFERENCES especie(id_especie)
);
CREATE SEQUENCE cont_id_especie;
CREATE TABLE IF NOT EXISTS Especie(
	id_especie integer NOT NULL DEFAULT nexval('cont_id_especie'),
	nom_vulgar character varying(50) NOT NULL,
	nom_cientifico character varying (50) NOT NULL,
	familia character varying (50) NOT NULL,
	peligro_extincion boolean NOT NULL,
	CONSTRAINT PK_especie PRIMARY KEY(id_especie)
)

