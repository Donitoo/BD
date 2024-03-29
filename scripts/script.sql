create table EMPLEADOS
(
DNI NUMBER(8)  NOT NULL,
NOMBRE VARCHAR(10) NOT NULL  ,
APELLIDO1 VARCHAR(15) NOT NULL ,
APELLIDO2 VARCHAR(15)  NOT NULL,
DIRECC1 VARCHAR(25) ,
DIRECC2 VARCHAR(20) ,
CIUDAD VARCHAR(20) ,
PROVINCIA VARCHAR(20) ,
COD_POSTAL VARCHAR(5)  ,
SEXO VARCHAR(1)  ,
FECHA_NAC DATE ,
TELEFONO NUMBER(7) ,
CELULAR NUMBER(8) ,

CONSTRAINT pregunta2
CHECK (SEXO IN('H', 'M')),

CONSTRAINT PK_Empleados
PRIMARY KEY (DNI)
);

CREATE TABLE DEPARTAMENTOS (
DPTO_COD NUMBER(5) NOT NULL,
NOMBRE_DPTO VARCHAR(30) NOT NULL UNIQUE ,
DPTO_PADRE NUMBER(5) ,
PRESUPUESTO NUMBER NOT NULL ,
PRES_ACTUAL NUMBER ,

CONSTRAINT PK_DEPARTAMENTOS
PRIMARY KEY (DPTO_COD)
);

CREATE TABLE UNIVERSIDADES (
UNIV_COD NUMBER(5) NOT NULL,
NOMBRE_UNIV VARCHAR(25) NOT NULL,
CIUDAD VARCHAR(20),
MUNICIPIO VARCHAR(2),
COD_POSTAL VARCHAR(5),

CONSTRAINT PK_UNIVERSIDADES
PRIMARY KEY (UNIV_COD)
);

CREATE TABLE ESTUDIOS (
ESTUDIOS_COD NUMBER(8) NOT NULL,
EMPLEADO_DNI NUMBER(8) NOT NULL,
UNIVERSIDAD NUMBER(5) NOT NULL,
AÑO NUMBER NOT NULL,
GRADO VARCHAR(3) NOT NULL,
ESPECIALIDAD VARCHAR(20) NOT NULL,

CONSTRAINT PK_ESTUDIOS
PRIMARY KEY (ESTUDIOS_COD),

CONSTRAINT FK_ESTUDIOS_EMPLEADOS
  FOREIGN KEY(EMPLEADO_DNI)
  REFERENCES EMPLEADOS( DNI ),

CONSTRAINT FK_ESTUDIOS_UNIVERSIDAD
  FOREIGN KEY(UNIVERSIDAD)
  REFERENCES UNIVERSIDADES( UNIV_COD ),

);



CREATE TABLE TRABAJOS (
TRABAJO_COD NUMBER(5) NOT NULL,
NOMBRE_TRAB VARCHAR(20) UNIQUE,
SALARIO_MIN NUMBER(2) NOT NULL,
SALARIO_MAX NUMBER(2) NOT NULL,

CONSTRAINT PK_TRABAJOS
PRIMARY KEY (UNIV_COD)
);

CREATE TABLE HISTORIAL_LABORAL (
HL_COD NUMBER(8) NOT NULL,
EMPLEADO_DNI NUMBER(8) NOT NULL,
TRABAJO_COD NUMBER(5) NOT NULL,
FECHA_INICIO DATE NOT NULL,
FECHA_FIN DATE ,
DPTO_COD NUMBER(5),
SUPERVISOR_DNI NUMBER(8) REFERENCES EMPLEADOS ,

CONSTRAINT PK_HISTORIAL_LABORAL
PRIMARY KEY (HL_COD),

CONSTRAINT FK_HL_EMPLEADOS
  FOREIGN KEY(EMPLEADO_DNI)
  REFERENCES EMPLEADOS( DNI ),

CONSTRAINT FK_HL_TRABAJOS
  FOREIGN KEY(TRABAJO_COD)
  REFERENCES TRABAJOS( TRABAJO_COD )
);
 

CREATE TABLE HISTORIAL_SALARIAL (
HS_COD NUMBER(8) NOT NULL,
EMPLEADO_DNI NUMBER(8) NOT NULL,
SALARIO NUMBER NOT NULL,
FECHA_COMIENZO DATE NOT NULL,
FECHA_FIN DATE ,

CONSTRAINT PK_ESTUDIOS
PRIMARY KEY (HS_COD),

CONSTRAINT FK_HISTORIALSALARIAL_EMPLEADOS
  FOREIGN KEY(EMPLEADO_DNI)
  REFERENCES EMPLEADOS( DNI )

);


-- PREGUNTA 7

