connection: "ismail_120_yrs_of_olympics_thesis"

# include all the views
include: "/views/**/*.view"
# include: "/other_maps/**/*.dashboard"
include: "/**/*.dashboard"

datagroup: ismail_thesis_olympics_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: ismail_thesis_olympics_default_datagroup

#------------------------------------------- Explores ----------------------------------

explore: athlete_events {
  label: "Athlete Olympic Events (120 Years)"
#   view_label: "Athlete Olympic Events"
  case_sensitive: no

  join: national_olympic_committees {                         # Join 1
    type: left_outer
    relationship: many_to_one
    sql_on: ${athlete_events.noc} = ${national_olympic_committees.noc};;
  }

  join: summer_games {                                        # Join 2
    type: inner   # Using Inner Join to avoid null values that result from Winter events when Left join is used
    relationship: many_to_one
    sql_on: ${athlete_events.olympic_year} = ${summer_games.olympiad_year}
      AND ${athlete_events.olympic_season} = "Summer";;
  }
  join: extended_view {
    type: inner   # Using Inner Join to avoid null values that result from Winter events when Left join is used
    relationship: many_to_one
    sql_on: ${athlete_events.olympic_year} = ${extended_view.olympiad_year}
      AND ${athlete_events.olympic_season} = "Summer";;
  }

}

explore: summer_games {
  label: "Olympic Summer Games"

  join: athlete_events {
    type: left_outer
    relationship: one_to_many
    sql_on: ${summer_games.olympiad_year} = ${athlete_events.olympic_year}
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
explore: body_map_dt {}

#------------------------------------------- Map Layers ----------------------------------
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

#------------------------------------------- TESTING AREA----------------------------------
explore: athlete_events_extends_test {
  #   sql_always_where:   {% if _user_attributes['first_name'] == 'Ismail' %} 1=1 {% else %}athlete_events_extends_test.noc = 'fra'{% endif %} ;;
  # fields: [ALL_FIELDS*,-test_filter.date_filter]
  #   view_label: "Athlete Olympic Events"
  #   access_filter: {
  #     field: athlete_events.athlete_id
  #     user_attribute: id
  #   }
  #    always_filter: {
  #      filters: [athlete_events.athlete_id: "{{ _user_attributes['id'] }}"]
  #    }
  label: "Athlete Olympic Events Test Hub"
  case_sensitive: no
  join: national_olympic_committees {                         # Join 1
    type: left_outer
    relationship: many_to_one
    sql_on: ${athlete_events_extends_test.noc} = ${national_olympic_committees.noc};;
  }

  join: summer_games {                                        # Join 2
    type: inner   # Using Inner Join to avoid null values that result from Winter events when Left join is used
    relationship: many_to_one
    sql_on: ${athlete_events_extends_test.olympic_year} = ${summer_games.olympiad_year}
      AND ${athlete_events_extends_test.olympic_season} = "Summer";;
  }
  join: extended_view {
    type: inner   # Using Inner Join to avoid null values that result from Winter events when Left join is used
    relationship: many_to_one
    sql_on: ${athlete_events_extends_test.olympic_year} = ${extended_view.olympiad_year}
      AND ${athlete_events_extends_test.olympic_season} = "Summer";;
  }
  join: derived_view {
    type: inner
    relationship: many_to_one
    sql_on: ${athlete_events_extends_test.olympic_year} = ${derived_view.olympiad_year}
      AND ${athlete_events_extends_test.olympic_season} = "Summer";;
  }
  join: test_filter {
    # fields: [-test_filter.date_filter]
    from: derived_view
    type: inner
    relationship: many_to_one
    sql_on: ${athlete_events_extends_test.olympic_year} = ${test_filter.olympiad_year}
      AND ${athlete_events_extends_test.olympic_season} = "Summer";;
  }
}


# explore: testing_precision_filter_dt {}
# explore: testing_liquid {}
# explore: menu_dt {}
explore: history_2 {}
explore: presenter {
  view_name: presenter
  join: unique_presenters_final {

    sql_on: ${unique_presenters_final.unique_presenter}=${presenter.presenter_1} ;;
    relationship: many_to_one
  }
}
# explore: unique_presenters {}
explore: unique_presenters_final {}
explore: currency_demo  {}
explore: liquid_conditional_format {}

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
