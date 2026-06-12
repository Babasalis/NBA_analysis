-- Compare average player size (height/weight) between 1990s, 2000s, 2010s, and 2020s.--
SELECT FLOOR(LEFT(season, 4)/10)*10 AS Decade, ROUND(AVG(player_height), 2) AS "Avg_height(cm)", ROUND(AVG(player_weight), 2) AS "Avg_weight(kg)"
FROM nba.all_seasons
GROUP BY FLOOR(LEFT(season, 4)/10)*10;