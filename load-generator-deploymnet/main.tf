terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.51.0"
    }
  }
}

provider "google" {
  project = var.project_id
  region = var.region
  zone   = var.zone
}



resource "google_compute_instance" "vm_instance" {
  name         = var.name
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
