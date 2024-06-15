{% macro add_conference_and_division(abbreviation_team) %}
    CASE
        WHEN {{ abbreviation_team }} IN ('ATL', 'CHA', 'MIA', 'ORL', 'WAS') THEN 'Southeast'
        WHEN {{ abbreviation_team }} IN ('BOS', 'BKN', 'NYK', 'PHI', 'TOR') THEN 'Atlantic'
        WHEN {{ abbreviation_team }} IN ('CHI', 'CLE', 'DET', 'IND', 'MIL') THEN 'Central'
        WHEN {{ abbreviation_team }} IN ('DAL', 'HOU', 'MEM', 'NOP', 'SAS') THEN 'Southwest'
        WHEN {{ abbreviation_team }} IN ('DEN', 'MIN', 'OKC', 'POR', 'UTA') THEN 'Northwest'
        WHEN {{ abbreviation_team }} IN ('GSW', 'LAC', 'LAL', 'PHX', 'SAC') THEN 'Pacific'
        ELSE 'Unknown'
    END AS division,

    CASE
        WHEN {{ abbreviation_team }} IN ('ATL', 'CHA', 'MIA', 'ORL', 'WAS', 'BOS', 'BKN', 'NYK', 'PHI', 'TOR', 'CHI', 'CLE', 'DET', 'IND', 'MIL') THEN 'Eastern'
        WHEN {{ abbreviation_team }} IN ('DAL', 'HOU', 'MEM', 'NOP', 'SAS', 'DEN', 'MIN', 'OKC', 'POR', 'UTA', 'GSW', 'LAC', 'LAL', 'PHX', 'SAC') THEN 'Western'
        ELSE 'Unknown'
    END AS conference
{% endmacro %}
