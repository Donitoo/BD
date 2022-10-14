-- King hay varios apellidos
-- Austin solo uno

set SERVEROUTPUT ON
DEFINE p_name = 'Austin'

DECLARE
    v_nombre employees.last_name%TYPE := '&p_name';
    v_puesto jobs.job_title%TYPE;
    
BEGIN
    select j.job_title
    into v_puesto
    from employees e join jobs j on e.job_id = j.job_id
    WHERE e.last_name = v_nombre;
    dbms_output.put_line('El empleado: '|| v_nombre || 'con puesto: ' || v_puesto);
exception
    when too_many_rows then 
    dbms_output.put_line( 'Más de dos personas que tienen igual apellido');
end;
/