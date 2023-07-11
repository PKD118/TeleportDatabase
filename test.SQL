CREATE OR REPLACE PROCEDURE checking(
  pa IN NUMBER,
  qa IN NUMBER,
  decision OUT VARCHAR2
) AS
  repeatation NUMBER;
  
BEGIN
  SELECT COUNT(*) INTO repeatation FROM Orders WHERE customer_id = pa and courier_id = qa;
  IF repeatation > 0 THEN
    decision := 'Yes';
  ELSE
    decision := 'No';
  END IF;
END;
/

SET SERVEROUTPUT ON
DECLARE
  customer_id Customers.customer_id%TYPE := 10;  
  courier_id Couriers.courier_id%TYPE := 10;  
  results VARCHAR2(10);
BEGIN
  checking(customer_id, courier_id, results);
  DBMS_OUTPUT.PUT_LINE('Customer has taken service from the courier: ' || results);
END;
/
