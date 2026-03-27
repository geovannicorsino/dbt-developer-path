{%- set statuses = ['completed', 'pending', 'shipped'] -%}

SELECT
    customer_id,
    {% for status in statuses %}
        SUM(
            CASE
                WHEN status = '{{ status }}' THEN order_amount
                ELSE 0
            END
        ) AS {{ status }}_total,
        COUNT(
            CASE
                WHEN status = '{{ status }}' THEN 1
            END
        ) AS {{ status }}_count
        {% if not loop.last %},
        {% endif %}
    {% endfor %}
FROM {{ ref('orders') }}
GROUP BY customer_id
ORDER BY customer_id
