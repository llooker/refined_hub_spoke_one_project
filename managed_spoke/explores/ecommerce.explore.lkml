include: "/hub/explores/*.lkml"
include: "/managed_spoke/views/*.view.lkml"
include: "/managed_spoke/layers/*.layer.lkml"

explore: +distribution_centers {
  group_label: "(AJC - One Project) Managed"
}

explore: +events {
  group_label: "(AJC - One Project) Managed"
}

explore: +inventory_items {
  group_label: "(AJC - One Project) Managed"
}

explore: +products {
  group_label: "(AJC - One Project) Managed"
}
