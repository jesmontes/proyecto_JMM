WITH base_ranking AS (
        
        SELECT * FROM {{ref('base_nba_games_data__ranking')}}
),

    src_games_details AS (
        SELECT * FROM {{source('__nba_games_data','game_details')}}
    ),

    src_games AS (

        SELECT * FROM {{source('__nba_games_data','games')}}
    ),

reg_season_init AS (
        SELECT  
                season,
                MIN(standingsdate) AS reg_season_init,
                MAX(g) AS g
                FROM base_ranking
                where standingsdate > '2004-01-01' AND  season_id LIKE '2%' AND g=1               
                group by all
                 order by 1
),
liga_sin_pretemp AS (
    SELECT *
    FROM src_games_details a
    JOIN src_games b 
    ON a.
)
