variable "rabbitmq_addr" {
  type        = string
  description = "Specifies the RabbitMQ connection URI"
}

variable "rabbitmq_admin_login" {
  type        = string
  description = "Specifies the RabbitMQ management administrator username"
}

variable "rabbitmq_admin_password" {
  type        = string
  description = "Specifies the RabbitMQ management administrator password"
}

