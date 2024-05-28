variable "project_id" {
  description = "The project ID to deploy to"
  type        = string
}

variable "cluster_name" {
  description = "The name of the cluster"
  type        = string
}

variable "description" {
  default = "Google Kubernetes Cluster created though Terraform."
}


variable "cluster_resource_labels" {
  type        = map(string)
  description = "The GCE resource labels (a map of key/value pairs) to be applied to the cluster"
  default     = {}
}

variable "location" {
  description = "The location (region or zone) to deploy the cluster"
  type        = string
}

variable "select_cluster_version" {
  description = "Variable to set up the Cluster release min_master_version parameter"
  type = bool
}

variable "cluster_version" {
  description = "The Kubernetes version for the cluster"
  default = "1.28.8-gke.1095000"
  type        = string
}

variable "select_release_channel" {
  description = "Bool variable for enabling specifi relase channel version"
}

variable "release_channel" {
  description = "The release channel for the cluster"
  type        = string
}

variable "machine_type" {
  description = "The machine type for the nodes"
  type        = string
}

# variable "image_type" {
#   description = "The image type for the nodes"
#   type        = string
# }

variable "disk_type" {
  description = "The disk type for the nodes"
  type        = string
}

variable "disk_size" {
  description = "The disk size for the nodes"
  default = 50
  type        = number
}

variable "create_service_account" {
  description = "Flag to create a new service account"
  type        = bool
  default     = true
}

variable "num_nodes" {
  description = "The number of nodes in the node pool"
  type        = number
}

variable "master_ipv4_cidr" {
  description = "The CIDR block for the master nodes"
  type        = string
}

variable "network_id" {
  description = "The VPC network for the cluster"
  type        = string
}

variable "subnetwork_id" {
  description = "The subnetwork for the cluster nodes"
  type        = string
}

variable "cluster_secondary_range_name" {
  description = "The secondary range name for the cluster pods"
  type        = string
}

variable "services_secondary_range_name" {
  description = "The secondary range name for the cluster services"
  type        = string
}


variable "node_locations" {
  description = "The locations for the nodes"
  type        = list(string)
}

variable "enable_private_nodes" {
  description = "Enable private nodes for the cluster"
  type        = bool
}

variable "master_global_access_config_enabled" {
  description = "Enable global access for the master"
  type        = bool
}

variable "master_authorized_networks" {
  type = list(object({
    cidr_blocks = list(object({
      cidr_block   = string
      display_name = string
    }))
  }))
  description = "List of master authorized networks. If none are provided, disallow external access (except the cluster node IPs, which GKE automatically whitelists)."
  default     = []
}



# variable "master_authorized_networks_config_display_name" {
#   description = "Display name for master authorized networks"
#   type        = string
# }

variable "cluster_autoscaling_enabled" {
  description = "Autoscaling profile for the cluster"
  type        = bool
}

# variable "timeout_create" {
#   description = "Timeout duration for creating the cluster"
#   type        = string
# }

# variable "timeout_update" {
#   description = "Timeout duration for updating the cluster"
#   type        = string
# }

# variable "timeout_delete" {
#   description = "Timeout duration for deleting the cluster"
#   type        = string
# }

variable "upgrade_max_surge" {
  description = "Maximum number of nodes that can be created beyond the current size of the node pool during the upgrade process"
  type        = number
}

variable "upgrade_max_unavailable" {
  description = "Maximum number of nodes that can be simultaneously unavailable during the upgrade process"
  type        = number
}

variable "auto_upgrade" {
  description = "Enable auto upgrade for the nodes"
  type        = bool
}

variable "auto_repair" {
  description = "Enable auto repair for the nodes"
  type        = bool
}

variable "horizontal_pod_autoscaling" {
  description = "Enable horizontal pod autoscaling"
  type        = bool
}

variable "http_load_balancing" {
  description = "Enable HTTP load balancing"
  type        = bool
}

variable "gce_persistent_disk_csi_driver_config_enabled" {
  description = "Enable GCE persistent disk CSI driver"
  type        = bool
}

variable "enable_shielded_nodes" {
  description = "Enable shielded nodes"
  type        = bool
}

variable "security_posture_mode" {
  description = "Security posture mode"
  default = "BASIC"
  type        = string
}

variable "workload_vulnerability_scanning" {
  description = "Enable or disable workload vulnerability scanning"
  type        = bool
}

variable "default_max_pods_per_node" {
  description = "The default maximum number of pods per node"
  type        = number
}


variable "binary_authorization_evaluation_mode" {
  description = "Binary authorization evaluation mode"
  default = "DISABLED" 
  type        = string
}

variable "initial_node_count" {
  description = "The initial node count for the default node pool"
  type        = number
}

variable "remove_default_node_pool" {
  description = "Remove the default node pool"
  type        = string

}
variable "vertical_pod_autoscaling_enabled" {
  type = bool
}

variable "node_config_preemptible_enabled" {
  type = bool
}


variable "shielded_instance_config_enable_secure_boot" {
  type = bool
}

variable "shielded_instance_config_enable_integrity_monitoring" {
  type = bool
}

variable "managed_prometheus_enabled" {
  type = bool
  default = false
}

variable "deletion_protection" {
  description = "If you want to delete de Cluster you'll need to set this value to False"
  type = bool
}

variable "image_type" {
  default = "COS_CONTAINERD"
}