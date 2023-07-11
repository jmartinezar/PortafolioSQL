/*El código crea una tabla de dos columnas: la primera con los nombres de los países en los que la empresa cuenta con más de dos clientes y la segunda con la cantidad de clientes que tiene la empresa en cada uno de estos países, está organizada alfabéticamente según el nombre de los países.*/

SELECT "CUST_COUNTRY", COUNT("CUST_NAME") AS "CUST_FOR_COUNTRY"
       FROM "CUSTOMER"
       GROUP BY "CUST_COUNTRY"
       HAVING COUNT("CUST_NAME")>2
       ORDER BY 1
