view: national_olympic_committees {
  sql_table_name: Olympics.National_Olympic_Committees ;;

  dimension: noc_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.NOC_ID ;;
  }

  dimension: iso_alpha_2 {
    type: string
    sql: ${TABLE}.ISO_Alpha_2 ;;
  }

  dimension: iso_alpha_3 {
    type: string
    sql: ${TABLE}.ISO_Alpha_3 ;;
  }

  dimension: iso_country {
    type: string
    sql: ${TABLE}.ISO_Country ;;
  }

  dimension: noc {
    type: string
    sql: ${TABLE}.NOC ;;
  }


  dimension: noc_region {
    type: string
    sql: ${TABLE}.NOC_Region ;;
  }

  dimension: noc_status {
    type: string
    sql: ${TABLE}.NOC_Status ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
