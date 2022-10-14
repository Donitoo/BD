CREATE DATABASE MisPeliculas;

create tablespace Coleccion
  datafile 'c:\oradata\MisPeliculas\data_file01.dbf'
  size 100M
  autoentend on next 10 M
  maxsize 2G;


create table Pelicula
(
idPelicula NUMBER primary key,
idDirector NUMBER REFERENCES Director,
título varchar2(100) not null,
año varchar2(4) not null,
nacionalidad varchar2(30) not null,
email varchar2(50) not null,
aColor char not null,
mayorDe number not null,
resumen varchar2(500) not null,
observaciones varchar2(1500) not null,
CHECK ((idPelicula IS NULL AND idDirector IS NOT NULL)
OR (idPelicula IS NOT NULL AND idDirector IS NULL)),

CONSTRAINT limiteEdad
CHECK (mayorDe BETWEEN 16 AND 90),

CONSTRAINT limiteAño
CHECK (año BETWEEN 1990 AND 2100)
) TABLESPACE Coleccion;

CREATE TABLE RepartoActores
(
idPelicula NUMBER PRIMARY KEY,
idActor NUMBER PRIMARY KEY,
personaje varchar2(80) not null,
CONSTRAINT Reparto_Actores_pk
PRIMARY KEY (idPelicula, idActor)

) TABLESPACE Coleccion;

CREATE TABLE Director
(
idDirector NUMBER PRIMARY KEY,
nombre varchar2(50) not null,
fechaNacimiento DATE not null,
país varchar2(50) not null
) TABLESPACE Coleccion;

CREATE TABLE Actor
(
idActor NUMBER PRIMARY KEY,
nombre varchar2(50) not null,
nacionalidad varchar2(50) not null
) TABLESPACE Coleccion;