
INSERT INTO Customers (customer_id, customer_name, customer_address, customer_phone) VALUES (1, 'Biduyt', '123 Main St, Anytown, USA', '01736716190');
INSERT INTO Customers (customer_id, customer_name, customer_address, customer_phone) VALUES (2, 'Biplob', 'Dr. M A Rashid Hall, KUET', '01729724644');
INSERT INTO Customers (customer_id, customer_name, customer_address, customer_phone) VALUES (3, 'Parmith', 'Sunamgonj', '01585463222');
INSERT INTO Customers (customer_id, customer_name, customer_address, customer_phone) VALUES (4, 'Shuvo', 'Sylhet', '01893097217');
INSERT INTO Customers (customer_id, customer_name, customer_address, customer_phone) VALUES (5, 'Rony', 'Chittagong', '01893361863');
INSERT INTO Customers (customer_id, customer_name, customer_address, customer_phone) VALUES (6, 'Satyajit', 'Dhaka', '01712817152');
INSERT INTO Customers (customer_id, customer_name, customer_address, customer_phone) VALUES (7, 'Doniel', 'Khagrachori', '01711911634');
INSERT INTO Customers (customer_id, customer_name, customer_address, customer_phone) VALUES (8, 'Labib', 'Khulna', '01753398111');
INSERT INTO Customers (customer_id, customer_name, customer_address, customer_phone) VALUES (9, 'Sumon', 'Jessore', '01756061375');
INSERT INTO Customers (customer_id, customer_name, customer_address, customer_phone) VALUES (10, 'Nibir', 'Dhaka', '01637793410');

INSERT INTO Couriers (courier_id, courier_name, courier_phone) VALUES (1, 'Fast Express', '01701806551');
INSERT INTO Couriers (courier_id, courier_name, courier_phone) VALUES (2, 'Aramex', '01786222020');
INSERT INTO Couriers (courier_id, courier_name, courier_phone) VALUES (3, 'Chowdhury Transport', '01787139760');
INSERT INTO Couriers (courier_id, courier_name, courier_phone) VALUES (4, 'PKDAS', '01622069242');
INSERT INTO Couriers (courier_id, courier_name, courier_phone) VALUES (5, 'Paperfly', '01754046917');
INSERT INTO Couriers (courier_id, courier_name, courier_phone) VALUES (6, 'Bulletz', '01759608171');
INSERT INTO Couriers (courier_id, courier_name, courier_phone) VALUES (7, 'Fotonspeed', '01712358125');
INSERT INTO Couriers (courier_id, courier_name, courier_phone) VALUES (8, 'Agun parabot', '01787305188');
INSERT INTO Couriers (courier_id, courier_name, courier_phone) VALUES (9, 'souza press', '01788573431');
INSERT INTO Couriers (courier_id, courier_name, courier_phone) VALUES (10, 'LOOTZ', '01757348848');

INSERT INTO Orders (order_id, customer_id, courier_id, order_date, status) VALUES (1, 1, 1,TRUNC(SYSDATE), 'Shipped');
INSERT INTO Orders (order_id, customer_id, courier_id, order_date, status) VALUES (2, 2, 2,TRUNC(SYSDATE), 'Shipped');
INSERT INTO Orders (order_id, customer_id, courier_id, order_date, status) VALUES (4, 4, 4,TRUNC(SYSDATE), 'Delivered');
INSERT INTO Orders (order_id, customer_id, courier_id, order_date, status) VALUES (5, 5, 5,TRUNC(SYSDATE), 'processed');
INSERT INTO Orders (order_id, customer_id, courier_id, order_date, status) VALUES (3, 3, 3,TRUNC(SYSDATE), 'Cancelled');
INSERT INTO Orders (order_id, customer_id, courier_id, order_date, status) VALUES (6, 6, 6,TRUNC(SYSDATE), 'processed');
INSERT INTO Orders (order_id, customer_id, courier_id, order_date, status) VALUES (7, 7, 7,TRUNC(SYSDATE), 'Shipped');
INSERT INTO Orders (order_id, customer_id, courier_id, order_date, status) VALUES (8, 8, 8,TRUNC(SYSDATE), 'Delivered');
INSERT INTO Orders (order_id, customer_id, courier_id, order_date, status) VALUES (9, 9, 9,TRUNC(SYSDATE), 'processed');
INSERT INTO Orders (order_id, customer_id, courier_id, order_date, status) VALUES (10, 10, 10,TRUNC(SYSDATE), 'Cancelled');

