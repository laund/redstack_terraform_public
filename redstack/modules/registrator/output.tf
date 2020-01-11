output "ip_registrator" {
  value       = "${lookup(docker_container.container-registrator.network_data[0], "ip_address")}"
  description = "IP Address Registrator"
}
