view: national_olympic_committees {
  sql_table_name: Olympics.National_Olympic_Committees ;;

  dimension: noc_id {
    description: "National Olympic Committee Table ID"
    primary_key: yes
    type: number
    sql: ${TABLE}.NOC_ID ;;
  }

  dimension: iso_alpha_2 {
    description: "ISO Alpha 2"
    label: "2-letter ISO Country code"
    type: string
    sql: ${TABLE}.ISO_Alpha_2 ;;
  }

  dimension: iso_alpha_3 {
    description: "ISO Alpha 3"
    label: "3-letter ISO Country code"
    type: string
    sql: ${TABLE}.ISO_Alpha_3 ;;
  }

  dimension: iso_country {
    description: "ISO Country Name"
    label: "Country Name"
    case_sensitive: no
    type: string
    sql:  CASE
            WHEN ${TABLE}.ISO_Country is null THEN ${TABLE}.NOC_Region
            ELSE ${TABLE}.ISO_Country
          END;;
    map_layer_name: countries {
      label: "Country"
    }
    link: {
      icon_url: "https://lipis.github.io/flag-icon-css/flags/4x3/{{ iso_alpha_2._value | downcase }}.svg"
      label: "{{ iso_country._value }}"
      url: "https://en.wikipedia.org/wiki/{{ value | url_encode }}"
      # <img class="flag" src="https://lipis.github.io/flag-icon-css/flags/4x3/aw.svg" alt="Aruba Flag">
    }
#     link: {
#       label: "Breadcrumbs link"
#       url: "{% assign filter_value = '_filters['athlete_events.olympic_year_string']' %}
#             {% if _explore._name == 'athlete_events' %}
#               {{filter_value}}
#             {% elsif _explore._name == 'athlete_events_extends_test' %}
#               filter_value = '_filters['athlete_events_extends_test.olympic_year_string']'
#             {% endif %}
#             /dashboards/594?OlympicYear={{ filter_value | url_encode }}"
#     }
#     link: {
#       label: "Breadcrumbs link"
#       url: "{% if _explore._name == 'athlete_events' %}
#               /dashboards/594?OlympicYear={{ _filters['athlete_events.olympic_year'] | url_encode }}
#             {% elsif _explore._name == 'athlete_events_extends_test' %}
#               /dashboards/594?OlympicYear={{ _filters['athlete_events_extends_test.olympic_year'] | url_encode }}
#             {% endif %}"
#     }

#     link: {
#       label: "Breadcrumbs link"
#       url:
#       "/dashboards/594?OlympicYear={{ _filters['athlete_events.olympic_year'] | url_encode }}"
# #       "/dashboards/594?OlympicYear={{ _filters['athlete_events_extends_test.olympic_year'] | url_encode }}"
#     }
  }

  dimension: noc {
    description: "National Olympic Committee Code"
    label: "NOC Country Code"
    type: string
    sql: ${TABLE}.NOC ;;
  }


  dimension: noc_region {
    description: "National Olympic Committee Country"
    label: "NOC Country"
    type: string
    sql: ${TABLE}.NOC_Region ;;
  }

  dimension: noc_status {
    description: "Status (Obsolete, Historic, Special or Current if blank)"
    type: string
    sql: ${TABLE}.NOC_Status ;;
  }

# Flag
  dimension: flag {
    description: "Country Flag"
    type: string
    sql:   CASE
            WHEN ${TABLE}.ISO_Country is null THEN ${TABLE}.NOC_Region
            ELSE ${TABLE}.ISO_Country
          END;;
    html: {%  if iso_alpha_2._value == "SU" or iso_alpha_2._value == "YU" or iso_alpha_2._value == "DD" or  iso_alpha_2._value == nil %}
            <a href={{link}}><img src="https://via.placeholder.com/200x150.jpg?text={{rendered_value}}" height= "32"></a>
          {% elsif iso_alpha_2._value != null %}
            {% assign flag_url_prefix = "https://lipis.github.io/flag-icon-css/flags/4x3/" %}
            <a href={{link}}><img src= {{flag_url_prefix}}{{ iso_alpha_2._value | downcase | append: ".svg" }} height= "32"/></a>
          {% else %}
            {{linked_value}}
          {% endif %}
    ;;
    drill_fields: []
    # html: <img src="https://lipis.github.io/flag-icon-css/flags/4x3/{{ iso_alpha_2._value | downcase }}.svg" height= "32" /> ;;
    # html: {% assign flag_url = 'https://lipis.github.io/flag-icon-css/flags/4x3/' %}
    #       <img  src="{{ flag_url | append: iso_alpha_2._value | downcase | append: '.svg' }}"
    #             height= "32"
    #       />
    # ;;
  }
# Flag
  dimension: big_flag {
    description: "Big Country Flag"
    type: string
    sql:   CASE
            WHEN ${TABLE}.ISO_Country is null THEN ${TABLE}.NOC_Region
            ELSE ${TABLE}.ISO_Country
          END;;
    html: {%  if iso_alpha_2._value == "SU" or iso_alpha_2._value == "YU" or iso_alpha_2._value == "DD" or  iso_alpha_2._value == nil %}
            <a href={{link}}><img src="https://via.placeholder.com/200x150.jpg?text={{rendered_value}}" height= "32"></a>
          {% elsif iso_alpha_2._value != null %}
            {% assign flag_url_prefix = "https://lipis.github.io/flag-icon-css/flags/4x3/" %}
            <a href={{link}}><img src= {{flag_url_prefix}}{{ iso_alpha_2._value | downcase | append: ".svg" }} height= "190"/></a>
          {% else %}
            {{linked_value}}
          {% endif %}
    ;;
    drill_fields: []
    # html: <img src="https://lipis.github.io/flag-icon-css/flags/4x3/{{ iso_alpha_2._value | downcase }}.svg" height= "32" /> ;;
    # html: {% assign flag_url = 'https://lipis.github.io/flag-icon-css/flags/4x3/' %}
    #       <img  src="{{ flag_url | append: iso_alpha_2._value | downcase | append: '.svg' }}"
    #             height= "32"
    #       />
    # ;;
  }
  measure: count {
    type: count
    drill_fields: []
  }

}
