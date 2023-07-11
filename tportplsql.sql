/*<TOAD_FILE_CHUNK>*/
---------customers
CREATE OR REPLACE PROCEDURE InsertCustomer(
    p_customer_id IN NUMBER,
    p_customer_name IN VARCHAR2,
    p_customer_address IN VARCHAR2,
    p_customer_phone IN VARCHAR2
)
AS
BEGIN
    INSERT INTO Customers(customer_id, customer_name, customer_address, customer_phone)
    VALUES (p_customer_id, p_customer_name, p_customer_address, p_customer_phone);
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Customer inserted successfully.');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error occurred: ' || SQLERRM);
        ROLLBACK;
END;
/

/*<TOAD_FILE_CHUNK>*/
---------------inserting orders
CREATE OR REPLACE PROCEDURE InsertOrder(
    p_customer_id IN Orders.customer_id%TYPE,
    p_courier_id IN Orders.courier_id%TYPE,
    p_status IN Orders.status%TYPE
)
AS
    p_order_date Orders.order_date%TYPE; -- Declare a variable to store the current date
BEGIN
    p_order_date := TRUNC(SYSDATE); -- Assign the current date to the variable
    
    -- Insert a new order into the Orders table
    INSERT INTO Orders (order_id, customer_id, courier_id, order_date, status)
    VALUES (order_seq.NEXTVAL, p_customer_id, p_courier_id, p_order_date, p_status);
    
    -- Commit the transaction to make the changes permanent
    COMMIT;
    
    -- Display a success message
    DBMS_OUTPUT.PUT_LINE('New order inserted successfully.');
EXCEPTION
    -- In case of any exception/error, rollback the transaction and display an error message
    WHEN OTHERS THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('Error occurred while inserting the order: ' || SQLERRM);
END;
/


---------show orders by customer_id

CREATE OR REPLACE PROCEDURE GetOrdersByCustomerId(
    p_customer_id IN NUMBER
)
AS
    v_order_id Orders.order_id%TYPE;
    v_order_date Orders.order_date%TYPE;
    v_status Orders.status%TYPE;
BEGIN
    FOR order_rec IN (
        SELECT order_id, order_date, status
        FROM Orders
        WHERE customer_id = p_customer_id
    )
    LOOP
        v_order_id := order_rec.order_id;
        v_order_date := order_rec.order_date;
        v_status := order_rec.status;

        
        DBMS_OUTPUT.PUT_LINE('Order ID: ' || v_order_id || ', Order Date: ' || v_order_date || ', Status: ' || v_status);
    END LOOP;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error occurred: ' || SQLERRM);
END;
/

-----------------------showing Customers and orders

DECLARE
  CURSOR customer_cursor IS SELECT * FROM Customers;
    
  CURSOR order_cursor IS SELECT * FROM Orders;
    
  u_customer_id Customers.customer_id%TYPE;
  u_customer_name Customers.customer_name%TYPE;
  u_customer_address Customers.customer_address%TYPE;
  u_customer_phone Customers.customer_phone%TYPE;
  
  v_order_id Orders.order_id%TYPE;
  v_customer_id Orders.customer_id%TYPE;
  v_courier_id Orders.courier_id%TYPE;
  v_order_date Orders.order_date%TYPE;
  v_status Orders.status%TYPE;
  
BEGIN
  -- Retrieving and displaying all customers
  OPEN customer_cursor;
  LOOP
    FETCH customer_cursor INTO u_customer_id, u_customer_name, u_customer_address, u_customer_phone;
    EXIT WHEN customer_cursor%NOTFOUND;
    -- Displaying customer details
    DBMS_OUTPUT.PUT_LINE('Customer ID: ' || u_customer_id);
    DBMS_OUTPUT.PUT_LINE('Customer Name: ' || u_customer_name);
    DBMS_OUTPUT.PUT_LINE('Customer Address: ' || u_customer_address);
    DBMS_OUTPUT.PUT_LINE('Customer Phone: ' || u_customer_phone);
    DBMS_OUTPUT.PUT_LINE('-----------------------------');
  END LOOP;
  CLOSE customer_cursor;

  -- Retrieving and displaying all orders
  OPEN order_cursor;
  LOOP
    FETCH order_cursor INTO v_order_id, v_customer_id, v_courier_id, v_order_date, v_status;
    EXIT WHEN order_cursor%NOTFOUND;
    -- Displaying order details
    DBMS_OUTPUT.PUT_LINE('Order ID: ' || v_order_id);
    DBMS_OUTPUT.PUT_LINE('Customer ID: ' || v_customer_id);
    DBMS_OUTPUT.PUT_LINE('Courier ID: ' || v_courier_id);
    DBMS_OUTPUT.PUT_LINE('Order Date: ' || v_order_date);
    DBMS_OUTPUT.PUT_LINE('Status: ' || v_status);
    DBMS_OUTPUT.PUT_LINE('-----------------------------');
  END LOOP;
  CLOSE order_cursor;
