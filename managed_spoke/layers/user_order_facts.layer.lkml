include: "/hub/views/order_items.view"
include: "/managed_spoke/explores/order_items.explore.lkml"
include: "/managed_spoke/explores/users.explore.lkml"


view: +order_items {
  measure: max_order_date {
    type: date_raw
    sql: max(${created_raw}) ;;
  }

  measure: min_order_date {
    type: date_raw
    sql: min(${created_raw}) ;;
  }
}

view: user_order_facts_ndt {
  view_label: "Users"
  derived_table: {
    explore_source: order_items {
      column: user_id {}
      column: max_order_date {}
      column: min_order_date {}
      column: lifetime_revenue {field: order_items.total_revenue}
      column: lifetime_order_count {field: order_items.order_count}
    }
  }
  dimension: user_id {
    primary_key: yes
    hidden: yes
    type: number
  }
  dimension_group: latest_order {
    type: time
    timeframes: [raw,date,week,month,year]
    sql: ${TABLE}.max_order_date ;;
  }
  dimension_group: first_order {
    type: time
    timeframes: [raw,date,week,month,year]
    sql: ${TABLE}.min_order_date ;;
  }
  dimension: lifetime_revenue {
    type: number
  }
  dimension: lifetime_order_count {
    type: number
  }
}

explore: +order_items {
  join: user_order_facts_ndt {
    type: inner
    sql_on: ${order_items.user_id} = ${user_order_facts_ndt.user_id} ;;
    relationship: many_to_one
  }
}

explore: +users {
  join: user_order_facts_ndt {
    type: left_outer
    sql_on: ${users.id} = ${user_order_facts_ndt.user_id} ;;
    relationship: one_to_one
  }
}
