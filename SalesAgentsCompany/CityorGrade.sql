/*El presente query genera una tabla a partir de la tabla CUSTOMER que contiene el código del cliente, su nombre, su ciudad, su grado y el código del vendedor, mostrando solamente los vendedores que son de New York o que tienen un grado superior a 2*/

SELECT "CUST_CODE", "CUST_NAME", "WORKING_AREA", "GRADE", "AGENT_CODE"
FROM "CUSTOMER"
WHERE ("CUSTOMER"."WORKING_AREA" = 'New York' OR "GRADE" > 2)
ORDER BY 2;
