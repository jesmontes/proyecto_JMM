WITH stg_games AS (

        SELECT * FROM {{ref('stg_nba_games_data__games')}}

),

    dim_game_type AS (

        SELECT DISTINCT game_type_id AS game_type_id,
        game_type
        FROM stg_games
    )

SELECT * FROM dim_game_type