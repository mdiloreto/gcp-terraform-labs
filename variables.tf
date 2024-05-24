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

variable "cluster_name" {}
variable "location" {}
variable "release_channel" {}
variable "machine_type" {}
variable "disk_type" {}
variable "disk_size" {
  default = 50
}
variable "num_nodes" {}
variable "master_ipv4_cidr" {}
# variable "network_id" {}
# variable "subnetwork_id" {}
variable "pod_secondary_range_name" {}
variable "services_secondary_range_name" {}
variable "default_max_pods_per_node" {}
variable "node_locations" {}
variable "enable_private_nodes" {}
variable "master_global_access_config_enabled" {}
variable "master_authorized_networks_config_cidr_block" {}
variable "master_authorized_networks_config_display_name" {}
variable "cluster_autoscaling_enabled" {}
variable "upgrade_max_surge" {}
variable "upgrade_max_unavailable" {}
variable "auto_upgrade" {}
variable "auto_repair" {}
variable "horizontal_pod_autoscaling" {}
variable "http_load_balancing" {}
variable "gce_persistent_disk_csi_driver_config_enabled" {}
variable "enable_shielded_nodes" {}
variable "workload_vulnerability_scanning" {}
variable "initial_node_count" {}
variable "remove_default_node_pool" {}
variable "vertical_pod_autoscaling_enabled" {}
variable "node_config_preemptible_enabled" {}
variable "shielded_instance_config_enable_secure_boot" {}
variable "shielded_instance_config_enable_integrity_monitoring" {}
variable "deletion_protection" {}
variable "select_cluster_version" {}
variable "select_release_channel" {}

# variable "node_pool_name" {}

variable "cluster_network_range_name_cidr" {
  description = "CIDR for the Cluster Network"
}

variable "services_secondary_range_name_cidr" {
  description = "Services Secondary range CIDR"
}

variable "pod_secondary_range_name_cidr" {
  description = "Pods secondary range CIDR"
}

variable "select_cluster_version_std" {}
variable "select_release_channel_std" {}

variable "project_id_std" {}
variable "cluster_name_std" {}
variable "location_std" {}
variable "release_channel_std" {}
variable "machine_type_std" {}
variable "disk_type_std" {}
variable "disk_size_std" {}
variable "num_nodes_std" {}
variable "master_ipv4_cidr_std" {}
variable "cluster_secondary_range_name_std" {}
variable "services_secondary_range_name_std" {}
variable "default_max_pods_per_node_std" {}
variable "node_locations_std" {}
variable "enable_private_nodes_std" {}
variable "master_global_access_config_enabled_std" {}
variable "master_authorized_networks_config_cidr_block_std" {}
variable "master_authorized_networks_config_display_name_std" {}
variable "cluster_autoscaling_enabled_std" {}
variable "upgrade_max_surge_std" {}
variable "upgrade_max_unavailable_std" {}
variable "auto_upgrade_std" {}
variable "auto_repair_std" {}
variable "horizontal_pod_autoscaling_std" {}
variable "http_load_balancing_std" {}
variable "gce_persistent_disk_csi_driver_config_enabled_std" {}
variable "enable_shielded_nodes_std" {}
variable "workload_vulnerability_scanning_std" {}
variable "initial_node_count_std" {}
variable "remove_default_node_pool_std" {}
variable "vertical_pod_autoscaling_enabled_std" {}
variable "node_config_preemptible_enabled_std" {}
variable "shielded_instance_config_enable_secure_boot_std" {}
variable "shielded_instance_config_enable_integrity_monitoring_std" {}
variable "deletion_protection_std" {}
variable "cluster_network_range_name_cidr_std" {}
variable "pod_secondary_range_name_cidr_std" {}
variable "services_secondary_range_name_cidr_std" {}
variable "subnetwork_name" {}