-- Adiciona privilegio a un usuario o grupo  de usuarios
GRANT

-- Elimina privilegios
REVOKE

-- En privilegios significa que el usuario tiene el privilegio sobre cualquier esquema
ANY

-- INDICE: DAR LA POSIBILIDAD DE CREAR, ALTERAR O ELIMINAR CUALQUIER ESQUEMA
CREATE ANY INDEX
ALTER ANY INDEX
DROP ANY INDEX

-- TABLA:
-- En su proio esquema
CREATE TABLE
 CREATE VIEW
CREATE PROCEDURE

-- En cualquier esquema
CREATE ANY TABLE        
CREATE ANY VIEW        
CREATE ANY PROCEDURE
ALTER ANY TABLE
DROP ANY TABLE
SELECT ANY TABLE
UPDATE ANY TABLE
DROP ANY TABLE

-- SESIÓN:
CREATE SESSION
ALTER SESSION
RESTRICTED SESSION

-- TABLESPACE
CREATE ,ALTER , DROP , UNLIMITED TABLESPACE


-- EJEMPLOS
GRANT CREATE SESSION TO emi;

GRANT CREATE SESSION TO emi
WITH ADMIN OPTION;


-- SYSOPER
STARTUP
SHUTDOWN
ALTER DATABASE OPEN | MOUNT
ALTER DATABASE BACKUP CONTROLFILE TO
RECOVER DATABASE
ALTER DATABASE ARCHIVELOG

-- SYSDBA: SOLO AL USUARIO SYS
SYSOPER PRIVILEGES WITH ADMIN OPTION
CREATE DATABASE
ALTER DATABASE BEGIN/END BACKUP
RETRICTED SESSION
RECOVER DATABASE UNTIL


-- Controla las restricciones sobre los privilegios SYSTEM
-- TRUE: Se permite acceso a los objetos en el esquemas SYS
-- FALSE: Por defecto, asegura que los privilegios del sistema que permiten acceso a cualquier esquema no permitan acceso al esquema SYS
07_DICTIONARY ACCESIBILITY


REVOKE CREATE TABLE FROM emi;

-- Asignarle a un usuario cualquiera, el usuario DBA
-- Significa que el usuario cualquiera pueda dar privilegios a otros usuarios
ADMIN OPTION

GRANT CREATE TABLE TO jeff WITH ADMIN OPTION;
REVOKE CREATE TABLE FROM jeff;


                Tabla   Vista   Secuencia    Procedimiento
ALTER           *                   *               *
REFERENCES      *  
EXECUTE                                             *
INDEX           *       *             
SELECT          *       *           *
INSERT          *       *
UPDATE          *       *
DELETE          *       *

-- EJEMPLOS
GRANT EXECUTE ON _NOMBRE_PROCEDIMIENTO_ TO _NOMBRE_USUARIO
GRANT UPDATE ON emi.customers TO jeff WITH GRANT OPTION;
REVOKE SELECT ON emi.orders FROM jeff;
-- GRANT OPTION ES IGUAL QUE GRANT ADMIN OPTION

-- REFERENCES: llaves foraneas
-- DBA
GRANT REFERENCES ON DBA.JOBS TO jeff WITH GRANT OPTION;
-- jeff
GRANT REFERENCES ON DBA.JOBS TO emi WITH GRANT OPTION;

-- Esto elimina en CASCADA si elimina jeff , tambien elimina a emi
REVOKE REFERENCES ON DBA.JOBS from jeff;

-- iNFORMACION
-- privilegios de sessio
SESSION_PRIVIS
DBA_SYS_PRIVIS -- SYS
DBA_TAB_PRIVS -- TABLAS
DBA_COL_PRIVS -- COLUMNAS

-- ***********************
-- ROLES: Administra el DBA
-- ***********************
-- crear un rol
CREATE ROLE ventas;

-- Asignar privilegios
GRANT create table,create view TO ventas

-- Revoca privilegios a los ROLES
REVOKE create table FROM ventas

-- Asignar rol a un usuario
GRANT ventas TO sam;


-- ROLES PREDEFINIDOS
-- CONNECT
CREATE SESSION

-- RESOURCE
CREATE CLUSTER,CREATE INDEXTYPE,
CREATE OPERATOR, CREATE PROCEDURE,
CREATE SEQUENCE,CREATE TABLE,CREATE TRIGGER,
CREATE TYPE

-- SCHEDULER_ADMIN
CREATE ANY JOB,CREATE EXTERNAL JOB,
CREATE JOB,EXECUTE ANY CLASS,EXECUTE ANY PROGRAM,
MANAGE SCHEDULER

-- DBA
MAYORIA DE privilegios DEL SISTEMA, MAS OTROS ROLES.

-- SELECT_CATALOG_ROLE
Sin privilegios del sistema, pero si HS_ADMIN_ROLES
junto con otros 1700 privilegios sobre el diccionario de datos


