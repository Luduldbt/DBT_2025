{% macro get_season(date_column_name) %}

case 
 WHEN MONTH({{date_column_name}}) IN (12,1,2) THEN 'WINTER'
        WHEN MONTH({{date_column_name}}) IN (3,4,5) THEN 'SPRING'
        WHEN MONTH({{date_column_name}}) IN (6,7,8)  THEN 'SUMMER'
        ELSE 'AUTUMN'
        END 
{% endmacro %}