include: "/hub/views/users.view"
include: "/hub/explores/users.explore.lkml"

view: +users {
  dimension: churnable {}
}
