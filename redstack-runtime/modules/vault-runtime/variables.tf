variable "vault_addr" {
  description = "Vault Address"
  default     = ""
}

variable "vault_token" {
  description = "Vault Token"
  default     = ""
}

variable "cassandra_hosts" {
  description = "Address Cassandra Cluster"
  type        = "list"
  default     = [""]
}

variable "rabbitmq_addr" {
  description = "RabbitMq Address"
  default     = "http://rabbitmq.redstack.local"
}

variable "rabbitmq_guest_password" {
  default = ""
}

variable "rabbitmq_guest_login" {
  default = ""
}

variable "rabbitmq_admin_password" {
  default = ""
}

variable "rabbitmq_admin_login" {
  default = ""
}
