terraform {
  backend "gcs" {
    bucket = "terraform-centauro-state"
    prefix = "terraform/centauro/dev/terragrunt-infrastructure"
  }
}