SELECT DISTINCT tablespace_name FROM dba_tablespaces ORDER BY TABLESPACE_NAME;
SELECT DISTINCT tablespace_name FROM user_tablespaces ORDER BY TABLESPACE_NAME;
 SELECT * FROM dba_tablespaces;
 
 select owner,TABLE_NAME,TABLESPACE_NAME
from dba_tables
where TABLESPACE_NAME = 'DATA1';

select DISTINCT tablespace_name from dba_tables;

SELECT * FROM all_users ORDER BY USERNAME;

describe c##emi.CUSTOMERS;
select role, granted_role from role_role_privs;
select role from dba_roles;

SELECT * FROM DBA_USERS;

select * from DBA_TS_QUOTAS 
where username = 'C##BOB';

select * from DBA_TABLES where tablespace_name='DATA1';
select DISTINCT TABLESPACE_NAME from DBA_TABLES ;

select * from dba_tab_privs;
select DISTINCT OWNER from dba_tab_privs ORDER BY OWNER;
select * from dba_tab_privs WHERE GRANTOR='C##EMI';
select DISTINCT PRIVILEGE from dba_tab_privs ORDER BY PRIVILEGE;
select * from dba_tab_privs
where privilege = 'C##DEV';
 -- Aprovecho para recordar algunas sentencias útiles para consultar los roles y privilegios generales del usuario que tiene abierta la sesión:
select * from user_role_privs;
select * from user_sys_privs;
 
 -- Listar Rol
 SELECT * FROM DBA_ROLES WHERE ROLE='SELECT_CATALOG_ROLE';
 
 --Listar los privilegios de un ROL
 select privilege
from dba_sys_privs
where grantee = 'C##DEV';

 select DISTINCT privilege
from dba_sys_privs where privilege like '%SELECT%';





