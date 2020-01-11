resource "vault_mount" "db" {
  path = "cassandra/"
  type = "database"
}

resource "vault_database_secret_backend_connection" "cassandra" {
  backend       = "${vault_mount.db.path}"
  name          = "cassandra-database"
  allowed_roles = ["cassandra-access-role"]

  cassandra {
    protocol_version = 4
    connect_timeout  = 10
    hosts            = ["${var.cassandra_hosts}"]
    username         = "cassandra"
    password         = "cassandra"
    tls              = false
  }
}

locals {
  create_statements = [
    "CREATE USER '{{username}}' WITH PASSWORD '{{password}}' NOSUPERUSER; GRANT SELECT ON ALL KEYSPACES TO {{username}};",
  ]
}

resource "vault_database_secret_backend_role" "role" {
  backend     = "${vault_mount.db.path}"
  name        = "cassandra-access-role"
  db_name     = "${vault_database_secret_backend_connection.cassandra.name}"
  default_ttl = "3600"
  max_ttl     = "86400"

  creation_statements = ["${local.create_statements}"]
}
