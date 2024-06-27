# # resource "google_compute_network" "hub-network" {
# #   name                    = "test-hub-network"
# #   auto_create_subnetworks = false
# # }

# # resource "google_compute_subnetwork" "hub-subnetwork" {
# #   name          = var.subnetwork_name
# #   ip_cidr_range = var.cluster_network_range_name_cidr
# #   region        = var.location
# #   network       = google_compute_network.hub-network.id

# #   secondary_ip_range {
# #     range_name    = var.services_secondary_range_name
# #     ip_cidr_range = var.services_secondary_range_name_cidr
# #   }

# #   secondary_ip_range {
# #     range_name    = var.pod_secondary_range_name
# #     ip_cidr_range = var.pod_secondary_range_name_cidr
# #   }
# # }

# # resource "google_compute_global_address" "ip_address" {
# #   name = "gke-ingress-public-ip"
# #   address_type = "EXTERNAL"
# #   description = "External IP Address for GKE Cluster Ingress"
# # }

# # module "gke_primary" {
# #   source = "./modules/autopilot-gke"

# #   select_cluster_version = var.select_cluster_version
# #   select_release_channel = var.select_release_channel
# #   project_id                              = var.project_id
# #   cluster_name                            = var.cluster_name
# #   location                                = var.location
# #   release_channel                         = var.release_channel
# #   machine_type                            = var.machine_type
# #   disk_type                               = var.disk_type
# #   disk_size                               = var.disk_size
# #   num_nodes                               = var.num_nodes
# #   master_ipv4_cidr                        = var.master_ipv4_cidr
# #   network_id                              = google_compute_network.hub-network.id
# #   subnetwork_id                           = google_compute_subnetwork.hub-subnetwork.id
# #   cluster_secondary_range_name            = var.cluster_secondary_range_name
# #   services_secondary_range_name           = var.services_secondary_range_name
# #   default_max_pods_per_node               = var.default_max_pods_per_node
# #   node_locations                          = var.node_locations
# #   enable_private_nodes                    = var.enable_private_nodes
# #   master_global_access_config_enabled     = var.master_global_access_config_enabled

# #   master_authorized_networks_config_cidr_block                             = var.master_authorized_networks_config_cidr_block
# #   master_authorized_networks_config_display_name                           = var.master_authorized_networks_config_display_name

# #   cluster_autoscaling_enabled             = var.cluster_autoscaling_enabled
# #   upgrade_max_surge                       = var.upgrade_max_surge
# #   upgrade_max_unavailable                 = var.upgrade_max_unavailable
# #   auto_upgrade                            = var.auto_upgrade
# #   auto_repair                             = var.auto_repair
# #   horizontal_pod_autoscaling              = var.horizontal_pod_autoscaling
# #   http_load_balancing                     = var.http_load_balancing
# #   gce_persistent_disk_csi_driver_config_enabled = var.gce_persistent_disk_csi_driver_config_enabled
# #   enable_shielded_nodes                   = var.enable_shielded_nodes
# #   workload_vulnerability_scanning         = var.workload_vulnerability_scanning
# #   initial_node_count                      = var.initial_node_count
# #   remove_default_node_pool                = var.remove_default_node_pool
# #   vertical_pod_autoscaling_enabled        = var.vertical_pod_autoscaling_enabled
# #   node_config_preemptible_enabled         = var.node_config_preemptible_enabled
# #   shielded_instance_config_enable_secure_boot          = var.shielded_instance_config_enable_secure_boot
# #   shielded_instance_config_enable_integrity_monitoring = var.shielded_instance_config_enable_integrity_monitoring
# #   deletion_protection = var.deletion_protection
# # }

# # module "standard_gke_primary" {
# #   source = "./modules/standard-gke"

# #   select_cluster_version = var.select_cluster_version_std
# #   select_release_channel = var.select_release_channel_std

