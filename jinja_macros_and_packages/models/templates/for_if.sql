{%- set numbers = range(
    1,
    11
) -%}
{%- for num in numbers -%}
    {%- if num % 2 == 0 -%}
    SELECT
        {{ num }} AS even_number

        {%- if not loop.last %}
    UNION ALL
    {% endif -%}
{%- endif -%}
{%- endfor -%}
