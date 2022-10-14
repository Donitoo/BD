/*3.4
Obtenga todos los nombres de los empleados que estan registrado en el historial de
sueldo y que no desempeñen el mismo que el puesto actual.
*/
set serveroutput on

declare
    v_nombre employees.first_name%type;
    v_apellido employees.last_name%type;
    
    cursor m_Cursor is
        select distinct e.first_name,e.last_name
        from employees e
        join job_history jh on e.employee_id = jh.employee_id
        where e.job_id <> jh.job_id;
begin
    open m_Cursor;
    dbms_output.put_line('Cambiaron de puesto');
    loop
        fetch m_Cursor into v_nombre, v_apellido;
        exit when m_Cursor%notfound;
        dbms_output.put_line('Nombre - apellido: '||v_nombre||' '||v_apellido);
    end loop;
    close m_Cursor;
end;
/