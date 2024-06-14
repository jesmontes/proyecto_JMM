with 

source as (

    select * from {{ source('__nba_games_data', 'games') }}

),

renamed as (

    select
        --_fivetran_id,
        game_id
        ,game_date_est
        ,home_team_id
        ,team_id_home
        ,team_id_away
        ,visitor_team_id
        ,{{round_and_alias('pts_home')}}
        --,pts_home
        ,{{round_and_alias('pts_away')}}
        --,pts_away
        ,{{round_and_alias('reb_home')}}
        --,reb_home
        ,{{round_and_alias('ast_home')}}
        --,ast_home
        --,fg_pct_home
        ,{{round_and_alias('fg_pct_home',2)}} 
        --,fg3_pct_home
        ,{{round_and_alias('fg3_pct_home',2)}} 
        --,ft_pct_home
        ,{{round_and_alias('ft_pct_home',2)}} 
        ,home_team_wins AS home_team_wins_id
        ,{{round_and_alias('reb_away')}}
        --,reb_away
        ,{{round_and_alias('ast_away')}}       
        --,ast_away
        ,{{round_and_alias('fg_pct_away',2)}} 
        --,fg_pct_away
        ,{{round_and_alias('fg3_pct_away',2)}} 
        --,fg3_pct_away
        ,{{round_and_alias('ft_pct_away',2)}} 
        --,ft_pct_away
        --game_status_text,
        ,season
        --_fivetran_deleted,
        ,_fivetran_synced

    from source

)

select * from renamed 
