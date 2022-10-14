-- Un paquete es un objeto de esquema que agrupa de forma logica tipos elementos y subprogramas relacionados PL/SQL

CREATE OR REPLACE PACKAGE emp_actions AS
    TYPE EmpRecTyp IS RECORD (emp_id INT, salary REAL);
    CURSOR desc_salary RETURN EmpRecTyp;
    PROCEDURE hire_employee (
        ename VARCHAR2,
        job VARCHAR2,
        mgr NUMBER,
        sal NUMBER,
        comm NUMBER,
        deptno NUMBER);
    PROCEDURE fire_employee (emp_id NUMBER);
END emp_actions;



CREATE OR REPLACE PACKAGE BODY emp_actions AS
    CURSOR desc_salary RETURN EmpRecTyp IS
        SELECT empno, sal FROM emp ORDER BY sal DESC;
    PROCEDURE hire_employee(
        ename VARCHAR2,
        job VARCHAR2,
        mgr NUMBER,
        sal NUMBER,
        COMM NUMBER,
        deptno NUMBER) IS
    BEGIN
        INSERT INTO emp VALUES (empno_seq.NEXTVAL, ename, job, mgr, SYSDATE, sal,comm,deptno);
    END hire_employee;

    PROCEDURE fire_employee (emp_id NUMBER) IS
    BEGIN
        DELETE FROM emp WHERE empno = emp_id;
    END fire_employee;
END emp_actions;
