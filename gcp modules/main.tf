provider "google" {
  #credentials = file("gcp-creds.json")
  access_token = ""
  project      = "systems-cloud"
}
resource "google_compute_network" "vpc_network" {
  name = "demo-network"
}
resource "google_compute_instance" "default" {
  name         = var.vmname
  machine_type = var.machine_type
  zone         = var.zone


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
