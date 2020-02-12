view: summer_games {
  sql_table_name: Olympics.Summer_Games ;;

  dimension: olympiad_id {
    description: "Unique ID"
    type: number
    primary_key: yes
    sql: ${TABLE}.Olympiad_ID ;;
  }

  dimension: olympiad_city_wiki_link {
    description: "Link to Host City Wikipage"
    type: string
    sql: ${TABLE}.Olympiad_CityWikiLink ;;
    hidden: yes
  }

  dimension_group: olympiad_end {
    description: "Olympic End Date"
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.Olympiad_EndDate ;;
    html:
      {% if olympiad_end_date._in_query %}
        {{linked_value}} | date: format: 'abbreviated_date'
#       {% else %}
#         event
      {% endif %}
    ;;
  }

  dimension: olympiad_host_city {
    description: "Host City"
    label: "Host City"
    type: string
    sql: ${TABLE}.Olympiad_HostCity ;;
    link: {
      icon_url: "https://en.wikipedia.org/static/favicon/wikipedia.ico"
      label: "{{ olympiad_host_city._value }}"
      url: "{{olympiad_city_wiki_link}}"
    }
    map_layer_name: modern_olympics_layer {
      label: "Host City"
    }
  }

  dimension: olympiad_host_country {
    description: "Host Country"
    label: "Host Country"
    type: string
    sql: ${TABLE}.Olympiad_HostCountry ;;
    map_layer_name: countries {
      label: "Host Nation"
    }
  }

  dimension: olympiad_host_country_code {
    description: "Host Country Code"
    type: string
    sql: ${TABLE}.Olympiad_HostCountryCode ;;
    map_layer_name: countries {
      label: "Host Nation Code"
    }
  }

  dimension: olympiad_is_celebrated {
    description: "Was the Olympiad celebrated or cancelled?"
    label: "Was the Olympiad celebrated?"
    type: yesno
    sql: ${TABLE}.Olympiad_IsCelebrated ;;
  }

  dimension: olympiad_ordinal {
    description: "1st, 2nd, ..."
    type: string
    sql: ${TABLE}.Olympiad_Ordinal ;;
  }

  dimension: olympiad_planned_city {
    description: "Host city before Cancellation"
    type: string
    sql: ${TABLE}.Olympiad_PlannedCity ;;
  }

  dimension: olympiad_roman {
    description: "I, II, III, IV,..."
    type: string
    sql: ${TABLE}.Olympiad_Roman ;;
  }

  dimension_group: olympiad_start {
    description: "Olympic Start Date"
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.Olympiad_StartDate ;;
  }

  dimension: olympiad_status {
    description: "Celebrated or Not"
    type: string
    case_sensitive: no
    sql: ${TABLE}.Olympiad_Status ;;
  }

  dimension: olympiad_year {
    description: "Olympic Year (YYYY)"
    type: number
    value_format: "####"
    sql: ${TABLE}.Olympiad_Year ;;
  }

  dimension_group: olympiad_duration {
    description: "How long was the Olympics?"
    label: "
    {% if days_olympiad_duration._in_query %} Olympiad Duration in Days
    {% elsif weeks_olympiad_duration._in_query %}  Olympiad Duration in Weeks
    {% else %}  Olympiad Duration
    {% endif %}"
    # label: "Olympiad Duration"
    type: duration
    datatype: date
    intervals: [day, week]
    sql_start: ${TABLE}.Olympiad_StartDate ;;
    sql_end: ${TABLE}.Olympiad_EndDate ;;

  }

  measure: count {
    type: count
    drill_fields: [olympiad_id]
  }



# TEST ---------------------------------------------------------------
  dimension_group: today {
    type: time
    sql: CURRENT_TIMESTAMP() ;;
  }

  parameter: this_year_or_earlier{
    description: "Current Year or Earlier"
    type: unquoted
    allowed_value: {
      label: "Current year"
      value: "this_year"
    }
    allowed_value: {
      label: "Before this year"
      value: "before_this_year"
    }
    allowed_value: {
      label: "After 2012"
      value: "aft_2012"
    }
  }

  dimension_group: dashboard_olympiad_start {
    description: "Dashboard Olympic Start Date"
    type: time
#     timeframes: [
#       date, month, year
#     ]
#     convert_tz: no
    datatype: date
    sql: {% if {{this_year_or_earlier._parameter_value}} == 'this_year' %}
        CASE
          WHEN ${olympiad_start_year} = ${today_year}
          THEN ${olympiad_start_date} ELSE NULL
         END
      {% elsif {{this_year_or_earlier._parameter_value}} == 'before_this_year' %}
        CASE
          WHEN ${olympiad_start_year} < ${today_year}
          THEN ${olympiad_start_date} ELSE NULL
        END
      {% elsif {{this_year_or_earlier._parameter_value}} == 'aft_2012' %}
        CASE
          WHEN ${olympiad_start_year} >= 2012
          THEN ${olympiad_start_date} ELSE NULL
        END
      {% else %}
        ${olympiad_start_date}
      {% endif %}
  ;;
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

    }

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
