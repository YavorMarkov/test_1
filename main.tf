
terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 3.5"
    }
  }

  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "test-1"

    workspaces {
      name = "test1"
    }
  }
}

provider "google" {
  
  // Note: The `credentials` attribute is omitted because the Google provider
  // will automatically use the GOOGLE_CREDENTIALS environment variable.
  project     = var.project_id
  region      = var.region
}

resource "google_compute_instance" "free_vm" {
  name         = "free-tier-vm"
  machine_type = "f1-micro"
  zone         = "us-central1-f"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-10"
    }
  }

  network_interface {
    network = "default"
    access_config {
      // Ephemeral IP for external access
    }
  }
}
