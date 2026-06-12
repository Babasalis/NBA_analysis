-- Identify which teams consistently produce top-performing players.
-- What is considered a top-performing player? A player that drops 25+ points per game, 6+ assists per game, or 10+ rebounds per game.
SELECT team_abbreviation, COUNT(player_name) AS "# of top performing players"
FROM nba.all_seasons
WHERE pts >= 25 OR reb >= 10 OR ast >= 6
GROUP BY team_abbreviation