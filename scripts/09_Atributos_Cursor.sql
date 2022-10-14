SQL: Sentencia SQL
-- Numero de filas afectadas por SQL mas reciente
SQL%ROWCOUNT

-- TRUE si la sentencia SQL mas reciente afecta a uno o mas registros
SQL%FOUND

-- TRUE si la sentencia SQL mas reciente no afecta a uno o mas registros
SQL%NOTFOUND

-- FALSE si el cursor implicito es cerrado despues de su ejecucion.Siempre se evaluan FALSE ya que PL/SQL los cierra.
SQL%ISOPEN


-- EJM: CURSOR IMPLICITO
VARIABLE rows_deleted VARCHAR2(30);

DECLARE
    v_employee_id employees.employee_id%TYPE := 176;
BEGIN
    DELETE FROM employees
    WHERE employees.employee_id = v_employee_id;
    
    :rows_deleted := (SQL%ROWCOUNT || 'row delete');
END;
/
PRINT rows_deleted;

-- EJM: CURSOR EXPLICITO
DECLARE
    CURSOR emp_cursor IS
        SELECT empno,ename from emp;
    v_empno emp.empno%TYPE;
    v_ename emp.ename%TYPE;
BEGIN
    OPEN emp_cursor;
    LOOP
        FETCH emp_cursor 
        INTO v_empno,v_ename;
        EXIT WHEN emp_cursor%NOTFOUND;
        dbms_output.put_line(v_empno || ', '|| v_ename);
    END LOOP;
    CLOSE emp_cursor;
END;
/

-- Manera mas abreviada de usar CURSORES
DECLARE
    CURSOR emp_cursor
    IS
        SELECT ename, sal
        FROM emp
        WHERE deptno = 10
        ORDER BY sal DESC;
BEGIN
    FOR emp_rec IN emp_cur
    LOOP
        DBMS_OUTPUT.PUT_LINE(
            'Employee ' || emp_rec.ename || ' earns ' || TO_CHAR(emp_rec.sal) || ' dollars.');
    END LOOP;
END;
/