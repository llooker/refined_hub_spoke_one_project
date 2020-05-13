view: reseller_margins {
  sql_table_name: secret_finance.reseller_margins ;;

  dimension: reseller_id {primary_key:yes hidden:yes}
  dimension: margin_rate {}
  dimension: company_cut {
    type: number
    sql: ${order_items.sale_price}*${margin_rate} ;;
    value_format_name: usd
  }
#   measure: total_company_cut { #Removed from here and added to order items refinement. No need to re-correct for symmetric aggregates that way!
#     type: sum
#     sql_distinct_key: ${order_items.id} ;;
#     sql: ${company_cut} ;;
#     value_format_name: usd
#   }
}
