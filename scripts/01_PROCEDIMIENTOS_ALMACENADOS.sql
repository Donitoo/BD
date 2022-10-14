-- PARAMETROS EN PL/SQL
-- listar en el mismo orden
POSICIONAL

-- listar parametros reales en cualquier orden asociandoles sus parametros correspondientes
NOMBRADO

-- Listar algunos de los parametros reales como posicionales y otros como nombrados: POSICIONAL y NOMBRADO
COMBINACION


IN      Por defecto, implicito no es necesario declararlo.
OUT     No se puede inicializar
IN OUT  No se puede inicializar


-------------------------------------
-- OUT
-------------------------------------
CREATE OR REPLACE PROCEDURE query_emp
(
    p_id IN employees.employee_id%TYPE,
    p_name OUT employees.last_name%TYPE,
    p_salary OUT employees.salary%TYPE,
    p_comm OUT employees.commission_pct%TYPE
)
IS
BEGIN
    SELECT last_name,salary,commission_pct
    INTO p_name,p_salary,p_comm
    FROM employees
    WHERE employee_id = p_id;
END query_emp;

-- Llama al procedimiento
VARIABLE g_name VARCHAR2(25);
VARIABLE g_sal NUMBER;
VARIABLE g_comm NUMBER;
EXECUTE query_emp(171, :g_name, :g_sal, :g_comm);
PRINT g_name



-------------------------------------
-- IN OUT
-------------------------------------
CREATE OR REPLACE PROCEDURE format_phone
(
    p_phone_no IN OUT VARCHAR2
)
IS 
BEGIN
p_phone_no := '(' || SUBSTR(p_phone_no,1,3) || ')' || SUBSTR(p_phone_no,4,3) || '-' || SUBSTR(p_phone_no,7);
END format_phone;

-- Declaramos una variable
variable g_phone_no VARCHAR2(15);
BEGIN
:g_phone_no := '8006330575';
END;
/
PRINT g_phone_no;

-- Llamamos al procedimiento almacenado
EXECUTE format_phone(:g_phone_no);
PRINT g_phone_no;


-------------------------------------
-- parametros al momento de llamar un procedimiento almacenado
-------------------------------------

CREATE OR REPLACE PROCEDURE add_dept
(
    p_name IN departments.department_name%TYPE DEFAULT 'unknown',
    p_loc departments.location_id%TYPE DEFAULT 1700
)
IS
BEGIN
    INSERT departments(department_id,department_name,location_id)
    VALUES(departments_seq.NEXTVAL,p_name,p_loc);
END add_dept;

-- Llamar al procedimiento por parametros

BEGIN
    add_dept;
    add_dept('TRAINING',2500);
    add_dept(p_loc=>2400,p_name=>'EDUCATION');
    add_dept(p_loc => 1200);
END;
/