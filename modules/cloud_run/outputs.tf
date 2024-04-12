output "service_name" {
  description = "The name of the deployed Google Cloud Run service."
  value       = google_cloud_run_v2_service.default.name
}

output "service_url" {
  description = "The URL of the deployed Google Cloud Run service."
  value       = google_cloud_run_v2_service.default.status[0].url
}

output "service_location" {
  description = "The location of the deployed Google Cloud Run service."
  value       = google_cloud_run_v2_service.default.location
}
