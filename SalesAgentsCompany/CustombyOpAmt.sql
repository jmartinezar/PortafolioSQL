/*El presente código funciona para proporcionar una tabla de los clientes con su código, su nombre, su área de trabajo y su monto operativo, organizadas, en la tabla solo entran los tres clientes con mayor monto de operación, siempre que dicho monto sea superior a US$ 50*/

SELECT "CUST_CODE", "CUST_NAME", "WORKING_AREA", "OPENING_AMT"
FROM "CUSTOMER"
WHERE "OPENING_AMT">50
ORDER BY 4 DESC LIMIT 3;
