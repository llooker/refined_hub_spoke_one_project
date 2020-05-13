include: "/hub/views/order_items.view.lkml"

view: +order_items {
  dimension: reseller_id {}
  measure: total_company_cut {
    type: sum
#     sql_distinct_key: ${order_items.id} ;; #unnecessary since we are able to move this directly to the order items view! Saves on unnecessary symmetric aggregates re-correction!
    sql: ${reseller_margins.company_cut} ;;
    value_format_name: usd
  }
}
