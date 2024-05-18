output "cluster_name" {
  description = "The name of the Kubernetes cluster"
  value       = google_container_cluster.primary.name
}

output "cluster_endpoint" {
  description = "The endpoint for the Kubernetes cluster"
  value       = google_container_cluster.primary.endpoint
}

output "cluster_master_version" {
  description = "The Kubernetes master version of the cluster"
  value       = google_container_cluster.primary.master_version
}

output "cluster_location" {
  description = "The location of the Kubernetes cluster"
  value       = google_container_cluster.primary.location
}

output "node_pool_name" {
  description = "The name of the node pool"
  value       = google_container_node_pool.primary_node_pool.name
}

output "node_pool_size" {
  description = "The size of the node pool"
  value       = google_container_node_pool.primary_node_pool.node_count
}

output "service_account_email" {
  description = "The email of the service account for the cluster nodes"
  value       = google_service_account.cluster_service_account.email
}
