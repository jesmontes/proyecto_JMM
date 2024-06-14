WITH source AS (

    SELECT *    
    FROM {{ source('__nba_games_data', 'game_details') }}
)

SELECT * FROM source