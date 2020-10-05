output "network_data" {
  value = docker_container.cassandra.*.network_data
}

output "ip" {
  value = {
    "cassandra-server-1" = docker_container.cassandra.0.network_data[0]["ip_address"]
    "cassandra-server-2" = docker_container.cassandra.1.network_data[0]["ip_address"]
    "cassandra-server-3" = docker_container.cassandra.2.network_data[0]["ip_address"]
  }

  description = "The IP addresses of the container on each network"
}

