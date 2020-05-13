include: "/hub/explores/*.lkml"
include: "/managed_spoke/views/*.view.lkml"
include: "/managed_spoke/layers/*.layer.lkml"

explore: distribution_centers {
  extends: [distribution_centers_hub]
  group_label: "(AJC - One Project) Managed"
}

explore: events {
  extends: [events_hub]
  group_label: "(AJC - One Project) Managed"
}

explore: inventory_items {
  extends: [inventory_items_hub]
  group_label: "(AJC - One Project) Managed"
}

explore: products {
  extends: [products_hub]
  group_label: "(AJC - One Project) Managed"
}
