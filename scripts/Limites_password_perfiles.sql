-- Contraseñas
-- Perfiles 
-- Administracion recursos
-- Crear perfiles con recursos

-- Obliga cambiar de contraseña en su proximo inicio de session
PASSWORD EXPIRE

-- numero de intentos, y bloquea cuenta
FAILED_LOGIN_ATTEMPS

-- Numero de dias que la cuenta esta bloqueada
PASSWORD_LOCK_TIME

-- tiempo de vida de la contraseñas en dias,despues expira
PASSWORD_LIFE_TIME

-- Periodo de gracias en dias para cambiar la contraseña despues del primer inicio de sesion satisfactorio luego que la contraseña expiró
PASSWORD_GRACE_TIME

-- Dias para que se pueda reutilizar una contraseña
PASSWORD_REUSE_TIME

-- Numero maximo que una contraseña se pueda usar
PASSWORD_REUSE_MAX

-- PL/SQL realiza una verificacion compleja de contraseñas antes de asignar una
PASSWORD_VERIFY_FUNCTION

-- Funcion de contraseñas proporcionada por el usuario
-- ESQUEMA SYS
Function_name(
    userid_parameter IN VARCHAR2(30),
    PASSWORD_parameter IN VARCHAR2(30),
    old_password_userid_parameter IN VARCHAR2(30))
RETURN BOOLEAN


CREATE PROFILE grace_5 LIMIT
    FAILED_LOGIN_ATTEMPS 3
    PASSWORD_LOCK_TIME UNLIMITED
    PASSWORD_LIFE_TIME 30
    PASSWORD_REUSE_TIME 30
    PASSWORD_VERIFY_FUNCTION verify_function
    PASSWORD_GRACE_TIME 5;

ALTER PROFILE default
    FAILED_LOGIN_ATTEMPS 3
    PASSWORD_LIFE_TIME 60
    PASSWORD_GRACE_TIME 10;

DROP PROFILE developer_prof;


-- Cuando se ha asignado a varios usuarios, entonces los usuarios que lo usan, usaran el perfil por defecto DEFAULT
DROP PROFILE developer_prof CASCADE;


-- Parametro para habilitar el limite de recursos
-- nivel sesion trabajo o comando
RESOURCE_LIMIT

-- Parametro de inicializacion
ALTER SYSTEM SET RESOURCE_LIMIT=TRUE;

-- Tiempo total de CPU milisegundos
CPU_PER_SESSION

-- Numero de sessiones concurrentes permitidas para el nombre de usuario
SESSION_PER_USER

-- Tiempo de conexion en mi session de trabajo transcurrido medido en minutos
CONNECT_TIME

-- periodos de inactividad en minutos
IDLE_TIME

-- Numero de bloques de datos (lecturas fisicas y logicas)
-- IMPIDE SACAR MUCHOS DATOS SENSIBLES A LA VEZ.
LOGICAL_READS_PER_SESSION

-- Espacio privado en el SGA medido en bytes(solo para servidor compartido)
PRIVATE_SGA

-- Tiempo de CPU por llamada en milisegundos
CPU_PER_CALL

-- Numero de bloquees de datos que se pueden leer por llamada
LOGICAL_READS_PER_CALL

CREATE PROFILE developer_prof LIMIT
    SESSIONS_PER_USER 2
    CPU_PER_SESSION 10000
    IDLE_TIME 60
    CONNECT_TIME 480

-- Muestra informacon de perfiles de contraseña
SELECT * FROM DBA_PROFILES

SELECT * FROM dba_profiles
    WHERE resource_type='PASSWROD'
    AND profile='GRACE_5';

