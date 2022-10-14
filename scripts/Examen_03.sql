-- (0.5 Punto) Elabore la sentencia para iniciar sesión como usuario administrador del gestor de base de datos en la consola de Oracle Database. Considere el usuario administrador tenga privilegios del rol de DBA en el DBMS.

sys as SYSDBA

-- (1 Punto) Elabore las sentencias para crear el tablespace de usuario llamado “Personal” con un tamaño de 100 Mb que se expanda automanticamente, la administración del segment sea automatica y la administración del extent sea local.

create tablespace Personal
  datafile 'c:\app\oradata\orcl\Personal.dbf' 
  size 100m AUTOEXTEND ON
  segment space management auto
  EXTENT MANAGEMENT LOCAL
;

-- (1 Punto) Elabore las sentencias para crear el tablespace temporal de usuario llamado “Temporal_Personal” con un tamaño de
-- 50 Mb, la administración del extent sea local y la asignación de extent uniformes de 1 MB.

CREATE TEMPORARY TABLESPACE Temporal_Personal
TEMPFILE 'c:\app\oradata\orcl\Temporal_Personal”.dbf'
SIZE 50M
EXTENT MANAGEMENT LOCAL
UNIFORM SIZE 1M;

-- (0.5 Punto) En la consola de Oracle Database elabore la sentencia para iniciar como usuario HR.

Connect HR/12345@ORCL

/*(1.0 Punto) Elabore las sentencias para crear las tablas capacitación y empleado_capacitacion con los siguientes campos: 
código de empleado,
código de la capacitación,
nombre de la capacitación,
nivel de la capacitación (técnico, experto, especialista),
descripción de la capacitación,
cantidad de horas de la capacitación,
Número de horas que el empleado asistió a la capacitación.
Elija que campos son parte de cada tabla y observe que un campo puede ser parte de más de una tabla. Las tablas deben ser creadas en el tablespace “Personal”.
*/
CREATE TABLE Nivel(
    NIVEL_ID NUMBER(6) NOT NULL,
    NIVEL_NAME VARCHAR2(50),
    
    CONSTRAINT PK_Nivel
    PRIMARY KEY(NIVEL_ID)
);

CREATE TABLE Capacitacion(
    Capacitacion_ID NUMBER(6) NOT NULL,
    Capacitacion_name NUMBER,
    NIVEL_ID NUMBER,
    DESCRIPCION VARCHAR2(150),
    HORAS NUMBER,
    
    CONSTRAINT PK_Capacitacion
    PRIMARY KEY(Capacitacion_ID),

    CONSTRAINT FK_Capacitacion_Nivel
    FOREIGN KEY (NIVEL_ID)
    REFERENCES Nivel(NIVEL_ID)
);

CREATE TABLE Empleado_Capacitacion(

   Empleado_Capacitacion NUMBER(6) NOT NULL,
   Capacitacion_ID NUMBER(6) NOT NULL,
   EMPLOYEE_ID NUMBER(6) NOT NULL,
   HORAS_ASISTIDAS NUMBER,
        
    CONSTRAINT PK_EC
    PRIMARY KEY(Empleado_Capacitacion),

    CONSTRAINT FK_EC_Capacitacion
    FOREIGN KEY (Capacitacion_ID)
    REFERENCES Capacitacion(Capacitacion_ID),

    CONSTRAINT FK_EC_Empleado
    FOREIGN KEY (EMPLOYEE_ID)
    REFERENCES EMPLOYEES(EMPLOYEE_ID)
);

INSERT INTO Nivel VALUES  (1,'Tecnico');
INSERT INTO Nivel VALUES  (2,'Experto');
INSERT INTO Nivel VALUES  (3,'Especialista');