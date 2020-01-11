output "network_data" {
  value = "${docker_container.container-cassandra.*.network_data}"
}

output "ip_cassandra" {
  value = {
    "cassandra-server-1" = "${lookup(docker_container.container-cassandra.0.network_data[0], "ip_address")}"
    "cassandra-server-2" = "${lookup(docker_container.container-cassandra.1.network_data[0], "ip_address")}"
    "cassandra-server-3" = "${lookup(docker_container.container-cassandra.2.network_data[0], "ip_address")}"
  }
}
