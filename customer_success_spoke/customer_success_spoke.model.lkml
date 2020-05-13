connection: "thelook_events_redshift"

include: "/hub/explores/*.lkml"

include: "/customer_success_spoke/views/*.view.lkml"
include: "/customer_success_spoke/layers/*.layer.lkml"
include: "/customer_success_spoke/explores/*.explore.lkml"

datagroup: customer_success {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "12 hour"
}

persist_with: customer_success
