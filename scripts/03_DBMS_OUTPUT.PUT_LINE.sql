-- Paquete de Oracle, se debe habilitar en el SQL PLUS con
-- SET SERVEROUTPUT ON
DBMS_OUTPUT.PUT_LINE

-- Area NO SQL o NO PLUS, no necesita :=, sino con =
DEFINE

-- ejm:
SET SERVEROUTPUT ON
DEFINE p_annual_sal = 60000;

-- Inicia el BLOQUE PL/SQL
DECLARE 
    v_sal NUMBER(9,2) := &p_annual_sal;
BEGIN
    v_sal := v_sal/12;
    DBMS_OUTPUT.PUT_LINE ('The monthly salary is' || TO_CHAR(v_sal));
END;
/

