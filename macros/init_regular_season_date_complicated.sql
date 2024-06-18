WITH base_ranking AS (
        
        SELECT * FROM {{ref('base_nba_games_data__ranking')}}
),

    src_games_details AS (
        SELECT * FROM {{source('__nba_games_data','game_details')}}
    ),

    base_games AS (

        SELECT * FROM {{ref('base_nba_games_data__games')}}
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
    SELECT a.game_id,
            a.season,
            a.game_date_est
    FROM base_games a
    JOIN reg_season_init b 
    ON a.season = b.season AND a.game_date_est >= b.reg_season_init
)
SELECT  *

 FROM liga_sin_pretemp


