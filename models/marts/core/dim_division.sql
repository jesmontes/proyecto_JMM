WITH stg_teams AS (

        SELECT * FROM {{ref('stg_nba_games_data__teams')}}

),

    dim_division AS (

        SELECT DISTINCT division_id AS division_id,
        division
        FROM stg_teams
    )

SELECT * FROM dim_division