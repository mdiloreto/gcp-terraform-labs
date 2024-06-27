region          = "us-east4"
zone            = "us-east4-a"
state_name      = "tfstate001"
backend_bucket  = "mc-tfstate"
network_name    = "default-vpc2"
subnet_name     = "default-subnet2"
workerpool_name = "test-private-pool"
no_external_ip  = true
cb_trigger_name = "bb-cicd-vm-instance-trigger"
cb_repo_name    = "bitbucket_tupperwareglobal_cloud_build-cicd-vm_instance"
cb_repo_type    = "UNKNOWN"
cb_filename     = "cloudbuild.yaml"
wp_disk_size    = "100"

fw_rule_name   = "allow-ingress-to-22-target-vm"
fw_ports       = ["22"]
fw_source_rg   = ["0.0.0.0/0"]
fw_source_tags = []
fw_protocol    = "tcp"

fw_rule_name2   = "allow-80-target-vm"
fw_ports2       = ["80"]
fw_source_rg2   = ["0.0.0.0/0"]
fw_source_tags2 = []
fw_protocol2    = "tcp"

# #GKE AUTOPILOT
# project_id                                           = "multicloudstech-gke"
# cluster_network_range_name_cidr                      = "10.197.128.0/24"
# services_secondary_range_name_cidr                   = "10.197.144.0/20"
# pod_secondary_range_name_cidr                        = "10.197.136.0/21"
# cluster_name                                         = "tf-autopilot-cluster"
# location                                             = "us-east4"
# release_channel                                      = "REGULAR"
# machine_type                                         = "e2-standard-4"
# disk_type                                            = "pd-standard"
# disk_size                                            = 25
# num_nodes                                            = 3
# master_ipv4_cidr                                     = "10.197.135.0/28"
# pod_secondary_range_name                             = "tw-vpc-usa-hub-sn-gke-pods"
# services_secondary_range_name                        = "tw-vpc-usa-hub-sn-gke-services"
# default_max_pods_per_node                            = 110
# node_locations                                       = ["us-east4-b", "us-east4-c"]
# enable_private_nodes                                 = false
# master_global_access_config_enabled                  = true
# master_authorized_networks_config_cidr_block         = "0.0.0.0/0"
# master_authorized_networks_config_display_name       = "Internet"
# cluster_autoscaling_enabled                          = false
# upgrade_max_surge                                    = 1
# upgrade_max_unavailable                              = 0
# auto_upgrade                                         = true
# auto_repair                                          = true
# horizontal_pod_autoscaling                           = true
# http_load_balancing                                  = true
# gce_persistent_disk_csi_driver_config_enabled        = true
# enable_shielded_nodes                                = false
# workload_vulnerability_scanning                      = false
# initial_node_count                                   = 1
# remove_default_node_pool                             = true
# vertical_pod_autoscaling_enabled                     = true
# node_config_preemptible_enabled                      = false
# shielded_instance_config_enable_secure_boot          = true
# shielded_instance_config_enable_integrity_monitoring = true
# deletion_protection                                  = false
# select_cluster_version                               = false
# select_release_channel                               = false


# # GKE STANDARD
# project_id_std                         = "multicloudstech-gke"
# subnetwork_name                        = "test-hub-subnetwork"
# cluster_network_range_name_cidr_std    = "10.197.128.0/24"
# services_secondary_range_name_cidr_std = "10.197.144.0/20"
# pod_secondary_range_name_cidr_std      = "10.197.136.0/21"
# cluster_name_std                       = "tf-interal-apps-cluster"
# location_std                           = "us-east4"

# release_channel_std                                = "REGULAR"
# machine_type_std                                   = "e2-standard-4"
# disk_type_std                                      = "pd-standard"
# disk_size_std                                      = 25
# num_nodes_std                                      = 1
# master_ipv4_cidr_std                               = "10.197.135.0/28"
# cluster_secondary_range_name_std                   = "tw-vpc-usa-hub-sn-gke-pods"
# services_secondary_range_name_std                  = "tw-vpc-usa-hub-sn-gke-services"
# default_max_pods_per_node_std                      = 110
# node_locations_std                                 = ["us-east4-b"]
# enable_private_nodes_std                           = false
# master_global_access_config_enabled_std            = true
# master_authorized_networks_config_cidr_block_std   = "0.0.0.0/0"
# master_authorized_networks_config_display_name_std = "Internet"
# cluster_autoscaling_enabled_std                    = false
# upgrade_max_surge_std                              = 1
# upgrade_max_unavailable_std                        = 0
# auto_upgrade_std                                   = true
# auto_repair_std                                    = true

# horizontal_pod_autoscaling_std       = true
# vertical_pod_autoscaling_enabled_std = true

# http_load_balancing_std                                  = true
# gce_persistent_disk_csi_driver_config_enabled_std        = true
# enable_shielded_nodes_std                                = false
# workload_vulnerability_scanning_std                      = false
# initial_node_count_std                                   = 1
# remove_default_node_pool_std                             = true
# node_config_preemptible_enabled_std                      = false
# shielded_instance_config_enable_secure_boot_std          = true
# shielded_instance_config_enable_integrity_monitoring_std = true
# deletion_protection_std                                  = false
# select_cluster_version_std                               = false
# select_release_channel_std                               = false



