-- Manejo de ERRORES
-- Definida por el sistema en tiempo de ejecucion o por el usuario

-- EJEMPLOS
-- Value string is divided by zero
ZERO_DIVIDE: ORA-22056

-- Out of memory
STORAGE_ERROR: ORA-27102


-- EJM APLICACION
DECLARE
    stock_price NUMBER := 9.73;
    net_earnings NUMBER := 0;
    pe_ratio NUMBER;
BEGIN
    -- Calculation might cause division-by-zero error
    pe_ratio := stock_price / net_earnings;
EXCEPTION
    WHEN ZERO_DIVIDE THEN -- HANDLES 'DIVISION BY ZERO' ERROR
        DBMS_OUTPUT.PUT_LINE('Division por cero');
        pe_ratio :=NULL;
    WHEN OTHERS THEN -- HANDLES ALL OTHER ERRORS
        DBMS_OUTPUT.PUT_LINE('Otro error');
        pe_ratio := NULL;
END; --EXCEPTION HANDLERS AND BLOCK END HERE
/

-- EXCEPCIONES PERSONALIZADAS
insufficient_funds : excepcion para indicar una cuenta bancaria sobregirada.

DBMS_STANDARD.RAISE_APPLICATION_ERROR

-- LANZA LA EXCEPCION PERSONALIZADA
RAISE


-- EJM APLICACION
DECLARE
    past_due EXCEPTION;
    acct_num NUMBER;
BEGIN
    DECLARE
        past_due EXCEPTION; -- this declaration prevails
        acct_num NUMBER;
        due_date DATE := SYSDATE -1 ;
        todays_date DATE := SYSDATE;
    BEGIN
        IF due_date < todays_date THEN
            RAISE past_due; -- this is not handled
        END IF;
    END;
EXCEPTION
    WHEN past_due THEN
        DBMS_OUTPUT.PUT_LINE('Handling PAST_DUE exception');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Coould');
END;
/


-- ASOCIAR UNA EXCEPTION CON UN NUMERO DE ERROR
OTHERS o PRAGMA EXCEPTION_INIT

PRAGMA: Directiva para el compilador que se procesa en tiempo de compilacion,no en tiempo de ejecucion

PRAGMA EXCEPTION_INIT(exception_name, -Oracle_error_number);

-- ejm APLICACION
DECLARE
    deadlock_detected EXCEPTION;
    PRAGMA EXCEPTION_INIT(deadlock_detected, -60);
BEGIN
    NULL; --Some operation that causes an ORA-00060 error
EXCEPTION
    WHEN deadlock_detected THEN
        NULL; --handle the error
END;

-- definir mensaje de error personalizados ORA-n
RAISE_APPLICATION_ERROR

RAISE_APPLICATION_ERROR(error_number,message[,{TRUE | FALSE}]);

RAISE_APPLICATION_ERROR es parte del paquete DBMS_STANDARD, cuyos metodos no requieren especificar nombre de paquete

error_number: entero negativo en el rango 20000..-2099
Message     : cadena de caraceteres de hasta 2048 bytes
Tercer parametro
    TRUE: error colocado en la pila de ERRORES anteriores
    FALSE(por defecto): error reeemplza los errores anteriores

DECLARE 
    num_tables NUMBER;
BEGIN
    SELECT COUNT(*) INTO num_tables FROM USER_TABLES;
    IF num_tables < 1000 THEN
    -- EMITE SU PROPIO CÓDIGO DE ERROR (ORA-20101) CON SU PROPIO MENSAJE DE ERROR. NO NECESITA CALIFICAR RAISE_APPLICATION_ERROR CON DBMS_STANDARD
        RAISE_APPLICATION_ERROR(-20101,'Esperando al menos 1000 tables');
    ELSE
        -- Hacer el resto del procesamiento (para el caso sin error)
        NULL;
    END IF;
END;
/