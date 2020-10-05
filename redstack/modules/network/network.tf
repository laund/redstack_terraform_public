resource "docker_network" "redstack_network" {
  name = var.network_name

  ipam_config {
    subnet = var.subnet
  }
}

