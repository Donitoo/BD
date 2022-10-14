-- a. (4 puntos) Escriba un procedimiento que reciba como parámetro el código de un empleado, el
-- número de mes y el número de año. Calcule la cantidad de horas que falto el empleado en ese mes
-- y retorne el nombre del empleado, el año y mes respectivo, y la cantidad de horas que falto el
-- empleado.

CREATE OR REPLACE PROCEDURE CantidadHorasDebe
(
    p_employee_id IN employees.employee_id%TYPE,
    p_mes IN NUMBER(2),
    p_year IN NUMBER(4)
)
IS
BEGIN
    SELECT COUNT()
    INTO p_horasDebe
    FROM employees e inner join EmpleadoHorario eh 
    ON e.employee_id = eh.employee_id
    INNER JOIN AsistenciaEmpleado ae
    ON ae.employee_id = e.employee_id
    WHERE employee_id = p_employee_id
    AND to_char(ae.Fecha,'MM') = p_mes
    AND to_char(ae.Fecha,'YYYY') = p_year;
END CantidadHorasDebe;

-- b. (4 puntos) Escriba un procedimiento que reciba como parámetro el número del mes y el número de
-- año. Calcule para cada empleado en dicho mes y año el monto de sueldo que le corresponde de
-- acuerdo a las horas laboradas y las horas de falta utilizando el procedimiento anteriormente
-- enunciado. Finalmente, realice un reporte en el que se muestre el nombre del empleado, el apellido
-- del empleado, el salario que le corresponde en el mes y año.