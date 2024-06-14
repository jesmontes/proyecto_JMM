--Quita los decimales salvo que le pases parametro y rellena el alias con el nombre de la columna


{% macro round_and_alias(column, decimales=None) %}
    {%- if decimales %}
        ROUND({{ column }}, {{decimales}}) AS {{ column }}
    {%- else %}
         ROUND({{ column }}, 0) AS {{ column }}
    {%- endif %}
{% endmacro %}
