output "network_data" {
  value = "${docker_container.container-consul.*.network_data}"
}

output "ip_consul" {
  value = {
    "consul-server-1" = "${lookup(docker_container.container-consul.0.network_data[0], "ip_address")}"
    "consul-server-2" = "${lookup(docker_container.container-consul.1.network_data[0], "ip_address")}"
    "consul-server-3" = "${lookup(docker_container.container-consul.2.network_data[0], "ip_address")}"
  }
}
