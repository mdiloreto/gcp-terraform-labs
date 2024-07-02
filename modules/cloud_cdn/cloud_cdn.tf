# Reserved IP address
resource "google_compute_global_address" "default" {
  provider     = google-beta
  name         = var.cpt_gbl_add_name
  address_type = var.cpt_gbl_add_type
  description  = var.cpt_gbl_add_ip_desc
}

# Health check
resource "google_compute_health_check" "default" {
  name     = var.backend_health_check_name
  provider = google-beta
  http_health_check {
    port_specification = var.http_health_check_port_specification
  }
}

# Backend service with custom request and response headers
resource "google_compute_backend_service" "default" {
  name                    = var.backend_service_name
  provider                = google-beta
  protocol                = var.backend_service_protocol
  port_name               = var.backend_service_port_name
  load_balancing_scheme   = var.backend_service_lb_scheme
  timeout_sec             = var.backend_service_timeout_sec
  enable_cdn              = var.backend_service_enable_cdn
  custom_request_headers  = var.backend_service_custom_request_headers
  custom_response_headers = var.backend_service_custom_response_headers
  health_checks           = [google_compute_health_check.default.id]

  backend {
    group           = var.backend_instance_group
    balancing_mode  = var.backend_service_balancing_mode
    capacity_scaler = var.backend_service_capacity_scaler
  }
}

# URL map
resource "google_compute_url_map" "default" {
  name            = var.url_map_name
  provider        = google-beta
  default_service = google_compute_backend_service.default.id
}

# HTTP proxy
resource "google_compute_target_https_proxy" "default" {
  name     = var.http_proxy_name
  provider = google-beta
  url_map  = google_compute_url_map.default.id
  ssl_certificates = [ var.ssl_certificate ]
  depends_on = [google_compute_url_map.default]
}

# Forwarding rule
resource "google_compute_global_forwarding_rule" "default" {
  name                  = var.compute_global_forwarding
  provider              = google-beta
  ip_protocol           = var.cpt_gbl_fwd_rul_ip_protocol
  load_balancing_scheme = var.cpt_gbl_fwd_rul_lb_scheme
  port_range            = var.cpt_gbl_fwd_rul_por_ran
  target                = google_compute_target_https_proxy.default.id
  ip_address            = google_compute_global_address.default.id
  depends_on = [google_compute_target_https_proxy.default]
}
