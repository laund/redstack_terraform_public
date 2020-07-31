output "network_data" {
  value = docker_container.rabbitmq.*.network_data
}

output "ip" {
  value       = {
    "rabbitmq-server-1" = docker_container.rabbitmq.0.network_data[0]["ip_address"]
    "rabbitmq-server-2" = docker_container.rabbitmq.1.network_data[0]["ip_address"]
    "rabbitmq-server-3" = docker_container.rabbitmq.2.network_data[0]["ip_address"]
  }

  description = "The IP addresses of the container on each network"
}
