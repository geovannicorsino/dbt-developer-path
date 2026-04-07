{{ config(materialized='table') }}

with stores as (

    select * from {{ ref('data_engineering', 'stg_ecommerce__stores') }}

),

orders as (

    select * from {{ ref('data_engineering', 'stg_ecommerce__orders') }}

),

store_metrics as (

    select
        store_id,
        count(order_id)     as total_orders,
        sum(order_total)    as total_revenue

    from orders
    group by store_id

),

final as (

    select
        stores.store_id,
        stores.store_name,
        stores.opened_at,
        stores.tax_rate,
        coalesce(store_metrics.total_orders, 0)     as total_orders,
        coalesce(store_metrics.total_revenue, 0)    as total_revenue

    from stores
    left join store_metrics using (store_id)

)

select * from final
