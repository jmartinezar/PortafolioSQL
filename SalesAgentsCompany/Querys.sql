CREATE TABLE IF NOT EXISTS "AGENTS" 
   (	
    "AGENT_CODE" CHAR(6) NOT NULL PRIMARY KEY, 
	"AGENT_NAME" CHAR(40), 
	"WORKING_AREA" CHAR(35), 
	"COMMISSION" NUMERIC(10,2), 
	"PHONE_NO" CHAR(15), 
	"COUNTRY" VARCHAR(25) 
	 );
INSERT INTO "AGENTS" VALUES ('A007', 'Ramasundar', 'Bangalore', '0.15', '077-25814763', '');
INSERT INTO "AGENTS" VALUES ('A003', 'Alex ', 'London', '0.13', '075-12458969', '');
INSERT INTO "AGENTS" VALUES ('A008', 'Alford', 'New York', '0.12', '044-25874365', '');
INSERT INTO "AGENTS" VALUES ('A011', 'Ravi Kumar', 'Bangalore', '0.15', '077-45625874', '');
INSERT INTO "AGENTS" VALUES ('A010', 'Santakumar', 'Chennai', '0.14', '007-22388644', '');
INSERT INTO "AGENTS" VALUES ('A012', 'Lucida', 'San Jose', '0.12', '044-52981425', '');
INSERT INTO "AGENTS" VALUES ('A005', 'Anderson', 'Brisban', '0.13', '045-21447739', '');
INSERT INTO "AGENTS" VALUES ('A001', 'Subbarao', 'Bangalore', '0.14', '077-12346674', '');
INSERT INTO "AGENTS" VALUES ('A002', 'Mukesh', 'Mumbai', '0.11', '029-12358964', '');
INSERT INTO "AGENTS" VALUES ('A006', 'McDen', 'London', '0.15', '078-22255588', '');
INSERT INTO "AGENTS" VALUES ('A004', 'Ivan', 'Torento', '0.15', '008-22544166', '');
INSERT INTO "AGENTS" VALUES ('A009', 'Benjamin', 'Hampshair', '0.11', '008-22536178', '');

