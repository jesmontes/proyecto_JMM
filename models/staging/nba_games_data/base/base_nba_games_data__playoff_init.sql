WITH src_ranking AS (
        SELECT * FROM {{source('__nba_games_data','ranking')}} WHERE season_id LIKE '2%'
),
    base_ranking AS (
        SELECT
            _fivetran_id,
            league_id,
            w_pct * 100 AS w_pct,
            l,
            team_id,
            returntoplay,
            g,
            road_record,
            CONCAT(
            SUBSTRING(season_id, 2, 4), '-', 
            LPAD(ROUND(CAST(SUBSTRING(season_id, 4, 2) + 1 AS VARCHAR), 0), 2, '0')
            ) AS season,
            season_id,
            w,
            standingsdate,
            conference,
            team,
            home_record,
            _fivetran_deleted,
            _fivetran_synced

        FROM src_ranking
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