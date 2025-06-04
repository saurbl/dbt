{%for i in range(10)%}
select {{i}} from number {%if not loop.last %} union all {%endif%}
{%endfor%}

{% set my_name= 'Saurabh' %}
my name is {{ my_name }} 

{% set flavors = ['chocolate', 'vanilla','strawberry'] %}
{{flavors[0]}}
{{flavors[1]}}
{{flavors[2]}}

{% set flavors = ['chocolate', 'vanilla','strawberry'] %}
{% for icecream in flavors -%}
i like {{icecream}}
{%endfor%}

{% set temperature = 40.0 %}
{%if temperature >50%}
i want cold drink
{%else %}
i want coffee
{%endif%}

{% set person = {
    'name': 'me',
    'number': 3
} %}

{{ person.name}}
