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
  }

  dimension: olympiad_host_country {
    description: "Host Country"
    label: "Host Country"
    type: string
    sql: ${TABLE}.Olympiad_HostCountry ;;
  }

  dimension: olympiad_host_country_code {
    description: "Host Country Code"
    type: string
    sql: ${TABLE}.Olympiad_HostCountryCode ;;
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
}
