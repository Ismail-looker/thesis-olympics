view: athlete_events {
  sql_table_name: Olympics.athlete_events ;;

  dimension: unique_id {
    description: "Unique ID"
    label: "_ID"
    primary_key: yes
    type: number
    sql: ${TABLE}.Unique_ID ;;
  }

  dimension: athlete_id {
    description: "Athlete Identifier No (Not Unique in table)"
    label: "Athlete ID"
    type: number
    sql: ${TABLE}.Athlete_ID ;;
  }

  dimension: athlete_name {
    description: "Name of Athlete"
    label: "Athlete Name"
    type: string
    sql: ${TABLE}.Athlete_Name ;;
  }

  dimension: athlete_gender {
    description: "Gender of Athlete"
    label: "Athlete Gender"
    type: string
    case: {
      when: {
        sql: ${TABLE}.Athlete_Gender = 'M' ;;
        label: "Male"
      }
      when: {
        sql: ${TABLE}.Athlete_Gender = 'F' ;;
        label: "Female"
      }
      else: "Other"
    }
#     sql:  CASE
#             WHEN ${TABLE}.Athlete_Gender = 'M' THEN 'Male'
#             WHEN ${TABLE}.Athlete_Gender = 'F' THEN 'Female'
#             ELSE 'Other'
#           END;;
  }

  dimension: athlete_age {
    description: "Age of Athlete"
    label: "Athlete Age"
    type: number
    sql: ${TABLE}.Athlete_Age ;;
  }

  dimension: athlete_height {
    description: "Height of Athlete"
    label: "Athlete Height"
    type: number
    sql: ${TABLE}.Athlete_Height ;;
  }

  dimension: athlete_weight {
    description: "Weight of Athlete"
    label: "Athlete Weight"
    type: number
    sql: ${TABLE}.Athlete_Weight ;;
  }

  dimension: athlete_team {
    description: "Team names - Advised to ignore due to Poor Dataset"
    label: "Olympic Team"
    type: string
    sql: ${TABLE}.Athlete_Team ;;
  }

  dimension: noc {
    description: "National Olympic Committee (NOC)"
    label: "National Olympic Committee"
    type: string
    sql: ${TABLE}.NOC ;;
  }

  dimension: games {
    description: "Olympic Title"
    label: "Olympic Title"
    type: string
    sql: ${TABLE}.Games ;;
  }

  dimension: olympic_year {
    description: "Olympic Year"
    type: number
    value_format: "####"
    sql: ${TABLE}.Olympic_Year ;;
  }

  dimension: olympic_season {
    description: "Olympic Season - Summer, Winter"
    type: string
    sql: ${TABLE}.Olympic_Season ;;
  }

  dimension: city {
    description: "Olympic City"
    label: "Olympic City"
    type: string
    sql: ${TABLE}.City ;;
  }

  dimension: sport {
    description: "Olympic Sport"
    label: "Olympic Sport"
    type: string
    sql: ${TABLE}.Sport ;;
  }

  dimension: olympic_event {
    description: "Olympic Event"
    label: "Olympic Event"
    type: string
    sql: ${TABLE}.Olympic_Event ;;
  }

  dimension: medal {
    description: "Medal - Gold, Silver, Bronze"
    label: "Olympic Medal"
    type: string
    sql: ${TABLE}.Medal ;;
  }

  # YYYY-MM-DD but with MM-DD as 01-01 and only used for partitioning
  dimension_group: olympic_year_partition_helper {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    hidden: yes
    convert_tz: no
    datatype: date
    sql: ${TABLE}.Olympic_Year_partition_helper ;;
  }

#   New Dimensions   ----------------------------------------------------------

  dimension: age_tier {
    description: "Athlete Age Tiers"
    label: "Athlete Age Tiers"
    type: tier
    tiers: [0, 10, 20, 30, 40, 50, 60, 70, 80]
    style: integer # the default value, could be excluded
    sql: ${athlete_age} ;;
  }
  dimension: gold_medal {
    description: "Medal - Gold, Silver, Bronze"
    label: "Olympic Medal"
    type: string
    sql: ${TABLE}.Medal ;;
  }
  measure: count {
    type: count
    drill_fields: [athlete_name]
  }

#   New Measures   -----------------------------------------------------------
  measure: number_of_distinct_athletes{
    description: "Number of Athletes"
    type: count_distinct
    sql: ${athlete_name};;
    drill_fields: [unique_id, athlete_name]
  }

  measure: number_of_distinct_avents{
    description: "Number of Events"
    type: count_distinct
    sql: ${olympic_event};;
    drill_fields: [unique_id, athlete_name]
  }

  measure: number_of_distinct_NOCs{
    description: "Number of NOCs"
    type: count_distinct
    sql: ${noc};;
    drill_fields: [unique_id, athlete_name]
  }

  measure: number_of_distinct_sports{
    description: "Number of Sports"
    type: count_distinct
    sql: ${sport};;
    drill_fields: [unique_id, athlete_name]
  }
  measure: number_of_gold_medals{
    description: "Number of Medals (Gold)"
    label: "Number of Medals (Gold)"
    type: count
    filters: {
      field: medal
      value: "gold"
    }
    drill_fields: [unique_id, athlete_name]
  }
  measure: number_of_silver_medals{
    description: "Number of Medals (Silver)"
    label: "Number of Medals (Silver)"
    type: count
    filters: {
      field: medal
      value: "silver"
    }
    drill_fields: [unique_id, athlete_name]
  }
  measure: number_of_bronze_medals{
    description: "Number of Medals (Bronze)"
    label: "Number of Medals (Bronze)"
    type: count
    filters: {
      field: medal
      value: "bronze"
    }
  }

  measure: number_of_medals{
    description: "Number of Medals (Total)"
    label: "Number of Medals (Total)"
    type: number
    sql: ${number_of_gold_medals}+${number_of_silver_medals}+${number_of_bronze_medals} ;;
    drill_fields: [unique_id, athlete_name]
  }
}