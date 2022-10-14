Funciones de conversion
TO_CHAR
TO_DATE
TO_NUMBER

DECLARE 
    v_date DATE := TO_DATE('12-JAN.2001','DD-MON-YYYY');
BEGIN
    ....

END;
/

v_date := 'January 13, 2001';
v_date := TO_DATE('January 13, 2001', 'Month DD, YYYY');
