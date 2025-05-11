PRAGMA foreign_key_check;
PRAGMA integrity_check;

SELECT 
    (SELECT COUNT(*) FROM agents) AS total_agents,
    (SELECT COUNT(*) FROM customer) AS total_customers,
    (SELECT COUNT(*) FROM orders) AS total_orders;

SELECT 'AGENTS' AS table_name, COUNT(*) AS duplicates FROM (
    SELECT AGENT_CODE FROM agents GROUP BY AGENT_CODE HAVING COUNT(*) > 1
) UNION ALL
SELECT 'CUSTOMER', COUNT(*) FROM (
    SELECT CUST_CODE FROM customer GROUP BY CUST_CODE HAVING COUNT(*) > 1
) UNION ALL
SELECT 'ORDERS', COUNT(*) FROM (
    SELECT ORD_NUM FROM orders GROUP BY ORD_NUM HAVING COUNT(*) > 1
);