{%- set colors = ['red', 'orange', 'yellow', 'green', 'blue', 'indigo', 'violet'] -%}
SELECT
    {%- for color in colors -%}
        '{{ color }}' AS rainbow_color,
        {%- if not loop.last -%}
        {%- endif -%}
    {%- endfor -%}
