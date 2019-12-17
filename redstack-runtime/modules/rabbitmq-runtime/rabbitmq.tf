resource "rabbitmq_vhost" "vhost" {
  name = "/"
}

resource "random_password" "admin_password" {
  length           = 16
  special          = true
  override_special = "_%@"
}

resource "rabbitmq_user" "admin" {
  name     = "admin"
  password = "${random_password.admin_password.result}"
  tags     = ["administrator"]
}

resource "rabbitmq_permissions" "admin" {
  user  = "admin"
  vhost = "${rabbitmq_vhost.vhost.name}"

  permissions {
    configure = ".*"
    write     = ".*"
    read      = ".*"
  }
}

resource "rabbitmq_queue" "hello" {
  name  = "hello"
  vhost = "${rabbitmq_permissions.admin.vhost}"

  settings {
    durable     = false
    auto_delete = false
  }
}

resource "rabbitmq_policy" "ha-lbh" {
  name  = "ha-lbh"
  vhost = "${rabbitmq_permissions.admin.vhost}"

  policy {
    pattern  = ".*"
    priority = 0
    apply_to = "all"

    definition = {
      ha-mode = "all"
    }
  }
}
