connection: "ismail_120_yrs_of_olympics_thesis"

# include all the views
include: "/views/**/*.view"

datagroup: ismail_thesis_olympics_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: ismail_thesis_olympics_default_datagroup

explore: olympics_120_years {
  label: "120 Years of Olympics"
  case_sensitive: no
  view_label: "Olympic medals dataset"



  join: national_olympic_committees {                         # Join 1
    type: left_outer
    sql_on: ${olympics_120_years.noc} = ${national_olympic_committees.noc}
            AND ${olympics_120_years.season} = "Summer";;
    relationship: many_to_one
  }

  join: summer_games {                                        # Join 2
    type: left_outer
    sql_on: ${olympics_120_years.year_year} = ${summer_games.olympiad_year}
      AND ${olympics_120_years.season} = "Summer";;
    relationship: many_to_one
  }

}

# explore: national_olympic_committees {}

# explore: summer_games {}
