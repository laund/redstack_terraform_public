variable "count_consul_server" {
  type        = string
  description = "Number of container in cluster"
}

variable "src_volume_consul" {
  type        = string
  description = "The path on the host where the volume is coming from"
}

variable "name" {
  type        = string
  description = "The name of the Docker container"
}
