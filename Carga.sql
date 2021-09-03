insert into client(client_id,dba,register_date,email) values ('102','Protiviti','01-AUG-21','ventas@protiviti.com');
insert into client(client_id,dba,register_date,email) values ('103','Paycom','02-AUG-21','ventas@Paycom.com');
insert into client(client_id,dba,register_date,email) values ('104','QuikTrip','12-AUG-21','ventas@QuikTrip.com');
insert into client(client_id,dba,register_date,email) values ('105','Delta','02-AUG-21','ventas@Delta.com');
insert into client(client_id,dba,register_date,email) values ('106','Salesforce','02-AUG-21','ventas@Salesforce.com');
insert into client(client_id,dba,register_date,email) values ('107','Gensler','04-AUG-21','ventas@Gensler.com');
insert into client(client_id,dba,register_date,email) values ('108','Stryker','05-AUG-21','ventas@Stryker.com');
insert into client(client_id,dba,register_date,email) values ('109','Solar','14-AUG-21','ventas@Solar.com');

insert into Bread (bread_id,type,price) values ('100','Frybread',5);
insert into Bread (bread_id,type,price) values ('101','cornbread',6);
insert into Bread (bread_id,type,price) values ('102','Pan Graham',7);

insert into Orden(order_id,client_id,delivery_date,bread_quantity,total) values ('100','102','01-AUG-21',150,1050);
insert into Orden(order_id,client_id,delivery_date,bread_quantity,total) values ('101','103','02-AUG-21',20,140);
insert into Orden(order_id,client_id,delivery_date,bread_quantity,total) values ('102','104','03-AUG-21',40,280);
insert into Orden(order_id,client_id,delivery_date,bread_quantity,total) values ('103','105','03-AUG-21',120,740);
insert into Orden(order_id,client_id,delivery_date,bread_quantity,total) values ('104','106','03-AUG-21',80,400);
insert into Orden(order_id,client_id,delivery_date,bread_quantity,total) values ('105','107','04-AUG-21',90,450);
insert into Orden(order_id,client_id,delivery_date,bread_quantity,total) values ('106','108','04-AUG-21',100,1000);


insert into Order_item (order_id,bread_id,bread_quantity,subtotal) values ('100','100',150,750);
insert into Order_item (order_id,bread_id,bread_quantity,subtotal) values ('100','101',50,300);
insert into Order_item (order_id,bread_id,bread_quantity,subtotal) values ('101','102',20,140);
insert into Order_item (order_id,bread_id,bread_quantity,subtotal) values ('102','102',40,280);
insert into Order_item (order_id,bread_id,bread_quantity,subtotal) values ('103','100',30,150);
insert into Order_item (order_id,bread_id,bread_quantity,subtotal) values ('103','101',40,240);
insert into Order_item (order_id,bread_id,bread_quantity,subtotal) values ('103','102',50,350);
insert into Order_item (order_id,bread_id,bread_quantity,subtotal) values ('104','100',80,400);
insert into Order_item (order_id,bread_id,bread_quantity,subtotal) values ('105','100',90,450);
insert into Order_item (order_id,bread_id,bread_quantity,subtotal) values ('106','100',100,1000);

insert into Return (return_id,client_id,fecha,bread_quantity,total) values ('100','102',20,100);
insert into Return (return_id,client_id,fecha,bread_quantity,total) values ('101','107',10,50);
insert into Return (return_id,client_id,fecha,bread_quantity,total) values ('102','108',30,160);


insert into Return_item (return_id,bread_id,bread_quantity,subtotal) values ('100','100',20,100);
insert into Return_item (return_id,bread_id,bread_quantity,subtotal) values ('101','100',10,50);
insert into Return_item (return_id,bread_id,bread_quantity,subtotal) values ('102','100',20,100);
insert into Return_item (return_id,bread_id,bread_quantity,subtotal) values ('102','101',10,60);