resource "docker_image" "traefik" {
  name         = "traefik:latest"
  keep_locally = "false"
}

resource "docker_container" "traefik" {
  count    = var.count_traefik_server
  image    = docker_image.traefik.latest
  must_run = true

  name     = var.name
  hostname = var.name

  env = [
    "SERVICE=traefik",
    "PROJECT=redstack",
    "ENVIRONMENT=production",
    "SERVICE_NAME=traefik",
    "--dns=10.5.0.2",
  ]

  command = ["--consul", "--consul.endpoint=consul-server-1:8500", "--consul.prefix=traefik"]
  restart = "no"

  ports {
    internal = 8080
    protocol = "tcp"
  }

  ports {
    internal = 8081
    protocol = "tcp"
  }

  volumes {
    container_path = "/etc/traefik/"
    host_path      = "${var.src_volume_traefik}-0${count.index + 1}/config/"
    read_only      = false
  }

  volumes {
    container_path = "/var/run/docker.sock"
    host_path      = "/var/run/docker.sock"
    read_only      = false
  }

  networks_advanced {
    name         = "redstack_network"
    ipv4_address = "10.5.0.${count.index + 12}"
  }
}
