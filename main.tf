resource "google_compute_instance" "default" {
  name         = "virtual-machine-from-terraform"
  machine_type = "f1-micro"
  zone         = "us-central1-a"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  network_interface {
    network = "default"

    access_config {
      // Include this section to give the VM an external ip address
    }
  }
}
 resource "google_compute_firewall" "default" {
  name = "ssh"
  network = "default"
  allow {
    protocol = "tcp"
    ports = ["22"]
  }
  target_tags = ["vm-instance"]
  source_ranges = ["0.0.0.0/0"]
 }


