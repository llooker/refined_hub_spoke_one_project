include: "/hub/explores/order_items.explore.lkml"
include: "/finance_spoke/explores/*.explore.lkml"
include: "/finance_spoke/layers/*.layer.lkml"
include: "/finance_spoke/views/*.view.lkml"

explore: +order_items {
  group_label: "(AJC - One Project) Finance"

  join: margins {
    type: left_outer
    sql_on: ${inventory_items.id} = ${margins.inventory_item_id};;
    relationship: many_to_one
  }
  join: reseller_margins {
    type: left_outer
    sql_on: ${order_items.reseller_id} = ${reseller_margins.reseller_id} ;;
    relationship: many_to_one
  }
}
