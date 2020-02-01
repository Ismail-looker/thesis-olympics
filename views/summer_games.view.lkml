view: summer_games {
  sql_table_name: Olympics.Summer_Games ;;

  dimension: olympiad_city_wiki_link {
    type: string
    sql: ${TABLE}.Olympiad_CityWikiLink ;;
  }

  dimension_group: olympiad_end {
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
  }

  dimension: olympiad_host_city {
    type: string
    sql: ${TABLE}.Olympiad_HostCity ;;
  }

  dimension: olympiad_host_country {
    type: string
    sql: ${TABLE}.Olympiad_HostCountry ;;
  }

  dimension: olympiad_host_country_code {
    type: string
    sql: ${TABLE}.Olympiad_HostCountryCode ;;
  }

  dimension: olympiad_id {
    type: number
    sql: ${TABLE}.Olympiad_ID ;;
  }

  dimension: olympiad_is_celebrated {
    type: yesno
    sql: ${TABLE}.Olympiad_IsCelebrated ;;
  }

  dimension: olympiad_ordinal {
    type: string
    sql: ${TABLE}.Olympiad_Ordinal ;;
  }

  dimension: olympiad_planned_city {
    type: string
    sql: ${TABLE}.Olympiad_PlannedCity ;;
  }

  dimension: olympiad_roman {
    type: string
    sql: ${TABLE}.Olympiad_Roman ;;
  }

  dimension_group: olympiad_start {
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
    type: string
    case_sensitive: no
    sql: ${TABLE}.Olympiad_Status ;;
  }

  dimension: olympiad_year {
    type: number
    sql: ${TABLE}.Olympiad_Year ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
