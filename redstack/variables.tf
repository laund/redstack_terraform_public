variable "network_name" {
  default = "redstack_network"
}

variable "subnet" {
  default = "10.5.0.0/16"
}

variable "src_volume_traefik" {
  default = ""
}

variable "src_volume_consul" {
  default = ""
}

variable "src_volume_vault" {
  default = ""
}

variable "src_volume_cassandra" {
  default = ""
}

variable "src_volume_mnesia_rabbitmq" {
  default = ""
}

variable "src_volume_config_rabbitmq" {
  default = ""
}
