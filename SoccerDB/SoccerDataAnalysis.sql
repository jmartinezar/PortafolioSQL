--Query inicial, busca en principio generar una tabla de posiciones estándar
SELECT TEAM_API_ID, CASE 
					WHEN HOME_TEAM_GOAL > AWAY_TEAM_GOAL THEN 'W' 
					WHEN HOME_TEAM_GOAL = AWAY_TEAM_GOAL THEN 'D' 
					WHEN HOME_TEAM_GOAL < AWAY_TEAM_GOAL THEN 'L' END AS "RESULT"
FROM TEAM T JOIN MATCH M ON (TEAM_API_ID = HOME_TEAM_API_ID)
WHERE LEAGUE_ID = 1
GROUP BY 1
ORDER BY 2 DESC;

--Query que cuente los partidos ganados ganados, empatados y perdidos en condición de local por cada equipo

SELECT TEAM_API_ID, COUNT(CASE WHEN home_team_goal < away_team_goal THEN 1 END) AS PartidosPerdidos,
       COUNT(CASE WHEN home_team_goal = away_team_goal THEN 1 END) AS PartidosEmpatados,
       COUNT(CASE WHEN home_team_goal > away_team_goal THEN 1 END) AS PartidosGanados
FROM TEAM T JOIN MATCH M ON (T.TEAM_API_ID = M.HOME_TEAM_API_ID)
WHERE LEAGUE_ID = 1
GROUP BY 1;

--Query que cuente los partidos ganados ganados, empatados y perdidos en condición de visitante por cada equipo

SELECT TEAM_API_ID, COUNT(CASE WHEN home_team_goal < away_team_goal THEN 1 END) AS PartidosPerdidos,
       COUNT(CASE WHEN home_team_goal = away_team_goal THEN 1 END) AS PartidosEmpatados,
       COUNT(CASE WHEN home_team_goal > away_team_goal THEN 1 END) AS PartidosGanados
FROM TEAM T JOIN MATCH M ON (T.TEAM_API_ID = M.AWAY_TEAM_API_ID)
WHERE LEAGUE_ID = 1
GROUP BY 1;