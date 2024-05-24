terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~>5.0.0"
    }
  }
  backend "gcs" {
    bucket = "multiclouds12312353"
    prefix = "terraform/state"

  }
}