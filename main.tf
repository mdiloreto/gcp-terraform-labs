# resource "google_project_service" "iam_api" {
#   service = "compute.googleapis.com"
#   disable_on_destroy = false

# }
# module "vpc_network" {
#   source = "./modules/vpc_network"
#   subnet_region = var.region
#   network_name = var.network_name
#   subnet_name = var.subnet_name
#   project_id = var.project_id
#   region = var.region
#   ip_cidr_range = "10.0.0.0/24"
# }

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

# module "linux_vm_debian" {
#   count = 1
#   source = "./modules/linux instance"
#   vm_name = "test-vm-bra-${count.index}"
#   project = var.project_id
#   region = var.region
#   zone = var.zone
#   network_name = module.vpc_network.network_name
#   subnet_name = module.vpc_network.subnet_name[0]
#   depends_on = [ module.vpc_network ]
# }

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

# module "firewall-rules" {
#   source = "./modules/firewall_rule_allow"

#   rules = [
#     {
#       name               = var.fw_rule_name
#       action             = "allow"
#       network            = var.network_name
#       protocol           = var.fw_protocol
#       ports              = var.fw_ports
#       source_ranges      = var.fw_source_rg
#       destination_ranges = flatten([
#                               for vm in module.linux_vm_centos : [
#                                 for ip in vm.ipv4-addresses : "${ip}/32"
#                               ]
#                             ]),
#       source_tags        = []                              
#     },
#     {
#       name               = var.fw_rule_name2
#       action             = "allow"
#       network            = var.network_name
#       protocol           = var.fw_protocol2
#       ports              = var.fw_ports2
#       source_ranges      = var.fw_source_rg2
#       destination_ranges = flatten([
#                             for vm in module.linux_vm_centos : [
#                                 for ip in vm.ipv4-addresses : "${ip}/32"
#                               ]
#                             ]),
#       source_tags        = []
#     }
#     // Add more rules as needed
#   ]
# }
