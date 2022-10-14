/*new_bread*/
INSERT INTO Bread(type,price) VALUES(type,price);
/*get_bread*/
SELECT * FROM Bread;

/*get_client*/
SELECT * FROM Client_view;
/*new_client*/
INSERT INTO Client(DBA,phone,email,password) VALUES(dba,phone,email,password);

/*get_orders*/
SELECT * FROM Orden;
/*get_order*/
SELECT * FROM Orden WHERE client_id=client_id;
/*get_orderItems*/
SELECT * FROM Order_item WHERE order_id=order_id;

/*get_discount*/
SELECT discount FROM Cliente_view WHERE client_id=client_id;