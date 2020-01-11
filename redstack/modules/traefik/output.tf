output "ip_traefik" {
  value       = "${lookup(docker_container.container-traefik.network_data[0], "ip_address")}"
  description = "IP Address Traefik"
}
