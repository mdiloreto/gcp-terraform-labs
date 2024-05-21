data "google_project" "project" {
  project_id = var.project_id
}

locals {
  selected_cluster_version = var.select_cluster_version ? var.cluster_version : null
}

resource "google_service_account" "cluster_service_account" {
  project      = var.project_id
  account_id   = "${substr(replace(replace(replace(var.cluster_name, "-", ""), "_", ""), "[^a-zA-Z0-9]", ""), 0, 25)}gke-sa"
  display_name = "Terraform-managed service account for cluster ${var.cluster_name}"
}

resource "google_project_iam_member" "cluster_service_account_node_service_account" {
  project = google_service_account.cluster_service_account.project
  role    = "roles/container.defaultNodeServiceAccount"
  member  = "serviceAccount:${google_service_account.cluster_service_account.email}"
}

resource "google_container_cluster" "primary" {
  name                     = var.cluster_name
  location                 = var.location
  enable_autopilot         = true
  
  deletion_protection      = var.deletion_protection

  private_cluster_config {
    enable_private_nodes   = var.enable_private_nodes
  #  master_ipv4_cidr_block = var.master_ipv4_cidr // enable only if the enable_private_nodes is true 
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
}