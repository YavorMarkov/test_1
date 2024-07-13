
terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 3.5"
    }
  }

  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "<YOUR_TERRAFORM_CLOUD_ORGANIZATION>"

    workspaces {
      name = "your-workspace-name"
    }
  }
}

provider "google" {
  credentials = jsondecode(var.google_credentials)
  project     = var.project_id
  region      = var.region
}

resource "google_compute_instance" "free_vm" {
  name         = "free-tier-vm"
  machine_type = "f1-micro"
  zone         = "us-central1-f"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  network_interface {
    network = "default"
    access_config {
      // Ephemeral IP for external access
    }
  }
}
