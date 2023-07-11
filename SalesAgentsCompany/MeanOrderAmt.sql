/*El query genera una tabla que contiene el código de todos los clientes cuyo monto de orden promedio sea superior a US$1000 junto con dicho valor promedio (el valor promedio es dado con un formato que usa la coma para indicar miles y tienes dos cifras decimales), las filas están organizadas de menor a mayor valor promedio.*/

SELECT "CUST_CODE", TO_CHAR(AVG("ORD_AMOUNT"), '999,999.99') AS "AVG_AMOUNT"
FROM "ORDERS"
GROUP BY "CUST_CODE"
HAVING AVG("ORD_AMOUNT")>1000
ORDER BY 2;
