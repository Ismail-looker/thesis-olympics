connection: "ismail_120_yrs_of_olympics_thesis"

# include all the views
include: "/views/**/*.view"
# include: "/other_maps/**/*.dashboard"

datagroup: ismail_thesis_olympics_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: ismail_thesis_olympics_default_datagroup

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
    sql_on: ${athlete_events.olympic_year} = ${summer_games.olympiad_year_str}
      AND ${athlete_events.olympic_season} = "Summer";;
  }

}

explore: summer_games {
  label: "Olympic Summer Games"

  join: athlete_events {
    type: left_outer
    relationship: one_to_many
    sql_on: ${summer_games.olympiad_year_str} = ${athlete_events.olympic_year}
          --AND ${athlete_events.olympic_season} = "Summer"
          ;;
  }

  join: national_olympic_committees {
    type: left_outer
    relationship: many_to_one
    sql_on: ${athlete_events.noc} = ${national_olympic_committees.noc};;
  }
}

# explore: national_olympic_committees {}

#------------------------------------------- TESTING AREA----------------------------------
# explore: testing_precision_filter_dt {}
explore: body_map_dt {}

map_layer: modern_olympics_layer {
  # feature_key: "Name"
  label: "Host City"
  file: "other_maps/modern_olympics.topojson"
  # min_zoom_level: 1.6
  # property_key: "Name"
  # max_zoom_level: 12
  # format: topojson
  # projection: airy
  property_label_key: "Name"
}

map_layer: body_map {
  # feature_key: "Name"
  label: "Body"
  file: "full_body.json"
  # min_zoom_level: 1.6
  property_key: "Body"
  # max_zoom_level: 12
  # format: topojson
  # projection: airy
  property_label_key: "Body"
}

map_layer: olympic_cities_map {
  # feature_key: "Name"
  label: "Host City"
  file: "olympic_cities.json"
  # min_zoom_level: 1.6
  property_key: "Year"
  # max_zoom_level: 12
  # format: topojson
  # projection: airy
  property_label_key: "Name"
}
# "properties": {
#   "Name": "Athens",
#   "description": null,
#   "ID": 1,
#   "Olympiad": "I",
#   "Year": 1896,
#   "Order": "1st",
#   "Start_date": "1896-04-06",
#   "End_date": "1896-04-15",
#   "Host_Country": "Greece",
#   "Host_City_Wiki": "https://en.wikipedia.org/wiki/Athens"
#   }
