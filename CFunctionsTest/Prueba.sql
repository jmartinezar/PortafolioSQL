CREATE OR REPLACE FUNCTION hello(TEXT)
       RETURNS TEXT AS
       '/home/jmartinezar/Documents/Trabajo/PortafolioSQL/PortafolioSQL/CFunctionsTest/ejemplo.so', 'hello'
       LANGUAGE C STRICT IMMUTABLE;
