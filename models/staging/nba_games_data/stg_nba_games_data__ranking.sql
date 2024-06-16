WITH base_ranking AS (
        SELECT * FROM {{ref('base_nba_games_data__ranking')}}
),

    final AS (
        SELECT 
               {{dbt_utils.generate_surrogate_key(['season','standingsdate','team_id'])}} AS ranking_id,
                standingsdate,
                {{dbt_utils.generate_surrogate_key(['season'])}} AS season_id,
                season,
                conference,
                team_id,
                team,
                g,
                w,
                l,
                w_pct,
                road_record,            
                home_record,
                _fivetran_synced

        FROM base_ranking
    )

    SELECT * FROM final

-- num_part_liga_reg AS (
--         SELECT  
--                 season,
--                 MAX(g) AS g
--                 FROM base_ranking
--                 where season_id LIKE '2%'
--                 group by 1 
--         ),

--         joined AS (

--             SELECT 
--                 a.season,
--                 a.g,
--                 MIN(standingsdate) AS playoff_init
--             FROM base_ranking a
--             JOIN num_part_liga_reg b
--             ON a.season = b.season AND a.g = b.g
--             WHERE standingsdate > '2004-01-01' 
--             group by 1,2 
--         ),
--     --SELECT * FROM joined 

-- final AS (
--     SELECT 
--             a.league_id,
--             a.w_pct,
--             a.l,
--             a.team_id,
--             a.g,
--             a.road_record,
--             a.season,
--             a.season_id,
--             a.w,
--             a.standingsdate,
--             a.conference,
--             a.team,
--             a.home_record,
--             a._fivetran_synced
--             ,CASE WHEN a.season = b.season AND a.standingsdate >= b.playoff_init  THEN 'Playoff'
--                     ELSE 'Regular Season'
--                     END AS game_type
--             FROM base_ranking a    
--             JOIN joined b 
--             ON a.season = b.season
-- )

-- SELECT * FROM final
