output "network_data" {
  value = docker_container.consul.*.network_data
}

output "ip" {
  value = {
    "consul-server-1" = docker_container.consul.0.network_data[0]["ip_address"]
    "consul-server-2" = docker_container.consul.1.network_data[0]["ip_address"]
    "consul-server-3" = docker_container.consul.2.network_data[0]["ip_address"]
  }

  description = "The IP addresses of the container on each network"
}

