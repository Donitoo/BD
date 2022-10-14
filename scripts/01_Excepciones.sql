-- King hay varios apellidos
-- Austin solo uno
variable g_puesto varchar2;
declare
    v_nombre employees.last_name%type := 'King';
begin
    select j.job_title
    into :g_puesto
    from employees e join jobs j on e.job_id = j.job_id
    WHERE e.last_name = v_nombre;
exception
    when too_many_rows then 
        :g_puesto := 'Más de dos personas que tienen igual apellido';
end;
/
print g_puesto;