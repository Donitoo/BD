DECLARE
    v_job VARCHAR2(9);
    v_count BINARY_INTEGER :=0;
    v_total_sal NUMBER(9,2) := 0;
    v_orderdate DATE := SYSDATE + 7;
    c_tax_rate CONSTANT NUMBER(3,2):= 8.25;
    v_valid BOOLEAN NOT NULL := TRUE;

    v_name employees.last_name%TYPE;
    v_balance NUMBER(7,2);
    v_min_balance v_balance%TYPE := 10;

-- TRUE , FALSE y NULL
BOOLEAN

-- Variable global
VARIABLE g_salary NUMBER;

BEGIN
    select salary
    INTO :g_salary
    FROM employees
    WHERE employee_id = 178
END;
/
PRINT g_salary

-- Referencias variables NO-PL/SQL
:g_salary := v_sal/12


