DECLARE
    v_variable VARCHAR2(5);
BEGIN
    SELECT nombre_columna
    INTO v_variable
    FROM nombre_tabla;
EXCEPTION
    WHEN nombre_excepcion THEN
    -- ...
END;


