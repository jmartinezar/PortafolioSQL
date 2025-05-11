SELECT 
    '=== REPORTE DE VENTAS ===' || CHAR(10) || CHAR(10) ||
    'Países con presencia: ' || (SELECT COUNT(DISTINCT CUST_COUNTRY) FROM CUSTOMER) || CHAR(10) ||
    'Clientes registrados: ' || (SELECT COUNT(*) FROM CUSTOMER) || CHAR(10) ||
    'Agentes activos: ' || (SELECT COUNT(*) FROM AGENTS) || CHAR(10) ||
    'Ventas totales: $' || (SELECT ROUND(SUM(ORD_AMOUNT), 2) FROM ORDERS) || CHAR(10) ||
    'Orden más grande: $' || (SELECT MAX(ORD_AMOUNT) FROM ORDERS) || CHAR(10) ||
    'Agente destacado: ' || (SELECT AGENT_NAME FROM AGENTS WHERE AGENT_CODE = (
        SELECT AGENT_CODE FROM ORDERS GROUP BY AGENT_CODE 
        ORDER BY SUM(ORD_AMOUNT) DESC LIMIT 1
    )) || ' ($' || (SELECT ROUND(SUM(ORD_AMOUNT), 2) FROM ORDERS GROUP BY AGENT_CODE 
        ORDER BY SUM(ORD_AMOUNT) DESC LIMIT 1) || ')' AS Reporte;