/*(3 puntos) Elabore las sentencias de SQL que respondan a las siguientes preguntas en base a la Diagrama No 1 que se pone a continuación.*/

-- Obtenga la lista de nombres y apellidos de los empleados que no han asistido a ninguna capacitación. El resultado ordénelos alfabéticamente.
SELECT E.FIRST_NAME, E.LAST_NAME
FROM Empleado_Capacitacion EC
RIGHT JOIN EMPLOYEES E ON E.EMPLOYEE_ID =  EC.employee_id
WHERE EC.employee_id IS NULL;


-- Obtenga los nombres y apellidos de todos los empleados junto con la cantidad de capacitaciones a las que han asistido estos empleados. El resultado ordénelo del empleado con mayor cantidad de capacitaciones a la menor cantidad de capacitaciones.
SELECT E.FIRST_NAME, E.LAST_NAME, SUM(EC.employee_id)
FROM Empleado_Capacitacion EC
INNER JOIN JOIN EMPLOYEES E ON E.EMPLOYEE_ID =  EC.employee_id 
GROUP BY E.EMPLOYEE_ID


-- Actualice el salario de todos los empleados de la empresa que han realizado capacitaciones, con un aumento del salario del empleado: 5% si tiene 10 capacitaciones de técnico, 10% si tiene 7 capacitaciones de experto, 15% si tiene 4 capacitaciones de especialista y 0% si no tiene ninguna capacitación. Solo se aplica una regla por empleado.