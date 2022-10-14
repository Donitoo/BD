/*
Elabore un resumen estadistico del numero promedio de contrataciones
por cada mes con respecto a todos los años que hay informacion en la
base de datos. Debe presentar solo dos columnas: Nombre del Mes y 
Numero Promedio de Contrataciones en ese Mes.
*/
set serveroutput on

declare
    v_cantContratados number := 1;
    v_totalYear number := 1;
    v_mes number;
    v_year number;
    v_mesTemp number;
    v_yearTemp number;
    v_avg number(3,2);
    
    cursor m_Cursor is
        select
            to_char(hire_date,'MM') as MES,
            to_char(hire_date,'yyyy') as AÑO
        from employees
        order by MES,AÑO;
begin
    open m_Cursor;
    fetch m_Cursor into v_mes,v_year;
    if m_Cursor%found then
        v_mesTemp := v_mes;
        v_yearTemp := v_year;        
        loop
            fetch m_Cursor into v_mes,v_year;
            exit when m_Cursor%notfound;
            if v_mesTemp <> v_mes then
                v_avg := v_cantContratados/v_totalYear;
                dbms_output.put_line('#Contratados: '||v_cantContratados||' #Años: '||v_totalYear);
                dbms_output.put_line('Mes: '||v_mesTemp||' AVG: '||v_avg);
                dbms_output.put_line('');
                v_cantContratados := 1;
                v_totalYear := 1;
                v_mesTemp := v_mes;
            elsif v_yearTemp <> v_year then
                v_yearTemp := v_year;
                v_cantContratados := v_cantContratados +1;
                v_totalYear := v_totalYear + 1;
            else
                v_cantContratados := v_cantContratados + 1;
            end if;
        end loop;
        v_avg := v_cantContratados/v_totalYear;
        dbms_output.put_line('#Contratados: '||v_cantContratados||' #Años: '||v_totalYear);
        dbms_output.put_line('Mes: '||v_mesTemp||' AVG: '||v_avg);
    else
        dbms_output.put_line('No hay datos para generar estadisticas');
    end if;
    
    close m_Cursor;
end;
/