INSERT INTO Payments (payment_id, order_id, payment_amount, payment_date) VALUES (1, 1, 100.00, TRUNC(SYSDATE));
INSERT INTO Payments (payment_id, order_id, payment_amount, payment_date) VALUES (2, 2, 150.00, TRUNC(SYSDATE));
INSERT INTO Payments (payment_id, order_id, payment_amount, payment_date) VALUES (3, 3, 340.00, TRUNC(SYSDATE));
INSERT INTO Payments (payment_id, order_id, payment_amount, payment_date) VALUES (4, 4, 400.00, TRUNC(SYSDATE));
INSERT INTO Payments (payment_id, order_id, payment_amount, payment_date) VALUES (5, 5, 750.00, TRUNC(SYSDATE));
INSERT INTO Payments (payment_id, order_id, payment_amount, payment_date) VALUES (6, 6, 100.00, TRUNC(SYSDATE));
INSERT INTO Payments (payment_id, order_id, payment_amount, payment_date) VALUES (7, 7, 480.00, TRUNC(SYSDATE));
INSERT INTO Payments (payment_id, order_id, payment_amount, payment_date) VALUES (8, 8, 740.00, TRUNC(SYSDATE));
INSERT INTO Payments (payment_id, order_id, payment_amount, payment_date) VALUES (9, 9, 107.00, TRUNC(SYSDATE));
INSERT INTO Payments (payment_id, order_id, payment_amount, payment_date) VALUES (10, 10, 225.00, TRUNC(SYSDATE));

INSERT INTO Tracking (tracking_id, order_id, tracking_status, tracking_date) VALUES (1, 1, 'Shipped', TRUNC(SYSDATE));
INSERT INTO Tracking (tracking_id, order_id, tracking_status, tracking_date) VALUES (2, 2, 'Shipped', TRUNC(SYSDATE));
INSERT INTO Tracking (tracking_id, order_id, tracking_status, tracking_date) VALUES (3, 3, 'Delivered', TRUNC(SYSDATE));
INSERT INTO Tracking (tracking_id, order_id, tracking_status, tracking_date) VALUES (4, 4, 'processed', TRUNC(SYSDATE));
INSERT INTO Tracking (tracking_id, order_id, tracking_status, tracking_date) VALUES (5, 5, 'Cancelled', TRUNC(SYSDATE));
INSERT INTO Tracking (tracking_id, order_id, tracking_status, tracking_date) VALUES (6, 6, 'processed', TRUNC(SYSDATE));
INSERT INTO Tracking (tracking_id, order_id, tracking_status, tracking_date) VALUES (7, 7, 'Shipped', TRUNC(SYSDATE));
INSERT INTO Tracking (tracking_id, order_id, tracking_status, tracking_date) VALUES (8, 8, 'Delivered', TRUNC(SYSDATE));
INSERT INTO Tracking (tracking_id, order_id, tracking_status, tracking_date) VALUES (9, 9, 'processed', TRUNC(SYSDATE));
INSERT INTO Tracking (tracking_id, order_id, tracking_status, tracking_date) VALUES (10, 10, 'Cancelled', TRUNC(SYSDATE));

update Tracking set tracking_status = 'Shipped' where order_id='9';
update Tracking set tracking_status = 'Cancelled' where order_id='1';
update Tracking set tracking_status = 'Delivered' where order_id='2';

delete from Payments where order_id =(select order_id from Tracking where tracking_status='Cancelled');
delete from Orders where status='Cancelled';

select count(customer_id) as number_of_customers from Customers;
select count(courier_id) as number_of_couriers from Couriers;
select count(order_id) as number_of_total_orders from Orders;

SELECT * FROM Customers WHERE customer_name LIKE '%E%';

