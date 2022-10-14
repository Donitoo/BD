
-- Manera formal de usar CURSORES
set serverouTput on
DECLARE 
    v_region regions.region_name%TYPE :='&region';
    v_paises countries.country_name%TYPE ;
    CURSOR paises_cursor is
        select c.country_name from countries c
        join regions r on c.region_id = r.region_id
        where r.region_name = v_region;
BEGIN
    dbms_output.put_line('El continente ' || v_region || ' tiene los siguientes paises ');
    open paises_cursor;
    LOOP 
    FETCH paises_cursor
    INTO v_paises;
    EXIT WHEN paises_cursor%NOTFOUND;
    dbms_output.put_line('Countries :' || v_paises);
    end loop;
    CLOSE paises_cursor;
END;
/
    
-- Manera mas abreviada de usar CURSORES

SET SERVEROUTPU ON
DECLARE
    v_region regions.region_name%TYPE := '&REGION';
    
    CURSOR cursor_paises IS
    SELECT c.country_name from countries c
        join regions r on c.region_id = r.region_id
        where r.region_name = v_region;
BEGIN
    FOR c_paises IN cursor_paises
    LOOP
        dbms_output.put_line('Pais :' || c_paises.country_name);
    END LOOP;
END;
/
    