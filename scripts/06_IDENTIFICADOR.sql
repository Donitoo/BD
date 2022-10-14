-- OUTER LLAMA AL ANTERIOR VARIABLE

<<outer>>
DECLARE
    V_SAL NUMBER(7,2) := 60000;
    V_COMM NUMBER(7,2) := V_SAL*.20;
    V_MESSAGE VARCHAR2(255) := ' elegilbe para comision';
BEGIN
    DECLARE
        V_SAL NUMBER(7,2) := 50000;
        V_COMM NUMBER(7,2) := 0;
        V_TOTAL_COMP NUMBER(7,2) := V_SAL + V_COMM;
    BEGIN
        V_MESSAGE := 'CAJERO no' || V_MESSAGE;
        outer.V_COMM := V_SAL*.30;
    END;

    V_MESSAGE := 'VENDEDOR' || V_MESSAGE;
END;
/