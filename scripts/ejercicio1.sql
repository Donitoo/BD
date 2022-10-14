/*3.1
Obtener y presentar Codigo de Empleado, Nombres y Apellidos, Codigo de Puesto
actual y Nombre de Puesto actual, de los N empleados que han rotado mas de puesto
desde que ingresaron a la empresa, para cada uno de ellos presente como columna
adicional el numero de veces que han cambiado de puesto.
*/

set serveroutput on

declare
    v_employee_id employees.employee_id%type;
    v_firstName employees.first_name%type;
    v_lastName employees.last_name%type;
    v_job_id employees.job_id%type;
    v_job_title jobs.job_title%type;
    v_cant number := '&cant';
    v_rotaciones number;
    
    cursor m_Cursor is
        select 
            d.employee_id,e.first_name,
            e.last_name,j.job_id,
            j.job_title,d.rotaciones
        from employees e
        inner join (select employee_id,count(*) as Rotaciones
        from job_history
        group by employee_id) d
        on d.employee_id = e.employee_id
        inner join jobs j
        on e.job_id = j.job_id
        order by d.rotaciones desc;
begin
    open m_Cursor;
    loop
        fetch m_Cursor into v_employee_id,v_firstName,
            v_lastName,v_job_id,v_job_title,v_rotaciones;
        exit when m_Cursor%notfound or m_Cursor%rowcount>v_cant ;
        dbms_output.put_line('Id: '||v_employee_id||', FN: '||v_firstName||', LN: '||v_lastName||', JobID: '
                ||v_job_id||', Title: '||v_job_title||', R:'||v_rotaciones);
    end loop;
    close m_Cursor;
end;
/