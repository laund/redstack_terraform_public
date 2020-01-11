output "network_data" {
  value = "${docker_container.container-rabbitmq.*.network_data}"
}

output "ip_rabbitmq" {
  value = {
    "rabbitmq-server-1" = "${lookup(docker_container.container-rabbitmq.0.network_data[0], "ip_address")}"
    "rabbitmq-server-2" = "${lookup(docker_container.container-rabbitmq.1.network_data[0], "ip_address")}"
    "rabbitmq-server-3" = "${lookup(docker_container.container-rabbitmq.2.network_data[0], "ip_address")}"
  }
}
