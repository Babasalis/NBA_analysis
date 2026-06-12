# NBA_analysis
A collection of SQL queries analyzing the `all_seasons` dataset, exploring player performance, physical attributes, efficiency, and team trends across NBA history.

## Queries
### `average_size.sql`
Compares average player height and weight across decades (1990s, 2000s, 2010s, 2020s). Groups players by decade using their season, and calculates the average height (cm) and weight (kg) for each group — useful for tracking how player size has evolved over time.

### `efficiency_stats.sql`
For each season, identifies the league's scoring leader (highest points per game) and reports their true shooting percentage (TS%) and usage rate (USG%). Helps explore whether top scorers sacrifice efficiency for volume.

### `most_improved.sql`
Finds the most improved players season-over-season in points, assists, and rebounds. Uses window functions to compare each player's current stats to their prior season, then identifies the player with the largest year-over-year increase in each category per season.

### `mvp.sql`
Calculates a custom MVP score for each player-season using a weighted formula: 40% points, 15% rebounds, 15% assists, and 30% true shooting percentage. Returns the top-ranked player for each season based on this composite score.

### `top_performing_player.sql`
Counts "top-performing player" seasons by team, where a top performance is defined as 25+ points, 10+ rebounds, or 6+ assists per game. Helps identify which teams have consistently produced standout individual performances.

### `player_ranking.sql`
For each season, identifies the league leaders in points, rebounds, and assists per game, along with their team. Provides a season-by-season snapshot of statistical leadership across the three core categories.

## Dataset
All queries run against `all_seasons`, a table containing per-season player statistics including points, rebounds, assists, shooting efficiency, usage rate, height, weight, and team affiliation.
