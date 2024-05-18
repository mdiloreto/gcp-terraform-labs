module "gke_primary" {
  source = "./modules/gke"

  project_id                              = var.project_id
  cluster_name                            = var.cluster_name
  location                                = var.location
  release_channel                         = var.release_channel
  machine_type                            = var.machine_type
  disk_type                               = var.disk_type
  disk_size                               = var.disk_size
  num_nodes                               = var.num_nodes
  master_ipv4_cidr                        = var.master_ipv4_cidr
  network_id                              = var.network_id
  subnetwork_id                           = var.subnetwork_id
  cluster_secondary_range_name            = var.cluster_secondary_range_name
  services_secondary_range_name           = var.services_secondary_range_name
  default_max_pods_per_node               = var.default_max_pods_per_node
  node_locations                          = var.node_locations
  enable_private_nodes                    = var.enable_private_nodes
  master_global_access_config_enabled     = var.master_global_access_config_enabled
  
  master_authorized_networks_config_cidr_block                             = var.master_authorized_networks_config_cidr_block
  master_authorized_networks_config_display_name                           = var.master_authorized_networks_config_display_name

  cluster_autoscaling_enabled             = var.cluster_autoscaling_enabled
  upgrade_max_surge                       = var.upgrade_max_surge
  upgrade_max_unavailable                 = var.upgrade_max_unavailable
  auto_upgrade                            = var.auto_upgrade
  auto_repair                             = var.auto_repair
  horizontal_pod_autoscaling              = var.horizontal_pod_autoscaling
  http_load_balancing                     = var.http_load_balancing
  gce_persistent_disk_csi_driver_config_enabled = var.gce_persistent_disk_csi_driver_config_enabled
  enable_shielded_nodes                   = var.enable_shielded_nodes
  workload_vulnerability_scanning         = var.workload_vulnerability_scanning
  initial_node_count                      = var.initial_node_count
  remove_default_node_pool                = var.remove_default_node_pool
  vertical_pod_autoscaling_enabled        = var.vertical_pod_autoscaling_enabled
  node_config_preemptible_enabled         = var.node_config_preemptible_enabled
  shielded_instance_config_enable_secure_boot          = var.shielded_instance_config_enable_secure_boot
  shielded_instance_config_enable_integrity_monitoring = var.shielded_instance_config_enable_integrity_monitoring
  deletion_protection = var.deletion_protection
}