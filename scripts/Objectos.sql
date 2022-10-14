CREATE TABLE Client(
    client_id VARCHAR2(6),
    DBA     VARCHAR2(120),
    register_date DATE,
    discount NUMBER(1),
    phone VARCHAR2(11),
    email VARCHAR2(120),

    CONSTRAINT PK_Client
    PRIMARY KEY(client_id)
)TABLESPACE LupitaBakery;


CREATE TABLE Orden(
    order_id    VARCHAR2(12),
    client_id   VARCHAR2(6),
    register_date   DATE,
    delivery_date   DATE,
    bread_quantity  NUMBER,
    total   NUMBER,

    CONSTRAINT PK_Orden
    PRIMARY KEY(order_id),

    CONSTRAINT FK_Order_Client
    FOREIGN KEY (client_id)
    REFERENCES Client(client_id)
)TABLESPACE LupitaBakery;


CREATE TABLE Bread(
    bread_id VARCHAR2(6),
    type VARCHAR2(120),
    price NUMBER,

    CONSTRAINT PK_Bread
    PRIMARY KEY(bread_id)
)TABLESPACE LupitaBakery;


CREATE TABLE Order_item(
    order_id    VARCHAR2(12),
    bread_id VARCHAR2(6),
    bread_quantity NUMBER,
    subtotal NUMBER,

    CONSTRAINT PK_Order_item
    PRIMARY KEY(order_id,bread_id),

    CONSTRAINT FK_Order_item_Orden
    FOREIGN KEY (order_id)
    REFERENCES Orden(order_id),

    CONSTRAINT FK_Order_item_Bread
    FOREIGN KEY (bread_id)
    REFERENCES Bread(bread_id)
)TABLESPACE LupitaBakery;


CREATE TABLE Return(
    return_id VARCHAR2(12),
    client_id VARCHAR2(6),
    fecha DATE,
    bread_quantity NUMBER,
    total NUMBER,

    CONSTRAINT PK_Return
    PRIMARY KEY(return_id),

    CONSTRAINT FK_Return_Client
    FOREIGN KEY (client_id)
    REFERENCES Client(client_id)
)TABLESPACE LupitaBakery;


CREATE TABLE Return_item(
    return_id VARCHAR2(12),
    bread_id VARCHAR(6),
    bread_quantity NUMBER,
    subtotal NUMBER,

    CONSTRAINT PK_Return_item
    PRIMARY KEY(return_id,bread_id),

    CONSTRAINT FK_Return_item_Return
    FOREIGN KEY (return_id)
    REFERENCES Return(return_id),

    CONSTRAINT FK_Return_item_Bread
    FOREIGN KEY (bread_id)
    REFERENCES Bread(bread_id)

)TABLESPACE LupitaBakery;


