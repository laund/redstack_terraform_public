resource "docker_image" "vault" {
  name         = "vault:latest"
  keep_locally = "false"
}

resource "docker_container" "vault" {
  count    = var.count-vault
  image    = docker_image.vault.latest
  must_run = true
  name     = "${var.name}-${count.index + 1}"
  hostname = "${var.name}-${count.index + 1}"

  labels {
    label = "traefik.http.routers.vault-lb.rule"
    value = "Host(`vault.redstack.local`)"
  }

  labels {
    label = "traefik.http.services.vault-server-1.loadbalancer.server.port"
    value = "8200"
  }

  env = [
    "SERVICE=vault",
    "PROJECT=redstack",
    "ENVIRONMENT=production",
    "VAULT_ADDR=http://0.0.0.0:8200",
    "CONSUL_HTTP_TOKEN=<Token Acl Consul>",
    "--dns=10.5.0.2"
  ]

  command = ["server"]
  restart = "no"

  ports {
    internal = 8200
    protocol = "tcp"
  }

  volumes {
    container_path = "/vault/config"
    host_path      = "${var.src_volume_vault}-0${count.index + 1}/config/"
    read_only      = false
  }

  networks_advanced {
    name         = "redstack_network"
    ipv4_address = "10.5.0.${count.index + 5}"
  }

  capabilities {
    add = ["IPC_LOCK"]
  }

  lifecycle {
    ignore_changes = [name]
  }
}
