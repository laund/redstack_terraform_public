resource "docker_image" "rabbitmq" {
  name         = "rabbitmq"
  keep_locally = "true"
}

resource "docker_container" "container-rabbitmq" {
  count    = "${var.count-rabbitmq}"
  image    = "${docker_image.rabbitmq.latest}"
  must_run = true
  name     = "rabbitmq-server-${count.index +1}"

  env = ["SERVICE=rabbitmq", "PROJECT=redstack", "ENVIRONMENT=production", "AUTOCLUSTER_TYPE=consul", "CONSUL_HOST=consul-server-1",
    "CONSUL_PORT=8500",
    "CONSUL_HTTP_TOKEN=<SecretAclToken>",
    "CONSUL_SVC=rabbitmq",
    "CONSUL_SVC_ADDR_AUTO=true",
    "AUTOCLUSTER_CLEANUP=true",
    "CLEANUP_WARN_ONLY=false",
    "RABBITMQ_ERLANG_COOKIE=secrect",
  ]

  restart = "always"

  ports {
    internal = 5672
    protocol = "tcp"
  }

  ports {
    internal = 15672
    protocol = "tcp"
  }

  volumes = {
    container_path = "/var/lib/rabbitmq/mnesia/"
    host_path      = "${var.src_volume_mnesia_rabbitmq}-0${count.index +1}/"
    read_only      = false
  }

  networks_advanced = {
    name         = "redstack_network"
    ipv4_address = "10.5.0.${count.index +21}"
  }

  labels = {
    traefik.http.routers.rabbitmq-lb.rule                            = "Host(`rabbitmq.redstack.local`)"
    traefik.http.services.rabbitmq-server-1.loadbalancer.server.port = "15672"
  }
}
