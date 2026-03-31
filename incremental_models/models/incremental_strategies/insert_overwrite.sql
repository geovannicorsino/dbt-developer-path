{{
    config(
        materialized='incremental',
        incremental_strategy='insert_overwrite',
        partition_by={
            "field": "ingest_date",
            "data_type": "date",
            "granularity": "day"
        }
    )
}}

select *
from {{ source('incremental_models', 'events') }}

{% if is_incremental() %}

  -- recalculate only for new ingest dates
  where ingest_date >= (select max(ingest_date) from {{ this }} )

{% endif %}
