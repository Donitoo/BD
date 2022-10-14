/*3.5
Obtenga todos los nombres de departamentos, los nombres y apellidos de los
empleados que no son jefes de departamento (Managment_ID en Departments).
*/
set serveroutput on;

declare
    v_depNameTemp departments.department_name%type;
    v_depName departments.department_name%type;
    v_nombre employees.first_name%type;
    v_apellido employees.last_name%type;
    
    cursor m_Cursor is 
        select d.department_name,e.first_name, e.last_name
        from employees e
        join departments d on e.department_id = d.department_id
        where e.employee_id not in (
                    select d2.manager_id
                    from departments d2
                    where d2.manager_id is not null)
                and e.department_id is not null
        order by d.department_name;
begin
    open m_Cursor;
    fetch m_Cursor into v_depName,v_nombre,v_apellido;
    if m_Cursor%found then
        v_depNameTemp := v_depName;
        dbms_output.put_line('Departamento '||v_depNameTemp);        
        dbms_output.put_line('Empleado: '||v_nombre||' '||v_apellido);
        loop
            fetch m_Cursor into v_depName,v_nombre,v_apellido;
            exit when m_Cursor%notfound;
            if v_depNameTemp <> v_depName then
                v_depNameTemp := v_depName;
                dbms_output.put_line('');
                dbms_output.put_line('Departamento '||v_depNameTemp);
            end if;
            dbms_output.put_line('Empleado: '||v_nombre||' '||v_apellido);
        end loop;
    else
        dbms_output.put_line('Sin empleados');
    end if;
    close m_Cursor;
end;
/
