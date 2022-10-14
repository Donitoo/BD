/*3.6
Obtenga el apellido del empleado, nombre de departamento y id de puesto de todos
los empleados cuya direccion de localizacion del departamento esta en la quinta
avenida (columna street_address).
*/
set serveroutput on;
declare
    v_apellido employees.first_name%type;
    v_depName departments.department_name%type;
    v_empId employees.employee_id%type;
    v_street locations.street_address%type := '2014 Jabberwocky Rd';
    
    cursor m_Cursor is 
        select e.last_name,d.department_name,e.employee_id
        from employees e
        join departments d on e.department_id = d.department_id
        join locations l on d.location_id = l.location_id
        where l.street_address=v_street;
begin
    open m_Cursor;
    loop
        fetch m_Cursor into v_apellido,v_depname,v_empid;
        exit when m_Cursor%notfound;
        dbms_output.put_line('Apellido: '||v_apellido||' | Dep: '||v_depname||' | Id: '||v_empId);
    end loop;
    if m_Cursor%rowcount = 0 then
        dbms_output.put_line('Sin direccion');
    end if;
    close m_Cursor;
end;
/