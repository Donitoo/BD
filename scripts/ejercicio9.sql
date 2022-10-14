/*3.9
Obtenga todos los nombres de empleados y su tiempo de servicio en la empresa.
*/
declare
    cursor m_Cursor
        is (
            select e2.first_name,e2.last_name, min(fecha),max(fecha)
            from (
                select employee_id,hire_date as fecha
                from employees
                union
                select employee_id,end_date
                from job_history
                order by employee_id,fecha) e1
            join employees e2 on e1.employee_id = e2.employee_id
            group by e1.employee_id,e2.first_name,e2.last_name
        );
    v_fechaInicial date;
    v_fechaFinal date;
    v_nombre employees.first_name%type;
    v_apellido employees.last_name%type;
    v_totalDias number;
begin
    open m_Cursor;
    loop
        fetch m_Cursor into v_nombre,v_apellido,v_fechaInicial,v_fechaFinal;
        exit when m_Cursor%notfound;
        if v_fechaInicial = v_fechaFinal then
            v_fechaFinal := sysdate;
        end if;
        v_totalDias := trunc(v_fechaFinal - v_fechaInicial);
        dbms_output.put_line('Nom:'||v_nombre||' || Ape:'||v_apellido||' || Dias:'||v_totalDias);
    end loop;
    close m_Cursor;
end;
/