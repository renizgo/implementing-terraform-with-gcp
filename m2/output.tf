output "ip" {
  value = google_compute_instance.this.network_interface.0.network_ip
}

output "beta_ip" {
  value = google_compute_instance.beta_this.network_interface.0.network_ip
}
