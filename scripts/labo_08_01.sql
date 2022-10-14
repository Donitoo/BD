-- ADMINISTRACIÓN DE USUARIOS

-- 1
create tablespace DATA1
  datafile 'c:\app\oradata\orcl\DATA1.dbf' 
  size 100m AUTOEXTEND ON
  segment space management auto
  EXTENT MANAGEMENT LOCAL
;

CREATE USER BOB
	IDENTIFIED BY crusader
	DEFAULT TABLESPACE DATA1
	QUOTA 5M ON DATA1
	TEMPORARY TABLESPACE TEMP
	QUOTA 1M ON USERS
    QUOTA 1M ON INDX;

GRANT CREATE SESSION TO bob;

-- 2
CREATE USER Emi
    IDENTIFIED BY MARY
    DEFAULT TABLESPACE DATA1
    QUOTA 5M ON DATA1
    TEMPORARY TABLESPACE TEMP;

-- 3
SELECT * FROM DB_USERS WHERE USERNAME IN('bob','emi');

-- 4
select * from DBA_TS_QUOTAS 
where username = 'BOB';

-- 5
-- 5.1
ALTER USER BOB
DEFAULT TABLESPACE DATA2
TEMPORARY TABLESPACE DATA5;

¿Qué sucede?
ERROR at line 1:
ORA-01031: insufficient privileges

¿Por qué?
El usuario bob no tiene los privilegios necesarios para cambiar su tablespace aún cuando se trata de su propia cuenta.

-- 5.2
ALTER USER bob
IDENTIFIED BY SAM;


-- 6
Alter USER bob
QUOTA unlimited on DATA1;

-- 7
DROP USER EMI CASCADE;

-- 8
ALTER USER C##BOB   
    IDENTIFIED BY OLINK
    PASSWORD EXPIRE;