module "consul_runtime" {
  source            = "./modules/consul-runtime"
  consul_addr       = "${var.consul_addr}"
  consul_datacenter = "${var.consul_datacenter}"
}

module "vault_runtime" {
  source          = "./modules/vault-runtime"
  vault_addr      = "${var.vault_addr}"
  vault_token     = "${var.vault_token}"
  cassandra_hosts = ["${var.cassandra_hosts}"]
}

module "rabbitmq_runtime" {
  source = "./modules/rabbitmq-runtime"
}