# ######### GKE Subnet and IP

# global_ip_address_reservation_name_amr         = "gke-ingress-internal-ip"
# gke_subnetwork_name_amr                        = "tw-vpc-usa-hub-sn-gke-nodes"
# gke_subnetwork_cidr_amr                        = "10.197.128.0/24"
# global_ip_address_reservation_address_type_amr = "INTERNAL"
# global_ip_address_reservation_description_amr  = "Internal Reserved IP Address for GKE Cluster Ingress"

# ######### GKE AMR-HUB-PRJ
# cluster_name_std_amr    = "tw-gke-interal-apps"
# description_gke_std_amr = "Google Kubernetes Cluster created for Internal Applications though Terraform."

# # Networking
# pod_secondary_range_cidr_std_amr      = "10.197.144.0/20"
# services_secondary_range_name_std_amr = "tw-vpc-usa-hub-sn-gke-services"
# services_secondary_range_cidr_std_amr = "10.197.136.0/21"
# pod_secondary_range_name_std_amr      = "tw-vpc-usa-hub-sn-gke-pods"
# master_ipv4_cidr_std_amr              = "10.197.135.0/28"

# master_global_access_config_enabled_std_amr            = true
# master_authorized_networks_config_cidr_block_std_amr   = "10.0.0.0/8"
# master_authorized_networks_config_display_name_std_amr = "Internal"

# master_authorized_networks = [
#   {
#     cidr_blocks = [
#       {
#         cidr_block   = "10.0.0.0/8"
#         display_name = "Internal"
#       },
#       {
#         cidr_block   = "0.0.0.0/0"
#         display_name = "Internet"
#       }
#     ]
#   }
# ]

# location_std_amr                 = "us-east4"
# node_locations_std_amr           = ["us-east4-b"]
# deletion_protection_std_amr      = true
# enable_private_nodes_std_amr     = true ### <<<<< enable private nodes. 
# initial_node_count_std_amr       = 1
# remove_default_node_pool_std_amr = true

# release_channel_std_amr           = "REGULAR"
# machine_type_std_amr              = "e2-standard-4"
# disk_type_std_amr                 = "pd-standard"
# disk_size_std_amr                 = 100
# num_nodes_std_amr                 = 1
# default_max_pods_per_node_std_amr = 256

# cluster_autoscaling_enabled_std_amr                   = false ### <<<<< Autoscaling Disabled. 
# upgrade_max_surge_std_amr                             = 1
# upgrade_max_unavailable_std_amr                       = 0
# auto_upgrade_std_amr                                  = true
# auto_repair_std_amr                                   = true
# horizontal_pod_autoscaling_std_amr                    = true
# http_load_balancing_std_amr                           = true
# gce_persistent_disk_csi_driver_config_enabled_std_amr = true
# enable_shielded_nodes_std_amr                         = false
# workload_vulnerability_scanning_std_amr               = false


# vertical_pod_autoscaling_enabled_std_amr                     = true
# node_config_preemptible_enabled_std_amr                      = false
# shielded_instance_config_enable_secure_boot_std_amr          = true
# shielded_instance_config_enable_integrity_monitoring_std_amr = true

# select_cluster_version_std_amr = false
# select_release_channel_std_amr = false

# #### Artifact Registry

# repository_id = "awx-operator"

### Cloud CDN module 

project_id                         = "silent-wharf-427322-a0"
backend_service_timeout_sec        = 30
backend_service_custom_response_headers = ["X-Custom-Header: value"]
cpt_gbl_add_res_pur                = "SHARED_LOADBALANCER_VIP"
cpt_gbl_fwd_rul_por_ran            = "80-80"
cpt_gbl_fwd_rul_lb_scheme          = "EXTERNAL"
backend_service_name               = "my-backend-service"
cpt_gbl_fwd_rul_ip_protocol        = "TCP"
compute_global_forwarding          = "my-global-forwarding-rule"
http_health_check_port_specification = "USE_SERVING_PORT"
backend_service_port_name          = "http"
backend_service_lb_scheme          = "EXTERNAL"
cpt_gbl_add_type                   = "EXTERNAL"
cpt_gbl_add_name                   = "my-global-address"
cpt_gbl_add_ip_desc                = "Description of IP address"
backend_service_custom_request_headers = ["X-Custom-Request-Header: value"]
http_proxy_name                    = "my-http-proxy"
backend_service_protocol           = "HTTP"
backend_service_capacity_scaler    = 1.0
url_map_name                       = "bra-recruitment-cdn"
backend_health_check_name          = "my-health-check"
backend_service_balancing_mode     = "UTILIZATION"
backend_instance_group             = "instancegroup01"
backend_service_enable_cdn         = true
nginx_startup_script   = "scripts/nginx.sh"