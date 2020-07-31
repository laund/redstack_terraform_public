resource "docker_image" "consul" {
  name         = "consul:latest"
  keep_locally = "false"
}

resource "docker_container" "consul" {
  count    = var.count_consul_server
  image    = docker_image.consul.latest
  must_run = true
  name     = "${var.name}-${count.index + 1}"
  hostname = "${var.name}-${count.index + 1}"

  labels {
    label = "traefik.http.routers.consul-lb.rule"
    value = "Host(`consul.redstack.local`)"
  }

  labels {
    label = "traefik.http.services.consul-server-1.loadbalancer.server.port"
    value = "8500"
  }

  env     = [
    "SERVICE=consul",
    "PROJECT=redstack",
    "ENVIRONMENT=production",
    "CONSUL_BOOTSTRAP_EXPECT=3"
  ]

  restart = "always"
  
  ports {
    internal = 8301
    protocol = "tcp"
  }

  ports {
    internal = 8301
    protocol = "udp"
  }

  ports {
    internal = 8302
    protocol = "tcp"
  }

  ports {
    internal = 8302
    protocol = "udp"
  }

  ports {
    internal = 8400
    protocol = "tcp"
  }

  ports {
    internal = 8500
    protocol = "tcp"
  }

  ports {
    internal = 8600
    protocol = "tcp"
  }

  ports {
    internal = 8600
    protocol = "udp"
  }

  volumes {
    container_path = "/consul/config/"
    host_path      = "${var.src_volume_consul}-0${count.index + 1}/"
    read_only      = false
  }

  networks_advanced {
    name         = "redstack_network"
    ipv4_address = "10.5.0.${count.index + 2}"
  }
  
}
