variable "count-cassandra" {
  type        = string
  description = "Number of container in cluster"
}

variable "name" {
  type        = string
  description = "The name of the Docker container"
}

variable "src_volume_cassandra" {
  type        = string
  description = "Source Docker Volume Cassandra Server"
}

