{{
    config(
        materialized='table',
        pre_hook = [
            "INSERT INTO SF_DBT_PULL.PRE_CREATED_TABLES.trial_timestamp_log(u_id,model_name,run_time_start,environment,status)
            SELECT UUID_STRING(),'{{ this.name }}',current_timestamp(),'{{ target.name }}','Started'
            "
        ],
        post_hook = [
            "UPDATE SF_DBT_PULL.PRE_CREATED_TABLES.trial_timestamp_log 
            SET run_time_end = CURRENT_TIMESTAMP() ,
            status = 'Success'
            WHERE run_time_end IS NULL
            AND model_name  = '{{this.name}}'
            AND environment = '{{target.name}}' 
            AND status = 'Started'
            
            "
            
        ],
        alias = 'log_table_entry_practise'
    )
}}
SELECT 'Hello Ronu' as Greetings