CREATE TABLE IF NOT EXISTS "CUSTOMER" 
   (	"CUST_CODE" VARCHAR(6) NOT NULL PRIMARY KEY, 
	"CUST_NAME" VARCHAR(40) NOT NULL, 
	"CUST_CITY" CHAR(35), 
	"WORKING_AREA" VARCHAR(35) NOT NULL, 
	"CUST_COUNTRY" VARCHAR(20) NOT NULL, 
	"GRADE" NUMERIC, 
	"OPENING_AMT" NUMERIC(12,2) NOT NULL, 
	"RECEIVE_AMT" NUMERIC(12,2) NOT NULL, 
	"PAYMENT_AMT" NUMERIC(12,2) NOT NULL, 
	"OUTSTANDING_AMT" NUMERIC(12,2) NOT NULL, 
	"PHONE_NO" VARCHAR(17) NOT NULL, 
	"AGENT_CODE" CHAR(6) NOT NULL REFERENCES "AGENTS"
);
INSERT INTO "CUSTOMER" VALUES ('C00013', 'Holmes', 'London', 'London', 'UK', '2', '6000.00', '5000.00', '7000.00', '4000.00', 'BBBBBBB', 'A003');
INSERT INTO "CUSTOMER" VALUES ('C00001', 'Micheal', 'New York', 'New York', 'USA', '2', '3000.00', '5000.00', '2000.00', '6000.00', 'CCCCCCC', 'A008');
INSERT INTO "CUSTOMER" VALUES ('C00020', 'Albert', 'New York', 'New York', 'USA', '3', '5000.00', '7000.00', '6000.00', '6000.00', 'BBBBSBB', 'A008');
INSERT INTO "CUSTOMER" VALUES ('C00025', 'Ravindran', 'Bangalore', 'Bangalore', 'India', '2', '5000.00', '7000.00', '4000.00', '8000.00', 'AVAVAVA', 'A011');
INSERT INTO "CUSTOMER" VALUES ('C00024', 'Cook', 'London', 'London', 'UK', '2', '4000.00', '9000.00', '7000.00', '6000.00', 'FSDDSDF', 'A006');
INSERT INTO "CUSTOMER" VALUES ('C00015', 'Stuart', 'London', 'London', 'UK', '1', '6000.00', '8000.00', '3000.00', '11000.00', 'GFSGERS', 'A003');
INSERT INTO "CUSTOMER" VALUES ('C00002', 'Bolt', 'New York', 'New York', 'USA', '3', '5000.00', '7000.00', '9000.00', '3000.00', 'DDNRDRH', 'A008');
INSERT INTO "CUSTOMER" VALUES ('C00018', 'Fleming', 'Brisban', 'Brisban', 'Australia', '2', '7000.00', '7000.00', '9000.00', '5000.00', 'NHBGVFC', 'A005');
INSERT INTO "CUSTOMER" VALUES ('C00021', 'Jacks', 'Brisban', 'Brisban', 'Australia', '1', '7000.00', '7000.00', '7000.00', '7000.00', 'WERTGDF', 'A005');
INSERT INTO "CUSTOMER" VALUES ('C00019', 'Yearannaidu', 'Chennai', 'Chennai', 'India', '1', '8000.00', '7000.00', '7000.00', '8000.00', 'ZZZZBFV', 'A010');
INSERT INTO "CUSTOMER" VALUES ('C00005', 'Sasikant', 'Mumbai', 'Mumbai', 'India', '1', '7000.00', '11000.00', '7000.00', '11000.00', '147-25896312', 'A002');
INSERT INTO "CUSTOMER" VALUES ('C00007', 'Ramanathan', 'Chennai', 'Chennai', 'India', '1', '7000.00', '11000.00', '9000.00', '9000.00', 'GHRDWSD', 'A010');
INSERT INTO "CUSTOMER" VALUES ('C00022', 'Avinash', 'Mumbai', 'Mumbai', 'India', '2', '7000.00', '11000.00', '9000.00', '9000.00', '113-12345678','A002');
INSERT INTO "CUSTOMER" VALUES ('C00004', 'Winston', 'Brisban', 'Brisban', 'Australia', '1', '5000.00', '8000.00', '7000.00', '6000.00', 'AAAAAAA', 'A005');
INSERT INTO "CUSTOMER" VALUES ('C00023', 'Karl', 'London', 'London', 'UK', '0', '4000.00', '6000.00', '7000.00', '3000.00', 'AAAABAA', 'A006');
INSERT INTO "CUSTOMER" VALUES ('C00006', 'Shilton', 'Torento', 'Torento', 'Canada', '1', '10000.00', '7000.00', '6000.00', '11000.00', 'DDDDDDD', 'A004');
INSERT INTO "CUSTOMER" VALUES ('C00010', 'Charles', 'Hampshair', 'Hampshair', 'UK', '3', '6000.00', '4000.00', '5000.00', '5000.00', 'MMMMMMM', 'A009');
INSERT INTO "CUSTOMER" VALUES ('C00017', 'Srinivas', 'Bangalore', 'Bangalore', 'India', '2', '8000.00', '4000.00', '3000.00', '9000.00', 'AAAAAAB', 'A007');
INSERT INTO "CUSTOMER" VALUES ('C00012', 'Steven', 'San Jose', 'San Jose', 'USA', '1', '5000.00', '7000.00', '9000.00', '3000.00', 'KRFYGJK', 'A012');
INSERT INTO "CUSTOMER" VALUES ('C00008', 'Karolina', 'Torento', 'Torento', 'Canada', '1', '7000.00', '7000.00', '9000.00', '5000.00', 'HJKORED', 'A004');
INSERT INTO "CUSTOMER" VALUES ('C00003', 'Martin', 'Torento', 'Torento', 'Canada', '2', '8000.00', '7000.00', '7000.00', '8000.00', 'MJYURFD', 'A004');
INSERT INTO "CUSTOMER" VALUES ('C00009', 'Ramesh', 'Mumbai', 'Mumbai', 'India', '3', '8000.00', '7000.00', '3000.00', '12000.00', 'Phone No', 'A002');
INSERT INTO "CUSTOMER" VALUES ('C00014', 'Rangarappa', 'Bangalore', 'Bangalore', 'India', '2', '8000.00', '11000.00', '7000.00', '12000.00', 'AAAATGF', 'A001');
INSERT INTO "CUSTOMER" VALUES ('C00016', 'Venkatpati', 'Bangalore', 'Bangalore', 'India', '2', '8000.00', '11000.00', '7000.00', '12000.00', 'JRTVFDD', 'A007');
INSERT INTO "CUSTOMER" VALUES ('C00011', 'Sundariya', 'Chennai', 'Chennai', 'India', '3', '7000.00', '11000.00', '7000.00', '11000.00', 'PPHGRTS', 'A010');

