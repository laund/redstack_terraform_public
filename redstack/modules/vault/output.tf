output "network_data" {
  value = docker_container.vault.*.network_data
}

output "ip" {
  value       = {
    "vault-server-1" = docker_container.vault.0.network_data[0]["ip_address"]
    "vault-server-2" = docker_container.vault.1.network_data[0]["ip_address"]
  }

  description = "The IP addresses of the container on each network"
}