# #   project_id                          = var.project_id_std
# #   cluster_name                        = var.cluster_name_std
# #   location                            = var.location_std
# #   release_channel                     = var.release_channel_std
# #   machine_type                        = var.machine_type_std
# #   disk_type                           = var.disk_type_std
# #   disk_size                           = var.disk_size_std
# #   num_nodes                           = var.num_nodes_std
# #   master_ipv4_cidr                    = var.master_ipv4_cidr_std
# #   network_id                          = google_compute_network.hub-network.id
# #   subnetwork_id                       = google_compute_subnetwork.hub-subnetwork.id
# #   cluster_secondary_range_name        = var.cluster_secondary_range_name_std
# #   services_secondary_range_name       = var.services_secondary_range_name_std
# #   default_max_pods_per_node           = var.default_max_pods_per_node_std
# #   node_locations                      = var.node_locations_std
# #   enable_private_nodes                = var.enable_private_nodes_std
# #   master_global_access_config_enabled = var.master_global_access_config_enabled_std

# #   master_authorized_networks_config_cidr_block   = var.master_authorized_networks_config_cidr_block_std
# #   master_authorized_networks_config_display_name = var.master_authorized_networks_config_display_name_std

# #   cluster_autoscaling_enabled                          = var.cluster_autoscaling_enabled_std
# #   upgrade_max_surge                                    = var.upgrade_max_surge_std
# #   upgrade_max_unavailable                              = var.upgrade_max_unavailable_std
# #   auto_upgrade                                         = var.auto_upgrade_std
# #   auto_repair                                          = var.auto_repair_std
# #   horizontal_pod_autoscaling                           = var.horizontal_pod_autoscaling_std
# #   http_load_balancing                                  = var.http_load_balancing_std
# #   gce_persistent_disk_csi_driver_config_enabled        = var.gce_persistent_disk_csi_driver_config_enabled_std
# #   enable_shielded_nodes                                = var.enable_shielded_nodes_std
# #   workload_vulnerability_scanning                      = var.workload_vulnerability_scanning_std
# #   initial_node_count                                   = var.initial_node_count_std
# #   remove_default_node_pool                             = var.remove_default_node_pool_std
# #   vertical_pod_autoscaling_enabled                     = var.vertical_pod_autoscaling_enabled_std
# #   node_config_preemptible_enabled                      = var.node_config_preemptible_enabled_std
# #   shielded_instance_config_enable_secure_boot          = var.shielded_instance_config_enable_secure_boot_std
# #   shielded_instance_config_enable_integrity_monitoring = var.shielded_instance_config_enable_integrity_monitoring_std
# #   deletion_protection                                  = var.deletion_protection_std
# # }

# #### GKE Cluster IP and Subnet
# // Here starts the prerrequisites for the GKE Standard cluster. 

# resource "google_compute_network" "tw-vpc-amer-hub" {
#   name = "tw-vpc-amer-hub"
#   auto_create_subnetworks = false
# }

# resource "google_compute_subnetwork" "hub-subnetwork" {

#   project = var.project_id
#   name          = var.gke_subnetwork_name_amr
#   ip_cidr_range = var.gke_subnetwork_cidr_amr
#   region        = var.location_std_amr
#   network       = google_compute_network.tw-vpc-amer-hub.id

#   secondary_ip_range {
#     range_name    = var.services_secondary_range_name_std_amr
#     ip_cidr_range = var.services_secondary_range_cidr_std_amr
#   }

#   secondary_ip_range {
#     range_name    = var.pod_secondary_range_name_std_amr
#     ip_cidr_range = var.pod_secondary_range_cidr_std_amr
#   }
# }

# resource "google_compute_address" "ingress_ip_address" {
#   project       = var.project_id
#   region        = var.region
#   name          = var.global_ip_address_reservation_name_amr 
#   address_type  = var.global_ip_address_reservation_address_type_amr 
#   subnetwork    = google_compute_subnetwork.hub-subnetwork.id
#   description   = var.global_ip_address_reservation_description_amr
#   purpose       = "SHARED_LOADBALANCER_VIP"
# }

