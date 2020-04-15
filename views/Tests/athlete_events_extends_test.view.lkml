include: "/views/**/athlete_events.view"
view: athlete_events_extends_test {
  extends: [athlete_events]

# --------- TEST 1 ----------------------
  filter: account_filter {
    type: string
    suggest_dimension: sport
  }

  dimension: account_satisfies_filter {
    type: yesno
    hidden: yes
    sql: {% condition account_filter %} ${sport} {% endcondition %} ;;
  }

  measure: count_dynamic_account {
    type: count
    filters: {
      field: account_satisfies_filter
      value: "yes"
    }
  }

# --------- TEST 2 ----------------------

#   dimension: merch_yr_wk {
#     type: number
#     group_label: "Calendar Merch Week"
#     group_item_label: "{% if _explore._name == 'dim_po_detail_expected_date_bandm' %} Week Ordered
#     {% else %} Merch Year Week
#     {% endif %}"
#     value_format: "0"
#     label: "{% if _explore._name == 'the_explore_we_want_a_new_label' %} New Name
#     {% else %} Normal Name
#     {% endif %}"
#     description: "Merchandise calendar year and week (e.g. 201951)"
#     sql: ${TABLE}.MERCH_YR_WK ;;
#   }

# --------- TEST 3 ----------------------

  dimension: athlete_name {
    description: "Name of Athlete"
#     label: "Athlete Name"
    label: "{% if _explore._name == 'summer_games' %}Athlete name in Summer Games{% else %}Athlete name Otherwise{% endif %}"
    type: string
    sql: ${TABLE}.Athlete_Name ;;
    link: {
      label: "Athlete Detail Dashboard"
      url: "/dashboards/603?Athlete={{ value | encode_uri }}"
      icon_url: ""
    }
  }

# --------- TEST 4 ----------------------

  dimension: breadcrumbs {
    description: "Breadcrumbs"
    label: "Breadcrumbs"
    type: string
    sql: 1 ;;
    html: <a target="new" href="/dashboards/594?OlympicYear={{ _filters['athlete_events_extends_test.olympic_year_string'] | url_encode }}">Dashboard Overview &#10095;</a>   <a target="new" href="/dashboards/594?OlympicYear={{ _filters['athlete_events_extends_test.olympic_year_string'] | url_encode }}">Dashboard 2 &#10095;</a> ;;
  }

# --------- TEST 5 ----------------------

#   measure: count_distinct_division_category_combo {
#     label: "Unique Division|Categories"
#     description: "Excludes Gift Cards."
#     type: average_distinct
#     sql:  CASE WHEN LOWER(${medal}) != 'silver' THEN ${medal}
#           WHEN LOWER(${medal}) != 'bronze' THEN ${medal}
#           ELSE NULL
#           END ;;
#   }

# --------- TEST 6 ----------------------


  # # You can specify the table name if it's different from the view name:
  # sql_table_name: my_schema_name.tester ;;
  #
  # # Define your dimensions and measures here, like this:
  # dimension: user_id {
  #   description: "Unique ID for each user that has ordered"
  #   type: number
  #   sql: ${TABLE}.user_id ;;
  # }
  #
  # dimension: lifetime_orders {
  #   description: "The total number of orders for each user"
  #   type: number
  #   sql: ${TABLE}.lifetime_orders ;;
  # }
  #
  # dimension_group: most_recent_purchase {
  #   description: "The date when each user last ordered"
  #   type: time
  #   timeframes: [date, week, month, year]
  #   sql: ${TABLE}.most_recent_purchase_at ;;
  # }
  #
  # measure: total_lifetime_orders {
  #   description: "Use this for counting lifetime orders across many users"
  #   type: sum
  #   sql: ${lifetime_orders} ;;
  # }
}

# view: athlete_events_extends_test {
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
