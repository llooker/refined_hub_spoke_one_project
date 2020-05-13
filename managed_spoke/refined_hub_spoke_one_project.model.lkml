connection: "thelook_events_redshift"

# include all the views and explores
include: "/hub/views/*.view"
include: "/hub/explores/*lkml"

datagroup: refined_hub_spoke_one_project_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: refined_hub_spoke_one_project_default_datagroup

explore: distribution_centers {
  extends: [distribution_centers_hub]
}

explore: events {
  extends: [events_hub]
}

explore: inventory_items {
  extends: [inventory_items_hub]
}

explore: order_items {
  extends: [order_items_hub]
}

explore: products {
  extends: [products_hub]
}

explore: users {
  extends: [users_hub]
}
