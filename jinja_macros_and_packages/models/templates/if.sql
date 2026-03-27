{%- set color = "blue" -%}
{%- if color == "blue" -%}
SELECT
    'The sky is blue' AS message
{%- else -%}
SELECT
    'The color is not blue' AS message
{%- endif -%}
