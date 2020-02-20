view: summer_games {
  sql_table_name: Olympics.Summer_Games ;;

  dimension: olympiad_id {
    description: "Unique ID"
    type: number
    primary_key: yes
    sql: ${TABLE}.Olympiad_ID ;;
  }

# Host City
  dimension: olympiad_host_city {
    description: "Host City"
    label: "Host City"
    type: string
    sql: ${TABLE}.Olympiad_HostCity ;;
    link: {
      icon_url: "https://en.wikipedia.org/static/favicon/wikipedia.ico"
      label: "{{ olympiad_host_city._value }}"
      url: "{{ olympiad_city_wiki_link }}"
    }
    map_layer_name: modern_olympics_layer {
      label: "Host City"
    }
  }

# Host Country
  dimension: olympiad_host_country {
    description: "Host Country"
    label: "Host Country"
    type: string
    sql: ${TABLE}.Olympiad_HostCountry ;;
    map_layer_name: countries {
      label: "Host Nation"
    }
  }

  dimension: olympiad_host_country_code {
    description: "Host Country Code"
    type: string
    sql: ${TABLE}.Olympiad_HostCountryCode ;;
    map_layer_name: countries {
      label: "Host Nation Code"
    }
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

# Olympic End Date
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
    html: {{linked_value}} | date: format: 'abbreviated_date'
      ;;
#       {% if olympiad_end_date._in_query %}
#         {{linked_value}} | date: format: 'abbreviated_date'
#       {% else %}
#         event
#       {% endif %}
    }

  dimension: olympiad_status {
    description: "Celebrated or Not"
    type: string
    case_sensitive: no
    sql: ${TABLE}.Olympiad_Status ;;
  }

  dimension: olympiad_logo {
    description: "Olympiad Logo"
    type: string
    sql: ${TABLE}.Olympiad_Year ;;
    html:
    {%  if olympiad_year._value == nil %}
      <a href={{link}}><img src="https://via.placeholder.com/280x280.jpg?text={{rendered_value}}" height= "32"></a>
    {% elsif olympiad_year._value != null %}
      {% assign original_size = "280x280" | append: "/" %}
      {% assign final_size = "140:140" %}
      {% assign logo_url_prefix = "https://stillimg.olympic.org/games/" | append: original_size %}
        <a href={{link}}><img src= "{{logo_url_prefix}}{{rendered_value}}_1.png?interpolation=lanczos-none&resize={{final_size}}"/></a>
    {% else %}
      {{linked_value}}
    {% endif %}
    ;;
  }
#   <a href={{link}}><img src= "{{logo_url_prefix}}{{rendered_value}}_1.png?interpolation=lanczos-none&resize={{final_size}}"/></a>
#   Actual Link to Olympic Logos
#   https://stillimg.olympic.org/games/280x280/2016_1.png?interpolation=lanczos-none&resize=140:140
#   https://stillimg.olympic.org/games/280x280/2016.png?

  dimension: olympiad_year {
    description: "Olympic Year (YYYY)"
    type: number
    value_format: "####"
    sql: ${TABLE}.Olympiad_Year ;;
  }

  dimension: olympiad_year_str {
    description: "Olympic Year (YYYY)"
    type: string
    sql: CAST(${TABLE}.Olympiad_Year AS STRING) ;; # In order to get suggestions in Filter
    full_suggestions: yes
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
