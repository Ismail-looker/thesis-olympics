view: summer_games {
  sql_table_name: Olympics.Summer_Games ;;

  dimension: olympiad_id {
    group_label: "Order of the Olympics"
    description: "Unique ID"
    type: number
    primary_key: yes
    sql: ${TABLE}.Olympiad_ID ;;
  }
# Host City Label
  dimension: olympiad_host_city_label {
    description: "Host City (Label)"
    label: "Host City (Label)"
    type: string
    sql: ${TABLE}.Olympiad_HostCity ;;
    }

# Host City Map
  dimension: olympiad_host_city {
    description: "Host City (Map)"
    label: "Host City (Map)"
    type: location
    sql_latitude:
    case
      when ${TABLE}.Olympiad_HostCity = "Antwerp" then {{ "51.22306899603961, 4.396630511581165" | split: "," | first | plus: 0.00 }}
      when ${TABLE}.Olympiad_HostCity = "Amsterdam" then {{ "52.36959040279029, 4.881694382688281" | split: "," | first| plus: 0.00 }}
      when ${TABLE}.Olympiad_HostCity = "Athens" then {{ "37.984176512961305, 23.71834137734774" | split: "," | first | plus: 0.00 }}
      when ${TABLE}.Olympiad_HostCity = "Atlanta" then {{ "33.75086670342035, -84.39700589385939" | split: "," | first | plus: 0.00 }}
      when ${TABLE}.Olympiad_HostCity = "Barcelona" then {{ "41.384543420162025, 2.159947105920594" | split: "," | first | plus: 0.00 }}
      when ${TABLE}.Olympiad_HostCity = 'Beijing' then {{ "39.90484485247526, 116.41943674448447" | split: "," | first | plus: 0.00 }}
      when ${TABLE}.Olympiad_HostCity = "Berlin" OR ${TABLE}.Olympiad_PlannedCity = "Berlin" then {{ "52.51658032673267, 13.397260119902" | split: "," | first | plus: 0.00 }}
      when ${TABLE}.Olympiad_HostCity = "City of Mexico" then {{ "19.434048111431146, -99.1375579769477" | split: "," | first | plus: 0.00 }}
      when ${TABLE}.Olympiad_HostCity = "Helsinki" then {{ "60.16985570000001, 24.93100105511553" | split: "," | first | plus: 0.00 }}
      when ${TABLE}.Olympiad_HostCity = "London" OR ${TABLE}.Olympiad_PlannedCity = "London" then {{ "51.50724951566158, -0.13063228541854244" | split: "," | first | plus: 0.00 }}
      when ${TABLE}.Olympiad_HostCity = "Los Angeles" OR ${TABLE}.Olympiad_PlannedCity = "Los Angeles" then {{ "34.054645879567964, -118.2436849" | split: "," | first | plus: 0.00 }}
      when ${TABLE}.Olympiad_HostCity = "Melbourne" then {{ "-37.8136276, 144.95736116128614" | split: "," | first | plus: 0.00 }}
      when ${TABLE}.Olympiad_HostCity = "Montreal" then {{ "45.44146532097211, -73.67170474382439" | split: "," | first | plus: 0.00 }}
      when ${TABLE}.Olympiad_HostCity = "Munich" then {{ "48.13628059324933, 11.591744599669966" | split: "," | first | plus: 0.00 }}
      when ${TABLE}.Olympiad_HostCity = "Moscow" then {{ "55.76015798172818, 37.623505682418255" | split: "," | first | plus: 0.00 }}
      when ${TABLE}.Olympiad_HostCity = "Paris" OR ${TABLE}.Olympiad_PlannedCity = "Paris" then {{ "48.86143088469847, 2.3485830557955865" | split: "," | first | plus: 0.00 }}
      when ${TABLE}.Olympiad_HostCity = "Rio de Janeiro" then {{ "-22.908849312241223, -43.22047283543354" | split: "," | first | plus: 0.00 }}
      when ${TABLE}.Olympiad_HostCity = "Rome" then {{ "41.90390781809182, 12.507976356205631" | split: "," | first | plus: 0.00 }}
      when ${TABLE}.Olympiad_HostCity = "Seoul" then {{ "37.562805397659766, 126.98304993748377" | split: "," | first | plus: 0.00 }}
      when ${TABLE}.Olympiad_HostCity = "Stockholm" then {{ "59.32711346939694, 18.059262881098107" | split: "," | first | plus: 0.00 }}
      when ${TABLE}.Olympiad_HostCity = "St. Louis" then {{ "38.63093217830784, -90.19082435430543" | split: "," | first | plus: 0.00 }}
      when ${TABLE}.Olympiad_HostCity = "Sydney" then {{ "-33.864498310081004, 151.2092955" | split: "," | first | plus: 0.00 }}
      when ${TABLE}.Olympiad_HostCity = "Tokyo" OR ${TABLE}.Olympiad_PlannedCity = "Tokyo" then {{ "35.68133437119713, 139.75639854330433" | split: "," | first | plus: 0.00 }}
      else null
    end
    ;;
    sql_longitude:
    case
      when ${TABLE}.Olympiad_HostCity = "Antwerp" then {{ "51.22306899603961, 4.396630511581165" | split: "," | last | plus: 0.00 }}
      when ${TABLE}.Olympiad_HostCity = "Amsterdam" then {{ "52.36959040279029, 4.881694382688281" | split: "," | last| plus: 0.00 }}
      when ${TABLE}.Olympiad_HostCity = "Athens" then {{ "37.984176512961305, 23.71834137734774" | split: "," | last | plus: 0.00 }}
      when ${TABLE}.Olympiad_HostCity = "Atlanta" then {{ "33.75086670342035, -84.39700589385939" | split: "," | last | plus: 0.00 }}
      when ${TABLE}.Olympiad_HostCity = "Barcelona" then {{ "41.384543420162025, 2.159947105920594" | split: "," | last | plus: 0.00 }}
      when ${TABLE}.Olympiad_HostCity = 'Beijing' then {{ "39.90484485247526, 116.41943674448447" | split: "," | last | plus: 0.00 }}
      when ${TABLE}.Olympiad_HostCity = "Berlin"OR ${TABLE}.Olympiad_PlannedCity = "Berlin"  then {{ "52.51658032673267, 13.397260119902" | split: "," | last | plus: 0.00 }}
      when ${TABLE}.Olympiad_HostCity = "City of Mexico" then {{ "19.434048111431146, -99.1375579769477" | split: "," | last | plus: 0.00 }}
      when ${TABLE}.Olympiad_HostCity = "Helsinki" then {{ "60.16985570000001, 24.93100105511553" | split: "," | last | plus: 0.00 }}
      when ${TABLE}.Olympiad_HostCity = "London" OR ${TABLE}.Olympiad_PlannedCity = "London"  then {{ "51.50724951566158, -0.13063228541854244" | split: "," | last | plus: 0.00 }}
      when ${TABLE}.Olympiad_HostCity = "Los Angeles" OR ${TABLE}.Olympiad_PlannedCity = "Los Angeles"  then {{ "34.054645879567964, -118.2436849" | split: "," | last | plus: 0.00 }}
      when ${TABLE}.Olympiad_HostCity = "Melbourne" then {{ "-37.8136276, 144.95736116128614" | split: "," | last | plus: 0.00 }}
      when ${TABLE}.Olympiad_HostCity = "Montreal" then {{ "45.44146532097211, -73.67170474382439" | split: "," | last | plus: 0.00 }}
      when ${TABLE}.Olympiad_HostCity = "Munich" then {{ "48.13628059324933, 11.591744599669966" | split: "," | last | plus: 0.00 }}
      when ${TABLE}.Olympiad_HostCity = "Moscow" then {{ "55.76015798172818, 37.623505682418255" | split: "," | last | plus: 0.00 }}
      when ${TABLE}.Olympiad_HostCity = "Paris" OR ${TABLE}.Olympiad_PlannedCity = "Paris" then {{ "48.86143088469847, 2.3485830557955865" | split: "," | last | plus: 0.00 }}
      when ${TABLE}.Olympiad_HostCity = "Rio de Janeiro" then {{ "-22.908849312241223, -43.22047283543354" | split: "," | last | plus: 0.00 }}
      when ${TABLE}.Olympiad_HostCity = "Rome" then {{ "41.90390781809182, 12.507976356205631" | split: "," | last | plus: 0.00 }}
      when ${TABLE}.Olympiad_HostCity = "Seoul" then {{ "37.562805397659766, 126.98304993748377" | split: "," | last | plus: 0.00 }}
      when ${TABLE}.Olympiad_HostCity = "Stockholm" then {{ "59.32711346939694, 18.059262881098107" | split: "," | last | plus: 0.00 }}
      when ${TABLE}.Olympiad_HostCity = "St. Louis" then {{ "38.63093217830784, -90.19082435430543" | split: "," | last | plus: 0.00 }}
      when ${TABLE}.Olympiad_HostCity = "Sydney" then {{ "-33.864498310081004, 151.2092955" | split: "," | last | plus: 0.00 }}
      when ${TABLE}.Olympiad_HostCity = "Tokyo" OR ${TABLE}.Olympiad_PlannedCity = "Tokyo" then {{ "35.68133437119713, 139.75639854330433" | split: "," | last | plus: 0.00 }}
      else null
    end
    ;;

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
    group_label: "Order of the Olympics"
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
    group_label: "Order of the Olympics"
    description: "I, II, III, IV,..."
    type: string
    sql: ${TABLE}.Olympiad_Roman ;;
  }

  dimension_group: olympiad_start {
    group_label: "Olympic Timeline"
    description: "Olympic Start Date"
    type: time
    timeframes: [
      raw,
      date,
      month,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.Olympiad_StartDate ;;
  }

# Olympic End Date
  dimension_group: olympiad_end {
    group_label: "Olympic Timeline"
    description: "Olympic End Date"
    type: time
    timeframes: [
      raw,
      date,
      month,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.Olympiad_EndDate ;;
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

  dimension: olympiad_logo_label {
    description: "Olympiad Logo Label"
    type: string
    sql: ${olympiad_host_country} || ' - ' || ${olympiad_year_str} ;;
  }

  dimension: olympiad_year {
    group_label: "Olympic Timeline"
    description: "Olympic Year (YYYY)"
    type: number
    value_format: "####"
    sql: ${TABLE}.Olympiad_Year ;;
    full_suggestions: yes
    bypass_suggest_restrictions: yes
  }

  dimension: olympiad_year_str {
    group_label: "Olympic Timeline"
    description: "Olympic Year (YYYY)"
    type: string
    sql: CAST(${TABLE}.Olympiad_Year AS STRING) ;; # In order to get suggestions in Filter
    full_suggestions: yes
  }

  dimension_group: olympiad_duration {
    group_label: "Olympic Timeline"
    description: "How long was the Olympics?"
    label: "
    {% if days_olympiad_duration._in_query %} Olympiad Duration in Days
    {% elsif weeks_olympiad_duration._in_query %}  Olympiad Duration in Weeks
    {% elsif months_olympiad_duration._in_query %}  Olympiad Duration in Months
    {% elsif quarters_olympiad_duration._in_query %}  Olympiad Duration in Quarters
    {% else %}  Olympiad Duration
    {% endif %}"
    # label: "Olympiad Duration"
    type: duration
    datatype: date
    intervals: [day, week, month, quarter]
    sql_start: ${TABLE}.Olympiad_StartDate ;;
    sql_end: ${TABLE}.Olympiad_EndDate ;;

  }

  measure: coun_duration {
    type: count_distinct
    sql: ${quarters_olympiad_duration} ;;
  }

  dimension: olympiad_city_wiki_link {
    description: "Link to Host City Wikipage"
    type: string
    sql: ${TABLE}.Olympiad_CityWikiLink ;;
    hidden: yes
  }

  measure: count {
    type: count
    drill_fields: [olympiad_id]
  }
}

# sql_latitude: case
# when ${TABLE}.Olympiad_HostCity = "Athens" then 23.71834137734774, 37.984176512961305
# when ${TABLE}.Olympiad_HostCity = "Paris" then 2.3485830557955865, 48.86143088469847
# when ${TABLE}.Olympiad_HostCity = "St. Louis" then -90.19082435430543, 38.63093217830784
# when ${TABLE}.Olympiad_HostCity = "London" then -0.13063228541854244, 51.50724951566158
# when ${TABLE}.Olympiad_HostCity = "Stockholm" then 18.059262881098107, 59.32711346939694
# when ${TABLE}.Olympiad_HostCity = "Berlin" then 13.397260119902, 52.51658032673267
# when ${TABLE}.Olympiad_HostCity = "Antwerp" then 4.396630511581165, 51.22306899603961
# when ${TABLE}.Olympiad_HostCity = "Amsterdam" then 4.881694382688281, 52.36959040279029
# when ${TABLE}.Olympiad_HostCity = "Los Angeles" then -118.2436849, 34.054645879567964
# when ${TABLE}.Olympiad_HostCity = "Tokyo" then 139.75639854330433, 35.68133437119713
# when ${TABLE}.Olympiad_HostCity = "Helsinki" then 24.93100105511553, 60.16985570000001
# when ${TABLE}.Olympiad_HostCity = "Melbourne" then 144.95736116128614, -37.8136276
# when ${TABLE}.Olympiad_HostCity = "Rome" then 12.507976356205631, 41.90390781809182
# when ${TABLE}.Olympiad_HostCity = "City of Mexico" then -99.1375579769477, 19.434048111431146
# when ${TABLE}.Olympiad_HostCity = "Munich" then 11.591744599669966, 48.13628059324933
# when ${TABLE}.Olympiad_HostCity = "Montreal" then -73.67170474382439, 45.44146532097211
# when ${TABLE}.Olympiad_HostCity = "Moscow" then 37.623505682418255, 55.76015798172818
# when ${TABLE}.Olympiad_HostCity = "Seoul" then 126.98304993748377, 37.562805397659766
# when ${TABLE}.Olympiad_HostCity = "Barcelona" then 2.159947105920594, 41.384543420162025
# when ${TABLE}.Olympiad_HostCity = "Atlanta" then -84.39700589385939, 33.75086670342035
# when ${TABLE}.Olympiad_HostCity = "Sydney" then 151.2092955, -33.864498310081004
# when ${TABLE}.Olympiad_HostCity = "Rio de Janeiro" then -43.22047283543354, -22.908849312241223
# when ${TABLE}.Olympiad_HostCity = 'Beijing' then '116.41943674448447, 39.90484485247526'
# else null
# end

#     sql_longitude: case
#                     when ${TABLE}.Olympiad_HostCity = "Amsterdam" then 4.881694382688281
#                     when ${TABLE}.Olympiad_HostCity = "Antwerp" then 4.396630511581165
#                     when ${TABLE}.Olympiad_HostCity = "Athens" then 23.71834137734774
#                     when ${TABLE}.Olympiad_HostCity = "Atlanta" then -84.39700589385939
#                     when ${TABLE}.Olympiad_HostCity = "Barcelona" then 2.159947105920594
#                     when ${TABLE}.Olympiad_HostCity = 'Beijing' then 116.41943674448447
#                     when ${TABLE}.Olympiad_HostCity = "Berlin" then 13.397260119902
#                     when ${TABLE}.Olympiad_HostCity = "City of Mexico" then -99.1375579769477
#                     when ${TABLE}.Olympiad_HostCity = "Helsinki" then 24.93100105511553
#                     when ${TABLE}.Olympiad_HostCity = "London" then -0.13063228541854244
#                     when ${TABLE}.Olympiad_HostCity = "Los Angeles" then -118.2436849
#                     when ${TABLE}.Olympiad_HostCity = "Melbourne" then 144.95736116128614
#                     when ${TABLE}.Olympiad_HostCity = "Montreal" then -73.67170474382439
#                     when ${TABLE}.Olympiad_HostCity = "Moscow" then 37.623505682418255
#                     when ${TABLE}.Olympiad_HostCity = "Munich" then 11.591744599669966
#                     when ${TABLE}.Olympiad_HostCity = "Paris" then 2.3485830557955865
#                     when ${TABLE}.Olympiad_HostCity = "Rio de Janeiro" then -43.22047283543354
#                     when ${TABLE}.Olympiad_HostCity = "Rome" then 12.507976356205631
#                     when ${TABLE}.Olympiad_HostCity = "Seoul" then 126.98304993748377
#                     when ${TABLE}.Olympiad_HostCity = "Stockholm" then 18.059262881098107
#                     when ${TABLE}.Olympiad_HostCity = "St. Louis" then -90.19082435430543
#                     when ${TABLE}.Olympiad_HostCity = "Sydney" then 151.2092955
#                     when ${TABLE}.Olympiad_HostCity = "Tokyo" then 139.75639854330433
#                     else null
#                   end
#     ;;
#     sql_latitude: case
#                     when ${TABLE}.Olympiad_HostCity = 'Amsterdam' then 52.36959040279029
#                     when ${TABLE}.Olympiad_HostCity = 'Antwerp' then 51.22306899603961
#                     when ${TABLE}.Olympiad_HostCity = 'Athens' then 37.984176512961305
#                     when ${TABLE}.Olympiad_HostCity = 'Atlanta' then 33.75086670342035
#                     when ${TABLE}.Olympiad_HostCity = 'Barcelona' then 41.384543420162025
#                     when ${TABLE}.Olympiad_HostCity = 'Beijing' then 39.90484485247526
#                     when ${TABLE}.Olympiad_HostCity = 'Berlin' then 52.51658032673267
#                     when ${TABLE}.Olympiad_HostCity = 'City of Mexico' then 19.434048111431146
#                     when ${TABLE}.Olympiad_HostCity = 'Helsinki' then 60.16985570000001
#                     when ${TABLE}.Olympiad_HostCity = 'London' then 51.50724951566158
#                     when ${TABLE}.Olympiad_HostCity = 'Los Angeles' then 34.054645879567964
#                     when ${TABLE}.Olympiad_HostCity = 'Melbourne' then -37.8136276
#                     when ${TABLE}.Olympiad_HostCity = 'Montreal' then 45.44146532097211
#                     when ${TABLE}.Olympiad_HostCity = 'Munich' then 48.13628059324933
#                     when ${TABLE}.Olympiad_HostCity = 'Moscow' then 55.76015798172818
#                     when ${TABLE}.Olympiad_HostCity = 'Paris' then 48.86143088469847
#                     when ${TABLE}.Olympiad_HostCity = 'Rio de Janeiro' then -22.908849312241223
#                     when ${TABLE}.Olympiad_HostCity = 'Rome' then 41.90390781809182
#                     when ${TABLE}.Olympiad_HostCity = 'Seoul' then 37.562805397659766
#                     when ${TABLE}.Olympiad_HostCity = 'Stockholm' then 59.32711346939694
#                     when ${TABLE}.Olympiad_HostCity = 'St. Louis' then 38.63093217830784
#                     when ${TABLE}.Olympiad_HostCity = 'Sydney' then -33.864498310081004
#                     when ${TABLE}.Olympiad_HostCity = 'Tokyo' then 35.68133437119713
#                     else null
#                   end
#     ;;
# sql_latitude: case
#                     when ${TABLE}.Olympiad_HostCity = "Athens" then "23.71834137734774"
#                     when ${TABLE}.Olympiad_HostCity = "Paris" then "2.3485830557955865"
#                     when ${TABLE}.Olympiad_HostCity = "St. louis" then "-90.19082435430543"
#                     when ${TABLE}.Olympiad_HostCity = "London" then "-0.13063228541854244"
#                     when ${TABLE}.Olympiad_HostCity = "Stockholm" then "18.059262881098107"
#                     when ${TABLE}.Olympiad_HostCity = "Berlin" then "13.397260119902"
#                     when ${TABLE}.Olympiad_HostCity = "Antwerp" then "4.396630511581165"
#                     when ${TABLE}.Olympiad_HostCity = "Amsterdam" then "4.881694382688281"
#                     when ${TABLE}.Olympiad_HostCity = "Los Angeles" then "-118.2436849"
#                     when ${TABLE}.Olympiad_HostCity = "Tokyo" then "139.75639854330433"
#                     when ${TABLE}.Olympiad_HostCity = "Helsinki" then "24.93100105511553"
#                     when ${TABLE}.Olympiad_HostCity = "Melbourne" then "144.95736116128614"
#                     when ${TABLE}.Olympiad_HostCity = "Rome" then "12.507976356205631"
#                     when ${TABLE}.Olympiad_HostCity = "City of Mexico" then "-99.1375579769477"
#                     when ${TABLE}.Olympiad_HostCity = "Munich" then "11.591744599669966"
#                     when ${TABLE}.Olympiad_HostCity = "Montreal" then "-73.67170474382439"
#                     when ${TABLE}.Olympiad_HostCity = "Moscow" then "37.623505682418255"
#                     when ${TABLE}.Olympiad_HostCity = "Seoul" then "126.98304993748377"
#                     when ${TABLE}.Olympiad_HostCity = "Barcelona" then "2.159947105920594"
#                     when ${TABLE}.Olympiad_HostCity = "Atlanta" then "-84.39700589385939"
#                     when ${TABLE}.Olympiad_HostCity = "Sydney" then "151.2092955"
#                     when ${TABLE}.Olympiad_HostCity = "Rio de Janeiro" then "-43.22047283543354"
#                     when ${TABLE}.Olympiad_HostCity = 'Beijing' then '116.41943674448447'
#                     else null
#                   end
#     ;;
#     sql_longitude: case
#                     when ${TABLE}.Olympiad_HostCity = "Athens" then "37.984176512961305"
#                     when ${TABLE}.Olympiad_HostCity = "Paris" then "48.86143088469847"
#                     when ${TABLE}.Olympiad_HostCity = "St. louis" then "38.63093217830784"
#                     when ${TABLE}.Olympiad_HostCity = "London" then "51.50724951566158"
#                     when ${TABLE}.Olympiad_HostCity = "Stockholm" then "59.32711346939694"
#                     when ${TABLE}.Olympiad_HostCity = "Berlin" then "52.51658032673267"
#                     when ${TABLE}.Olympiad_HostCity = "Antwerp" then "51.22306899603961"
#                     when ${TABLE}.Olympiad_HostCity = "Amsterdam" then "52.36959040279029"
#                     when ${TABLE}.Olympiad_HostCity = "Los Angeles" then "34.054645879567964"
#                     when ${TABLE}.Olympiad_HostCity = "Tokyo" then "35.68133437119713"
#                     when ${TABLE}.Olympiad_HostCity = "Helsinki" then "60.16985570000001"
#                     when ${TABLE}.Olympiad_HostCity = "Melbourne" then "-37.8136276"
#                     when ${TABLE}.Olympiad_HostCity = "Rome" then "41.90390781809182"
#                     when ${TABLE}.Olympiad_HostCity = "City of Mexico" then "19.434048111431146"
#                     when ${TABLE}.Olympiad_HostCity = "Munich" then "48.13628059324933"
#                     when ${TABLE}.Olympiad_HostCity = "Montreal" then "45.44146532097211"
#                     when ${TABLE}.Olympiad_HostCity = "Moscow" then "55.76015798172818"
#                     when ${TABLE}.Olympiad_HostCity = "Seoul" then "37.562805397659766"
#                     when ${TABLE}.Olympiad_HostCity = "Barcelona" then "41.384543420162025"
#                     when ${TABLE}.Olympiad_HostCity = "Atlanta" then "33.75086670342035"
#                     when ${TABLE}.Olympiad_HostCity = "Sydney" then "-33.864498310081004"
#                     when ${TABLE}.Olympiad_HostCity = "Rio de Janeiro" then "-22.908849312241223"
#                     when ${TABLE}.Olympiad_HostCity = 'Beijing' then '39.90484485247526'
#                     else null
#                   end
#     ;;
