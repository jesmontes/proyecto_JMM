with 

source as (

    select * from {{ source('__nba_players_all_seasons', 'players') }}

),

players_general_info as (

    select
        --player_name,
        DISTINCT(player_name) AS player_name,
        --team_abbreviation,
        --age,
        --player_height,
        --player_weight,
        college,
        country,
        draft_year,
        draft_round,
        draft_number       
    from source
    GROUP BY all

)

select * from renamed
