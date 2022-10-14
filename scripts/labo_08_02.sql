-- ADMINISTRACIÓN DE PRIVILEGIOS

-- 1
CREATE USER EMI
    IDENTIFIED BY SAM
    DEFAULT TABLESPACE DATA1
    QUOTA 1M ON DATA1
    TEMPORARY TABLESPACE TEMP;

GRANT CONNECT,RESOURCE TO EMI;


-- 2
-- 2.1
create table oe.orders(
    order_id number(12) not null,
    line_item_id number(3) not null,
    product_id number(6) not null,
    unit_price number(8,2),
    quantity number(8)
);

-- 2.2
Insert into emi.orders select * from OE.orders;

-- 2.3
Grant selecT  on emi.customers to bob;

Que sucede
ERROR at line 1:
ORA-00990: missing or invalid privilege

Porque
Porque BOB no tiene la PRIVILEGIOS de Resources

-- 3
grant select on emi.orders
to bob with grant option;

GRANT SELECT ANY TABLE TO BOB;

-- 4
CREATE USER TREVOR
    IDENTIFIED BY SAM
    DEFAULT TABLESPACE DATA1
    QUOTA 1M ON DATA1
    TEMPORARY TABLESPACE TEMP;

GRANT CONNECT TO TREVOR;

-- 5
-- 5.1

GRANT SELECT ON EMI.CUSTOMERS TO TREVOR;
ALTER USER BOB IDENTIFIED BY sam;

-- 5.2
REVOKE SELECT ON EMI.CUSTOMERS FROM BOB;

-- 5.3
No se puede acceder a la tabla, ya que el usuario bob quien le otorgo los permisos a Trevor, ya no tiene permisos para la tabla customers.

-- 6
-- 6.1
GRANT create ANY table TO Emi;
CREATE TABLE bob.orders as (select * from emi.orders);

-- 6.2
select * from DBA_TABLES where owner='bob';

-- 7
GRANT SYSOPER TO C##EMI;