terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.51.0"
    }
  }
}

provider "google" {
  # credentials = file("<NAME>.json")
  credentials = file(var.credentials)
  # project = "<PROJECT_ID>"
  project = var.project_id
#   project = "cloud-computing-402605"

  region = "europe-west6"
  zone   = "europe-west6-a"
}



resource "google_compute_instance" "vm_instance" {
  name         = "load-generator"
  machine_type = var.instance_type



  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2004-lts"
    }
  }
  network_interface {
    network = "default"
    access_config {

    }
  }

  metadata_startup_script = file("${path.module}/install_docker.sh")


}
