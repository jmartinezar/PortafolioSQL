/*El presente código funciona para proporcionar una tabla de los clientes con su código, su nombre, su área de trabajo y su monto operativo, organizadas, en la tabla solo entrar los clientes para los cuales el monto de operación es superior a US$ 50 y están organizados de mayor a menor monto*/

SELECT "CUST_CODE", "CUST_NAME", "WORKING_AREA", "OPENING_AMT"
FROM "CUSTOMER"
WHERE "OPENING_AMT">50
ORDER BY 4 DESC;
