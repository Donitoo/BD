-- Modificar cuota de usuario sobre el tablespace
ALTER USER aaron
QUOTA 10M ON USERS;

ALTER USER sidney
QUOTA UNLIMITED ON DATA;


-- Elimina SOLO al usuario
DROP USER aaron;

-- Elimina al usuario y todos sus objetos: tablas, etc
DROP USER aaron CASCADE; 



-- ver todos los los users
DBA_USERS

-- Ver las tablespace 
DBA_TS_QUOTAS