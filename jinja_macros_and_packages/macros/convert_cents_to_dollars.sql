{% macro convert_cents_to_dollars(amount_column) %}
    {{ amount_column }} / 100.0
{% endmacro %}