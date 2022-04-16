provider "google" {
  #credentials = file("gcp-creds.json")
  access_token = ""
  project      = "systems-cloud"
}
resource "google_compute_network" "vpc_network1" {
  name = "terraform-network1"
}
# resource "google_compute_instance" "default" {
#   name         = "test"
#   machine_type = "e2-medium"
#   zone         = "asia-east1"

#   tags = ["foo", "bar"]

#   boot_disk {
#     initialize_params {
#       image = "debian-cloud/debian-9"
#     }
#   }

#   // Local SSD disk
#   scratch_disk {
#     interface = "SCSI"
#   }

#   network_interface {
#     network = "default"

#     access_config {
#       // Ephemeral public IP
#     }
#   }

#   metadata = {
#     foo = "bar"
#   }

#   metadata_startup_script = "echo hi > /test.txt"

# }
