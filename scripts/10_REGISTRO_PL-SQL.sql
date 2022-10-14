TYPE nombre_tipo IS RECORD
    (declaracion_campo [, declaracion_campo]...);
identificador nombre_tipo;

Declaracion_campo es
nombre_campo{tipo_campo | variable%TYPE
| tabla.columna%TYPE | tabla%ROWTYPE}
[[NOT NULL] { := | DEFAULT} expr]


-- Declaramos un TIPO REGISTRO
TYPE emp_record_type IS RECORD
(
    last_name VARCHAR2(25),
    JOB_ID VARCHAR2(10),
    salary NUMBER(8,2));

-- Declaramos la VARIABLE de TIPO REGISTRO
emp_record emp_record_type;

-- ROWTYPE: SE PUEDE DECLARAR UN TIPO REGISTRO CON UNA TABLA

dept_record departments%ROWTYPE;
emp_record employees%ROWTYPE;

-- TIPO REGISTRO en CURSORES
DECLARE
    CURSOR emp_cursor IS
        SELECT * FROM emp;
    emp_record emp%ROWTYPE;
BEGIN
    OPEN emp_cursor;
    LOOP
        FETCH emp_cursor
        INTO emp_record
        EXIT WHEN emp_cursor%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE(emp_record.empno || ', ' || emp_record.ename);
    END LOOP
    CLOSE emp_cur;
END;
/