variable "google_credentials" {
    description = "JSON credentials for Google Cloud Service Account"
    type        = string
    sensitive   = true
}

variable "project_id" {
    description = "The Google Cloud project ID"
    type        = string
}

variable "region" {
    description = "The region to host the Google Cloud resources"
    type        = string
}
