output "network_name" {
    value       = module.network.name
    description = "Docker network name"
}

output "network_id" {
    value       = module.network.id
    description = "Docker network id"
}

output "network_scope" {
    value       = module.network.scope
    description = "Docker network scope"
}

output "traefik_ip" {
    value       = module.traefik.ip
    description = "The IP addresses of the container on each network"
}

output "consul_cluster_ip" {
  value       = module.consul_cluster.ip
  description = "The IP addresses of the container on each network"
}

output "vault_cluster_ip" {
  value       = module.vault_cluster.ip
  description = "The IP addresses of the container on each network"
}

output "rabbitmq_cluster_ip" {
  value       = module.rabbitmq_cluster.ip
  description = "The IP addresses of the container on each network"
}

output "admin_password" {
  value = module.rabbitmq_runtime.password
}

output "registrator_cluster_ip" {
  value       = module.registrator.ip
  description = "The IP addresses of the container on each network"
}

output "cassandra_cluster_ip" {
  value       = module.cassandra_cluster.ip
  description = "The IP addresses of the container on each network"
}
