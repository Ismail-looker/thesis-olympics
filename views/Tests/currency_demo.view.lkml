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
      SELECT 4 as ID, 10000.00 as val, 'JPY' as currency;;
  }

  dimension: ID
  {
    type: number
    primary_key: yes
    sql: ${TABLE}.ID;;
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

  dimension: formatted_amount {
    type: number
#     value_format: "0.##"
    value_format_name: decimal_2
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

  measure: count {
    type: count
  }

}
