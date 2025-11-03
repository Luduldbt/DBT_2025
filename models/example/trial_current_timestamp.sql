{{
    config(
        materialized='view'
    )
}}
select current_timestamp() as ct