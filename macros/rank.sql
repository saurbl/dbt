{% macro rank(partition_by_col, order_by_col) %}
 rank() over (
 partition by {{ partition_by_col }} order by {{ order_by_col }} desc)
{% endmacro %}
