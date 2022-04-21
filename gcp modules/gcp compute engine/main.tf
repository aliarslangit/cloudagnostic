provider "google" {
  #credentials = file("gcp-creds.json")
  access_token = ""
  project      = "systems-cloud"
}
locals {
  count = var.cloud == "gcp" ? 1 : 0
}
resource "google_compute_network" "vpc_network" {
  count = local.count
  name  = "demo-network-1"

}
resource "google_compute_instance" "default" {
  count        = local.count
  name         = var.vmname
  machine_type = var.machine_type
  zone         = var.zone


  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  # // Local SSD disk
  # scratch_disk {
  #   interface = "SCSI"
  # }

  network_interface {
    network = "default"

    access_config {
      // Ephemeral public IP
    }
  }


}
