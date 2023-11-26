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

  # Generate the script with variables and pass it to the instance
  metadata_startup_script = templatefile("${path.module}/install_docker.sh", {
    FRONTEND_ADDR = var.frontend_addr,
    USERS         = var.users_count,
  })

}