/*3.8
Obtenga los nombres de los empleados que no estan registrados en el historial 
de sueldo (Job_history) y que trabajen en el departamento de marketing.
*/
set serveroutput on;
declare
    v_nombre employees.first_name%type;
    v_apellido employees.last_name%type;
    cursor m_Cursor 
        is (select first_name, last_name
        from employees
        where employee_id
            not in (
                select jh.employee_id
                from job_history jh)
            and department_id=20);
begin
    open m_Cursor;
    loop
        fetch m_Cursor into v_nombre,v_apellido;
        exit when m_Cursor%notfound;
        dbms_output.put_line('Nombre: '||v_nombre||' || Apellido: '||v_apellido);
    end loop;
    close m_Cursor;
exception
    when others then
        dbms_output.put_line('Algo inesperado ocurri�');
end;
/