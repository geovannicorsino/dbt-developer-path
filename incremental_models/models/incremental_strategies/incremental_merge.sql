{{
    config(
        materialized='incremental',
        unique_key='event_id',
        incremental_strategy='merge'
    )
}}

select *
from {{ source('incremental_models', 'events') }}

{% if is_incremental() %}

  -- recalculate only for new ingest dates
  where ingest_date >= (select max(ingest_date) from {{ this }} )

{% endif %}
