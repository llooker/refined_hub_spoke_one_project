include: "/hub/views/order_items.view.lkml"
view: +order_items {

dimension_group: in_transit {
  type: duration
  sql_start: ${shipped_raw} ;;
  sql_end: ${delivered_raw} ;;
}

}