CREATE TABLE IF NOT EXISTS "ORDERS" 
   (
        "ORD_NUM" NUMERIC(6,0) NOT NULL PRIMARY KEY, 
	"ORD_AMOUNT" NUMERIC(12,2) NOT NULL, 
	"ADVANCE_AMOUNT" NUMERIC(12,2) NOT NULL, 
	"ORD_DATE" DATE NOT NULL, 
	"CUST_CODE" VARCHAR(6) NOT NULL REFERENCES "CUSTOMER",
	"AGENT_CODE" CHAR(6) NOT NULL REFERENCES "AGENTS",
	"ORD_DESCRIPTION" VARCHAR(60) NOT NULL
   );
INSERT INTO "ORDERS" VALUES('200100', '1000.00', '600.00', '08/01/2008', 'C00013', 'A003', 'SOD');
INSERT INTO "ORDERS" VALUES('200110', '3000.00', '500.00', '04/15/2008', 'C00019', 'A010', 'SOD');
INSERT INTO "ORDERS" VALUES('200107', '4500.00', '900.00', '08/30/2008', 'C00007', 'A010', 'SOD');
INSERT INTO "ORDERS" VALUES('200112', '2000.00', '400.00', '05/30/2008', 'C00016', 'A007', 'SOD'); 
INSERT INTO "ORDERS" VALUES('200113', '4000.00', '600.00', '06/10/2008', 'C00022', 'A002', 'SOD');
INSERT INTO "ORDERS" VALUES('200102', '2000.00', '300.00', '05/25/2008', 'C00012', 'A012', 'SOD');
INSERT INTO "ORDERS" VALUES('200114', '3500.00', '2000.00', '08/15/2008', 'C00002', 'A008', 'SOD');
INSERT INTO "ORDERS" VALUES('200122', '2500.00', '400.00', '09/16/2008', 'C00003', 'A004', 'SOD');
INSERT INTO "ORDERS" VALUES('200118', '500.00', '100.00', '07/20/2008', 'C00023', 'A006', 'SOD');
INSERT INTO "ORDERS" VALUES('200119', '4000.00', '700.00', '09/16/2008', 'C00007', 'A010', 'SOD');
INSERT INTO "ORDERS" VALUES('200121', '1500.00', '600.00', '09/23/2008', 'C00008', 'A004', 'SOD');
INSERT INTO "ORDERS" VALUES('200130', '2500.00', '400.00', '07/30/2008', 'C00025', 'A011', 'SOD');
INSERT INTO "ORDERS" VALUES('200134', '4200.00', '1800.00', '09/25/2008', 'C00004', 'A005', 'SOD');
INSERT INTO "ORDERS" VALUES('200108', '4000.00', '600.00', '02/15/2008', 'C00008', 'A004', 'SOD');
INSERT INTO "ORDERS" VALUES('200103', '1500.00', '700.00', '05/15/2008', 'C00021', 'A005', 'SOD');
INSERT INTO "ORDERS" VALUES('200105', '2500.00', '500.00', '07/18/2008', 'C00025', 'A011', 'SOD');
INSERT INTO "ORDERS" VALUES('200109', '3500.00', '800.00', '07/30/2008', 'C00011', 'A010', 'SOD');
INSERT INTO "ORDERS" VALUES('200101', '3000.00', '1000.00', '07/15/2008', 'C00001', 'A008', 'SOD');
INSERT INTO "ORDERS" VALUES('200111', '1000.00', '300.00', '07/10/2008', 'C00020', 'A008', 'SOD');
INSERT INTO "ORDERS" VALUES('200104', '1500.00', '500.00', '03/13/2008', 'C00006', 'A004', 'SOD');
INSERT INTO "ORDERS" VALUES('200106', '2500.00', '700.00', '04/20/2008', 'C00005', 'A002', 'SOD');
INSERT INTO "ORDERS" VALUES('200125', '2000.00', '600.00', '10/10/2008', 'C00018', 'A005', 'SOD');
INSERT INTO "ORDERS" VALUES('200117', '800.00', '200.00', '10/20/2008', 'C00014', 'A001', 'SOD');
INSERT INTO "ORDERS" VALUES('200123', '500.00', '100.00', '09/16/2008', 'C00022', 'A002', 'SOD');
INSERT INTO "ORDERS" VALUES('200120', '500.00', '100.00', '07/20/2008', 'C00009', 'A002', 'SOD');
INSERT INTO "ORDERS" VALUES('200116', '500.00', '100.00', '07/13/2008', 'C00010', 'A009', 'SOD');
INSERT INTO "ORDERS" VALUES('200124', '500.00', '100.00', '06/20/2008', 'C00017', 'A007', 'SOD'); 
INSERT INTO "ORDERS" VALUES('200126', '500.00', '100.00', '06/24/2008', 'C00022', 'A002', 'SOD');
INSERT INTO "ORDERS" VALUES('200129', '2500.00', '500.00', '07/20/2008', 'C00024', 'A006', 'SOD');
INSERT INTO "ORDERS" VALUES('200127', '2500.00', '400.00', '07/20/2008', 'C00015', 'A003', 'SOD');
INSERT INTO "ORDERS" VALUES('200128', '3500.00', '1500.00', '07/20/2008', 'C00009', 'A002', 'SOD');
INSERT INTO "ORDERS" VALUES('200135', '2000.00', '800.00', '09/16/2008', 'C00007', 'A010', 'SOD');
INSERT INTO "ORDERS" VALUES('200131', '900.00', '150.00', '08/26/2008', 'C00012', 'A012', 'SOD');
INSERT INTO "ORDERS" VALUES('200133', '1200.00', '400.00', '06/29/2008', 'C00009', 'A002', 'SOD');

