/*
Philip Burggraf
Lab 13 - PL
*/

--1.

SET SERVEROUTPUT ON;

DECLARE
num NUMBER := 10;

BEGIN
DBMS_OUTPUT.PUT_LINE('The value of num is: ' || num);
END;
/
--2.
DECLARE
num_of_students NUMBER;

BEGIN
SELECT COUNT(*) INTO num_of_students
FROM STUDENT.STUDENT;
DBMS_OUTPUT.PUT_LINE('The number of students is ' || num_of_students);
END;
/
--3.
DECLARE
salary STUDENT.EMPLOYEE.SALARY%TYPE;
title STUDENT.EMPLOYEE.TITLE%TYPE;

BEGIN
SELECT SALARY, TITLE
INTO salary, title
FROM STUDENT.EMPLOYEE
WHERE NAME = 'Stella';

DBMS_OUTPUT.PUT_LINE('Stellas title is ' || title || ' and her salary is ' || salary);
END;
/
--4.
DECLARE
max_invoice_total AP.INVOICES.INVOICE_TOTAL%TYPE;
min_invoice_total AP.INVOICES.INVOICE_TOTAL%TYPE;

BEGIN
SELECT MAX(INVOICE_TOTAL), MIN(INVOICE_TOTAL)
INTO max_invoice_total, min_invoice_total
FROM AP.INVOICES;

DBMS_OUTPUT.PUT_LINE('Max invoice: $' || TO_CHAR(max_invoice_total, '99,999.99'));
DBMS_OUTPUT.PUT_LINE('Min invoice: $' || TO_CHAR(min_invoice_total, '99,999.99'));

END;
/
--5.
DECLARE
max_invoice_due_date AP.INVOICES.INVOICE_DUE_DATE%TYPE;

BEGIN
SELECT MAX(INVOICE_DUE_DATE)
INTO max_invoice_due_date
FROM AP.INVOICES;

IF max_invoice_due_date < '19-JUL-2008' THEN
DBMS_OUTPUT.PUT_LINE('Overdue!');
ELSE
DBMS_OUTPUT.PUT_LINE('Ok.');
END IF;

END;
/
--6.
DECLARE
customer_state OM.CUSTOMERS.CUSTOMER_STATE%TYPE;

BEGIN
SELECT CUSTOMER_STATE
INTO customer_state
FROM OM.CUSTOMERS
WHERE CUSTOMER_ID = 15;

CASE customer_state
WHEN 'WI' THEN
DBMS_OUTPUT.PUT_LINE('Cold Winters');
WHEN 'CA' THEN
DBMS_OUTPUT.PUT_LINE('Moderate Winters');
ELSE
DBMS_OUTPUT.PUT_LINE('No data on this winter.');

END CASE;
END; 
/
--7.

BEGIN
FOR i IN 1..3 LOOP
DBMS_OUTPUT.PUT_LINE('I: ' || i);
END LOOP;
END; 
/
DECLARE
i NUMBER := 1;
BEGIN
WHILE i < 4 LOOP
DBMS_OUTPUT.PUT_LINE('i: ' || i);
i := i + 1;
END LOOP;
END;  
/
DECLARE
i NUMBER := 3;
BEGIN
LOOP
DBMS_OUTPUT.PUT_LINE('i: ' || i);
i := i - 1;
EXIT WHEN i <= 0;
END LOOP; 
END;   
/
--8.
DECLARE
name STUDENT.EMPLOYEE.NAME%TYPE;

BEGIN
SELECT NAME
INTO name
FROM STUDENT.EMPLOYEE
WHERE NAME = 'Sally';

EXCEPTION 
WHEN NO_DATA_FOUND THEN
DBMS_OUTPUT.PUT_LINE('No data found.');
END;



