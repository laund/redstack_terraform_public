module "network" {
  source = "./modules/network"

  network_name = "redstack_network"
  subnet       = "10.5.0.0/16"
}

module "traefik" {
  source = "./modules/traefik"

  name                 = "traefik-server-1"
  count_traefik_server = "1"
  src_volume_traefik   = "/opt/github/redstack_terraform_public/redstack/data/traefik-server"
}

module "consul_cluster" {
  source = "./modules/consul"

  name                = "consul-server"
  count_consul_server = "3"
  src_volume_consul   = "/opt/github/redstack_terraform_public/redstack/data/consul-server"
}

module "consul_runtime" {
  source = "./modules/consul-runtime"
}

module "vault_cluster" {
  source = "./modules/vault"

  count-vault      = "2"
  name             = "vault-server"
  src_volume_vault = "/opt/github/redstack_terraform_public/redstack/data/vault-server"
}

module "rabbitmq_cluster" {
  source = "./modules/rabbitmq"

  count-rabbitmq             = "3"
  name                       = "rabbitmq-server"
  src_volume_mnesia_rabbitmq = "/opt/github/redstack_terraform_public/redstack/data/rabbitmq-server"
}

module "rabbitmq_runtime" {
  source = "./modules/rabbitmq-runtime"
}

module "vault_rabbitmq_runtime" {
  source = "./modules/vault-rabbitmq-runtime"

  rabbitmq_admin_login    = "admin"
  rabbitmq_admin_password = module.rabbitmq_runtime.password
  rabbitmq_addr           = var.rabbitmq_addr
}

module "registrator" {
  source = "./modules/registrator"

  name                     = "registrator-server-1"
  count_registrator_server = "1"
}

module "cassandra_cluster" {
  source = "./modules/cassandra"

  count-cassandra      = "3"
  name                 = "cassandra-server"
  src_volume_cassandra = "/opt/github/redstack_terraform_public/redstack/data/cassandra-server"
}

module "vault_cassandra_runtime" {
  source = "./modules/vault-cassandra-runtime"

}
