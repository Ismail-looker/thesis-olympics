view: body_map_dt {
  derived_table: {
    sql: SELECT 1 as id, "Head" as Body UNION ALL
                  SELECT  2 as id, "Head" as Body UNION ALL
                  SELECT  3 as id, "Head" as Body UNION ALL
                  SELECT  4 as id, "Head" as Body UNION ALL
                  SELECT  5 as id, "Head" as Body UNION ALL
                  SELECT  6 as id, "Head" as Body UNION ALL
                  SELECT  7 as id, "Chest" as Body UNION ALL
                  SELECT  8 as id, "Chest" as Body UNION ALL
                  SELECT  9 as id, "Chest" as Body UNION ALL
                  SELECT  10 as id, "Chest" as Body UNION ALL
                  SELECT  10 as id, "Chest" as Body UNION ALL
                  SELECT  10 as id, "Chest" as Body UNION ALL
                  SELECT  10 as id, "Chest" as Body UNION ALL
                  SELECT  11 as id, "Chest" as Body UNION ALL
                  SELECT  12 as id, "Chest" as Body UNION ALL
                  SELECT  13 as id, "Chest" as Body UNION ALL
                  SELECT  14 as id, "Left_hand" as Body UNION ALL
                  SELECT  15 as id, "Left_hand" as Body UNION ALL
                  SELECT  16 as id, "Left_hand" as Body UNION ALL
                  SELECT  17 as id, "Left_hand" as Body UNION ALL
                  SELECT  18 as id, "Left_hand" as Body UNION ALL
                  SELECT  19 as id, "Right_hand" as Body UNION ALL
                  SELECT  20 as id, "Right_hand" as Body UNION ALL
                  SELECT  21 as id, "Lower_body" as Body UNION ALL
                  SELECT  22 as id, "Lower_body" as Body UNION ALL
                  SELECT  23 as id, "Mid_body" as Body UNION ALL
                  SELECT  24 as id, "Mid_body" as Body UNION ALL
                  SELECT  25 as id, "Lower_body" as Body UNION ALL
                  SELECT  26 as id, "Lower_body" as Body
  ;;
  }
  dimension: id {
    sql: ${TABLE}.id;;
  }

  dimension: body {
    type: string
    sql: ${TABLE}.Body ;;
    map_layer_name: body_map
  }

  measure: no_of_injuries {
    type: count
  }
}

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
# }

# view: body_map_dt {
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
