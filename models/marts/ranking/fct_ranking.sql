WITH stg_ranking AS (
        
        SELECT * FROM {{ref('stg_nba_games_data__ranking')}}
),

    fct_ranking AS (

        SELECT 
                ranking_id,
                standingsdate,
                season_id,
                conference_id,
                team_id,
                g,
                w,
                l,
                w_pct,
                road_record,            
                home_record,
                _fivetran_synced

    )

SELECT * FROM fct_ranking