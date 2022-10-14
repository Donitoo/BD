/*3.3
Obtener y presentar la informacion de gastos en salario y estadistica de empleados
a nivel regional. Como encabezado de cada region presente el nombre de la region 
y en la siguiente linea indique como detalle la suma de salarios, cantidad de
empleados, y fecha de ingreso del empleado mas antiguo.
*/
set serveroutput on;

declare
    cursor m_Cursor is
        select r.region_name as REGION ,count(e.salary) as "#EMPLEADOS"
             ,sum(e.salary) as "Suma de salarios",min(hire_date) as "Mas antiguo"
        from employees e
            join departments d on e.department_id = d.department_id
            join locations l on d.location_id = l.location_id
            join countries c on l.country_id = c.country_id
            join regions r on c.region_id = r.region_id
        group by r.region_name;
    
    v_region regions.region_name%type;
    v_cantEmp number;
    v_sumSal number;
    v_fechaAnt date;
    
begin
    open m_Cursor;
    loop
    fetch m_Cursor into v_region,v_cantEmp,v_sumSal,v_fechaAnt;
    exit when m_Cursor%notfound;
    dbms_output.put_line('Region: ' || v_region ||
                    ' #Empleados: ' || v_cantEmp ||
                    ' Suma de salarios: '|| v_sumSal ||
                    ' Mas antiguo: ' || v_fechaAnt);
    end loop;
    close m_Cursor;
end;
/
