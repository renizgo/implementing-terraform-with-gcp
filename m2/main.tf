resource "google_compute_instance" "this" {
  provider     = google
  name         = "instance"
  machine_type = "e2-medium"
  zone         = "southamerica-east1-a"

  boot_disk {
    initialize_params {
      image = "debian-10-buster-v20220920"
    }
  }

  network_interface {
    network = "projects/dc-interconnect/global/networks/vpc-interconnect-overflow"
    subnetwork = "overflow-qas-br-01"
    subnetwork_project = "dc-interconnect"
  }

  metadata = {
    ssh-keys = "${var.username}:${file("~/.ssh/id_ed25519.pub")}"
  }

  metadata_startup_script = "sudo apt-get update; echo 'Hello World!' >> /home/${var.username}/startup"
}

resource "google_compute_instance" "beta_this" {
  provider     = google-beta
  name         = "instance-beta"
  machine_type = "e2-medium"
  zone         = "southamerica-east1-a"

  boot_disk {
    initialize_params {
      image = "debian-10-buster-v20220920"
    }
  }

  network_interface {
    network = "projects/dc-interconnect/global/networks/vpc-interconnect-overflow"
    subnetwork = "overflow-qas-br-01"
    subnetwork_project = "dc-interconnect"
  }

  metadata = {
    ssh-keys = "${var.username}:${file("~/.ssh/id_ed25519.pub")}"
  }

  metadata_startup_script = "sudo apt-get update; echo 'Hello World (Beta)!' >> /home/${var.username}/startup"
}
