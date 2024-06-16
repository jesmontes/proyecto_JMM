WITH stg_games AS (

        SELECT * FROM {{ref('stg_nba_games_data__games')}}

),

    dim_season AS (

        SELECT DISTINCT season_id AS season_id,
        season
        FROM stg_games
    )

SELECT * FROM dim_season