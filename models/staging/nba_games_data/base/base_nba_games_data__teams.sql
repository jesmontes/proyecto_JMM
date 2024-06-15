WITH src_teams AS (
        SELECT * FROM {{source('__nba_games_data','teams')}}
)

SELECT * FROM src_teams
