output "network_data" {
  value = "${docker_container.container-vault.*.network_data}"
}

output "ip_vault" {
  value = {
    "vault-server-1" = "${lookup(docker_container.container-vault.0.network_data[0], "ip_address")}"
    "vault-server-2" = "${lookup(docker_container.container-vault.1.network_data[0], "ip_address")}"
  }
}
