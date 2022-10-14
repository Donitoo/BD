CREATE PLUGGABLE DATABASE LupitaBakerypdb
ADMIN USER LupitaBakery IDENTIFIED BY "12345"
DEFAULT TABLESPACE LupitaBakery
  DATAFILE 'C:\app\oradata\ORCL\LupitaBakerypdb\LupitaBakery.dbf'
  SIZE 250M
  AUTOEXTEND ON
  FILE_NAME_CONVERT = ('C:\app\oradata\ORCL\pdbseed\',
                         'C:\app\oradata\ORCL\LupitaBakerypdb\')
  PATH_PREFIX = 'C:\app\oradata\ORCL\LupitaBakerypdb\';
ALTER PLUGGABLE DATABASE LUPITABAKERYPDB OPEN;
ALTER SESSION SET CONTAINER = LUPITABAKERYPDB;
GRANT ALL PRIVILEGES TO LupitaBakery CONTAINER=CURRENT;
EXEC DBMS_SERVICE.CREATE_SERVICE(service_name => 'lupitabakeryapp',network_name => 'lupitabakeryapp.tomukomatsu.com');
EXEC DBMS_SERVICE.START_SERVICE('lupitabakeryapp');
ALTER PLUGGABLE DATABASE SAVE STATE;