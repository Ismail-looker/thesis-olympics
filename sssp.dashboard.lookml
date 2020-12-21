- dashboard: sssp
  preferred_viewer: dashboards-next
  title: ssssss
  layout: newspaper
  elements:
  - title: New Tile
    name: New Tile
    model: 3proj_m
    explore: order_items
    type: looker_grid
    fields: [order_items.count, order_items.order_id]
    filters:
      order_items.returned_time: 2016/04/06 09:33 to 2016/09/06 09:33
    sorts: [order_items.count desc]
    limit: 20
    query_timezone: UTC
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    listen:
      Datetime range: order_items.returned_date
    row: 0
    col: 0
    width: 24
    height: 6
  - title: Single Viz
    name: Single Viz
    model: ismail_thesis_olympics
    explore: athlete_events_extends_test
    type: single_value
    fields: [athlete_events_extends_test.dashboard_links]
    sorts: [athlete_events_extends_test.dashboard_links]
    limit: 500
    query_timezone: UTC
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_types: {}
    defaults_version: 1
    row: 6
    col: 0
    width: 8
    height: 6
