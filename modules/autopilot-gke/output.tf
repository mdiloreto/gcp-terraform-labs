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