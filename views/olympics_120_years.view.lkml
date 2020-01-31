view: olympics_120_years {
  sql_table_name: Olympics.olympics_120_years ;;
  drill_fields: [id, year_year, city, season]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.ID ;;
  }

  dimension: age {
    type: number
    sql: ${TABLE}.Age ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}.City ;;
  }

  dimension: event {
    type: string
    sql: ${TABLE}.Event ;;
  }

  dimension: games {
    type: string
    sql: ${TABLE}.Games ;;
  }

  dimension: height {
    type: number
    sql: ${TABLE}.Height ;;
  }

  dimension: medal {
    type: string
    sql: ${TABLE}.Medal ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.Name ;;
  }

  dimension: noc {
    type: string
    sql: ${TABLE}.NOC ;;
  }

  dimension: season {
    type: string
    sql: ${TABLE}.Season ;;
  }

  dimension: sex {
    type: string
    sql: ${TABLE}.Sex ;;
  }

  dimension: sport {
    type: string
    sql: ${TABLE}.Sport ;;
  }

  dimension: team {
    type: string
    sql: ${TABLE}.Team ;;
  }

  dimension: weight {
    type: number
    sql: ${TABLE}.Weight ;;
  }

  dimension_group: year { # YYYY-MM-DD truncated to only YYYY as MM-DD is 01-01 and only used for partitioning
    type: time
    timeframes: [
      year
    ]
    datatype: date
    convert_tz: no
    sql: ${TABLE}.Year ;;
    order_by_field: id

  }

  measure: count {
    type: count
    drill_fields: [id, name]
  }
}
