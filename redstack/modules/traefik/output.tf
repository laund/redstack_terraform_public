output "network_data" {
  value = docker_container.traefik.*.network_data
}

output "ip" {
  value       = {
    "traefik-server-1" = docker_container.traefik.0.network_data[0]["ip_address"]
  }

  description = "The IP addresses of the container on each network"
}
