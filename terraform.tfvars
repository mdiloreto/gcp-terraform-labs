project_id = "multicloudstech-417802" 
region = "us-east4"
zone = "us-east4-a"
state_name = "tfstate001"
backend_bucket = "mc-tfstate"
network_name = "default-vpc2"
subnet_name = "default-subnet2"
workerpool_name = "test-private-pool"
no_external_ip = true
cb_trigger_name = "bb-cicd-vm-instance-trigger"
cb_repo_name = "bitbucket_tupperwareglobal_cloud_build-cicd-vm_instance"
cb_repo_type = "UNKNOWN"
cb_filename = "cloudbuild.yaml"
wp_disk_size = "100"

fw_rule_name = "allow-ingress-to-22-target-vm"
fw_ports = ["22"]
fw_source_rg = [ "0.0.0.0/0" ]
fw_source_tags = []
fw_protocol = "tcp"

fw_rule_name2 = "allow-80-target-vm"
fw_ports2 = ["80"]
fw_source_rg2 = [ "0.0.0.0/0" ]
fw_source_tags2 = []
fw_protocol2 = "tcp"