INSERT
INTO EMPLEADOS ( DNI , NOMBRE, APELLIDO1,APELLIDO2,SEXO )
VALUES ( 111222, 'Sergio', 'Palma', 'Entrena','H' ) ;

INSERT
INTO EMPLEADOS ( DNI , NOMBRE, APELLIDO1,APELLIDO2,SEXO )
VALUES ( 222333, 'Lucia', 'Ortega', 'Plus','H' ) ;

/*
No se puede insertar la fila, porque  el atributo TRAB_COD no acepta valores nulos y 
DPTO_COD al ser de 6 caracteres, tendra un conflicto con la restriccion FK_HL_TRABAJOS y conflicto con la clausula REFERENCES
*/

-- PREGUNTA 8
/*
Ocurrira un error, ya que tendra un conflicto con la clausula  REFERENCES hacia la tabla EMPLEADOS,ya que dicha restriccion debe asegurar la existencia de una llave foranea.
*/

-- PREGUNTA 9
/*
Ocurrira un error, ya que tendra un conflicto con la restriccion FK_ESTUDIOS_UNIVERSIDAD,
se debe habilitar la eliminacion en cascada.
*/

ALTER TABLE ESTUDIOS DROP FK_ESTUDIOS_UNIVERSIDAD;

ALTER TABLE ESTUDIOS 
  ADD CONSTRAINT FK_ESTUDIOS_UNIVERSIDAD 
  FOREIGN KEY (UNIVERSIDAD) 
  REFERENCES UNIVERSIDAD(UNIV_COD) 
  ON DELETE CASCADE;

-- PREGUNTA 11
ALTER TABLE EMPLEADOS 
ADD VALORACION NUMBER(2) DEFAULT 5
    CHECK (VALORACION BETWEEN 1 AND 10)
;

-- PREGUNTA 12
ALTER TABLE EMPLEADOS
  MODIFY NOMBRE number(40);

-- PREGUNTA 13
ALTER TABLE EMPLEADOS
  MODIFY DIREC1 number(40) not null;

-- PREGUNTA 14


-- PREGUNTA 15
ALTER TABLE EMPLEADOS DROP CONSTRAINT primaria_Empleados CASCADE;

ALTER TABLE EMPLEADOS
ADD CONSTRAINT PK_Empleados PRIMARY KEY (NOMBRE, APELLIDO1, APELLIDO2);

-- PREGUNTA 17
CREATE VIEW NOMBRE_EMPLEADOS AS
SELECT CONCAT(NOMBRE,APELLIDO1,APELLIDO2) "Nombres" FROM EMPLEADOS
WHERE CIUDAD = 'Málaga'

-- PREGUNTA 18
CREATE VIEW INFORMACION_EMPLEADOS AS
SELECT CONCAT(NOMBRE,APELLIDO1,APELLIDO2) "Nombres",TRUNC( ( TO_NUMBER(TO_CHAR(SYSDATE,'YYYYMMDD')) -  TO_NUMBER(TO_CHAR(FechaNacimiento,'YYYYMMDD') ) ) / 10000) AS Edad FROM EMPLEADOS

-- PREGUNTA 19
DROP VIEW INFORMACION_EMPLEADOS;

CREATE VIEW INFORMACION_EMPLEADOS AS
SELECT DNI,CONCAT(NOMBRE,APELLIDO1,APELLIDO2) "Nombres",TRUNC( ( TO_NUMBER(TO_CHAR(SYSDATE,'YYYYMMDD')) -  TO_NUMBER(TO_CHAR(FechaNacimiento,'YYYYMMDD') ) ) / 10000) AS Edad FROM EMPLEADOS;

CREATE VIEW INFORMACION_ACTUAL AS
SELECT IE.* ,SALARIO FROM INFORMACION_EMPLEADOS IE JOIN HISTORIAL_SALARIAL HS
ON IE.DNI = HS.EMPLEADO_DNI


-- PREGUNTA 20
/*
El orden si importa, primero se tendrian que borrar por orden especifico todos los registros de
todas las tablas respectando las restricciones de llaves foraneas, y luego respetando el mismo orden, se eliminan todas las tablas.
*/

TRUNCATE TABLE HISTORIAL_SALARIAL;
TRUNCATE TABLE HISTORIAL_LABORAL;
TRUNCATE TABLE ESTUDIOS;
TRUNCATE TABLE UNIVERSIDADES;
TRUNCATE TABLE TRABAJOS;
TRUNCATE TABLE DEPARTAMENTOS;
TRUNCATE TABLE EMPLEADOS;

DROP TABLE HISTORIAL_SALARIAL;
DROP TABLE HISTORIAL_LABORAL;
DROP TABLE ESTUDIOS;
DROP TABLE UNIVERSIDADES;
DROP TABLE TRABAJOS;
DROP TABLE DEPARTAMENTOS;
DROP TABLE EMPLEADOS;
