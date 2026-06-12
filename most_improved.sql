-- Identify most improved players across seasons (biggest jump in points/rebounds/assists).

WITH table_one AS(SELECT player_name, season,
pts,
LAG(pts, 1) OVER(
PARTITION BY player_name ORDER BY season) AS pts_prevyear, 
(pts - LAG(pts, 1) OVER(
PARTITION BY player_name ORDER BY season)) AS pts_diff,
ast,
LAG(ast, 1) OVER(PARTITION BY player_name ORDER BY season) AS prev_ast,
(ast - LAG(ast,1) OVER(PARTITION BY player_name ORDER BY season)) AS ast_diff,
reb,
LAG(reb, 1) OVER(PARTITION BY player_name ORDER BY season) AS prev_reb,
(reb - LAG(reb,1) OVER(PARTITION BY player_name ORDER BY season)) AS reb_diff
FROM nba.all_seasons),

table_two AS(SELECT season, MAX(pts_diff) AS max_ptdiff, 
MAX(ast_diff) AS max_astdiff, MAX(reb_diff) AS max_rebdiff
FROM table_one
GROUP BY season)

SELECT o.season,
MAX(CASE WHEN o.pts_diff = t.max_ptdiff THEN o.player_name END) AS player_most_improved_pts,
MAX(CASE WHEN o.pts_diff = t.max_ptdiff THEN o.pts END) AS pts,
MAX(CASE WHEN o.pts_diff = t.max_ptdiff THEN o.pts_prevyear END) AS prev_pts,
t.max_ptdiff,
MAX(CASE WHEN o.ast_diff = t.max_astdiff THEN o.player_name END) AS player_most_improved_ass,
t.max_astdiff,
MAX(CASE WHEN o.reb_diff = t.max_rebdiff THEN o.player_name END) AS player_most_improved_reb,
t.max_rebdiff
FROM table_one o
JOIN table_two t
ON o.season = t.season
GROUP BY season;