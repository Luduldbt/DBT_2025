{{
    config(
        materialized='table',
        query_tag = 'GS_PROJECT_DBT'
    )
}}

select current_timestamp()