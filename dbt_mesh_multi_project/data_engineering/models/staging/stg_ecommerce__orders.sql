with source as (

    select * from {{ ref('raw_orders') }}

),

renamed as (

    select
        id                              as order_id,
        customer                        as customer_id,
        store_id,
        subtotal,
        tax_paid,
        order_total,
        cast(ordered_at as timestamp)   as ordered_at

    from source

)

select * from renamed
