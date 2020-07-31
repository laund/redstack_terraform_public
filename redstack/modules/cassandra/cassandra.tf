resource "docker_image" "cassandra" {
  name         = "cassandra:latest"
  keep_locally = "true"
}

resource "docker_container" "cassandra" {
  count    = var.count-cassandra
  image    = docker_image.cassandra.latest
  must_run = true
  name     = "${var.name}-${count.index + 1}"
  hostname = "${var.name}-${count.index + 1}"

  labels {
    label = "traefik.http.routers.cassandra-lb.rule"
    value = "Host(`cassandra.redstack.local`)"
  }

  labels {
    label = "traefik.http.services.cassandra-server-1.loadbalancer.server.port"
    value = "8200"
  }
  
  env      = [
    "SERVICE=cassandra",
    "PROJECT=redstack",
    "ENVIRONMENT=production",
    "CASSANDRA_CLUSTER_NAME=redstack_cluster",
    "CASSANDRA_SEEDS=cassandra-server-1",
    "MAX_HEAP_SIZE=1G",
    "HEAP_NEWSIZE=1G",
    "CONSUL_HTTP_ADDR=10.5.0.2:8500",
    "SERVICE_NAME=cassandra",
    "--dns=10.5.0.2"
  ]

  restart  = "always"

  ports {
    internal = 7000
    protocol = "tcp"
  }

  ports {
    internal = 7001
    protocol = "tcp"
  }

  ports {
    internal = 7199
    protocol = "tcp"
  }

  ports {
    internal = 9042
    protocol = "tcp"
  }

  ports {
    internal = 9160
    protocol = "tcp"
  }

  ports {
    internal = 31500
    protocol = "tcp"
  }

  volumes {
    container_path = "/var/lib/cassandra"
    host_path      = "${var.src_volume_cassandra}-0${count.index + 1}/data"
    read_only      = false
  }

  networks_advanced {
    name         = "redstack_network"
    ipv4_address = "10.5.0.${count.index + 9}"
  }

}

