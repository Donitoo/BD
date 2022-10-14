CREATE TABLESPACE Esquema
DATAFILE 'C:\disk\app_data_01.dbf' SIZE 100M AUTOEXTEND ON next 10m maxsize 200m,
'C:\disk\app data_02.dbf' SIZE 100M AUTOEXTEND ON next 10m maxsize 200m

EXTENT MANAGEMENT LOCAL
segment space management auto
;

