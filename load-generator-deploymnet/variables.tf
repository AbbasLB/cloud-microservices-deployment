
variable "gcp_project_id" {
  type        = string
  description = "The GCP project ID to apply this config to"
  default     = "<project_id_here>"
}

variable "name" {
  type        = string
  description = "Name given to the Load Generator VM"
  default     = "boutique-load-generator"
}

variable "region" {
  type        = string
  description = "Region of the new Load Generator"
  default     = "europe-west6"
}

variable "zone" {
  type        = string
  description = "Zone of the new Load Generator"
  default     = "europe-west6-a"
}

variable "instance_type" {
  type        = string
  description = "The machine type of the new Load Generator VM"
  default     = "e2-standard-2"
}