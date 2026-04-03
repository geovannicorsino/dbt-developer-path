SELECT
    id AS payment_id,
    orderid AS order_id,
    paymentmethod AS payment_method,
    status,
    amount / 100 AS amount,-- amount IS STORED IN cents CONVERT it TO dollars,
    created AS created_at,
FROM
    {{ source(
        'stripe',
        'payments'
    ) }}
