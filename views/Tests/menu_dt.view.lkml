view: menu_dt {

  derived_table: {
    sql:
         SELECT 'http://icon-library.com/images/three-line-menu-icon/three-line-menu-icon-11.jpg' as icon
          ;;
  }

  dimension: menu {
    type: string
    sql: ${TABLE}.icon ;;
    html: <a href="/dashboards/113">
            <img src="https://cdn4.iconfinder.com/data/icons/logos-and-brands/512/227_Netflix_logo-512.png" height=40 />
          </a>
          <a href="/dashboards/112">
            <img src="https://cdn0.iconfinder.com/data/icons/free-social-media-set/24/rss-512.png" height=40 />
          </a>
          <a href="/dashboards/114">
            <img src="https://cdn3.iconfinder.com/data/icons/soda-red/512/new-folder-video.png" height=40 />
          </a>
          ;;
#     link: {
#       label: "Netflix Overview"
#       url:"/dashboards/113"
#     }
#     link: {
#       label: "Content Overview"
#       url:"/dashboards/112"
#     }
#     link: {
#       label: "New Overview"
#       url:"/dashboards/114"
#     }
    can_filter: no
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

}

# view: menu {
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
view: navigation_bar {



}
