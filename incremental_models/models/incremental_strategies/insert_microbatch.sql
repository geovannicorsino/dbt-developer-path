{{
    config(
        materialized='incremental',
        incremental_strategy='microbatch',
        event_time="ingest_date",
        batch_size="hour",
        begin="2026-03-01",
        partition_by={
            "field": "ingest_date",
            "data_type": "date",
            "granularity": "day",
        }
    )
}}

select *
from {{ source('incremental_models', 'events') }}
