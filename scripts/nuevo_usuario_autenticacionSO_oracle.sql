-- Parametro de inicializacion OS_AUTHENT_PREFIX
-- especifica el formato de los nombres de usuarios
-- Inicia sesion con el usuario del SO, e ingresa directamente a la BD

CREATE USER ops$external_user
	IDENTIFIED EXTERNALLY
	DEFAULT TABLESPACE example 
	QUOTA 5M ON example 
	PROFILE app_user;