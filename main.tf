resource "google_project_service" "iam_api" {
  service            = "compute.googleapis.com"
  disable_on_destroy = false

}
module "vpc_network" {
  source        = "./modules/vpc_network"
  subnet_region = var.region
  network_name  = var.network_name
  subnet_name   = var.subnet_name
  project_id    = var.project_id
  region        = var.region
  ip_cidr_range = "10.0.0.0/24"
}

# module "cloud_build_trigger_01" {
#   source = "./modules/cloud-build_w_wp"

#   cb_repo_name        = var.cb_repo_name
#   cb_repo_type        = var.cb_repo_type
#   cb_region           = var.region
#   cb_trigger_name     = var.cb_trigger_name
#   cb_filename         = var.cb_filename
#   project_id       = var.project_id
#   workerpool_name  = var.workerpool_name
#   wp_disk_size     = var.wp_disk_size
#   network          = module.vpc_network.network_id
#   no_external_ip   = var.no_external_ip

#   depends_on = [module.vpc_network]
# }

module "linux_vm_debian" {
  count        = 1
  source       = "./modules/linux instance"
  vm_name      = "test-vm-bra-${count.index}"
  project      = var.project_id
  region       = var.region
  zone         = var.zone
  network_name = module.vpc_network.network_name
  subnet_name  = module.vpc_network.subnet_name[0]
  depends_on   = [module.vpc_network]
  startup_script = var.nginx_startup_script
}

# module "linux_vm_centos" {
#   count = 2
#   source = "./modules/linux instance"
#   vm_name = "test-vm-ecu-${count.index}"
#   vm_image = "centos-cloud/centos-7"
#   project = var.project_id
#   region = var.region
#   zone = var.zone
#   network_name = module.vpc_network.network_name
#   subnet_name = module.vpc_network.subnet_name[0]
#   depends_on = [ module.vpc_network ]
# }

# module "linux_vm_redhat" {
#   count = 1
#   source = "./modules/linux instance"
#   vm_name = "test-vm-bel-${count.index}"
#   vm_image = "rhel-cloud/rhel-8"
#   project = var.project_id
#   region = var.region
#   zone = var.zone
#   network_name = module.vpc_network.network_name
#   subnet_name = module.vpc_network.subnet_name[0]
#   depends_on = [ module.vpc_network ]
# }

resource "google_compute_instance_group" "example_instance_group" {
  name        = "example-instance-group"
  zone        = var.zone
  instances   = flatten([
                            for vm in module.linux_vm_debian : [
                                for self_link in vm.self_link : "${self_link}"
                              ]
                            ])
  named_port {
    name = "http"
    port = 80
  }
}

module "firewall-rules" {
  source = "./modules/firewall_rules"

  rules = [
    {
      name               = var.fw_rule_name
      action             = "allow"
      network            = var.network_name
      protocol           = var.fw_protocol
      ports              = var.fw_ports
      source_ranges      = var.fw_source_rg
      destination_ranges = flatten([
                              for vm in module.linux_vm_debian : [
                                for ip in vm.ipv4-addresses : "${ip}/32"
                              ]
                            ]),
      source_tags        = []                              
    },
    {
      name               = var.fw_rule_name2
      action             = "allow"
      network            = var.network_name
      protocol           = var.fw_protocol2
      ports              = var.fw_ports2
      source_ranges      = var.fw_source_rg2
      destination_ranges = flatten([
                            for vm in module.linux_vm_debian : [
                                for ip in vm.ipv4-addresses : "${ip}/32"
                              ]
                            ]),
      source_tags        = []
    }
    // Add more rules as needed
  ]
}

module "cloud_cdn" {
  source = "./modules/cloud_cdn"

  backend_service_timeout_sec             = var.backend_service_timeout_sec
  backend_service_custom_response_headers = var.backend_service_custom_response_headers
  cpt_gbl_add_res_pur                     = var.cpt_gbl_add_res_pur
  cpt_gbl_fwd_rul_por_ran                 = var.cpt_gbl_fwd_rul_por_ran
  cpt_gbl_fwd_rul_lb_scheme               = var.cpt_gbl_fwd_rul_lb_scheme
  backend_service_name                    = var.backend_service_name
  cpt_gbl_fwd_rul_ip_protocol             = var.cpt_gbl_fwd_rul_ip_protocol
  compute_global_forwarding               = var.compute_global_forwarding
  http_health_check_port_specification    = var.http_health_check_port_specification
  backend_service_port_name               = var.backend_service_port_name
  backend_service_lb_scheme               = var.backend_service_lb_scheme
  cpt_gbl_add_type                        = var.cpt_gbl_add_type
  cpt_gbl_add_name                        = var.cpt_gbl_add_name
  cpt_gbl_add_ip_desc                     = var.cpt_gbl_add_ip_desc
  backend_service_custom_request_headers  = var.backend_service_custom_request_headers
  http_proxy_name                         = var.http_proxy_name
  backend_service_protocol                = var.backend_service_protocol
  backend_service_capacity_scaler         = var.backend_service_capacity_scaler
  url_map_name                            = var.url_map_name
  backend_health_check_name               = var.backend_health_check_name
  backend_service_balancing_mode          = var.backend_service_balancing_mode
  backend_instance_group                  = google_compute_instance_group.example_instance_group.self_link
  backend_service_enable_cdn              = var.backend_service_enable_cdn
  ssl_certificate                         = google_compute_ssl_certificate.certv2.id
}

resource "google_compute_ssl_certificate" "default" {
  name        = var.cdn_ssl_cert_name
  private_key = file(var.cdn_ssl_cert_pri_key_pat)
  certificate = file(var.cdn_ssl_cert_pem)
}

resource "google_compute_ssl_certificate" "certv2" {
  name        = "${var.cdn_ssl_cert_name}-v2"
  private_key = file(var.cdn_ssl_cert_pri_key_pat_v2)
  certificate = file(var.cdn_ssl_cert_pem_v2)
}