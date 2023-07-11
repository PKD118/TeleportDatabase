-- DDL (Data Definition Language) - Table creation
CREATE TABLE Customers (
    customer_id NUMBER PRIMARY KEY,
    customer_name VARCHAR2(100),
    customer_address VARCHAR2(200),
    customer_phone VARCHAR2(20)
);

CREATE TABLE Couriers (
    courier_id NUMBER,
    courier_name VARCHAR2(100),
    courier_phone VARCHAR2(20),
	PRIMARY KEY(courier_id)
);

CREATE TABLE Orders (
    order_id NUMBER,
    customer_id NUMBER,
    courier_id NUMBER,
    order_date TIMESTAMP,
    status VARCHAR2(50),
	PRIMARY KEY(order_id),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
    FOREIGN KEY (courier_id) REFERENCES Couriers(courier_id)
);

CREATE TABLE Payments (
    payment_id NUMBER,
    order_id NUMBER,
    payment_amount NUMBER,
    payment_date TIMESTAMP,
	PRIMARY KEY(Payment_id),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id)
);

CREATE TABLE Tracking (
    tracking_id NUMBER PRIMARY KEY,
    order_id NUMBER,
    tracking_status VARCHAR2(100),
    tracking_date TIMESTAMP,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id)
);
