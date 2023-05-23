/* Q9) Create a stored procedure to display supplier id, name, Rating(Average rating of all the products sold by every customer) and Type_of_Service. For Type_of_Service, If rating =5, print “Excellent Service”,If rating >4 print “Good Service”, If rating >2 print “Average Service” else print “Poor Service”. Note that there should be one rating per supplier. */

call DisplaySupplierDetails();

/* 
CREATE DEFINER=`root`@`localhost` PROCEDURE `DisplaySupplierDetails`()
BEGIN
SELECT S.SUPP_NAME, SP_RO_2.*,
CASE
	WHEN AverageRating = 5 THEN 'Excellent Service'
	WHEN AverageRating > 4 THEN 'Good Service'    
	WHEN AverageRating > 2 THEN 'Average Service'    
    ELSE 'Poor Service'
END As 'TypeOfService'
FROM SUPPLIER S INNER JOIN (
SELECT SUPP_ID, AVG(RAT_RATSTARS) as 'AverageRating' FROM(
	SELECT SP.SUPP_ID, RO.ORD_ID, RO.RAT_RATSTARS 
	FROM SUPPLIER_PRICING SP INNER JOIN (
		SELECT O.ORD_ID, O.PRICING_ID, R.RAT_RATSTARS FROM
		`Order` O INNER JOIN
        RATING R 
        ON O.ORD_ID = R.ORD_ID
	) as RO
	ON SP.PRICING_ID = RO.PRICING_ID
) as SP_RO
GROUP BY supp_id
) as SP_RO_2
ON S.SUPP_ID = SP_RO_2.SUPP_ID;
END
*/