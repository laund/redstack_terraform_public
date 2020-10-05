variable "count-rabbitmq" {
  type        = string
  description = "Number of container in cluster"
}

variable "name" {
  type        = string
  description = "The name of the Docker container"
}

variable "src_volume_mnesia_rabbitmq" {
  type        = string
  description = "Docker volume mount point Mnesia"
}
