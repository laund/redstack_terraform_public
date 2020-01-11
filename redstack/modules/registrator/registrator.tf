resource "docker_image" "registrator" {
  name         = "gliderlabs/registrator:latest"
  keep_locally = "false"
}

resource "docker_container" "container-registrator" {
  image    = "${docker_image.registrator.latest}"
  must_run = true
  name     = "registrator-server"

  hostname = "registrator-server-1"
  env      = ["PROJECT=redstack", "ENVIRONMENT=production", "SERVICE_NAME=registrator", "--dns=10.5.0.2", "CONSUL_HTTP_TOKEN=<Consul ACL Token"]
  command  = ["consul://consul-server-1:8500"]
  restart  = "always"

  volumes = {
    container_path = "/tmp/docker.sock"
    host_path      = "/var/run/docker.sock"
    read_only      = false
  }

  networks_advanced = {
    name         = "redstack_network"
    ipv4_address = "10.5.0.${count.index +7}"
  }
}
