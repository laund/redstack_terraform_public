variable "network_name" {
  default = "redstack_network"
}

variable "subnet" {
  default = "10.5.0.0/16"
}

variable "src_volume_traefik" {
  default = "/opt/github-personal/redstack_terraform_public/redstack/data/traefik-server"
}

variable "src_volume_consul" {
  default = "/opt/github-personal/redstack_terraform_public/redstack/data/consul-server"
}

variable "src_volume_vault" {
  default = "/opt/github-personal/redstack_terraform_public/redstack/data/vault-server"
}

variable "src_volume_cassandra" {
  default = "/opt/github-personal/redstack_terraform_public/redstack/data/cassandra-server"
}

variable "src_volume_mnesia_rabbitmq" {
  default = "/opt/github-personal/redstack_terraform_public/redstack/data/rabbitmq-server"
}

variable "consul_addr" {
  description = "Consul Address"
  default     = "http://consul.redstack.local"
}

variable "consul_datacenter" {
  description = "Datacenter Name"
  default     = "dc1"
}

variable "consul_token" {
  default     = "<Secret ID Consul>"
  description = "Secret ID"
}

variable "vault_addr" {
  description = "Vault Address"
  default     = "http://10.5.0.5"
}

variable "vault_token" {
  description = "Vault Token"
  default     = "<Root Token Vault>"
}

variable "cassandra_hosts" {
  description = "Address Cassandra Cluster"
  type        = "list"
  default     = ["10.5.0.9", "10.5.0.10", "10.5.0.11"]
}

variable "rabbitmq_addr" {
  description = "RabbitMq Address"
  default     = "http://10.5.0.21"
}

variable "rabbitmq_guest_login" {
  description = "Guest User Rabbitmq Management"
  default     = "guest"
}

variable "rabbitmq_guest_password" {
  description = "Guest User Password Rabbitmq Management"
  default     = "guest"
}
