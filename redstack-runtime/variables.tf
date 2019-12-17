variable "consul_addr" {
  description = "Consul Address"
  default     = "http://consul.redstack.local:8500"
}

variable "consul_datacenter" {
  description = "Datacenter Name"
  default     = "dc1"
}

variable "vault_addr" {
  description = "Vault Address"
  default     = "http://10.5.0.5"
}

variable "vault_token" {
  description = "Vault Token"
  default     = "<RootToken>"
}

variable "cassandra_hosts" {
  description = "Address Cassandra Cluster"
  type        = "list"
  default     = ["10.5.0.9", "10.5.0.10", "10.5.0.11"]
}

variable "rabbitmq_addr" {
  description = "RabbitMq Address"
  default     = "http://rabbitmq.redstack.local"
}

variable "rabbitmq_guest_login" {
  description = "Guest User Rabbitmq Management"
  default     = "guest"
}

variable "rabbitmq_guest_password" {
  description = "Guest User Password Rabbitmq Management"
  default     = ""
}

variable "rabbitmq_admin_login" {
  description = "Admin User Rabbitmq Management"
  default     = "admin"
}

variable "rabbitmq_admin_password" {
  description = "Admin User Password Rabbitmq Management"
  default     = ""
}
