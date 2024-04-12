variable "name" {
  description = "The name of the Google Cloud Run service."
  type        = string
}

variable "location" {
  description = "The location where the Google Cloud Run service will be deployed."
  type        = string
}

variable "ingress" {
  description = "The ingress settings for the Google Cloud Run service."
  type        = string
  default     = "INGRESS_TRAFFIC_ALL"
}

variable "docker_image_url" {
  description = "The URL of the Docker image to be used for the Google Cloud Run service."
  type        = string
}