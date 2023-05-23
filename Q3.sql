/* Q3) Display the total number of customers based on gender who have placed orders of worth at least Rs.3000. */

set SQL_MODE = '';
SELECT COUNT(CUS_NAME) as 'Total Customers', CUS_GENDER FROM (
	SELECT * FROM (
		SELECT C.CUS_NAME, C.CUS_GENDER, O.* FROM CUSTOMER C
        INNER JOIN
        `order` O
        ON C.CUS_ID = O.CUS_ID
        WHERE O.ORD_AMOUNT >= 3000
       ) as CO
       GROUP BY CO.CUS_ID
	) as CO2
GROUP BY CUS_GENDER;
