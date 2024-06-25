# # resource "google_service_account" "sa" {
# #   project      = var.project_id
# #   account_id   = "${substr(replace(replace(replace(var.cluster_name, "-", ""), "_", ""), "[^a-zA-Z0-9]", ""), 0, 25)}gke-sa"
# #   display_name = "Terraform-managed service account for cluster ${var.cluster_name}"
# # }

# # resource "google_project_iam_member" "cluster_service_account_node_sa" {
# #   project = google_service_account.sa.project
# #   role    = "roles/container.defaultNodeServiceAccount"
# #   member  = "serviceAccount:${google_service_account.sa.email}"
# # }


# module "gke" {
#   source                     = "./modules/terraform-google-kubernetes-engine"

#   project_id                 = var.project_id
#   name                       = var.cluster_name
#   region                     = var.location
#   zones                      = var.node_locations
#   network                    = var.network_id
#   subnetwork                 = var.subnetwork_id
#   ip_range_pods              = var.cluster_secondary_range_name
#   ip_range_services          = var.services_secondary_range_name
#   http_load_balancing        = var.http_load_balancing
#   network_policy             = false
#   horizontal_pod_autoscaling = true
#   filestore_csi_driver       = false
#   create_service_account = true
#    node_pools = [
#     {
#       name                      = "default-node-pool"
#       machine_type              = "e2-medium"
#       node_locations            = ["us-east4-b","us-east4-c"]
#       min_count                 = 1
#       max_count                 = 100
#       local_ssd_count           = 0
#       spot                      = false
#       disk_size_gb              = 100
#       disk_type                 = "pd-standard"
#       image_type                = "COS_CONTAINERD"
#       enable_gcfs               = false
#       enable_gvnic              = false
#       logging_variant           = "DEFAULT"
#       auto_repair               = true
#       auto_upgrade              = true
#       preemptible               = false
#       initial_node_count        = 80
#     },
#   ]


#   node_pools_oauth_scopes = {
#     all = [
#       "https://www.googleapis.com/auth/logging.write",
#       "https://www.googleapis.com/auth/monitoring",
#     ]
#   }

#   node_pools_labels = {
#     all = {}

#     default-node-pool = {
#       default-node-pool = true
#     }
#   }

#   node_pools_metadata = {
#     all = {}

#     default-node-pool = {
#       node-pool-metadata-custom-value = "my-node-pool"
#     }
#   }

#   node_pools_taints = {
#     all = []

#     default-node-pool = [
#       {
#         key    = "default-node-pool"
#         value  = true
#         effect = "PREFER_NO_SCHEDULE"
#       },
#     ]
#   }

#   node_pools_tags = {
#     all = []

#     default-node-pool = [
#       "default-node-pool",
#     ]
#   }
# }