variable "project_id" {}
variable "region" {}
variable "zone" {}
variable "backend_bucket" {}
variable "state_name" {}
variable "network_name" {}
variable "subnet_name" {}
variable "workerpool_name" {}
variable "no_external_ip" {}
variable "cb_trigger_name" {}
variable "cb_filename" {}
variable "cb_repo_name" {}
variable "cb_repo_type" {}
variable "wp_disk_size" {}
variable "nat_ip" {
  description = "Public ip address"
  default     = null
}

variable "network_tier" {
  description = "Network network_tier"
  default     = "PREMIUM"
}

variable "service_account" {
  default = null
  type = object({
    email  = string,
    scopes = set(string)
  })
  description = "Service account to attach to the instance. See https://www.terraform.io/docs/providers/google/r/compute_instance_template#service_account."
}
## Firewall variables 

variable "fw_source_tags" {
  description = "Source Tag list"
  type        = list(string)
}

variable "fw_ports" {
  type = list(number)
}

variable "fw_source_rg" {
  description = "Source ip ranges for the rule"
}

variable "fw_rule_name" {
  type        = string
  description = "Name of the firewall rule"
}

variable "fw_protocol" {
  type        = string
  description = "Protocol for the rule"
}

## Firewall variables  2

variable "fw_source_tags2" {
  description = "Source Tag list"
  type        = list(string)
}

variable "fw_ports2" {
  type = list(number)
}

variable "fw_source_rg2" {
  description = "Source ip ranges for the rule"
}

variable "fw_rule_name2" {
  type        = string
  description = "Name of the firewall rule"
}

variable "fw_protocol2" {
  type        = string
  description = "Protocol for the rule"
}

# variable "cluster_name" {}
# variable "location" {}
# variable "release_channel" {}
# variable "machine_type" {}
# variable "disk_type" {}
# variable "disk_size" {
#   default = 50
# }
# variable "num_nodes" {}
# variable "master_ipv4_cidr" {}
# # variable "network_id" {}
# # variable "subnetwork_id" {}
# variable "pod_secondary_range_name" {}
# variable "services_secondary_range_name" {}
# variable "default_max_pods_per_node" {}
# variable "node_locations" {}
# variable "enable_private_nodes" {}
# variable "master_global_access_config_enabled" {}
# variable "master_authorized_networks_config_cidr_block" {}
# variable "master_authorized_networks_config_display_name" {}
# variable "cluster_autoscaling_enabled" {}
# variable "upgrade_max_surge" {}
# variable "upgrade_max_unavailable" {}
# variable "auto_upgrade" {}
# variable "auto_repair" {}
# variable "horizontal_pod_autoscaling" {}
# variable "http_load_balancing" {}
# variable "gce_persistent_disk_csi_driver_config_enabled" {}
# variable "enable_shielded_nodes" {}
# variable "workload_vulnerability_scanning" {}
# variable "initial_node_count" {}
# variable "remove_default_node_pool" {}
# variable "vertical_pod_autoscaling_enabled" {}
# variable "node_config_preemptible_enabled" {}
# variable "shielded_instance_config_enable_secure_boot" {}
# variable "shielded_instance_config_enable_integrity_monitoring" {}
# variable "deletion_protection" {}
# variable "select_cluster_version" {}
# variable "select_release_channel" {}

# # variable "node_pool_name" {}

# variable "cluster_network_range_name_cidr" {
#   description = "CIDR for the Cluster Network"
# }

# variable "services_secondary_range_name_cidr" {
#   description = "Services Secondary range CIDR"
# }

# variable "pod_secondary_range_name_cidr" {
#   description = "Pods secondary range CIDR"
# }

# variable "select_cluster_version_std" {}
# variable "select_release_channel_std" {}

# variable "project_id_std" {}
# variable "cluster_name_std" {}
# variable "location_std" {}
# variable "release_channel_std" {}
# variable "machine_type_std" {}
# variable "disk_type_std" {}
# variable "disk_size_std" {}
# variable "num_nodes_std" {}
# variable "master_ipv4_cidr_std" {}
# variable "cluster_secondary_range_name_std" {}
# variable "services_secondary_range_name_std" {}
# variable "default_max_pods_per_node_std" {}
# variable "node_locations_std" {}
# variable "enable_private_nodes_std" {}
# variable "master_global_access_config_enabled_std" {}
# variable "master_authorized_networks_config_cidr_block_std" {}
# variable "master_authorized_networks_config_display_name_std" {}
# variable "cluster_autoscaling_enabled_std" {}
# variable "upgrade_max_surge_std" {}
# variable "upgrade_max_unavailable_std" {}
# variable "auto_upgrade_std" {}
# variable "auto_repair_std" {}
# variable "horizontal_pod_autoscaling_std" {}
# variable "http_load_balancing_std" {}
# variable "gce_persistent_disk_csi_driver_config_enabled_std" {}
# variable "enable_shielded_nodes_std" {}
# variable "workload_vulnerability_scanning_std" {}
# variable "initial_node_count_std" {}
# variable "remove_default_node_pool_std" {}
# variable "vertical_pod_autoscaling_enabled_std" {}
# variable "node_config_preemptible_enabled_std" {}
# variable "shielded_instance_config_enable_secure_boot_std" {}
# variable "shielded_instance_config_enable_integrity_monitoring_std" {}
# variable "deletion_protection_std" {}
# variable "cluster_network_range_name_cidr_std" {}
# variable "pod_secondary_range_name_cidr_std" {}
# variable "services_secondary_range_name_cidr_std" {}
# variable "subnetwork_name" {}

