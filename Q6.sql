/* Q6) Find the least expensive product from each category and print the table with category id, name, product name and price of the product */

SELECT SP_P2.CAT_ID, SP_P2.CAT_NAME, SP_P2.PRO_NAME as 'ProductName', SP_P2.SUPP_PRICE as 'ProductPrice' FROM (
	SELECT C.*, SP_P.PRO_ID, SP_P.PRO_NAME, SP_P.SUPP_PRICE,
    RANK() OVER(PARTITION BY C.CAT_ID ORDER BY SP_P.SUPP_PRICE) as PRICE_RANK FROM CATEGORY C
    INNER JOIN
    (SELECT P.*, SP.SUPP_PRICE FROM SUPPLIER_PRICING SP 
    INNER JOIN
    PRODUCT P
    ON SP.PRO_ID = P.PRO_ID) as SP_P
    ON C.CAT_ID = SP_P.CAT_ID) as SP_P2
	WHERE PRICE_RANK = 1;