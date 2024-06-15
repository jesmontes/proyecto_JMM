with players_general_info as (

    select * from {{ ref('base_nba_players_all_seasons__players') }}

)

select * from players_general_info
