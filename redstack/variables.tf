variable "consul_addr" {
  description = "Consul Address"
  default     = "http://10.5.0.2:8500"
}

variable "consul_datacenter" {
  description = "Datacenter Name"
  default     = "dc1"
}

variable "consul_token" {
  default     = "<Token Acl Bootstrap>"
  description = "Secret ID"
}

variable "vault_addr" {
  description = "Vault Address"
  default     = "http://10.5.0.5:8200"
}

variable "vault_token" {
  description = "Vault Token"
  default     = "<Vault Root Token>"
}

variable "rabbitmq_addr" {
  description = "RabbitMq Address"
  default     = "http://10.5.0.21:15672"
}

variable "rabbitmq_guest_login" {
  description = "Guest User Rabbitmq Management"
  default     = "guest"
}

variable "rabbitmq_guest_password" {
  description = "Guest User Password Rabbitmq Management"
  default     = "guest"
}
