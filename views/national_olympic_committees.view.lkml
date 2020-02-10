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
    map_layer_name: countries {
      # feature_key: "ISO_A3"
      # file: "/map_folder/regions.topojson"
      # format: topojson
      label: "{{iso_country}}"
      # max_zoom_level: 12
      # min_zoom_level: 1.6
      # projection: airy
      # property_key: "ISO_A3"
      # property_label_key: "NAME"
    }
  }

  dimension: iso_alpha_3 {
    description: "ISO Alpha 3"
    label: "3-letter ISO Country code"
    type: string
    sql: ${TABLE}.ISO_Alpha_3 ;;
    map_layer_name: countries {
      label: "Country ISO-3"
    }
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
  }

  dimension: noc {
    description: "National Olympic Committee Code"
    label: "Country Code"
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

  measure: count {
    type: count
    drill_fields: []
  }
}
