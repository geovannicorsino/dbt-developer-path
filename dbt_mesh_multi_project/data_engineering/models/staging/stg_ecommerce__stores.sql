with source as (

    select * from {{ ref('raw_stores') }}

),

renamed as (

    select
        id                              as store_id,
        name                            as store_name,
        cast(opened_at as timestamp)    as opened_at,
        cast(tax_rate as float64)       as tax_rate

    from source

)

select * from renamed
