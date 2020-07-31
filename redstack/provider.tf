provider "local" {}

provider "consul" {
  address    = var.consul_addr
  datacenter = var.consul_datacenter
  token      = var.consul_token
}

provider "vault" {
  address = var.vault_addr
  token   = var.vault_token
}

provider "rabbitmq" {
  endpoint = var.rabbitmq_addr
  username = var.rabbitmq_guest_login
  password = var.rabbitmq_guest_password
}
