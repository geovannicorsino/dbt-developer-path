{% set person ={ 'name': 'John',
'age': 30,
'email': 'john@example.com',
'city': 'Sao Paulo' } %}
{% for key,
    value in person.items() %}
SELECT
    '{{ key }}' AS field,
    '{{ value }}' AS VALUE {% if not loop.last %}
    UNION ALL
    {% endif %}
{% endfor %}
