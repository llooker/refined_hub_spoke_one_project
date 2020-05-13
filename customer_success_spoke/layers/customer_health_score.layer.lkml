include: "/hub/views/order_items.view.lkml"
include: "/customer_success_spoke/explores/order_items.explore.lkml"

view: +order_items {
  dimension: created_day_of_week {
    group_label: "Created Date"
    label: "Day of Week"
    type: date_day_of_week
    sql: ${created_raw} ;;
  }
  measure: count_orders_with_jeans {
    hidden:yes
    type:count_distinct
    sql: ${order_id} ;;
    filters: [products.category: "Jeans"]
  }
  measure: total_revenue_on_thursdays {
    hidden:yes
    type: sum
    sql: ${sale_price} ;;
    filters: [created_day_of_week: "Thursday"]
  }
}

view: cs_user_order_ndt {
  view_label: "CS User Order Facts"
  derived_table: {
    explore_source: order_items {
      column: user_id {}
      column: count_orders_with_jeans {}
      column: total_revenue_on_thursdays {}
    }
  }

  dimension: user_id {
    hidden:yes
    primary_key:yes
  }

  dimension: count_orders_with_jeans {
    type: number
  }
  dimension: total_revenue_on_thursdays {
    type: number
  }
  dimension: customer_health_score {
    type: string
    case: {
      when: {
        label: "Gold"
        sql: ${count_orders_with_jeans}>5 AND ${total_revenue_on_thursdays} >100 ;;
      }
      when: {
        label: "Silver"
        sql: ${count_orders_with_jeans}>5 OR ${total_revenue_on_thursdays} >100 ;;
      }
      when: {
        label: "Bronze"
        sql: ${count_orders_with_jeans} >2 OR ${total_revenue_on_thursdays} >50 ;;
      }
    }
  }
  measure: count_gold_customeers {
    type: count
    filters: [customer_health_score: "Gold"]
  }
  measure: count_silver_customeers {
    type: count
    filters: [customer_health_score: "Silver"]
  }
  measure: count_bronze_customeers {
    type: count
    filters: [customer_health_score: "Bronze"]
  }
}

explore: +order_items {}
