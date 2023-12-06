
variable "frontend_addr" {
  type        = string
  description = "Frontend Address"
}

variable "instances_count" {
  type        = number
  description = "Number of Instances"
}

variable "users_count" {
  type        = number
  description = "Number of Users"
  default = 20
}

variable "gcp_project_id" {
  type        = string
  description = "The GCP project ID to apply this config to"
  default     = "cloud-computing-402605"
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
