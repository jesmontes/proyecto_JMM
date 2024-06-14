with 

source as (

    select * from {{ source('__nba_games_data', 'games') }}

),

renamed as (

    select
        --_fivetran_id,
        game_id,
        game_date_est,
        home_team_id,
        team_id_home,
        team_id_away,
        visitor_team_id,
        pts_home,
        pts_away,
        reb_home,
        ast_home,
        fg_pct_home,
        fg3_pct_home,
        ft_pct_home,
        home_team_wins,
        reb_away,
        ast_away,
        fg_pct_away,
        fg3_pct_away,
        ft_pct_away,
        --game_status_text,
        season,
        --_fivetran_deleted,
        _fivetran_synced

    from source

)

select * from renamed 
