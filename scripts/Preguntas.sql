PREGUNTA 01

CREATE TABLESPACE Esquema
DATAFILE 'C:\disk\app_data_01.dbf' SIZE 100M AUTOEXTEND ON next 10m maxsize 200m,
'C:\disk\app data_02.dbf' SIZE 100M AUTOEXTEND ON next 10m maxsize 200m

EXTENT MANAGEMENT LOCAL
segment space management auto
;


PREGUNTA 02
create temporary tablespace TempEsquema
tempfile 'c:\disk\TempEsquema.dbf' size 50m AUTOEXTEND ON
extent management local;


PREGUNTA 03
create table Persona
(
idPersona NUMBER primary key,
nombre varchar2(50) not null,
dirección varchar2(50) not null,
teléfono number(9) not null,
email varchar2(50) not null
);

CREATE TABLE Personal
(
idPersonal NUMBER PRIMARY KEY,
idPersona NUMBER NOT NULL,
unidadAdministrativa varchar2(50) not null,
categoriaProfesional varchar2(50) not null,
CONSTRAINT PersonalPersona_fk FOREIGN KEY (idPersona)
REFERENCES Persona(idPersona)
);


CREATE TABLE Profesor
(
idProfesor NUMBER PRIMARY KEY,
idPersona NUMBER NOT NULL,
departamento varchar2(50) not null,
dedicacion varchar2(150) not null,
CONSTRAINT ProfesorPersona_fk FOREIGN KEY (idPersona)
REFERENCES Persona(idPersona)
);

CREATE TABLE Alumno
(
idAlumno NUMBER PRIMARY KEY,
idPersona NUMBER NOT NULL,
nroExpediente number not null,
titulacion varchar2(50) not null,
CONSTRAINT AlumnoPersona_fk FOREIGN KEY (idPersona)
REFERENCES Persona(idPersona)
);

create table Centro
(
idCentro NUMBER primary key,
nombre varchar2(50) not null,
ubicacion varchar2(50) not null,
foro number(4) not null
);

CREATE TABLE CentroPersona
(
idCentro NUMBER NOT NULL,
idPersona NUMBER NOT NULL,
CONSTRAINT CentroPersona_pk
PRIMARY KEY (idCentro, idPersona)
);

PREGUNTA 04
ALTER TABLE Centro
ADD CHECK (foro<=500);