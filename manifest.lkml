project_name: "ismail_thesis_olympics"

# # Use local_dependency: To enable referencing of another project
# # on this instance with include: statements
#
# local_dependency: {
#   project: "name_of_other_project"
# }

constant: flag_url_prefix {
  value: "https://lipis.github.io/flag-icon-css/flags/4x3/"
}

constant: param_default {
  value: "{{_user_attributes['first_name']}}"
}