# #### TW 



# ######### GKE AMR-HUB-PRJ
# variable "description_gke_std_amr" {}
# variable "gke_subnetwork_name_amr" {}
# variable "gke_subnetwork_cidr_amr" {}
# variable "location_std_amr" {}
# variable "services_secondary_range_name_std_amr" {}
# variable "services_secondary_range_cidr_std_amr" {}
# variable "pod_secondary_range_name_std_amr" {}
# variable "pod_secondary_range_cidr_std_amr" {}
# variable "global_ip_address_reservation_name_amr" {}
# variable "global_ip_address_reservation_address_type_amr" {}
# variable "global_ip_address_reservation_description_amr" {}
# variable "select_cluster_version_std_amr" {}
# variable "select_release_channel_std_amr" {}
# variable "cluster_name_std_amr" {}
# variable "release_channel_std_amr" {}
# variable "machine_type_std_amr" {}
# variable "disk_type_std_amr" {}
# variable "disk_size_std_amr" {}
# variable "num_nodes_std_amr" {}
# variable "master_ipv4_cidr_std_amr" {}
# variable "default_max_pods_per_node_std_amr" {}
# variable "node_locations_std_amr" {}
# variable "enable_private_nodes_std_amr" {}
# variable "master_global_access_config_enabled_std_amr" {}
# variable "master_authorized_networks_config_cidr_block_std_amr" {}
# variable "master_authorized_networks_config_display_name_std_amr" {}
# variable "cluster_autoscaling_enabled_std_amr" {}
# variable "upgrade_max_surge_std_amr" {}
# variable "upgrade_max_unavailable_std_amr" {}
# variable "auto_upgrade_std_amr" {}
# variable "auto_repair_std_amr" {}
# variable "horizontal_pod_autoscaling_std_amr" {}
# variable "http_load_balancing_std_amr" {}
# variable "gce_persistent_disk_csi_driver_config_enabled_std_amr" {}
# variable "enable_shielded_nodes_std_amr" {}
# variable "workload_vulnerability_scanning_std_amr" {}
# variable "initial_node_count_std_amr" {}
# variable "remove_default_node_pool_std_amr" {}
# variable "vertical_pod_autoscaling_enabled_std_amr" {}
# variable "node_config_preemptible_enabled_std_amr" {}
# variable "shielded_instance_config_enable_secure_boot_std_amr" {}
# variable "shielded_instance_config_enable_integrity_monitoring_std_amr" {}
# variable "deletion_protection_std_amr" {}
# variable "repository_id" {}

# variable "master_authorized_networks" {}

variable "backend_service_timeout_sec" {
  description = "Backend service timeout in seconds"
  type        = number
}

variable "backend_service_custom_response_headers" {
  description = "Custom response headers for the backend service"
  type        = list(string)
}

variable "cpt_gbl_add_res_pur" {
  description = "Resource purpose for the global address"
  type        = string
}

variable "cpt_gbl_fwd_rul_por_ran" {
  description = "Port range for the global forwarding rule"
  type        = string
}

variable "cpt_gbl_fwd_rul_lb_scheme" {
  description = "Load balancer scheme for the global forwarding rule"
  type        = string
}

variable "backend_service_name" {
  description = "Name of the backend service"
  type        = string
}

variable "cpt_gbl_fwd_rul_ip_protocol" {
  description = "IP protocol for the global forwarding rule"
  type        = string
}

variable "compute_global_forwarding" {
  description = "Compute global forwarding rule"
  type        = string
}

variable "http_health_check_port_specification" {
  description = "Port specification for the HTTP health check"
  type        = string
}

variable "backend_service_port_name" {
  description = "Port name for the backend service"
  type        = string
}

variable "backend_service_lb_scheme" {
  description = "Load balancer scheme for the backend service"
  type        = string
}

variable "cpt_gbl_add_type" {
  description = "Type for the global address"
  type        = string
}

variable "cpt_gbl_add_name" {
  description = "Name for the global address"
  type        = string
}

variable "cpt_gbl_add_ip_desc" {
  description = "IP description for the global address"
  type        = string
}

variable "backend_service_custom_request_headers" {
  description = "Custom request headers for the backend service"
  type        = list(string)
}

variable "http_proxy_name" {
  description = "Name for the HTTP proxy"
  type        = string
}

variable "backend_service_protocol" {
  description = "Protocol for the backend service"
  type        = string
}

variable "backend_service_capacity_scaler" {
  description = "Capacity scaler for the backend service"
  type        = number
}

variable "url_map_name" {
  description = "Name for the URL map"
  type        = string
}

variable "backend_health_check_name" {
  description = "Name for the backend health check"
  type        = string
}

variable "backend_service_balancing_mode" {
  description = "Balancing mode for the backend service"
  type        = string
}

variable "backend_instance_group" {
  description = "Instance group for the backend service"
  type        = string
}

variable "backend_service_enable_cdn" {
  description = "Enable CDN for the backend service"
  type        = bool
}

variable "nginx_startup_script" {
  type = string
}