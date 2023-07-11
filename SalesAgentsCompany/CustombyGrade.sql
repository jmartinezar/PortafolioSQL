/*El presente Query crea una tabla derivada de la tabla CUSTOMER que contiene las columnas con el código, el nombre, área de trabajo y el grado, los ordena de menor a mayor grado, para clientes con el mismo grado se organizan siguiendo un orden alfabético*/

SELECT "CUST_CODE", "CUST_NAME", "WORKING_AREA", "GRADE"
FROM "CUSTOMER"
ORDER BY 4 DESC, 2;
