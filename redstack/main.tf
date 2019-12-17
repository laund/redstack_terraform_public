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

module "vault_cluster" {
  source           = "./modules/vault"
  count-vault      = "2"
  src_volume_vault = "${var.src_volume_vault}"
}

module "registrator" {
  source = "./modules/registrator"
}

module "cassandra_cluster" {
  source               = "./modules/cassandra"
  count-cassandra      = "3"
  src_volume_cassandra = "${var.src_volume_cassandra}"
}

module "rabbitmq_cluster" {
  source                     = "./modules/rabbitmq"
  count-rabbitmq             = "3"
  src_volume_config_rabbitmq = "${var.src_volume_config_rabbitmq}"
  src_volume_mnesia_rabbitmq = "${var.src_volume_mnesia_rabbitmq}"
}

module "app-python" {
  source = "./modules/app-python"
}

module "app-node" {
  source = "./modules/app-node"
}
