view: testing_liquid {
  derived_table: {
    sql:  SELECT 1 as id, "A" as service_center, CURRENT_DATE as date_value, "NULL" as mydesc, NULL as link_type
          UNION ALL
          SELECT 2 as id, "B" as service_center, CURRENT_DATE as date_value, 'Empty String ""' as mydesc, '' as link_type
          UNION ALL
          SELECT 3 as id, "C" as service_center, CURRENT_DATE as date_value, 'Text' as mydesc, 'Google' as link_type
          UNION ALL
          SELECT 4 as id, "D" as service_center, CURRENT_DATE as date_value, 'Text' as mydesc, 'Facebook' as link_type
          UNION ALL
          SELECT 5 as id, "E" as service_center, CURRENT_DATE as date_value, 'Text' as mydesc, 'Somethingelse' as link_type
  ;;
  }
  dimension: id {
    sql: ${TABLE}.id;;
  }

  dimension: service_center {
    type:string
    sql: ${TABLE}.service_center ;;
  }

  dimension: date_value {
    type: date
    convert_tz: no
    sql: ${TABLE}.date_value ;;
  }

  dimension: mydesc {
    label: "My Desc"
    type:string
    sql: ${TABLE}.mydesc ;;
  }

  dimension: link_type {
    type: string
    sql: ${TABLE}.link_type ;;
  }

  dimension: checked_value{
#     type: string
    sql: "" ;;
    html: {% if link_type._value != blank %}http://google.com/search?q={{ service_center._value }} {{ date_value._value }} {{ link_type._value }}{% endif%};;
  }


  dimension: test_url {
#     type: string
    sql: 1 ;;
    link: {
      label: "Checked All: {% if {{link_type._value}} == ''%}''{% elsif {{link_type._value}} == nil%}NULL{% endif %}"
      url: "{% if {{link_type._value}} == '' or {{link_type._value}} == nil %}{{mydesc._value}}{% endif %}"
    }
    link: {
      label: "{% if {{link_type._value}} == nil %}NULL{% endif %}"
      url: "{% if {{link_type._value}} == nil %}{{mydesc._value}}{% endif %}"
    }
    link: {
      label: "{% if {{link_type._value}} == blank %}Blank (keyword){% endif %}"
      url: "{% if {{link_type._value}} == blank %}{{mydesc._value}}{% endif %}"
    }
    link: {
      label: "Just value"
      url: "{% if link_type._value != blank %}http://google.com/search?q={{ service_center._value }} {{ date_value._value }} {{ link_type._value }}{% endif%}"
    }
  }
}
