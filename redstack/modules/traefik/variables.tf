variable "name" {
  type        = string
  description = "The name of the Docker container"
}

variable "src_volume_traefik" {
  type        = string
  description = "The path on the host where the volume is coming from"
}

variable "count_traefik_server" {
  type        = string
  description = "Number of container in cluster"
}
