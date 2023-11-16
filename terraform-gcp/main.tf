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
  credentials = file("cloud-computing-402605-7feb99606c7c.json")
  # project = "<PROJECT_ID>"
  project = "cloud-computing-402605"

  region = "europe-west6"
  zone   = "europe-west6-a"
}



resource "google_compute_instance" "vm_instance" {
  name         = "load-generator"
  machine_type = "e2-standard-2"


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



  # You can add more configuration options as needed

}
