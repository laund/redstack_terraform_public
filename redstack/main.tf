module "network" {
  source       = "./modules/network"
  network_name = "${var.network_name}"
  subnet       = "${var.subnet}"
}

module "traefik" {
  source             = "./modules/traefik"
  src_volume_traefik = "${var.src_volume_traefik}"
}

module "consul_cluster" {
  source            = "./modules/consul"
  count-consul      = "3"
  src_volume_consul = "${var.src_volume_consul}"
}

module "consul_runtime" {
  source            = "./modules/consul-runtime"
  consul_addr       = "${var.consul_addr}"
  consul_datacenter = "${var.consul_datacenter}"
}

module "vault_cluster" {
  source           = "./modules/vault"
  count-vault      = "2"
  src_volume_vault = "${var.src_volume_vault}"
}

module "rabbitmq_cluster" {
  source                     = "./modules/rabbitmq"
  count-rabbitmq             = "3"
  src_volume_mnesia_rabbitmq = "${var.src_volume_mnesia_rabbitmq}"
}

module "rabbitmq_runtime" {
  source = "./modules/rabbitmq-runtime"
}

module "vault_rabbitmq_runtime" {
  source        = "./modules/vault-rabbitmq-runtime"
  vault_addr    = "${var.vault_addr}"
  vault_token   = "${var.vault_token}"
  rabbitmq_addr = "${var.rabbitmq_addr}"
}

module "registrator" {
  source = "./modules/registrator"
}

module "cassandra_cluster" {
  source               = "./modules/cassandra"
  count-cassandra      = "3"
  src_volume_cassandra = "${var.src_volume_cassandra}"
}

module "vault_cassandra_runtime" {
  source          = "./modules/vault-cassandra-runtime"
  vault_addr      = "${var.vault_addr}"
  vault_token     = "${var.vault_token}"
  cassandra_hosts = ["${var.cassandra_hosts}"]
}
