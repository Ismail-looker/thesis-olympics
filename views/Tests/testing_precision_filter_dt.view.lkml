view: testing_precision_filter_dt {
  derived_table: {
    sql: SELECT 1 as id, 11.0000009 as in_days
                    UNION ALL
                    SELECT 2 as id, 11.02 as in_days
                    UNION ALL
                    SELECT 3 as id, 11 as in_days
                    UNION ALL
                    SELECT 4 as id, 29 as in_days
                    UNION ALL
                    SELECT 5 as id, 32 as in_days
  ;;
  }
  dimension: id {
    sql: ${TABLE}.id;;
  }

  dimension: order_date {
    type:date
    convert_tz: no
  }

  dimension: in_days {
    type: number
    sql: round(${TABLE}.in_days,0) ;;
    value_format: "#00.000"
  }


  measure: count {
    type: count
#     sql: ${id} ;;
  }

# # TEST ---------------------------------------------------------------
#   dimension_group: today {
#     type: time
#     sql: CURRENT_TIMESTAMP() ;;
#   }
#
#   parameter: this_year_or_earlier{
#     description: "Current Year or Earlier"
#     type: unquoted
#     allowed_value: {
#       label: "Current year"
#       value: "this_year"
#     }
#     allowed_value: {
#       label: "Before this year"
#       value: "before_this_year"
#     }
#     allowed_value: {
#       label: "After 2012"
#       value: "aft_2012"
#     }
#   }

#   dimension_group: dashboard_olympiad_start {
#     description: "Dashboard Olympic Start Date"
#     type: time
# #     timeframes: [
# #       date, month, year
# #     ]
# #     convert_tz: no
#     datatype: date
#     sql: {% if {{this_year_or_earlier._parameter_value}} == 'this_year' %}
#         CASE
#           WHEN ${olympiad_start_year} = ${today_year}
#           THEN ${olympiad_start_date} ELSE NULL
#          END
#       {% elsif {{this_year_or_earlier._parameter_value}} == 'before_this_year' %}
#         CASE
#           WHEN ${olympiad_start_year} < ${today_year}
#           THEN ${olympiad_start_date} ELSE NULL
#         END
#       {% elsif {{this_year_or_earlier._parameter_value}} == 'aft_2012' %}
#         CASE
#           WHEN ${olympiad_start_year} >= 2012
#           THEN ${olympiad_start_date} ELSE NULL
#         END
#       {% else %}
#         ${olympiad_start_date}
#       {% endif %}
#   ;;
#   }
  #     sql: {% if {{this_year_or_earlier._parameter_value}} == "'before this year'" %}
#         CASE WHEN ${TABLE}.Olympiad_StartDate < date_trunc("year", getdate()) THEN ${TABLE}.Olympiad_StartDate ELSE NULL END
#         {% elsif {{this_year_or_earlier._parameter_value}} == "'this year'" %}
#         ${TABLE}.Olympiad_StartDate WHERE ${TABLE}.Olympiad_StartDate = date_trunc("year", getdate())
#         {% else %}
#         ${TABLE}.Olympiad_StartDate
#         {% endif %};;
#     sql:  CASE
#             WHEN {{this_year_or_earlier._parameter_value}} == "'this year'" THEN 'Male'
#             ELSE NULL
#           END;;


#   dimension: dashboard_purchase_date {
#     sql: {% if {{include_last_month._parameter_value}} == 'this' %}
#           CASE
#             WHEN ${purchase_month} = ${today_month}
#             THEN ${purchase_date} ELSE NULL
#            END
#         {% elsif {{include_last_month._parameter_value}} == 'before' %}
#           CASE
#             WHEN ${purchase_month} < ${today_month}
#             THEN ${purchase_date} ELSE NULL
#           END
#         {% else %}
#           ${purchase_date}
#         {% endif %}
#     ;;
#   }

#   dimension_group: dashboard_olympiad_start {
#     description: "Dashboard Olympic Start Date"
#     type: time
#     timeframes: [
#       year
#     ]
#     convert_tz: no
#     datatype: date
#     sql: {% if {{this_year_or_earlier._parameter_value}} == "'before this year'" %}
#         ${TABLE}.Olympiad_StartDate WHERE ${TABLE}.Olympiad_StartDate < date_trunc("year", getdate())
#         {% elsif {{this_year_or_earlier._parameter_value}} == "'this year'" %}
#         ${TABLE}.Olympiad_StartDate WHERE ${TABLE}.Olympiad_StartDate = date_trunc("year", getdate())
#         {% else %}
#         ${TABLE}.Olympiad_StartDate
#         {% endif %};;
#   }
#   sql: {% if this_year_or_earlier == "'before this year'" %}
#   ${TABLE}.Olympiad_StartDate WHERE ${TABLE}.Olympiad_StartDate < date_trunc("year", getdate())
#   {% elsif this_year_or_earlier == "'this year'" %}
#   ${TABLE}.Olympiad_StartDate WHERE ${TABLE}.Olympiad_StartDate = date_trunc("year", getdate())
#   {% elsif this_year_or_earlier == "'2016'" %}
#   ${TABLE}.Olympiad_StartDate WHERE ${TABLE}.Olympiad_StartDate = "'2016'"
#   {% else %}
#   ${TABLE}.Olympiad_StartDate
#   {% endif %};;
# }

#   parameter: this_month_or_earlier{
#     description: "Current Month or Earlier"
#     type: unquoted
#     allowed_value: {
#       label: "Current Month"
#       value: "this month"
#     }
#     allowed_value: {
#       label: "Before this month"
#       value: "before this month"
#     }
#     allowed_value: {
#       label: "2016"
#       value: "2016"
#     }
#   }

#   filter: current_month_selector {
#     description: "Current Month or Earlier"
#     type: string
#     default_value: "this month"
#     full_suggestions: yes
#     suggest_dimension: summer_games.olympiad_start
#   }
# TEST ---------------------------------------------------------------
}
