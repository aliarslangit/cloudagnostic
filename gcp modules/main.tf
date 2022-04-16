provider "google" {
  #credentials = file("gcp-creds.json")
  access_token = ""
  project      = "systems-cloud"
}
resource "google_compute_network" "vpc_network" {
  name = "demo-network"
}
resource "google_compute_instance" "default" {
  name         = "demo-vm"
  machine_type = "e2-medium"
  zone         = "asia-east1"

  tags = ["env", "dev"]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  // Local SSD disk
  scratch_disk {
    interface = "SCSI"
  }

  network_interface {
    network = "default"

    access_config {
      // Ephemeral public IP
    }
  }


}
