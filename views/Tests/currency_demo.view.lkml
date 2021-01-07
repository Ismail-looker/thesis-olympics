view: currency_demo
{
  derived_table:
  {
    sql:
      SELECT 1 as ID, 10000.00 as val, 'USD' as currency
      UNION ALL
      SELECT 2 as ID, 10000.00 as val, 'EUR' as currency
      UNION ALL
      SELECT 3 as ID, 10000.00 as val, 'CHF' as currency
      UNION ALL
      SELECT 4 as ID, 20000.00 as val, 'JPY' as currency
      UNION ALL
      SELECT 5 as ID, 10000.00 as val, 'GBP' as currency;;
  }

  dimension: ID
  {
    type: number
    primary_key: yes
    sql: ${TABLE}.ID;;
    html: <center>{{value}}</center> ;;
  }

  dimension: currency
  {
    type: string
    sql: ${TABLE}.currency;;
  }

  dimension: currency_symbol
  {
    hidden: yes
    sql:
        CASE
          WHEN ${currency} = 'USD' THEN '$'
          WHEN ${currency} = 'EUR' THEN '£'
          WHEN ${currency} = 'JPY' THEN '¥'
          ELSE CONCAT(${currency}, ' ')
        END;;
  }

  dimension: raw_value {
    type: number
#     value_format: "0.##"
    value_format_name: decimal_2
    order_by_field: usd_amount
    sql: ${TABLE}.val;;
  }

  dimension: formatted_amount {
    type: string
#     value_format: "0.##"
    # value_format_name: decimal_2
    order_by_field: usd_amount
    sql: ${TABLE}.val;;
#         {{ currency_symbol._value }}{{ rendered_value }};; # html
    html:   {% if currency._value == 'USD' %}
              {{ rendered_value | prepend: "$ " }}
            {% elsif currency._value == 'EUR' %}
              {{ rendered_value | prepend: "€ " }}
            {% elsif currency._value =='GBP' %}
              {{ rendered_value | prepend: "£ " }}
            {% elsif currency._value == 'JPY' %}
              {{ rendered_value | prepend: "¥ " }}
          {% else %}
            {{ rendered_value | prepend: " " | prepend: currency._value }}
          {% endif %};;
  }

  measure: currency_summary {
    type: number
    sql:${formatted_amount};;
    html:   {% if currency._value == 'USD' %}
              {{ rendered_value | prepend: "$ " }}
            {% elsif currency._value == 'EUR' %}
              {{ rendered_value | prepend: "€ " }}
            {% elsif currency._value =='GBP' %}
              {{ rendered_value | prepend: "£ " }}
            {% elsif currency._value == 'JPY' %}
              {{ rendered_value | prepend: "¥ " }}
            {% else %}
              {{ rendered_value | prepend: " " | prepend: currency._value }}
            {% endif %};;
  }

  dimension: usd_amount
  {
    hidden: yes
    type: number
    value_format: "0.##"
    sql:
        CASE
          WHEN ${currency} = 'USD' THEN 1.0 * ${formatted_amount}
          WHEN ${currency} = 'EUR' THEN 1.09 * ${formatted_amount}
          WHEN ${currency} = 'JPY' THEN 0.008 * ${formatted_amount}
          WHEN ${currency} = 'CHF' THEN 1.02 * ${formatted_amount}
          ELSE NULL
        END;;
  }

  dimension: rating {
    sql: ${TABLE}.ID  ;;
    html: {% if value == 1 %}
              {{ value | append: " " }}
              <i class='fa fa-star' aria-hidden='true'></i>
            {% elsif value == 2 %}
              {{ rendered_value | append: " " }}
              <i class='fa fa-star' aria-hidden='true'></i>
              <i class='fa fa-star' aria-hidden='true'></i>
            {% elsif value == 3 %}
              {{ value | append: " " }}
              <i class='fa fa-star' aria-hidden='true'></i>
              <i class='fa fa-star' aria-hidden='true'></i>
              <i class='fa fa-star' aria-hidden='true'></i>
            {% elsif value == 4 %}
              {{ value | append: " " }}
              <i class='fa fa-star' aria-hidden='true'></i>
              <i class='fa fa-star' aria-hidden='true'></i>
              <i class='fa fa-star' aria-hidden='true'></i>
              <i class='fa fa-star' aria-hidden='true'></i>
            {% elsif value == 5 %}
             {{ value | append: " " }}
              <i class='fa fa-star' aria-hidden='true'></i>
              <i class='fa fa-star' aria-hidden='true'></i>
              <i class='fa fa-star' aria-hidden='true'></i>
              <i class='fa fa-star' aria-hidden='true'></i>
              <i class='fa fa-star' aria-hidden='true'></i>
            {% endif %};;
  }

  dimension: rating2 {
    sql: ${TABLE}.ID  ;;
    html: {% if value == 1 %}
              {{ rendered_value | append: " " }}
                {% for i in (1..value) %}
                  <i class='fa fa-star' aria-hidden='true'></i>
                {% endfor %}
            {% elsif value == 2 %}
              {{ rendered_value | append: " " }}
                {% for i in (1..value) %}
                  <i class='fa fa-star' aria-hidden='true'></i>
                {% endfor %}
            {% elsif value == 3 %}
              {{ rendered_value | append: " " }}
                {% for i in (1..value) %}
                  <i class='fa fa-star' aria-hidden='true'></i>
                {% endfor %}
            {% elsif value == 4 %}
              {{ rendered_value | append: " " }}
                {% for i in (1..value) %}
                  <i class='fa fa-star' aria-hidden='true'></i>
                {% endfor %}
            {% elsif value == 5 %}
              {{ rendered_value | append: " " }}
                {% for i in (1..value) %}
                  <i class='fa fa-star' aria-hidden='true'></i>
                {% endfor %}
            {% endif %};;
  }

  measure: count {
    type: count
  }

}
