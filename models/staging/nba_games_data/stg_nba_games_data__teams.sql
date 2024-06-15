WITH base_teams AS (

    SELECT * FROM {{ref('base_nba_games_data__teams')}}
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

        from base_teams
    )

SELECT * FROM teams 