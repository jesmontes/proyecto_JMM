{% macro concat_season(season_column) %}
    CONCAT(
        {{ season_column }},'-',
        ROUND(CAST(SUBSTRING({{ season_column }}, 3, 2) + 1 AS VARCHAR), 0) 
    ) AS {{season_column}}
{% endmacro %}
