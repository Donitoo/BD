-- Tiene que crearse antes el TABLESPACE y
-- quota 10m on example, tamaño maximo del objeto mas grande
-- Tiene que crearse antes el TABLESPACE temporal, reorganizacion de datos, creacion de indices
-- quota 5m on data, tamaño maximo del objeto mas grande
-- Se puede crear varios tablespace y asignarlos al usuario con QUOTA, EXAMPLE Y DATA
-- uno decide en que tablespace crear un objeto
-- Profile app_user,establecemos limitaciones de recursos,contraseñas
-- PASSWORD EXPIRE, hace que al iniciar sesion por primera vez, cambie su contraseña

CREATE USER sidney
	IDENTIFIED BY out_standing1
	DEFAULT TABLESPACE example
	QUOTA 10M ON example
	TEMPORARY TABLESPACE temp
	QUOTA 5M ON data
	PROFILE app_user
	PASSWORD EXPIRE;
	