# resource "google_compute_subnetwork" "proxy_only_subnet" {
#   name          = "proxy-only-subnet"
#   ip_cidr_range = "10.199.19.0/24"
#   region        = var.region  
#   network       = google_compute_network.tw-vpc-amer-hub.id
#   purpose       = "REGIONAL_MANAGED_PROXY"
#   role          = "ACTIVE"
# }

# #### GKE STANDARD
# // Here starts the GKE Standard cluster deployment. 

# module "standard_gke_primary" {
#   source = "./modules/standard-gke"

#   description            = var.description_gke_std_amr

#   select_cluster_version = var.select_cluster_version_std_amr
#   select_release_channel = var.select_release_channel_std_amr

#   project_id                          = var.project_id
#   cluster_name                        = var.cluster_name_std_amr
#   location                            = var.location_std_amr
#   release_channel                     = var.release_channel_std_amr
#   machine_type                        = var.machine_type_std_amr
#   disk_type                           = var.disk_type_std_amr
#   disk_size                           = var.disk_size_std_amr
#   num_nodes                           = var.num_nodes_std_amr
#   master_ipv4_cidr                    = var.master_ipv4_cidr_std_amr
#   network_id                          = google_compute_network.tw-vpc-amer-hub.id
#   subnetwork_id                       = google_compute_subnetwork.hub-subnetwork.id
#   cluster_secondary_range_name        = var.pod_secondary_range_name_std_amr
#   services_secondary_range_name       = var.services_secondary_range_name_std_amr
#   default_max_pods_per_node           = var.default_max_pods_per_node_std_amr
#   node_locations                      = var.node_locations_std_amr
#   enable_private_nodes                = var.enable_private_nodes_std_amr
#   master_global_access_config_enabled = var.master_global_access_config_enabled_std_amr

#   cluster_autoscaling_enabled                          = var.cluster_autoscaling_enabled_std_amr
#   upgrade_max_surge                                    = var.upgrade_max_surge_std_amr
#   upgrade_max_unavailable                              = var.upgrade_max_unavailable_std_amr
#   auto_upgrade                                         = var.auto_upgrade_std_amr
#   auto_repair                                          = var.auto_repair_std_amr
#   horizontal_pod_autoscaling                           = var.horizontal_pod_autoscaling_std_amr
#   http_load_balancing                                  = var.http_load_balancing_std_amr
#   gce_persistent_disk_csi_driver_config_enabled        = var.gce_persistent_disk_csi_driver_config_enabled_std_amr
#   enable_shielded_nodes                                = var.enable_shielded_nodes_std_amr
#   workload_vulnerability_scanning                      = var.workload_vulnerability_scanning_std_amr
#   initial_node_count                                   = var.initial_node_count_std_amr
#   remove_default_node_pool                             = var.remove_default_node_pool_std_amr
#   vertical_pod_autoscaling_enabled                     = var.vertical_pod_autoscaling_enabled_std_amr
#   node_config_preemptible_enabled                      = var.node_config_preemptible_enabled_std_amr
#   shielded_instance_config_enable_secure_boot          = var.shielded_instance_config_enable_secure_boot_std_amr
#   shielded_instance_config_enable_integrity_monitoring = var.shielded_instance_config_enable_integrity_monitoring_std_amr
#   deletion_protection                                  = var.deletion_protection_std_amr
#   master_authorized_networks                           = var.master_authorized_networks 
#   depends_on = [ google_compute_subnetwork.hub-subnetwork ]
# }

# resource "google_artifact_registry_repository" "docker_repo" {
#   provider     = google
#   location     = var.region
#   repository_id = var.repository_id
#   description  = "Docker repository for storing container images"
#   format       = "DOCKER"
# }


# resource "google_project_iam_member" "standard_cluster_service_account_node_service_account" {
#   project = var.project_id
#   role    = "roles/artifactregistry.reader"
#   member  = "serviceAccount:${module.standard_gke_primary.service_account_email}"
#   # condition {
#   #   title       = "Restrict access to specific repository"
#   #   description = "Allows access only to this specific repository"
#   #   expression  = "resource.name.startsWith('projects/${var.project_id}/locations/${var.region}/repositories/${var.repository_id}')"
#   # }
# }
