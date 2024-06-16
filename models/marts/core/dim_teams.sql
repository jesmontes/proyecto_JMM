WITH stg_teams AS (
        SELECT * FROM {{ref('stg_nba_games_data__teams')}}
),

    dim_teams AS (

        SELECT  
            team_id
            ,conference_id            
            ,division_id
            ,nickname
            ,city
            ,abbreviation
            ,arena
            ,arenacapacity
            ,yearfounded
            ,owner
            ,generalmanager
            ,dleagueaffiliation

            FROM stg_teams
)

SELECT * FROM dim_teams