output "traefik_server_ip" {
  value       = "${module.traefik.ip_traefik}"
  description = "IP Traefik"
}

output "consul_cluster_ip" {
  value       = "${module.consul_cluster.ip_consul}"
  description = "Consul Cluster IP Servers"
}

output "vault_cluster_ip" {
  value       = "${module.vault_cluster.ip_vault}"
  description = "Vault Cluster IP Servers"
}

output "rabbitmq_cluster_ip" {
  value       = "${module.rabbitmq_cluster.ip_rabbitmq}"
  description = "Rabbitmq Cluster IP Servers"
}

output "registrator_cluster_ip" {
  value       = "${module.registrator.ip_registrator}"
  description = "Registrator Server IP"
}

output "cassandra_cluster_ip" {
  value       = "${module.cassandra_cluster.ip_cassandra}"
  description = "Cassandra Cluster IP Servers"
}