/*El presente query usa where para aplicar dos condiciones al mismo dato y ordena alfabéticamente según el nombre*/

SELECT "AGENT_CODE", "AGENT_NAME", "WORKING_AREA", "COMMISSION"
FROM "AGENTS"
WHERE ("COMMISSION" >= 0.12 AND "COMMISSION" < 0.14)
ORDER BY 2;

/*Este query crea una tabla con el código y el nombre de los agentes según la cantidad de órdenes que hayan realizado, organizados de mayor a menor cantidad de órdenes*/

SELECT A."AGENT_CODE", "AGENT_NAME", COUNT("ORD_NUM")
FROM "AGENTS" A, "ORDERS" O
WHERE A."AGENT_CODE"=O."AGENT_CODE"
GROUP BY 2, 1
ORDER BY 3 DESC;

/*El presente query genera una tabla a partir de la tabla CUSTOMER que contiene el código del cliente, su nombre, su ciudad, su grado y el código del vendedor, mostrando solamente los vendedores que son de New York o que tienen un grado superior a 2*/

SELECT "CUST_CODE", "CUST_NAME", "WORKING_AREA", "GRADE", "AGENT_CODE"
FROM "CUSTOMER"
WHERE ("CUSTOMER"."WORKING_AREA" = 'New York' OR "GRADE" > 2)
ORDER BY 2;

