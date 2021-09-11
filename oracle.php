<?php
$db = "(DESCRIPTION =
        (ADDRESS = (PROTOCOL = TCP)(HOST = localhost)(PORT = 1521))
        (CONNECT_DATA =
          (SERVER = DEDICATED)
          (SERVICE_NAME = orcl)
        )
      )" ;
    $connect = oci_connect("LupitaBakery", "12345", $db);
    var_dump($connect);
     $query = "SELECT * from bread";

$result = oci_parse($connect, $query);

  oci_execute($result);
 $tmpcount = oci_fetch($result);
 var_dump($tmpcount);
     if ($tmpcount==1) {
        echo "Login Success";}
    else
    {
        echo "Login Failed";
    }
oci_execute($result);

$asd = oci_fetch($result) ;
var_dump($asd);
   while (oci_fetch($result)) {
        echo oci_result($result, 'TYPE') . " es ";
        echo oci_result($result, 'PRICE') . "<br>\n";
 }

# show pdbs;
/*
Desplácese a C:\app\OracleHomeUser1\product\12.1.0\dbhome_1\NETWORK\ ADMIN. Haga
doble clic en tnsnames.ora para ver la configuración de la red.

Verá que se ha creado un alias de conexión denominado "ORCL". Este alias "ORCL" apunta
a la base de datos de contenedores con el nombre de servicio "ORCL".

Cree un alias de conexión de base de datos denominado "PDBORCL" y especifique los
parámetros de configuración de red para acceder a la base de datos acoplable "PDBORCL"
que creamos durante la instalación. Copie el siguiente código y péguelo en el archivo
tnsnames.ora. Si es necesario, modifique el host y el puerto para que coincidan con los
valores del alias de ORCL.
PDBORCL =
(DESCRIPTION =
(ADDRESS = (PROTOCOL = TCP)(HOST = localhost)(PORT = 1521))
(CONNECT_DATA =
(SERVER = DEDICATED)
(SERVICE_NAME = pdborcl)
)
)

● Abra un símbolo del sistema y ejecute el siguiente comando. Este comando utiliza SQL * Plus
para conectarse a la base de datos conectable como administrador del sistema
sqlplus sys/oracle@pdborcl as sysdba

De forma predeterminada, el esquema HR está bloqueado. Ejecute el siguiente comando
para desbloquear el esquema HR.

alter user hr identified by hr account unlock;

Ejecute los siguientes comandos para conectarse al esquema HR en la base de datos
conectable y consulte la tabla EMPLOYEES.

connect hr/hr@pdborcl
select count(*) from employees;

*/

?>