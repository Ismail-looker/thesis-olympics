view: presenter {
  derived_table: {
    sql:
          SELECT 1 as id, "A" as presenter_1, "C" as presenter_2, 5 as count UNION ALL
            SELECT  2 as id, "A" as presenter_1, "B" as presenter_2, 5 as count UNION ALL
            SELECT  3 as id, "B" as presenter_1, "A" as presenter_2, 5 as count UNION ALL
            SELECT  4 as id, "B" as presenter_1, "D" as presenter_2, 5 as count  UNION ALL
            SELECT  5 as id, "C" as presenter_1, "E" as presenter_2, 5 as count  UNION ALL
            SELECT  6 as id, "C" as presenter_1, "B" as presenter_2, 5 as count  UNION ALL
            SELECT  7 as id, "D" as presenter_1, "B" as presenter_2, 5 as count  UNION ALL
            SELECT  8 as id, "E" as presenter_1, "D" as presenter_2, 5 as count  UNION ALL
            SELECT  9 as id, "E" as presenter_1, "A" as presenter_2, 5 as count  UNION ALL
            SELECT  10 as id, "E" as presenter_1, "B" as presenter_2, 5 as count
     ;;
  }

  dimension: id {
    primary_key:yes
    type:number
    sql:${TABLE}.id;;
  }

  dimension: presenter_1 {
    type: string
    sql:${TABLE}.presenter_1;;
  }

  dimension: presenter_2 {
    type: string
    sql:${TABLE}.presenter_2;;
#       html: {% if value < 1 %}
#          <p>{{ rendered_value }} <img src="http://findicons.com/files/icons/573/must_have/48/check.png" height=20 width=20></p>
#           {% else %}
#         <p>{{ rendered_value }}<img src="http://findicons.com/files/icons/719/crystal_clear_actions/64/cancel.png" height=20 width=20></p>
#       {% endif %} ;;
  }

  measure: count {
    type: sum
    sql:${TABLE}.count;;
#     html: {% if value < 1 %}
#     <p>{{ rendered_value }}<i class="fa fa-arrow-down" aria-hidden="true"></i></p>
#     {% else %}
#     <p>{{ rendered_value }}<i class="fa fa-arrow-up" aria-hidden="true"></i></p>
#     {% endif %} ;;
  }

}

view: unique_presenters {
  derived_table: {
    sql: SELECT presenter_1 AS unique_presenter, count AS presenter_count FROM ${presenter.SQL_TABLE_NAME}
          UNION ALL
         SELECT presenter_2 AS unique_presenter, count AS presenter_count FROM ${presenter.SQL_TABLE_NAME}
        ;;
  }
}

view: unique_presenters_final {
  derived_table: {
    sql: SELECT row_number() over() as id, unique_presenter, presenter_count FROM ${unique_presenters.SQL_TABLE_NAME}
        ;;
  }

  dimension: id {
    primary_key: yes
    type: number
    sql:${TABLE}.id;;
  }

  dimension: unique_presenter {
    type: string
    sql:${TABLE}.unique_presenter;;
  }
  dimension: presenter_count {
    type: number
    sql:${TABLE}.presenter_count;;
  }

  measure: unique_presenter_total {
    type: sum
    sql:${presenter_count};;
  }

}





view: history_2 {
  derived_table: {
    sql:SELECT
        user.first_name AS `user.first_name`,
        user_facts.last_ui_login_credential_type AS `user_facts.last_ui_login_credential_type`,
        CASE
      WHEN history.SOURCE = 'api3'
                OR history.SOURCE = 'dashboard_prefetch'
                OR history.SOURCE = 'data-download-api'
               THEN 'API'
      WHEN history.SOURCE = 'regenerator'
                OR history.SOURCE = 'scheduled_task'
               THEN 'System'
      WHEN history.SOURCE = 'dashboard'
                OR history.SOURCE = 'run_async'
                OR history.SOURCE = 'explore'
                OR history.SOURCE = 'private_embed'
                OR history.SOURCE = 'private_url'
                OR history.SOURCE = 'public_embed'
                OR history.SOURCE = 'public_url'
                OR history.SOURCE = 'public_embed'
                OR history.SOURCE like 'look%'
                OR history.SOURCE like 'render_manager%'
                OR history.SOURCE = 'source_query'
                OR history.SOURCE = 'sqlrunner'
                OR history.SOURCE = 'suggest'
                OR history.SOURCE = 'query'
                OR history.SOURCE = 'merge_query'
                OR history.SOURCE = 'drill_modal'
               THEN 'User'
      ELSE 'Other'
      END AS `history.issuer_source`,
        CASE WHEN model_set.embed THEN 'Yes' ELSE 'No' END
       AS `model_set.embed`,
        user.email AS `user.email`,
        CONCAT (user.first_name, ' ', user.last_name)  AS `user.name`,
        COUNT(DISTINCT user_facts.id) AS `user_facts.count`
      FROM history
      LEFT JOIN user ON history.user_id = user.id
      LEFT JOIN user_facts ON history.user_id = user_facts.user_id
      LEFT JOIN user_facts_role ON user.id = user_facts_role.user_id
      LEFT JOIN role ON user_facts_role.role_id = role.id
      LEFT JOIN model_set ON role.model_set_id = model_set.id

      GROUP BY 1,2,3,4,5,6
      ORDER BY user.id
      LIMIT 50;;
  }

}
