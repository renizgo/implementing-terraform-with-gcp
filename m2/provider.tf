terraform {
  required_providers {
    google = {
      version = "~> 4.0.0"
    }
    google-beta = {
      version = "~> 4.0.0"
    }
  }
}

provider "google" {
  credentials = file("/home/renato/test-svc-creds.json")
  project     = "terragrunt-infrastructure"
  region      = "southamerica-east1"
  zone        = "southamerica-east1-a"
}

provider "google-beta" {
  project = "terragrunt-infrastructure"
  region  = "southamerica-east1"
  zone    = "southamerica-east1-a"
}
