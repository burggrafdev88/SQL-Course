/*
PL 14
Philip Burggraf
*/

--3.

SET SERVEROUTPUT ON;

DECLARE
    CURSOR invoices_cursor IS
        SELECT VENDOR_NAME, INVOICE_NUMBER, TO_CHAR(INVOICE_TOTAL - PAYMENT_TOTAL - CREDIT_TOTAL, '$99,999.99') AS BALANCE_DUE
        FROM AP.INVOICES
        JOIN AP.VENDORS ON
        INVOICES.VENDOR_ID = VENDORS.VENDOR_ID
        WHERE INVOICE_TOTAL - CREDIT_TOTAL - PAYMENT_TOTAL > 5000
        ORDER BY BALANCE_DUE DESC;
        
        invoice_row AP.INVOICES%rowtype;
BEGIN
    FOR invoice_row IN invoices_cursor LOOP
        DBMS_OUTPUT.PUT_LINE(invoice_row.balance_due || ' ' || invoice_row.invoice_number || ' ' || invoice_row.vendor_name);
    END LOOP;
END; 
/

--5.
VARIABLE minimum_value NUMBER;

BEGIN
    :minimum_value := &minimum_val;
END;

DECLARE
    CURSOR invoices_cursor IS
        SELECT VENDOR_NAME, INVOICE_NUMBER, INVOICE_TOTAL - PAYMENT_TOTAL - CREDIT_TOTAL AS BALANCE_DUE
        FROM AP.INVOICES
        JOIN AP.VENDORS ON
        INVOICES.VENDOR_ID = VENDORS.VENDOR_ID
        WHERE INVOICE_TOTAL - CREDIT_TOTAL - PAYMENT_TOTAL > :minimum_value
        ORDER BY BALANCE_DUE DESC;
        
        invoice_row AP.INVOICES%rowtype;
BEGIN
    DBMS_OUTPUT.PUT_LINE('Invoice amounts greater than or equal to ' || :minimum_value);
    FOR invoice_row IN invoices_cursor LOOP
        IF(invoice_row.balance_due > :minimum_value) THEN
            DBMS_OUTPUT.PUT_LINE(TO_CHAR(invoice_row.balance_due,'$99,999.99') || ' ' || invoice_row.invoice_number || ' ' || invoice_row.vendor_name);
        END IF;
    END LOOP;
END; 
