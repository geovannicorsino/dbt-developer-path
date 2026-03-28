{% macro format_currency(amount) %}
    CONCAT('$', CAST({{ amount }} AS STRING))
{% endmacro %}
