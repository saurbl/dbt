with customers as (

     select * from {{ ref('stg_jaffle_shop__customers') }}

),

orders as ( 

    select * from {{ ref('fct_orders') }}

),

customer_orders as (

    select
        customer_id,
        min(order_date) as first_order_date,
        max(order_date) as most_recent_order_date,
        count(order_id) as number_of_orders,
        sum(amount) as lifetime_value

    from orders

    group by 1

),

final as (

    select
        customers.customer_id,
     {% set Name= ['Michael','Shawn']%}
     {% for Names in Name %}
     sum(case when customers.first_name='{{ Names }}' then customer_orders.number_of_orders else 0 end) as totalSoldBy_{{Names}}{% if not loop.last %},{% endif -%}
	  {% endfor %}
    from customers

    left join customer_orders using (customer_id)
     group by 1
)

select * from final