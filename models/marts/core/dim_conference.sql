WITH stg_teams AS (

        SELECT * FROM {{ref('stg_nba_games_data__teams')}}

),

    dim_conference AS (

        SELECT DISTINCT conference_id AS conference_id,
        conference
        FROM stg_teams
    )

SELECT * FROM dim_conference