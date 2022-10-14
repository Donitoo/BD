-- TRIGGER
Tiempo del Triger (Trigger Timing)
TABLA: BEFORE, AFTER
VISTA: INSTEAD OF

Evento del Trigger (Triggering Event)
INSERT
UPDATE 
DELETE

Nombre de Tabla
ON Tabla
ON vista

Tipo de Trigger
Fila
Sentencia

Clausula WHEN
Condicion de restricción

Cuerpo del Trigger Bloque PL/SQL

Tiempo del Trigger
¿Cuando deberia lanzarse?

-- Ejecuta el cuerpo del trigger
Antes que el evento DML sobre la tabla
Antes que haga el insert,UPDATE, etc
BEFORE

-- Ejecuta el cuerpo del trigger
Despues del evento DML sobre la tabla
AFTER

-- Ejecuta el cuerpo del trigger
en vez de la sentencia que lanza el trigger
INSTEAD OF



BEFORE ROW TRIGGER
AFTER ROW TRIGGER
AFTER STATEMENT TRIGGER

CREATE OR REPLACE TRIGGER nombre_trigger
tiempo
event1 [OR event2 OR event3]
ON nombre_tabla
cuerpo trigger


CREATE OR REPLACE TRIGGER secure_emp
    BEFORE INSERT ON employees
BEGIN
    IF (TO_CHAR(SYSTDATE,'Y') IN ('SAT','SUN')) OR (TO_CHAR(SYSDATE,'HH24:MI')
    NOT BEETWEN '09:00' AND '18:00' THEN
    RAISE_APPLICATION _ERROR (-20500,'You may insert into EMPLOYEES TABLE ONLY' || 'during business hours.');
    end IF;
end;


INSERT 
    INTO employees
        (employee_id,last_name,first_name,email,hire_date,hob_id,salary,department_id)
    VALUES (300,'Smith','Rob','RSMITH',SYSDATE,'IT_')