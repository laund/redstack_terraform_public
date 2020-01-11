variable "vault_addr" {
  description = "Vault Address"
  default     = ""
}

variable "vault_token" {
  description = "Vault Token"
  default     = ""
}

variable "rabbitmq_addr" {
  description = "RabbitMq Address"
  default     = ""
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
