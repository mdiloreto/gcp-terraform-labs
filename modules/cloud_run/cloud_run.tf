resource "google_cloud_run_v2_service" "default" {
  name     = var.name
  location = var.location
  ingress = var.ingress

  template {
    containers {
      image = var.docker_image_url
    }
  }
}