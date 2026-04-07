with source as (

    select * from {{ ref('raw_products') }}

),

renamed as (

    select
        sku,
        name            as product_name,
        type            as product_type,
        cast(price as int64)    as product_price,
        description     as product_description

    from source

)

select * from renamed
