WITH stg_games AS (

        SELECT * FROM {{ref('stg_nba_games_data__games')}}

),

    dim_conference AS (

        SELECT DISTINCT conference_id AS conference_id,
        conference
        FROM stg_games
    )

SELECT * FROM dim_conference