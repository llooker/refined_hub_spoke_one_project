connection: "thelook_events_redshift"

#include all spoke views, explores, and layers
include: "views/*.view.lkml"
include: "explores/*.explore.lkml"
include: "layers/*.layer.lkml"

datagroup: refined_hub_spoke_one_project_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: refined_hub_spoke_one_project_default_datagroup
