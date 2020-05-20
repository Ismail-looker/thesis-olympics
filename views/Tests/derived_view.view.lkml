view: derived_view {
  derived_table: {
    sql: SELECT
        Olympiad_ID as `Olympiad_ID`
        ,Olympiad_HostCity as `Olympiad_HostCity`
        ,Olympiad_Year as `Olympiad_Year`
        ,Olympiad_StartDate as `Olympiad_StartDate`
        , COUNT(*) as count

      FROM Olympics.Summer_Games
      WHERE {% condition derived_view.date_filter %} Olympiad_StartDate {% endcondition %}
      ;;
  }

  filter: date_filter {
    type: date
    default_value: ""
  }

# Variable not found "date_filter". Note that liquid in the "sql"
# of a "derived_table" must reference fully scoped field names
# (i.e. "join_name.field_name") when the view is joined into an explore using "from".
# derived_view.view:1 (ismail_thesis_olympics:athlete_events_extends_test)Help

  dimension: olympiad_id {
    group_label: "Order of the Olympics"
    description: "Unique ID"
    type: number
    primary_key: yes
    sql: ${TABLE}.Olympiad_ID ;;
  }

  dimension: olympiad_host_city_label {
    description: "Host City (Label)"
    label: "Host City (Label)"
    type: string
    sql: ${TABLE}.Olympiad_HostCity ;;
  }

  dimension: olympiad_year {
    group_label: "Olympic Timeline"
    description: "Olympic Year (YYYY)"
    type: number
    value_format: "####"
    sql: ${TABLE}.Olympiad_Year ;;
    full_suggestions: yes
    bypass_suggest_restrictions: yes
  }

  dimension: olympiad_year_str {
    group_label: "Olympic Timeline"
    description: "Olympic Year (YYYY)"
    type: string
    sql: CAST(${TABLE}.Olympiad_Year AS STRING) ;; # In order to get suggestions in Filter
    full_suggestions: yes
  }

  dimension_group: olympiad_start {
    group_label: "Olympic Timeline"
    description: "Olympic Start Date"
    type: time
    timeframes: [
      raw,
      date,
      month,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.Olympiad_StartDate ;;
  }

  measure: count {
    type: count
    drill_fields: [olympiad_id]
  }
}

# view: base_view {
#   # Or, you could make this view a derived table, like this:
#   derived_table: {
#     sql: SELECT
#         user_id as user_id
#         , COUNT(*) as lifetime_orders
#         , MAX(orders.created_at) as most_recent_purchase_at
#       FROM orders
#       GROUP BY user_id
#       ;;
#   }
#
#   # Define your dimensions and measures here, like this:
#   dimension: user_id {
#     description: "Unique ID for each user that has ordered"
#     type: number
#     sql: ${TABLE}.user_id ;;
#   }
#
#   dimension: lifetime_orders {
#     description: "The total number of orders for each user"
#     type: number
#     sql: ${TABLE}.lifetime_orders ;;
#   }
#
#   dimension_group: most_recent_purchase {
#     description: "The date when each user last ordered"
#     type: time
#     timeframes: [date, week, month, year]
#     sql: ${TABLE}.most_recent_purchase_at ;;
#   }
#
#   measure: total_lifetime_orders {
#     description: "Use this for counting lifetime orders across many users"
#     type: sum
#     sql: ${lifetime_orders} ;;
#   }
# }
