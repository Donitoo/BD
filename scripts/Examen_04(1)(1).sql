-- (0.5 Punto) En la consola elabore las sentencias para crear las llaves primarias en capacitación y empleado_capacitacion.
Se asume que los campos ya estan creados en las tablas y solo se agregan los constraint.

ALTER TABLE Capacitacion
ADD CONSTRAINT PK_Capacitacion
    PRIMARY KEY(Capacitacion_ID);

ALTER TABLE empleado_capacitacion
ADD CONSTRAINT PK_EC
    PRIMARY KEY(Empleado_Capacitacion);

-- (1.0 Punto) En la consola elabore las sentencias para crear las llaves foráneas en capacitación y empleado_capacitacion. Las necesarias y suficientes para la consistencia de la base de datos.
Se asume que los campos ya estan creados en las tablas y solo se agregan los constraint.

ALTER TABLE Capacitacion
ADD CONSTRAINT FK_Capacitacion_Nivel
    FOREIGN KEY (NIVEL_ID)
    REFERENCES Nivel(NIVEL_ID);

ALTER TABLE empleado_capacitacion
ADD CONSTRAINT FK_EC_Capacitacion
    FOREIGN KEY (Capacitacion_ID)
    REFERENCES Capacitacion(Capacitacion_ID);

ALTER TABLE empleado_capacitacion
ADD CONSTRAINT FK_EC_Empleado
    FOREIGN KEY (EMPLOYEE_ID)
    REFERENCES EMPLOYEES(EMPLOYEE_ID);



-- (1.0 Punto) En la consola elabore las sentencias para crear la vista que muestre el nombre de la capacitación, la descripción de la capacitación, nombre del empleado, apellido del empleado y el número de horas que el empleado asistió a la capacitación en orden de este último campo.
CREATE VIEW Reporte_Capacitaciones_Empleado AS
SELECT C.Capacitacion_name,C.DESCRIPCION,E.FIRST_NAME,E.LAST_NAME,EC.HORAS_ASISTIDAS
FROM Empleado_Capacitacion EC
INNER JOIN Capacitacion C ON EC.Capacitacion_ID = C.Capacitacion_ID
INNER JOIN EMPLOYEES E ON E.EMPLOYEE_ID =  EC.EMPLOYEE_ID
ORDER BY HORAS_ASISTIDAS;



-- (0.5 Punto) En la consola elabore las sentencias para crear el índice para el campo de nombre del empleado y apellido del  empleado de la tabla employees.
CREATE INDEX I_Employees_apellidonombre
 on Employees(LAST_NAME,FIRST_NAME);
