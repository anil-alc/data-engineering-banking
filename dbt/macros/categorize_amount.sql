{% macro categorize_amount(column_name) %}
    case
        when {{ column_name }} < 1000 then 'Low Value'
        when {{ column_name }} between 1000 and 10000 then 'Medium Value'
        else 'High Value'
    end
{% endmacro %}