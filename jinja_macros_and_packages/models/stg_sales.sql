select
    sale_id,
    product_id,
    quantity,
    {{ convert_cents_to_dollars('sale_amount_cents') }} as sale_amount_dollars,
    {{ format_currency(convert_cents_to_dollars('sale_amount_cents')) }} as sale_amount_formatted,
    sale_date,
    customer_id
from {{ ref('sales') }}