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
            ,{{dbt_utils.generate_surrogate_key(['conference'])}} AS conference_id
            ,conference
            ,{{dbt_utils.generate_surrogate_key(['division'])}} AS division_id
            ,division
            ,_fivetran_synced

        from base_teams
    )

SELECT * FROM teams 