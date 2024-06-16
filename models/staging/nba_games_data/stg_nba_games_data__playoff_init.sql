WITH base_ranking AS (
        SELECT * FROM {{ref('base_nba_games_data__ranking')}} WHERE season_id LIKE '2%'
),
       
    num_part_liga_reg AS (
        SELECT  
                season,
                MAX(g) AS g
                FROM base_ranking
                where season_id LIKE '2%'
                group by 1 
        ),

        joined AS (

            SELECT 
                a.season,
                a.g,
                MIN(standingsdate) AS playoff_init
            FROM base_ranking a
            JOIN num_part_liga_reg b
            ON a.season = b.season AND a.g = b.g
            WHERE standingsdate > '2004-01-01' 
            group by 1,2 
        )
    SELECT * FROM joined 