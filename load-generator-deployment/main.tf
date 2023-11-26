terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.51.0"
    }
  }
}

provider "google" {
  project = var.gcp_project_id
  region  = var.region
  zone    = var.zone
}

resource "google_compute_instance" "vm_instance" {
  count        = var.instances_count
  name         = "${var.name}-${count.index + 1}"  # Naming pattern: initial_name-1, initial_name-2, etc.
  machine_type = var.instance_type

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2004-lts"
    }
  }

  network_interface {
    network = "default"
    access_config {}
  }

  # Generate the script with variables and pass it to each instance
  metadata_startup_script = templatefile("${path.module}/install_docker.sh", {
    FRONTEND_ADDR = var.frontend_addr,
    USERS         = var.users_count,
  })
}
