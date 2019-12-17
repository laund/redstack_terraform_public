resource "vault_rabbitmq_secret_backend" "rabbitmq" {
  connection_uri = "${var.rabbitmq_addr}:15672"
  username       = "guest"
  password       = "guest"
}

resource "vault_mount" "rabbit" {
  path        = "rabbitmq"
  type        = "rabbitmq"
  description = "Dynamic secrets for rabbitmq"
}

resource "vault_rabbitmq_secret_backend_role" "role" {
  backend = "${vault_rabbitmq_secret_backend.rabbitmq.path}"
  name    = "deploy"

  #tags = "tag1,tag2"

  vhost {
    configure = ".*"
    host      = "/"
    read      = ".*"
    write     = ".*"
  }
}
