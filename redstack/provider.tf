provider "local" {}

provider "consul" {
  address    = "${var.consul_addr}:8500"
  datacenter = "${var.consul_datacenter}"
  token      = "${var.consul_token}"
}

provider "vault" {
  address = "${var.vault_addr}:8200"
  token   = "${var.vault_token}"
}

provider "rabbitmq" {
  endpoint = "${var.rabbitmq_addr}:15672"
  username = "${var.rabbitmq_guest_login}"
  password = "${var.rabbitmq_guest_password}"
}
