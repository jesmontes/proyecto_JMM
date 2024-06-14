WITH source AS (

    SELECT *    
    FROM {{ source('__nba_games_data', 'games') }}
)

SELECT * FROM source