{% macro get_day(date_column) %}
    CASE
    WHEN DAYNAME({{date_column}}) IN ('Sat','Sun')
         THEN 'WEEKEND'
         ELSE 'BUSINESSDAY'
    END
{% endmacro %}