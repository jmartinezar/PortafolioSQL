PRAGMA foreign_keys = ON;
PRAGMA journal_mode = WAL;
BEGIN TRANSACTION;

-- Importar AGENTS
CREATE TEMP TABLE temp_agents AS SELECT * FROM agents WHERE 1=0;
.mode csv
.import 'data/AGENTS.csv' temp_agents
INSERT OR IGNORE INTO AGENTS 
SELECT 
    AGENT_CODE,
    TRIM(AGENT_NAME),
    TRIM(WORKING_AREA),
    COMMISSION,
    PHONE_NO,
    CASE WHEN COUNTRY = '' THEN 'Unknown' ELSE COUNTRY END
FROM temp_agents;
DROP TABLE temp_agents;

-- Importar CUSTOMER
CREATE TEMP TABLE temp_customer AS SELECT * FROM customer WHERE 1=0;
.import 'data/CUSTOMER.csv' temp_customer
INSERT OR IGNORE INTO CUSTOMER 
SELECT
    CUST_CODE,
    TRIM(CUST_NAME),
    TRIM(CUST_CITY),
    TRIM(WORKING_AREA),
    TRIM(CUST_COUNTRY),
    GRADE,
    OPENING_AMT,
    RECEIVE_AMT,
    PAYMENT_AMT,
    OUTSTANDING_AMT,
    PHONE_NO,
    AGENT_CODE
FROM temp_customer;
DROP TABLE temp_customer;

-- Importar ORDERS
CREATE TEMP TABLE temp_orders AS SELECT * FROM orders WHERE 1=0;
.import 'data/ORDERS.csv' temp_orders
INSERT OR IGNORE INTO ORDERS 
SELECT 
    ORD_NUM,
    ORD_AMOUNT,
    ADVANCE_AMOUNT,
    DATE(SUBSTR(ORD_DATE, 7, 4) || '-' || SUBSTR(ORD_DATE, 4, 2) || '-' || SUBSTR(ORD_DATE, 1, 2)),
    CUST_CODE,
    AGENT_CODE,
    ORD_DESCRIPTION
FROM temp_orders;
DROP TABLE temp_orders;

COMMIT;