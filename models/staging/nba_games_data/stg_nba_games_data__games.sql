with 

source as (

    select * from {{ ref('base_nba_games_data__games') }}

),

renamed as (

    select
        game_id
        ,game_date_est
        ,home_team_id
        ,team_id_home
        ,team_id_away
        ,visitor_team_id
        ,{{round_and_alias('pts_home')}}
        ,{{round_and_alias('pts_away')}}
        ,{{round_and_alias('reb_home')}}
        ,{{round_and_alias('ast_home')}}
        ,{{round_and_alias('fg_pct_home',1)}} 
        ,{{round_and_alias('fg3_pct_home',1)}} 
        ,{{round_and_alias('ft_pct_home',1)}} 
        ,home_team_wins AS home_team_wins_id
        ,{{round_and_alias('reb_away')}}
        ,{{round_and_alias('ast_away')}}       
        ,{{round_and_alias('fg_pct_away',1)}} 
        ,{{round_and_alias('fg3_pct_away',1)}} 
        ,{{round_and_alias('ft_pct_away',1)}} 
        ,season
        ,_fivetran_synced

    from source

)

select * from renamed 
