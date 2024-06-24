WITH src_ranking AS (
        SELECT * FROM {{source('__nba_games_data','ranking')}} WHERE season_id LIKE '2%'
),
    season_casted AS (
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
    )
    SELECT * FROM season_casted