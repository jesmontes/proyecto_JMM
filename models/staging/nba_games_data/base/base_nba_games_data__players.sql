--Saco jugadores despues de 2019 de game_details y los uno a players que solo llega a 2019
WITH src_players_hasta_2019 AS (
        SELECT * 
        FROM {{ source('__nba_games_data', 'players') }}
    ),

    src_game_details AS (
         SELECT * 
        FROM {{ source('__nba_games_data', 'game_details') }}   
    ),
    src_games AS (
         SELECT * 
        FROM {{ source('__nba_games_data', 'games') }}   
    ),

players_2019_2022 AS (
    SELECT  
            a.player_name,
            a.team_id,
            a.player_id,
            b.season
            FROM src_game_details a
            JOIN src_games b
            ON a.game_id = b.game_id
            WHERE b.season > 2019

),

union_players AS (
    SELECT * FROM src_players_hasta_2019

    UNION ALL

    SELECT * FROM players_2019_2022
),

player_season_corregida AS (

SELECT  player_name,
        team_id,
        player_id,
        --añado año que acaba para poder luego combinar con la otra
        CONCAT(season, '-', ROUND(CAST(SUBSTRING(season, 3, 2) + 1 AS VARCHAR), 0)) AS season 
                
     FROM union_players
)

SELECT * FROM union_players order by season desc

