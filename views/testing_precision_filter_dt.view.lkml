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
#   dimension: order_date {
#     type:date
#     convert_tz: no
#   }

  dimension: in_days {
    type: number
    sql: round(${TABLE}.in_days,0) ;;
    value_format: "#00.000"
  }


  measure: count_d {
    type: count
#     sql: ${id} ;;
  }

}
