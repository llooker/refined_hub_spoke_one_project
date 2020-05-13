include: "/hub/explores/*.lkml"
include: "/managed_spoke/views/*.view.lkml"
include: "/managed_spoke/layers/*.layer.lkml"

explore: distribution_centers {
  extends: [distribution_centers_hub]
}

explore: events {
  extends: [events_hub]
}

explore: inventory_items {
  extends: [inventory_items_hub]
}

explore: products {
  extends: [products_hub]
}
