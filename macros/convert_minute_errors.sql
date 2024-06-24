{% macro convert_minute_errors(column_name) %}
    CASE
        -- Convert '0.000000:38' to '0:38'
        WHEN {{ column_name }} LIKE '0.000000:%' THEN
            '0:' || SPLIT_PART({{ column_name }}, ':', 2)
        
        -- Convert '-8' to '8:00'
        WHEN {{ column_name }} LIKE '-%' THEN
            LTRIM({{ column_name }}, '-') || ':00'
        
        -- Convert '0' to '0:00'
        WHEN {{ column_name }} = '0' THEN
            '0:00'

        -- Convert '22.000000:14' to '22:14'
        WHEN {{ column_name }} LIKE '%.000000:%' THEN
            SPLIT_PART({{ column_name }}, '.', 1) || ':' || SPLIT_PART({{ column_name }}, ':', 2)

        -- Convert '18.000000:18.' to '18:18'
        WHEN {{ column_name }} LIKE '%.000000:%.' THEN
            SPLIT_PART({{ column_name }}, '.', 1) || ':' || SPLIT_PART(SPLIT_PART({{ column_name }}, ':', 2), '.', 1)

        -- Convert single number minutes (e.g., '53') to '53:00'
        WHEN {{ column_name }} NOT LIKE '%:%' AND TRY_CAST({{ column_name }} AS INT) IS NOT NULL THEN
            {{ column_name }} || ':00'

        -- Keep correct format as is
        ELSE
            {{ column_name }}
    END
{% endmacro %}
