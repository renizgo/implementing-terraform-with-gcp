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
  project     = "overflow-api-qas"
  region      = "southamerica-east1"
  zone        = "southamerica-east1-c"
}

provider "google-beta" {
  project = "overflow-api-qas"
  region  = "southamerica-east1"
  zone    = "southamerica-east1-c"
}
