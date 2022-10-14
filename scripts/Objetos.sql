CREATE TABLE Client(
    client_id NUMBER GENERATED ALWAYS AS IDENTITY,
    DBA     VARCHAR2(120) NOT NULL,
    register_date DATE DEFAULT sysdate NOT NULL,
    discount NUMBER(10,4) DEFAULT 0.00 NOT NULL,
    phone VARCHAR2(11) NOT NULL,
    email VARCHAR2(120) NOT NULL,
    password VARCHAR2(120) DEFAULT '12345' NOT NULL,

    CONSTRAINT PK_Client
    PRIMARY KEY(client_id)
)TABLESPACE LupitaBakery;


CREATE TABLE Orden(
    order_id    NUMBER GENERATED ALWAYS AS IDENTITY,
    client_id   NUMBER NOT NULL,
    register_date   DATE DEFAULT sysdate NOT NULL,
    delivery_date   DATE DEFAULT sysdate + 1 NOT NULL,
    bread_quantity  NUMBER(5) NOT NULL,
    total   NUMBER(10,4) NOT NULL,
    discount NUMBER(10,4) DEFAULT 0.00 NOT NULL,
    final_price NUMBER(10,4) NOT NULL,

    CONSTRAINT PK_Orden
    PRIMARY KEY(order_id),

    CONSTRAINT FK_Order_Client
    FOREIGN KEY (client_id)
    REFERENCES Client(client_id)
)TABLESPACE LupitaBakery;


CREATE TABLE Bread(
    bread_id NUMBER GENERATED ALWAYS AS IDENTITY,
    type VARCHAR2(120) NOT NULL,
    price NUMBER(10,4) DEFAULT 0.15 NOT NULL,

    CONSTRAINT PK_Bread
    PRIMARY KEY(bread_id)
)TABLESPACE LupitaBakery;


CREATE TABLE Order_item(
    order_id    NUMBER NOT NULL,
    bread_id NUMBER NOT NULL,
    bread_quantity NUMBER(5) NOT NULL,
    subtotal NUMBER(10,4) NOT NULL,

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
    return_id NUMBER GENERATED ALWAYS AS IDENTITY,
    client_id NUMBER NOT NULL,
    fecha DATE DEFAULT sysdate NOT NULL,
    bread_quantity NUMBER(5) NOT NULL,
    total NUMBER(10,4) NOT NULL,

    CONSTRAINT PK_Return
    PRIMARY KEY(return_id),

    CONSTRAINT FK_Return_Client
    FOREIGN KEY (client_id)
    REFERENCES Client(client_id)
)TABLESPACE LupitaBakery;


CREATE TABLE Return_item(
    return_id NUMBER NOT NULL,
    bread_id NUMBER NOT NULL,
    bread_quantity NUMBER(5) NOT NULL,
    subtotal NUMBER(10,4) NOT NULL,

    CONSTRAINT PK_Return_item
    PRIMARY KEY(return_id,bread_id),

    CONSTRAINT FK_Return_item_Return
    FOREIGN KEY (return_id)
    REFERENCES Return(return_id),

    CONSTRAINT FK_Return_item_Bread
    FOREIGN KEY (bread_id)
    REFERENCES Bread(bread_id)

)TABLESPACE LupitaBakery;


