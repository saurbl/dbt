{% macro limit_data(col_name) -%}
where {{ col_name }} >=dateadd('day',-3,current_timestamp)
{% endmacro %}