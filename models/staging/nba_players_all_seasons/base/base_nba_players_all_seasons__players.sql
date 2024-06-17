with 

source as (

    select * from {{ source('__nba_players_all_seasons', 'players') }}

),

players_general_info as (

    select
        _fivetran_id
        ,player_name
        --DISTINCT(player_name) AS player_name,
        --team_abbreviation,
        ,ROUND(age,0) AS age
        ,ROUND(player_height,0) AS player_height_cm
        ,ROUND(player_weight,0) AS player_weight_kg
        ,COALESCE(college,'Unknown') AS college
        ,country
        ,draft_year
        ,draft_round
        ,draft_number
        ,season 
        ,_fivetran_deleted
        ,_fivetran_synced     
    from source
    GROUP BY all

)

select * from players_general_info
