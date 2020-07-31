resource "vault_rabbitmq_secret_backend" "rabbitmq" {
  connection_uri = var.rabbitmq_addr
  username       = var.rabbitmq_admin_login
  password       = var.rabbitmq_admin_password
}

resource "vault_rabbitmq_secret_backend_role" "role" {
  backend = vault_rabbitmq_secret_backend.rabbitmq.path
  name    = "rabbitmq_access_role"

  tags = "management, monitoring"

  vhost {
    configure = ".*"
    host      = "/"
    read      = ".*"
    write     = ".*"
  }
}
