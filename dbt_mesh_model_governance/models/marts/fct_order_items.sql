{{ config(materialized = 'table') }}

with items as (
    select * from {{ ref('raw_items') }}
),

orders as (
    select * from {{ ref('raw_orders') }}
),

customers as (
    select * from {{ ref('raw_customers') }}
),

stores as (
    select * from {{ ref('raw_stores') }}
),

final as (
    select
        items.id                                    as order_item_id,
        items.order_id,
        items.sku                                   as product_id,
        orders.store_id                             as location_id,
        orders.customer                             as customer_id,
        orders.order_total,
        cast(orders.tax_paid as float64)            as tax_paid,
        cast(orders.ordered_at as timestamp)        as ordered_at,
        customers.name                              as customer_name,
        stores.name                                 as location_name,
        stores.tax_rate,
        cast(stores.opened_at as timestamp)         as location_opened_at
    from items
    left join orders    on orders.id    = items.order_id
    left join customers on customers.id = orders.customer
    left join stores    on stores.id    = orders.store_id
)

select * from final