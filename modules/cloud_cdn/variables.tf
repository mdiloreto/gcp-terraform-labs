# variables.tf

variable "cpt_gbl_add_name" {
  description = "Name for the global address"
  type        = string
}

variable "cpt_gbl_add_type" {
  description = "Type for the global address"
  type        = string
}

variable "cpt_gbl_add_ip_desc" {
  description = "Description for the global address"
  type        = string
}

variable "cpt_gbl_add_res_pur" {
  description = "Purpose for the reserved global address"
  type        = string
}

variable "compute_global_forwarding" {
  description = "Name for the global forwarding rule"
  type        = string
}

variable "cpt_gbl_fwd_rul_ip_protocol" {
  description = "IP protocol for the global forwarding rule"
  type        = string
}

variable "cpt_gbl_fwd_rul_lb_scheme" {
  description = "Load balancing scheme for the global forwarding rule"
  type        = string
}

variable "cpt_gbl_fwd_rul_por_ran" {
  description = "Port range for the global forwarding rule"
  type        = string
}

variable "http_proxy_name" {
  description = "Name for the HTTP proxy"
  type        = string
}

variable "url_map_name" {
  description = "Name for the URL map"
  type        = string
}

variable "backend_service_name" {
  description = "Name for the backend service"
  type        = string
}

variable "backend_service_protocol" {
  description = "Protocol for the backend service"
  type        = string
}

variable "backend_service_port_name" {
  description = "Port name for the backend service"
  type        = string
}

variable "backend_service_lb_scheme" {
  description = "Load balancing scheme for the backend service"
  type        = string
}

variable "backend_service_timeout_sec" {
  description = "Timeout in seconds for the backend service"
  type        = number
}

variable "backend_service_enable_cdn" {
  description = "Enable CDN for the backend service"
  type        = bool
}

variable "backend_service_custom_request_headers" {
  description = "Custom request headers for the backend service"
  type        = list(string)
}

variable "backend_service_custom_response_headers" {
  description = "Custom response headers for the backend service"
  type        = list(string)
}

variable "backend_service_balancing_mode" {
  description = "Balancing mode for the backend service"
  type        = string
}

variable "backend_service_capacity_scaler" {
  description = "Capacity scaler for the backend service"
  type        = number
}
variable "backend_instance_group" {}
variable "backend_health_check_name" {}
variable "http_health_check_port_specification" {}
variable "ssl_certificate" {
  description = "id/self_link of the Cert Manager certificate"
}
