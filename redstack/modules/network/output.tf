output "name" {
  value       = docker_network.redstack_network.name
  description = "Docker network name"
}

output "id" {
  value       = docker_network.redstack_network.id
  description = "Docker network id"
}

output "scope" {
  value       = docker_network.redstack_network.scope
  description = "DOcker network scope"
}
