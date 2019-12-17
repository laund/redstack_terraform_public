variable "count-rabbitmq" {
  description = "Number of container in cluster"
  default     = ""
}

variable "src_volume_mnesia_rabbitmq" {
  description = "Docker volume Mnesia"
  default     = ""
}

variable "src_volume_config_rabbitmq" {
  description = "Docker volume Config"
  default     = ""
}
