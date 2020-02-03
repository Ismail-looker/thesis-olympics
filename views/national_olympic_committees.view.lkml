view: national_olympic_committees {
  sql_table_name: Olympics.National_Olympic_Committees ;;

  dimension: noc_id {
    description: "National Olympic Committee Table ID"
    primary_key: yes
    type: number
    sql: ${TABLE}.NOC_ID ;;
  }

  dimension: iso_alpha_2 {
    description: "2-letter ISO Country code"
    type: string
    sql: ${TABLE}.ISO_Alpha_2 ;;
  }

  dimension: iso_alpha_3 {
    description: "3-letter ISO Country code"
    type: string
    sql: ${TABLE}.ISO_Alpha_3 ;;
  }

  dimension: iso_country {
    description: "ISO Country Name"
    label: "Country"
    case_sensitive: no
    type: string
    sql:  CASE
            WHEN ${TABLE}.ISO_Country is null THEN ${TABLE}.NOC_Region
            ELSE ${TABLE}.ISO_Country
          END;;
  }

  dimension: noc {
    description: "National Olympic Committee Code"
    type: string
    sql: ${TABLE}.NOC ;;
  }


  dimension: noc_region {
    description: "National Olympic Committee Country"
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
