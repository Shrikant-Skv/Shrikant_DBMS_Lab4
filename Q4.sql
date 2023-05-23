/* Q4) Display all the orders along with product name ordered by a customer having Customer_Id=2 */

SELECT P.PRO_NAME as 'ProductName', O.* FROM `order` O
INNER JOIN
SUPPLIER_PRICING SP
ON O.PRICING_ID = SP.PRICING_ID
INNER JOIN
PRODUCT P
ON P.PRO_ID = SP.PRO_ID
WHERE O.CUS_ID = 2;