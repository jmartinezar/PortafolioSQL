/*El código crea una tabla de dos columnas con el nombre y el país de cada cliente de la empresa, está organizada alfabéticamente por el nombre*/

SELECT "CUST_COUNTRY", COUNT("CUST_NAME") AS "CUST_FOR_COUNTRY"
       FROM "CUSTOMER"
       GROUP BY "CUST_COUNTRY"
       ORDER BY 1
