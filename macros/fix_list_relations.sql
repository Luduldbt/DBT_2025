{% macro list_relations_without_caching(schema_relation) -%}
  {% call statement('list_relations_without_caching', fetch_result=True) %}
    {% if '.' in schema_relation %}
      show objects in schema {{ schema_relation }}
    {% else %}
      show objects in schema {{ target.database }}.{{ schema_relation }}
    {% endif %}
  {% endcall %}
  {{ return(load_result('list_relations_without_caching').table) }}
{%- endmacro %}
