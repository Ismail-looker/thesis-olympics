view: olympics_120_years {
#   label: "Athlete Olympic Events"
#   view_label: "Athlete Olympic Events"
  sql_table_name: Olympics.athlete_events ;;
  drill_fields: [id, year_year, city, season]

  dimension: primary_key {
    description: "Unique ID"
    label: "_ID"
    primary_key: yes
    # hidden: yes
    type: number
    sql: ROW_NUMBER() OVER() ;;
  }

  dimension: id {
    description: "Athlete Identifier No (Not Unique in table)"
    label: "Athlete ID"
    type: number
    sql: ${TABLE}.ID ;;
  }

  dimension: name {
    description: "Name of Athlete"
    label: "Athlete Name"
    type: string
    sql: ${TABLE}.Name ;;
  }

  dimension: sex {
    description: "Gender of Athlete"
    label: "Athlete Gender"
    type: string
    sql: ${TABLE}.Sex ;;
  }

  dimension: age {
    description: "Age of Athlete"
    label: "Athlete Age"
    type: number
    sql: ${TABLE}.Age ;;
  }

  dimension: height {
    description: "Height of Athlete"
    label: "Athlete Height"
    type: number
    sql: ${TABLE}.Height ;;
  }

  dimension: weight {
    description: "Weight of Athlete"
    label: "Athlete Weight"
    type: number
    sql: ${TABLE}.Weight ;;
  }
  dimension: city {
    description: ""
    type: string
    sql: ${TABLE}.City ;;
  }

  dimension: event {
    description: ""
    type: string
    sql: ${TABLE}.Event ;;
  }

  dimension: games {
    description: ""
    type: string
    sql: ${TABLE}.Games ;;
  }

  dimension: medal {
    description: ""
    type: string
    sql: ${TABLE}.Medal ;;
  }

  dimension: noc {
    description: ""
    type: string
    sql: ${TABLE}.NOC ;;
  }

  dimension: season {
    description: ""
    type: string
    sql: ${TABLE}.Season ;;
  }

  dimension: sport {
    description: ""
    type: string
    sql: ${TABLE}.Sport ;;
  }

  dimension: team {
    description: ""
    type: string
    sql: ${TABLE}.Team ;;
  }


  dimension_group: year { # YYYY-MM-DD truncated to only YYYY as MM-DD is 01-01 and only used for partitioning
    description: "Olympic Year"
    type: time
    timeframes: [
      year
    ]
    datatype: date
    convert_tz: no
    sql: ${TABLE}.Year ;;
    order_by_field: id
  }

#   New Dimensions   ----------------------------------------------------------

  dimension: age_tier {
    description: "Athlete Age Tiers"
    label: "Athlete Age Tiers"
    type: tier
    tiers: [0, 10, 20, 30, 40, 50, 60, 70, 80]
    style: classic # the default value, could be excluded
    sql: ${age} ;;
  }

  measure: count {
    description: ""
    type: count
    drill_fields: [id, name]
  }

#   New Measures   -----------------------------------------------------------
  measure: number_of_distinct_Athletes{
    description: ""
    type: count_distinct
    sql: ${name};;
    drill_fields: [id, name]
  }

}
