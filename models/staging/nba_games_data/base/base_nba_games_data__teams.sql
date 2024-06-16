WITH src_teams AS (
        SELECT * FROM {{source('__nba_games_data','teams')}}
),

     teams AS (
        select
             yearfounded
            ,arenacapacity
            ,nickname
            ,arena
            ,owner
            ,city
            ,generalmanager
            ,abbreviation
            ,dleagueaffiliation
            ,team_id
            ,{{add_conference_and_division('abbreviation')}}
            ,_fivetran_synced

        from src_teams
    )

SELECT * FROM teams 