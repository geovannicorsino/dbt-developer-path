with source as (
    select * from {{ ref('sales') }}
),

renamed as (
    select
        {{ dbt_utils.generate_surrogate_key(['sale_id', 'product_id']) }} as sale_surrogate_key,
        *
    from source
)

select * from renamed
