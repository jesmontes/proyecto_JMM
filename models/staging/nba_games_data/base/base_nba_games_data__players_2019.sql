WITH source AS (

    SELECT *    
    FROM {{source('__nba_games_data','players')}}
),

src_players_hasta_2019 AS (
        SELECT 
            player_id           
            ,player_name
            ,team_id
            ,season
            ,_fivetran_synced 
        FROM source
    )

SELECT * FROM src_players_hasta_2019 