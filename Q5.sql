/* Q5) Display the Supplier details who can supply more than one product. */

SELECT * FROM SUPPLIER WHERE SUPP_ID IN (
SELECT SUPP_ID FROM SUPPLIER_PRICING
GROUP BY SUPP_ID 
HAVING COUNT(SUPP_ID) > 1
);