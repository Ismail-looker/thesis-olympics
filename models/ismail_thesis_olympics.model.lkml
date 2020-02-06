connection: "ismail_120_yrs_of_olympics_thesis"

# include all the views
include: "/views/**/*.view"

datagroup: ismail_thesis_olympics_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: ismail_thesis_olympics_default_datagroup

# explore: olympics_120_years {
#   label: "120 Years of Olympics"
#   view_label: "Athlete Olympic Events"
#   case_sensitive: no
#
#   join: national_olympic_committees {                         # Join 1
#     type: left_outer
#     sql_on: ${olympics_120_years.noc} = ${national_olympic_committees.noc};;
#     relationship: many_to_one
# #     fields: [
# #       national_olympic_committees.created_date,
# #       national_olympic_committees.full_name,
# #       national_olympic_committees.email,
# #       national_olympic_committees.age,
# #       national_olympic_committees.gender,
# #       usenational_olympic_committeesrs.state_on_map
# #     ]
#   }
#
#   join: summer_games {                                        # Join 2
#     type: left_outer
#     sql_on: ${olympics_120_years.year_year} = ${summer_games.olympiad_year}
#       AND ${olympics_120_years.season} = "Summer";;
#     relationship: many_to_one
#   }
#
# }

explore: athlete_events {
  label: "Athlete Olympic Events (120 Years)"
  view_label: "Athlete Olympic Events"
  case_sensitive: no

  join: national_olympic_committees {                         # Join 1
    type: left_outer
    relationship: many_to_one
    sql_on: ${athlete_events.noc} = ${national_olympic_committees.noc};;
#     fields: [
#       national_olympic_committees.created_date,
#       national_olympic_committees.full_name,
#       national_olympic_committees.email,
#       national_olympic_committees.age,
#       national_olympic_committees.gender,
#       national_olympic_committees.state_on_map
#     ]
  }

  join: summer_games {                                        # Join 2
    type: inner   # Using Inner Join to avoid null values that result from Winter events when Left join is used
    relationship: many_to_one
    sql_on: ${athlete_events.olympic_year} = ${summer_games.olympiad_year}
      AND ${athlete_events.olympic_season} = "Summer";;
  }

}

# explore: national_olympic_committees {}

explore: summer_games {
  label: "Olympic Summer Games"
#   sql_always_where: ${summer_games.dashboard_olympiad_start_date} IS NOT NULL ;;

}
