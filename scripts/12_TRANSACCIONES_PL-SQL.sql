-- Grabacion fisica en la base de datos
COMMIT

-- Deshacer los cambios del COMMIT
ROLLBACK

-- indica que realizara COMMIT por cada instruccion si esta en ON o no si esta en OFF
AUTOCOMMIT


-- En Oracle POR DEFECTO esta en OFF
SET AUTO[COMMIT] {OFF | ON | INMEDIATE | statenebt_count}

-- Si esta en OFF, el ORACLE espera la sentencia COMMIT para hacer que todos los cambios sean permanentes


-- Usar las sentencias 
COMMINT y ROLLBACK -- para finalizar de manera explicita una transaccion

-- Puntos de control
SAVEPOINT Nombre_punto_control;

COMMIT TO N1_punto_control;
ROLLBACK TO N2_punto_contro;

-- Control de Concurrencia

-- Bloqueos compartidos(o bloqueos S)
LOCK TABLE TableName IN SHARE MODE;

-- Bloqueos exclusivos ( bloqueos X )
LOCK TABLE TableName IN EXCLUSIVE MODE;

-- Bloqueos compartidos a nivel de fila (bloqueos RS)
LOCK TABLE TableName IN ROW SHARE MODE;

-- Bloqueos exclusivos a nivel de fila (Bloqueos RX)
LOCK TABLE TableName IN ROW EXCLUSIVE MODE;

-- Bloqueo exclusivo de nivel de fila (bloqueo SRX)
LOCK TABLE TableName IN SHARE ROW EXCLUSIVE MODE;


