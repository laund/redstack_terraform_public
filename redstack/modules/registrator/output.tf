output "network_data" {
  value = docker_container.registrator.*.network_data
}

output "ip" {
  value       = {
    "registrator-server-1" = docker_container.registrator.0.network_data[0]["ip_address"]
  }

  description = "The IP addresses of the container on each network"
}
