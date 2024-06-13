{{
    codegen.generate_source(
        schema_name = 'nba_games_data',
        database_name = 'ALUMNO27_DEV_BRONZE_DB',
        table_names = ['games','game_details','players','ranking','teams'],
        generate_columns = True,
        include_descriptions=True,
        include_data_types=True,
        name='desarrollo',
        include_database=True,
        include_schema=True
        )
}}