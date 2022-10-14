insert into client(client_id,dba,register_date,email) values ('102','Protiviti','01-AUG-21','ventas@protiviti.com','12345');
insert into client(client_id,dba,register_date,email) values ('103','Paycom','02-AUG-21','ventas@Paycom.com','12345');
insert into client(client_id,dba,register_date,email) values ('104','QuikTrip','12-AUG-21','ventas@QuikTrip.com','12345');
insert into client(client_id,dba,register_date,email) values ('105','Delta','02-AUG-21','ventas@Delta.com','12345');
insert into client(client_id,dba,register_date,email) values ('106','Salesforce','02-AUG-21','ventas@Salesforce.com','12345');
insert into client(client_id,dba,register_date,email) values ('107','Gensler','04-AUG-21','ventas@Gensler.com','12345');
insert into client(client_id,dba,register_date,email) values ('108','Stryker','05-AUG-21','ventas@Stryker.com','12345');
insert into client(client_id,dba,register_date,email) values ('109','Solar','14-AUG-21','ventas@Solar.com','12345');

insert into Bread (bread_id,type,price) values ('100','Frybread',0.15);
insert into Bread (bread_id,type,price) values ('101','Cornbread',0.15);
insert into Bread (bread_id,type,price) values ('102','Pan Graham',0.15);

insert into Orden(order_id,client_id,delivery_date,bread_quantity,total) values ('100','102','01-AUG-21',150,22.5);
insert into Orden(order_id,client_id,delivery_date,bread_quantity,total) values ('101','103','02-AUG-21',200,30);
insert into Orden(order_id,client_id,delivery_date,bread_quantity,total) values ('102','104','03-AUG-21',400,60);
insert into Orden(order_id,client_id,delivery_date,bread_quantity,total) values ('103','105','03-AUG-21',120,18);
insert into Orden(order_id,client_id,delivery_date,bread_quantity,total) values ('104','106','03-AUG-21',800,120);
insert into Orden(order_id,client_id,delivery_date,bread_quantity,total) values ('105','107','04-AUG-21',900,135);
insert into Orden(order_id,client_id,delivery_date,bread_quantity,total) values ('106','108','04-AUG-21',100,15);


insert into Order_item (order_id,bread_id,bread_quantity,subtotal) values ('100','100',100,15);
insert into Order_item (order_id,bread_id,bread_quantity,subtotal) values ('100','101',50,7.5);
insert into Order_item (order_id,bread_id,bread_quantity,subtotal) values ('101','102',200,30);
insert into Order_item (order_id,bread_id,bread_quantity,subtotal) values ('102','102',400,60);
insert into Order_item (order_id,bread_id,bread_quantity,subtotal) values ('103','100',20,3);
insert into Order_item (order_id,bread_id,bread_quantity,subtotal) values ('103','101',50,7.5);
insert into Order_item (order_id,bread_id,bread_quantity,subtotal) values ('103','102',50,7.5);
insert into Order_item (order_id,bread_id,bread_quantity,subtotal) values ('104','100',800,120);
insert into Order_item (order_id,bread_id,bread_quantity,subtotal) values ('105','100',900,135);
insert into Order_item (order_id,bread_id,bread_quantity,subtotal) values ('106','100',100,15);

insert into Return (return_id,client_id,bread_quantity,total) values ('100','102',20,3);
insert into Return (return_id,client_id,bread_quantity,total) values ('101','107',10,1.5);
insert into Return (return_id,client_id,bread_quantity,total) values ('102','108',30,4.5);


insert into Return_item (return_id,bread_id,bread_quantity,subtotal) values ('100','100',20,3);
insert into Return_item (return_id,bread_id,bread_quantity,subtotal) values ('101','100',10,1.5);
insert into Return_item (return_id,bread_id,bread_quantity,subtotal) values ('102','100',20,3);
insert into Return_item (return_id,bread_id,bread_quantity,subtotal) values ('102','101',10,1.5);