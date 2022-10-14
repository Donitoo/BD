-- TABLAS INDEX BY

-- 2 COMPONENTES
-- BINARY_INTEGER: llave primaria de tipo de datos
-- Columna de tipo de dato escalar o registro

TYPE nombre_tipo IS TABLE OF
    {tipo_columna | variable%TYPE 
    | tabla.columna%TYPE} [NOT NULL]
    | tabla%ROWTYPE
[INDEX BY BINARY_INTEGER];

-- Declaramos
identificador nombre_tipo;

-- EJM
TYPE ename_table_type IS TABLE OF
    employees.last_name%TYPE
    INDEX BY BINARY_INTEGER;
Ena-me_table ename_table_type;

-- Metodos de tablas INDEX BY
INDEX BY:
    EXISTS(n) -- Exitencia
    COUNT -- contar
    FIRST y LAST -- ir a primero o ultimo
    PRIOR(n) -- ir al anterior
    NEXT(n) -- ir al siguiente
    TRIM
    DELETE -- Eliminacion

-- ejm
SET serverouTput on
DECLARE
    TYPE emp_table_type IS TABLE OF
        employees%ROWTYPE
    INDEX BY BINARY_INTEGER;

    my_emp_table emp_table_type;
    v_count NUMBER(3) := 104;
BEGIN
    FOR i IN 100..v_count
    LOOP
        SELECT * INTO my_emp_table(i)
        FROM employees
        WHERE employee_id = i;
    END LOOP;

    FOR i IN my_emp_table.FIRST..my_emp_table.LAST
    LOOP
        DBMS_OUTPUT.PUT_LINE(my_emp_table(i).last_name);
    END LOOP;
END;
/
