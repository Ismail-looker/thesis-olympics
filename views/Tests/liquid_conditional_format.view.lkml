view: liquid_conditional_format {
  derived_table: {
    sql:
      SELECT 1 as id, "[120, 300, 400]" as pattern, "[120, 300, 400]" as epoch_list, 5 as count UNION ALL
            SELECT  2 as id, "[120, 300, 400]" as pattern, "[100, 120, 300, 400]" as epoch_list, 5 as count UNION ALL
            SELECT  3 as id, "[100, 250, 300]" as pattern, "[100, 250, 300, 400]" as epoch_list, 5 as count UNION ALL
            SELECT  4 as id, "[350, 500, 600]" as pattern, "[100, 250, 300, 400]" as epoch_list, 5 as count UNION ALL
            SELECT  5 as id, "[Hello]" as pattern, "[Hello, World]" as epoch_list, 5 as count
      ;;
  }

  dimension: id {
    primary_key:yes
    type:number
    sql:${TABLE}.id;;
  }

  dimension: pattern {
    type: string
    sql:${TABLE}.pattern;;
#     html: <font color="Red">{{ value }}</font> ;;
#     html: {{ value | remove: '['| remove: ']' | split: ', ' | join: "-" }} ;;
  }

  dimension: pattern_test {
    type: string
    sql:${TABLE}.pattern;;
#     html: {{ value | remove: '['| remove: ']' | replace: "," , "-" }}  ;;
#     html: {{ value | remove: '['| remove: ']' | split: ', ' | join: "-" }}  ;;
  }

  dimension: epoch_list_test {
    type: string
    sql:${TABLE}.epoch_list;;
    required_fields: [pattern]
#     html: {{ value | remove: '['| remove: ']' | replace: "," , "-" }}  ;;
#     html: {{ value | remove: '['| remove: ']' | split: ', ' | join: "-" }}  ;;
    html: {% assign epoc = value | remove: '['| remove: ']' | split: ', ' | join: "-" %}{% capture match_found %};;
  }

  dimension: test {
    type: string
    sql: ${TABLE}.pattern;;
    html: {% assign link = "http://example.com "%};;
#       {% capture has_link %}{% if link contains '://' %}Yes{% else %}No{% endif %}{% endcapture%}
#       {{has_link}} ;;
  }

  dimension: epoch_list {
    type: string
    sql:${TABLE}.epoch_list;;
    required_fields: [pattern]
    html: {% assign _pattern = pattern._value | remove: '['| remove: ']' | split: ', ' | join: "-" %}
          {% assign _epoch_list = value | remove: '['| remove: ']' | split: ', ' | join: "-" %}
      {% if _epoch_list contains _pattern  %}
        <p style="background-color: lightgreen; color: black; text-align:center">{{value}} <i class="fa fa-check" style="font-size:14px;color:green"></i></p>
      {% else %}
        <p style="background-color: orange; color: black; text-align:center">{{value}} <i class="fa fa-times" style="font-size:14px;color:red"></i></p>
      {% endif %};;
      #     html:
      #         {% if value | remove: '['| remove: ']' | split: ', ' | join: "-" contains pattern._rendered_value %}
      #           <i class="far fa-thumbs-up"></i> <div style="background-color: lightgreen; color: black; text-align:center">{{ rendered_value | replace: pattern._value, 'match found: ' | append: pattern._value }}</div>
      #         {% elsif value contains '250' %}
      #           <div style="background-color: lightblue; text-align:center">{{ value }}</div>
      #         {% else %}
      #           <div style="background-color: red; text-align:center">{{ value }}</div>
      #         {% endif %};;

    }

    dimension: epoch_list_2 {
      type: string
      sql:${TABLE}.epoch_list;;
      required_fields: [pattern]
      html:
        {% if (value | remove: '['| remove: ']') contains (pattern._value | remove: '['| remove: ']') %}
         <p style="color: green">{{ rendered_value }}</p>
        {% elsif value contains "250" %}
         <p style="color: blue">{{ rendered_value }}</p>
        {% else %}
         <p style="color: red; font-size:100%">{{ rendered_value }}</p>
        {% endif %};;
    }

    dimension: epoch_list_3 {
      type: string
      sql:${TABLE}.epoch_list;;
      required_fields: [pattern]
      html: {% assign answer =  value | remove: '['| remove: ']' contains pattern._value | remove: '['| remove: ']' %}
              {% case answer %}
                {% when true %}
                   {{answer}} <div style="background-color: lightgreen; color: black; text-align:center">{{ value | replace: pattern._value, '*' }}</div>
                {% else %}
                  <div style="background-color: lightblue; color: black; text-align:center">{{ value }}</div>
              {% endcase %};;
    }

    dimension: yes_no {
      type: yesno
      sql:{% if ${epoch_list}| remove: '['| remove: ']' contains ${pattern}| remove: '['| remove: ']' %}
        true
          {% else %}
            false
          {% endif %} ;;
    }

    dimension: epoch_list_4 {
      type: string
      sql:${TABLE}.epoch_list;;
      required_fields: [pattern]
      html: {% assign answer = epoch_list_4._value contains 'hello' %}

       1.  {{value | remove: '['| remove: ']' | split: ', ' | join: "-" contains pattern._value | remove: '['| remove: ']' | split: ', ' | join: "-"}} 4. {{answer}};;
    }
    dimension: ttt {
      type: string
      sql:${TABLE}.epoch_list;;
      required_fields: [pattern]
      html: {% assign string = '[hello, world]' %}
            {% if string contains 'hello' %}
              {{string contains 'hello'}} string includes 'hello'
              {% else %}
              no
            {% endif %};;
    }

    measure: count {
      type: sum
      sql:${TABLE}.count;;
    }

#   dimension: epoch_list {
#     type: string
#     sql:${TABLE}.epoch_list;;
#     required_fields: [pattern]
#     html:
#         {% if (value | remove: '['| remove: ']' | split: ', ' | join: "-") contains (pattern._value | remove: '['| remove: ']' | split: ', ' | join: "-") %}
#          <p style="color: green">{{ rendered_value }}</p>
#         {% elsif value contains "250" %}
#          <p style="color: blue">{{ rendered_value }}</p>
#         {% else %}
#          <p style="color: red">{{ rendered_value }}</p>
#         {% endif %};;
#
#     }

  }
