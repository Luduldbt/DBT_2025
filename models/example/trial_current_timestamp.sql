{{
    config(
        materialized='ephemeral'
    )
}}
select current_timestamp() as ct