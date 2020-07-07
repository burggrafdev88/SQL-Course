/* Lab 5
Philip Burggraf*/

--1. 
SELECT COUNT(*) AS "NUMBER OF INVOICES"
FROM AP.INVOICES;

--2.
SELECT COUNT(PAYMENT_DATE) AS "NUMBER OF VALID PAYMENT DATES"
FROM AP.INVOICES;

--3.
SELECT COUNT(*) - COUNT(PAYMENT_DATE) AS "NUMBER OF NULL PAYMENT DATES"
FROM AP.INVOICES;

--4. 
SELECT *
FROM
    (SELECT DISTINCT PAYMENT_DATE
    FROM AP.INVOICES)
ORDER BY PAYMENT_DATE;

--5.
SELECT COUNT(DISTINCT PAYMENT_DATE) AS "NUMBER OF DIFF. PAYMENT DATES"
FROM AP.INVOICES;

--6.
SELECT TO_CHAR(SUM(INVOICE_TOTAL), '$999,999.99') AS "TOTAL INVOICE AMOUNT"
FROM AP.INVOICES;

--7.
SELECT TO_CHAR(AVG(INVOICE_TOTAL), '999,999.999') AS "AVG INVOICE AMOUNT"
FROM AP.INVOICES;

--8.
SELECT TO_CHAR(AVG(INVOICE_TOTAL), '9999') AS "AVG INVOICE AMOUNT"
FROM AP.INVOICES;

--9.
SELECT MIN(INVOICE_TOTAL), MAX(INVOICE_TOTAL)
FROM AP.INVOICES;

--10.
SELECT TO_CHAR(MIN(INVOICE_TOTAL),'$99,999.99') AS "LOWEST INVOICE TOTAL", TO_CHAR(MAX(INVOICE_TOTAL),'$99,999.99') AS "HIGHEST INVOICE TOTAL"
FROM AP.INVOICES;

--11.
SELECT MAX(VENDOR_NAME) AS "LAST VENDOR"
FROM AP.VENDORS;

--12.
SELECT MIN(INVOICE_DATE) 
FROM AP.INVOICES;

--13.
SELECT INVOICE_DATE, COUNT(*) AS "INVOICES PER DATE"
FROM AP.INVOICES
GROUP BY INVOICE_DATE
ORDER BY INVOICE_DATE;

--14.
SELECT INVOICE_TOTAL, COUNT(*) AS "INVOICES LESS THAN $10.00"
FROM AP.INVOICES
WHERE INVOICE_TOTAL < 10
GROUP BY INVOICE_TOTAL
ORDER BY INVOICE_TOTAL;

--15.
SELECT VENDOR_STATE, COUNT(*) AS "VENDORS PER STATE"
FROM AP.VENDORS
GROUP BY VENDOR_STATE
ORDER BY VENDOR_STATE;

--16.
SELECT VENDOR_STATE, COUNT(*) AS "VENDORS PER STATE"
FROM AP.VENDORS
GROUP BY VENDOR_STATE
HAVING COUNT(*) > 2
ORDER BY COUNT(*) DESC;

--17.
SELECT TERMS_ID, COUNT(*) AS "NUMBER IN TERMS ID CATEGORY"
FROM AP.INVOICES
GROUP BY TERMS_ID
ORDER BY TERMS_ID;

--18.
SELECT INVOICE_DATE, COUNT(*) AS "INVOICES PER DATE"
FROM AP.INVOICES
WHERE TRUNC(INVOICE_DATE) >= '01-JUN-2014' AND TRUNC(INVOICE_DATE) <= '30-JUN-2014'
GROUP BY INVOICE_DATE
ORDER BY INVOICE_DATE;

--19.
SELECT INVOICE_DATE, COUNT(*) AS "INVOICES PER DATE"
FROM AP.INVOICES
GROUP BY INVOICE_DATE
HAVING INVOICE_DATE BETWEEN '01-JUN-2014' AND '30-JUN-2014'
ORDER BY INVOICE_DATE;

--20.
SELECT INVOICE_DUE_DATE - INVOICE_DATE AS "DIFFERENCE IN DAYS", COUNT(INVOICE_DUE_DATE - INVOICE_DATE) AS "HOW MANY DAYS?"
FROM AP.INVOICES
GROUP BY INVOICE_DUE_DATE - INVOICE_DATE
ORDER BY INVOICE_DUE_DATE - INVOICE_DATE DESC;
