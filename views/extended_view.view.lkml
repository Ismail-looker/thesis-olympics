include: "/views/**/summer_games.view"
view: extended_view {
  extends: [summer_games]
  dimension: olympiad_host_city_label {
    description: "Host City (Label)"
    label: "New Host City (Label)"
    type: string
    sql: ${TABLE}.Olympiad_HostCity ;;
  }

  measure: additional_measure {
    type: count
  }
}