/*El código crea una tabla de dos columnas: la primera con los nombres de los países en los que la empresa cuenta con más de dos clientes y la segunda con la cantidad de clientes que tiene la empresa en cada uno de estos países, está organizada alfabéticamente según el nombre de los países.*/

SELECT "CUST_COUNTRY", COUNT("CUST_NAME") AS "CUST_FOR_COUNTRY"
       FROM "CUSTOMER"
       GROUP BY "CUST_COUNTRY"
       HAVING COUNT("CUST_NAME")>2
       ORDER BY 1;

/*El presente Query crea una tabla derivada de la tabla CUSTOMER que contiene las columnas con el código, el nombre, área de trabajo y el grado, los ordena de menor a mayor grado, para clientes con el mismo grado se organizan siguiendo un orden alfabético*/

SELECT "CUST_CODE", "CUST_NAME", "WORKING_AREA", "GRADE"
FROM "CUSTOMER"
ORDER BY 4 DESC, 2;

/*El presente código funciona para proporcionar una tabla de los clientes con su código, su nombre, su área de trabajo y su monto operativo, organizadas, en la tabla solo entran los tres clientes con mayor monto de operación, siempre que dicho monto sea superior a US$ 50*/

SELECT "CUST_CODE", "CUST_NAME", "WORKING_AREA", "OPENING_AMT"
FROM "CUSTOMER"
WHERE "OPENING_AMT">50
ORDER BY 4 DESC LIMIT 3;

/*El código implementa un WHERE sub-query para obtener el código y nombre del (de los) agente(s) con la comisión más alta*/

SELECT "AGENT_CODE", "AGENT_NAME", "COMMISSION"
FROM "AGENTS" A
WHERE "COMMISSION"=(
      SELECT MAX("COMMISSION")
      FROM "AGENTS"
      ORDER BY 1 DESC LIMIT 1)
ORDER BY 2;

/*El query genera una tabla que contiene el código de todos los clientes cuyo monto de orden promedio sea superior a US$1000 junto con dicho valor promedio (el valor promedio es dado con un formato que usa la coma para indicar miles y tienes dos cifras decimales), las filas están organizadas de menor a mayor valor promedio.*/

SELECT "CUST_CODE", TO_CHAR(AVG("ORD_AMOUNT"), '999,999.99') AS "AVG_AMOUNT"
FROM "ORDERS"
GROUP BY "CUST_CODE"
HAVING AVG("ORD_AMOUNT")>1000
ORDER BY 2;

/*Este query genera el código del cliente que tuvo en total mayor monto de orden, teniendo en cuenta todas las órdenes, junto con el monto total de dicho cliente*/

SELECT "CUST_CODE", SUM("ORD_AMOUNT") AS "TOTAL_AMOUNT"
FROM "ORDERS"
GROUP BY "CUST_CODE"
ORDER BY 2 DESC LIMIT 1;

/*Este query toma de la tabla ORDERS las columnas con el número de orden, el monto de la orden, la fecha de la orden, el código del cliente y el código del agente. La tabla resultado contiene solo los datos de las órdenes hechas en fechas diferentes a 2008-04-15, órdenes cuyo código de agente sea menor a A010 y cuyo monto sea menor a 1500*/

SELECT "ORD_NUM", "ORD_AMOUNT", "ORD_DATE", "CUST_CODE", "AGENT_CODE"
       FROM "ORDERS"
       WHERE ("ORD_DATE"!='2008-04-15' AND "ORDERS"."AGENT_CODE" < 'A010' AND "ORD_AMOUNT"<1500)
       ORDER BY 1;

--Este query crea una vista de los 5 agentes con mayor cantidad de ordernes realizadas


CREATE VIEW "BEST_AGENTS" AS
       (SELECT A."AGENT_NAME" AS "AGENT NAME", COUNT("ORD_NUM") AS "ORDERS AMOUNT"
       FROM "AGENTS" A JOIN "ORDERS" O ON A."AGENT_CODE"=O."AGENT_CODE"
       GROUP BY A."AGENT_NAME"
       ORDER BY 2 DESC LIMIT 5);

