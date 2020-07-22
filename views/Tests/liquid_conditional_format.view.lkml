view: liquid_conditional_format {
  derived_table: {
    sql:
      SELECT 1 as id, "[120, 300, 400]" as pattern, "[120, 300, 400]" as epoch_list, 5 as count UNION ALL
            SELECT  2 as id, "[120, 300, 400]" as pattern, "[100, 120, 300, 400, 120, 300, 400]" as epoch_list, 5 as count UNION ALL
            SELECT  3 as id, "[100, 250, 300]" as pattern, "[100, 250, 300, 400]" as epoch_list, 5 as count UNION ALL
            SELECT  4 as id, "[350, 500, 600]" as pattern, "[100, 250, 300, 400]" as epoch_list, 5 as count UNION ALL
            SELECT  5 as id, "[Hello]" as pattern, "[Hello, World]" as epoch_list, 5 as count UNION ALL
            SELECT  6 as id, null as pattern, "[Hello, World]" as epoch_list, 5 as count UNION ALL
            SELECT  7 as id, "fitbit,endomondo,googlefit" as pattern, "[Hello, World]" as epoch_list, 5 as count
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
    html: <p style="text-align:center">{{value}}</p> ;;
  }

  dimension: matches {
    type: string
    sql:${TABLE}.pattern;;
    html: {% assign _count = 0 %}
              {% assign __pattern = value | remove: '['| remove: ']'%}
              {% assign __epoch_list = epoch_list._value | remove: '['| remove: ']' | split: ', '%}
              {% assign _epochlist_countseed = epoch_list._value %}
                {% for item in __epoch_list %}
                  {% if _epochlist_countseed contains __pattern %}
                    {% assign _count = _count | plus: 1 %}
                    {% assign _epochlist_countseed = _epochlist_countseed | replace_first: __pattern, '' %}
                  {% endif %}
                {% endfor %}
              <p style="text-align:center">{{ _count }}</p>;;
  }

  dimension: epoch_list {
    type: string
    sql:${TABLE}.epoch_list;;
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

#   dimension: pattern_test {
#     type: number
#     required_fields: [pattern]
#     sql: {% assign _pattern = pattern._value | remove: '['| remove: ']' | split: ', ' | join: "-" %}
#           {% assign _epoch_list = epoch_list._value | remove: '['| remove: ']' | split: ', ' | join: "-" %}
#     {% assign patt = "r'" | append: _pattern | append: "'" %}
#     array_length(regexp_extract_all({{_epoch_list}}, {{patt}}));;
#   }

#   dimension: pattern_test2 {
#     type: string
#     required_fields: [pattern]
#     sql: {% assign _pattern2 = pattern._value | remove: '['| remove: ']' | split: ', ' | join: "-" %}
#           {% assign _epoch_list2 = epoch_list._value | remove: '['| remove: ']' | split: ', ' | join: "-" %}
#     {% assign patt2 = "r'" | append: _pattern2 | append: "'" %}
#       ARRAY_TO_STRING((regexp_extract_all({{_epoch_list2}}, {{patt2}})), ' - ');;
#   }

    dimension: epoch_list_highlighted {
      type: string
      sql:${TABLE}.epoch_list;;
      html:
          {% assign stripped_pattern = pattern._value | remove: '['| remove: ']' %}
          {% assign highlight = stripped_pattern | prepend: '<mark>' | append: '</mark>' %}
          {% if value contains stripped_pattern  %}
            <p style="color: black; text-align:center">{{value | replace: stripped_pattern, highlight }}</p>
          {% else %}
            <p style="color: black; text-align:center">{{value}}</p>
          {% endif %};;
    }
#     html: {% assign stripped_pattern = pattern._value | remove: '['| remove: ']' %}
#             {% assign new_pattern = stripped_pattern | prepend: '<'| append: '>' %}
#           {% assign _epoch_list = value | remove: '['| remove: ']' %}
#           {% if _epoch_list contains stripped_pattern  %}
#           <p style="background-color: lightgreen; color: black; text-align:center">{{value | replace: stripped_pattern, new_pattern }} <i class="fa fa-check" style="font-size:14px;color:green"></i></p>
#           {% else %}
#           <p style="background-color: orange; color: black; text-align:center">{{value}} <i class="fa fa-times" style="font-size:14px;color:red"></i></p>
#           {% endif %};;


    dimension: epoch_list_2 {
      type: string
      sql:${TABLE}.epoch_list;;
      required_fields: [pattern]
#       html:
#         {% if (value | remove: '['| remove: ']') contains (pattern._value | remove: '['| remove: ']') %}
#          <p style="color: green">{{ rendered_value }}</p>
#         {% elsif value contains "250" %}
#          <p style="color: blue">{{ rendered_value }}</p>
#         {% else %}
#          <p style="color: red; font-size:100%">{{ rendered_value }}</p>
#         {% endif %};;
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

    dimension: partner_integration {
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

    dimension: count_of_integration{
      sql: coalesce(${TABLE}.pattern, "EMPTY");;
      html: {% assign my_array = value  %}
            {% assign my_array2 = my_array | split: "," %}
            {% if my_array == "EMPTY" %}
              0
            {% else %}
              {{ my_array2.size }}
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
