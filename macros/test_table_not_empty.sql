{% macro test_table_not_empty(model, column_name=1) %}

{% set error_threshold = kwargs.get('error_threshold', 0) %}

WITH count_rows AS (

    SELECT 
        count({{ column_name }}) AS cnt
    FROM {{ model }}

)

SELECT 
    cnt
FROM count_rows
WHERE cnt <= {{ error_threshold }}

{% endmacro %}