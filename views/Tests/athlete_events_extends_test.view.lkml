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

  parameter: time_period {
    type: unquoted
    allowed_value: {
      label: "30 Days"
      value: "30"
    }
    allowed_value: {
      label: "60 Days"
      value: "60"
    }
    allowed_value: {
      label: "90 Days"
      value: "90"
    }
  }

  dimension: period {
    label_from_parameter: time_period
    type: number
    sql:
    {% if time_period._parameter_value == '30' %}
    30
    {% elsif time_period._parameter_value == '60' %}
    60
    {% elsif time_period._parameter_value == '90' %}
    90
    {% else %}
    NULL
    {% endif %} ;;
  }


  dimension: month_formatted {
    group_label: "Created"
    label: "Month"
    sql:  "2020-05" ;;
    html: {{rendered_value}} | {{ rendered_value | append: "-01" | date: "%b %y" }};;
  }


  dimension: falsey {
    type: string
    sql: false ;;
    html: {% if falsey._value %}
          'style'
          {% else %}
          other style
          {% endif %}
          ;;
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
    label: "{% if _explore._name == 'summer_games' %}Athlete name in Summer Games{% else %}Athlete name (Liquid){% endif %}"
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

  dimension: dashboard_links {
    label: " "
#       hidden: yes
    type: string
    sql: 1 ;;
   }



#   dimension: dril_field {
#     type: string
#     drill_fields: [gender, count]
#     sql: ${TABLE}.first_name ;;
#     link: {
#       label: "tetsy"
#       url: "
#       {% assign filter_config = '{}' %}
#       {% assign vis_config = '
#       {\"type\":\"table\"}' %}
#
#       {{ dummy._link }}&vis_config={{ vis_config | encode_uri }}&pivots=users.state&filter_config={{ filter_config | encode_uri }}"
#     }
#   }

#   dimension: dril_field {
#     type: string
#     drill_fields: [gender, count]
#     sql: ${TABLE}.first_name ;;
#     link: {
#       label: "tetsy"
#       url: "
#       {% assign filter_config = '{}' %}
#       {% assign vis_config = '
#       {\"type\":\"table\"}' %}
#
#       {{ dummy._link }}&vis_config={{ vis_config | encode_uri }}&pivots=users.state&filter_config={{ filter_config | encode_uri }}"
#     }
#   }

#   dimension: state {
#     type: string
#     sql: ${TABLE}.state ;;
#     drill_fields: [zip]
#     map_layer_name: us_states
#     link: {
#       label: "By Zip"
#       url: "
#       {% assign vis= '{\"map_plot_mode\":\"points\",
#       \"heatmap_gridlines\":false,
#       \"heatmap_gridlines_empty\":false,
#       \"heatmap_opacity\":0.5,
#       \"show_region_field\":true,
#       \"draw_map_labels_above_data\":true,
#       \"map_tile_provider\":\"light\",
#       \"map_position\":\"fit_data\",
#       \"map_scale_indicator\":\"off\",
#       \"map_pannable\":true,
#       \"map_zoomable\":true,
#       \"map_marker_type\":\"circle\",
#       \"map_marker_icon_name\":\"default\",
#       \"map_marker_radius_mode\":\"proportional_value\",
#       \"map_marker_units\":\"meters\",
#       \"map_marker_proportional_scale_type\":\"linear\",
#       \"map_marker_color_mode\":\"fixed\",
#       \"show_view_names\":false,
#       \"show_legend\":true,
#       \"quantize_map_value_colors\":false,
#       \"reverse_map_value_colors\":false,
#       \"type\":\"looker_map\",
#       \"defaults_version\":1}' %}
#
#       {% assign dynamic_fields= '[]' %}
#
#       {{link}}&f[covid_insights_1.category]=&f[covid_insights_1.state]=TX&vis={{vis | encode_uri}}&dynamic_fields={{dynamic_fields | encode_uri}}"
#     }
#   }

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
