-- CONTADOR
V_COUNT := V_COUNT+1;

-- ASIGNAR FLAG BOOLEAN
V_EQUAL := (V_N1 = V_N2);

-- VERIFICAR SI UN NUMERO CONTIENE UN VALOR
V_VALID :=  (V_EMPno IS NOT NULL);

------------------------------------------------
-- SENTENCIA IF
------------------------------------------------
IF condicion THEN
    ...
ELSEIF condiciON THEN
    ...
ELSEIF condicion THEN
    ...
END IF;

-- EJM
IF UPPER(V_LAST_NAME)='GEITZ' THEN
    V_MGR := 102;
END IF;

------------------------------------------------
-- CASE
------------------------------------------------
CASE selector
    WHEN expresion1 THEN resultado1
    WHEN expresion1 THEN resultado1
    ...
    WHEN expresion1 THEN resultadoN
    ELSE resultadoN+1;
END;

-- EJM

SET SERVEROUTPUT ON
DECLARE
    v_grade CHAR(1) := UPPER('&_grade');
    v_appraisal VARCHAR2(20);
BEGIN
    v_appraisal :=
        CASE v_grade
            WHEN 'A' THEN 'Excellent'
            WHEN 'B' THEN 'Very Good'
            WHEN 'C' THEN 'Good'
            ELSE 'No such grade'
        END;
    DBMS_OUTPUT.PUT_LINE('Grade: '|| v_grade || ' Appraisal ' || v_appraisal);
END;
/



------------------------------------------------
-- LOOP : TRUE FALSE O NULL
------------------------------------------------

LOOP 
    ...
    EXIT WHEN (TRUE)
END LOOP

-- EJM

DECLARE 
    v_country_id locations.country_id%TYPE := 'CA';
    v_location_id locations.location_id%TYPE;
    v_city locations.city%TYPE :='Montreal';
    v_counter NUMBER(2) := 1 ;
BEGIN
    SELECT MAX(location_id) INTO v_location_id FROM locations
    WHERE country_id = v_country_id;
    
    LOOP
        INSERT INTO locations(location_id,city,country_id)
        VALUES ((v_location_id + v_counter),v_city,v_country_id);
        v_counter := v_counter +1;
        EXIT WHEN v_counter >3 ;
    END LOOP;
END;

------------------------------------------------
-- FOR : [REVERSE] recorrido inverso
------------------------------------------------
FOR contador IN  [REVERSE]
    limite_inferior .. limite_superior LOOP
    sentencia1;
    sentencia2;
    ..
END LOOP;

-- EJM
