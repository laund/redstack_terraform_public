variable "count-vault" {
  type        = string
  description = "Number of container in cluster"
}

variable "name" {
  type        = string
  description = "The name of the Docker container"
}

variable "src_volume_vault" {
  type        = string
  description = "The path on the host where the volume is coming from"
}
