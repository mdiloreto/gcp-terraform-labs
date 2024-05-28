data "google_project" "project" {
  project_id = var.project_id
}

resource "google_service_account" "standard_cluster_service_account" {
  project      = var.project_id
  account_id   = "${substr(replace(replace(replace(var.cluster_name, "-", ""), "_", ""), "[^a-zA-Z0-9]", ""), 0, 25)}gke-sa"
  display_name = "Terraform-managed service account for cluster ${var.cluster_name}"
}

resource "google_project_iam_member" "standard_cluster_service_account_node_service_account" {
  project = google_service_account.standard_cluster_service_account.project
  role    = "roles/container.defaultNodeServiceAccount"
  member  = "serviceAccount:${google_service_account.standard_cluster_service_account.email}"
}

resource "google_container_cluster" "standard_cluster" {
  name                     = var.cluster_name
  description              = var.description
  location                 = var.location
  initial_node_count       = var.initial_node_count
  remove_default_node_pool = var.remove_default_node_pool
  node_locations           = var.node_locations
  resource_labels          = var.cluster_resource_labels

#  min_master_version = var.cluster_version // must be uncommented to specify the min_master_version 
#  min_master_version = var.release_channel == null || var.release_channel == "UNSPECIFIED" ? var.cluster_version : var.kubernetes_version == "latest" ? null : var.kubernetes_version

  deletion_protection      = var.deletion_protection

    node_config {
      disk_size_gb = var.disk_size
      service_account = google_service_account.standard_cluster_service_account.email
    }

    monitoring_config {
        managed_prometheus {
        enabled = var.managed_prometheus_enabled
    }
    }

  private_cluster_config {
    enable_private_endpoint = false
    enable_private_nodes   = var.enable_private_nodes
    master_ipv4_cidr_block = var.master_ipv4_cidr
    master_global_access_config {
      enabled = var.master_global_access_config_enabled
    }
  }

  ip_allocation_policy {
    cluster_secondary_range_name  = var.cluster_secondary_range_name
    services_secondary_range_name = var.services_secondary_range_name
  }

  network    = var.network_id
  subnetwork = var.subnetwork_id

  addons_config {
    horizontal_pod_autoscaling {
      disabled = var.horizontal_pod_autoscaling
    }
    http_load_balancing {
      disabled =! var.http_load_balancing
    }
    gce_persistent_disk_csi_driver_config {
      enabled = var.gce_persistent_disk_csi_driver_config_enabled
    }
  }

  # logging_service    = "logging.googleapis.com/kubernetes"
  # monitoring_service = "monitoring.googleapis.com/kubernetes"

  enable_shielded_nodes = var.enable_shielded_nodes

  security_posture_config {
    mode                            = var.security_posture_mode
  }

  dynamic "release_channel" {
    for_each = var.select_release_channel ? [1] : [0]
    content {
          channel = var.release_channel
    }
  }
  # release_channel {
  #   channel = var.release_channel
  # }

    dynamic "cost_management_config" {
    for_each = var.enable_cost_allocation ? [1] : []
    content {
      enabled = var.enable_cost_allocation
    }
  }

  cluster_autoscaling {
    enabled = var.cluster_autoscaling_enabled
    dynamic "auto_provisioning_defaults" {
      for_each = var.cluster_autoscaling_enabled ? [1] : []

      content {
        service_account = google_service_account.standard_cluster_service_account.email

        management {
          auto_repair  = var.auto_repair
          auto_upgrade = var.auto_upgrade
        }

        disk_size = var.disk_size
        disk_type = var.disk_type
        image_type = var.image_type
      }
    }
    # autoscaling_profile = var.cluster_autoscaling.autoscaling_profile != null ? var.cluster_autoscaling.autoscaling_profile : "BALANCED"
  }

  vertical_pod_autoscaling {
    enabled = var.vertical_pod_autoscaling_enabled
  }
  dynamic "master_authorized_networks_config" {
    for_each = var.master_authorized_networks
    content {
      dynamic "cidr_blocks" {
        for_each = master_authorized_networks_config.value.cidr_blocks
        content {
          cidr_block   = lookup(cidr_blocks.value, "cidr_block", "")
          display_name = lookup(cidr_blocks.value, "display_name", "")
        }
      }
    }
  }

  default_max_pods_per_node = var.default_max_pods_per_node

  binary_authorization {
    evaluation_mode = var.binary_authorization_evaluation_mode
  }

  workload_identity_config {
  workload_pool = "${data.google_project.project.project_id}.svc.id.goog"
}

#   timeouts {
#     create = var.timeout_create
#     update = var.timeout_update
#     delete = var.timeout_delete
#   }
}

resource "google_container_node_pool" "standard_primary_node_pool" {
  name     = "${var.cluster_name}-primary-pool"
  cluster  = google_container_cluster.standard_cluster.name
  location = google_container_cluster.standard_cluster.location
  node_count = var.num_nodes

  node_config {
    preemptible  = var.node_config_preemptible_enabled
    machine_type = var.machine_type
    disk_type    = var.disk_type
    disk_size_gb = var.disk_size

    service_account = google_service_account.standard_cluster_service_account.email
    oauth_scopes    = [
      "https://www.googleapis.com/auth/cloud-platform",
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring"
    ]
    metadata = {
      disable-legacy-endpoints = "true"
    }

    shielded_instance_config {
      enable_secure_boot          = var.shielded_instance_config_enable_secure_boot
      enable_integrity_monitoring = var.shielded_instance_config_enable_integrity_monitoring
    }
  }

  management {
    auto_upgrade = var.auto_upgrade
    auto_repair  = var.auto_repair
  }

  upgrade_settings {
    max_surge       = var.upgrade_max_surge
    max_unavailable = var.upgrade_max_unavailable
  }

}

