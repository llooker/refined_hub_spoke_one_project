view: margins {
  sql_table_name: secret_finance.margins ;;

  dimension: inventory_item_id {primary_key:yes hidden:yes}
  dimension: margin {}
  measure: total_margin {
    type: sum
    sql: ${margin} ;;
  }
}
