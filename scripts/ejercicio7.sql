/*3.7
Obtenga los nombres y apellidos de todos los empleados que hayan desempeñado 
los mismos puestos que el empleado Juan Perez.
*/
set serveroutput on;
declare
    v_nombre employees.first_name%type := '&nombre';
    v_apellido employees.last_name%type := '&apellido';
    v_nombreTemp employees.first_name%type;
    v_apellidoTemp employees.last_name%type;
    v_empId employees.employee_id%type;
    
    cursor m_Cursor is
        (
        select first_name,last_name
        from employees
        where job_id not in (
                select job_id
                from employees
                where employee_id = (
                                select employee_id
                                from employees
                                where first_name = v_nombre 
                                        and last_name=v_apellido
                                )
                union
                select job_id
                from job_history
                where employee_id = (
                                select employee_id
                                from employees
                                where first_name = v_nombre 
                                    and last_name=v_apellido
                                    )
                )
        );

begin
    open m_Cursor;
    
    select employee_id
    into v_empid
    from employees
    where first_name=v_nombre
        and last_name=v_apellido;
        
    loop
        fetch m_Cursor into v_nombreTemp,v_apellidoTemp;
        exit when m_Cursor%notfound;
        dbms_output.put_line('Nombre: '||v_nombreTemp||' || Apellido: '||v_apellidoTemp);
    end loop;
    
    close m_Cursor;
exception
    when no_data_found then
        dbms_output.put_line('No existe el empleado');
end;
/