END;
/

/*<TOAD_FILE_CHUNK>*/
----------process orders
CREATE OR REPLACE PROCEDURE ProcessOrders(
    p_customer_id IN NUMBER
)
AS
    v_order_id Orders.order_id%TYPE;
    v_order_date Orders.order_date%TYPE;
    v_status Orders.status%TYPE;
BEGIN
    -- Retrieve orders for the specified customer
    FOR order_rec IN (
        SELECT order_id, order_date, status
        FROM Orders
        WHERE customer_id = p_customer_id
    )
    LOOP
        v_order_id := order_rec.order_id;
        v_order_date := order_rec.order_date;
        v_status := order_rec.status;
        
        -- Perform different actions based on the order status
        IF v_status = 'Pending' THEN 
            DBMS_OUTPUT.PUT_LINE('Order ID: ' || v_order_id || ', Order Date: ' || v_order_date || ', Status: ' || v_status);
            DBMS_OUTPUT.PUT_LINE('Processing the order...');
            -- Perform actions specific to pending orders
            
        ELSIF v_status = 'Shipped' THEN
            DBMS_OUTPUT.PUT_LINE('Order ID: ' || v_order_id || ', Order Date: ' || v_order_date || ', Status: ' || v_status);
            DBMS_OUTPUT.PUT_LINE('Updating tracking information...');
            -- Perform actions specific to shipped orders
            
        ELSIF v_status = 'Delivered' THEN
            DBMS_OUTPUT.PUT_LINE('Order ID: ' || v_order_id || ', Order Date: ' || v_order_date || ', Status: ' || v_status);
            DBMS_OUTPUT.PUT_LINE('Processing payment...');
            -- Perform actions specific to delivered orders
            
        ELSE
            DBMS_OUTPUT.PUT_LINE('Unknown status for Order ID: ' || v_order_id);
        END IF;
        
        DECLARE
            v_item_count NUMBER := 1;
        BEGIN
            WHILE v_item_count <= 5 LOOP
                DBMS_OUTPUT.PUT_LINE('Processing item ' || v_item_count || ' of Order ID: ' || v_order_id);
                -- Perform actions on each item
                
                v_item_count := v_item_count + 1;
            END LOOP;
        END;
    END LOOP;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error occurred: ' || SQLERRM);
END;
/

/*<TOAD_FILE_CHUNK>*/
-------------update order Status

CREATE OR REPLACE PROCEDURE UpdateOrderStatus(
    p_order_id IN NUMBER,
    p_status IN VARCHAR2
)
AS
BEGIN
    UPDATE Orders
    SET status = p_status
    WHERE order_id = p_order_id;
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Order status updated successfully.');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error occurred: ' || SQLERRM);
        ROLLBACK;
END;
/

/*<TOAD_FILE_CHUNK>*/
CREATE OR REPLACE PROCEDURE CalculateTotalPayment(
    p_order_id IN Orders.order_id%TYPE,
    p_total_payment OUT NUMBER
)
AS
BEGIN
    SELECT SUM(payment_amount)
    INTO p_total_payment
    FROM Payments
    WHERE order_id = p_order_id;
    
    DBMS_OUTPUT.PUT_LINE('Total payment amount for Order ID ' || p_order_id || ': ' || p_total_payment);
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No payments found for Order ID ' || p_order_id);
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error occurred while calculating total payment: ' || SQLERRM);
END;
/

/*<TOAD_FILE_CHUNK>*/
CREATE OR REPLACE PROCEDURE GetTrackingInfo(
    p_order_id IN Orders.order_id%TYPE
)
AS
    v_tracking_status Tracking.tracking_status%TYPE;
    v_tracking_date Tracking.tracking_date%TYPE;
BEGIN
    SELECT tracking_status, tracking_date
    INTO v_tracking_status, v_tracking_date
    FROM Tracking
    WHERE order_id = p_order_id;
    
    DBMS_OUTPUT.PUT_LINE('Tracking Information for Order ID ' || p_order_id);
    DBMS_OUTPUT.PUT_LINE('Status: ' || v_tracking_status);
    DBMS_OUTPUT.PUT_LINE('Date: ' || TO_CHAR(v_tracking_date, 'YYYY-MM-DD'));
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No tracking information found for Order ID ' || p_order_id);
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error occurred while retrieving tracking information: ' || SQLERRM);
END;
/

/*<TOAD_FILE_CHUNK>*/
CREATE OR REPLACE PROCEDURE DeleteCustomer(
    p_customer_id IN Customers.customer_id%TYPE
)
AS
BEGIN
    DELETE FROM Orders
    WHERE customer_id = p_customer_id;
    
    DELETE FROM Customers
    WHERE customer_id = p_customer_id;
    
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Customer and associated orders deleted successfully.');
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Customer with ID ' || p_customer_id || ' not found.');
    WHEN OTHERS THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('Error occurred while deleting customer: ' || SQLERRM);
END;
/

