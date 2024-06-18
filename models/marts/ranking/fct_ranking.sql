WITH stg_ranking AS (
        
        SELECT * FROM {{ref('stg_nba_games_data__ranking')}}
),

    stg_teams AS (

        SELECT * FROM {{ref('stg_nba_games_data__teams')}}
    ),

    fct_ranking AS (

        SELECT 
                a.ranking_id,
                a.standingsdate,
                a.season_id,
                a.conference_id,
                b.division_id,
                a.team_id,
                a.g,
                a.w,
                a.l,
                a.w_pct,
                a.road_record,            
                a.home_record,
                a._fivetran_synced

            FROM stg_ranking a 
            JOIN stg_teams b 
            ON a.team_id = b.team_id

    )

SELECT * FROM fct_ranking