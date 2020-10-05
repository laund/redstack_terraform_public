resource "vault_mount" "db" {
  path = "cassandra/"
  type = "database"
}

resource "vault_database_secret_backend_connection" "cassandra" {
  backend       = vault_mount.db.path
  name          = "cassandra-database"
  allowed_roles = ["cassandra-access-role"]

  cassandra {
    protocol_version = 4
    connect_timeout  = 10
    hosts            = ["10.5.0.9", "10.5.0.10", "10.5.0.11"]
    username         = "cassandra"
    password         = "cassandra"
    tls              = false
  }
}

locals {
  creation_statements = [
    "CREATE USER '{{username}}' WITH PASSWORD '{{password}}' NOSUPERUSER; GRANT SELECT ON ALL KEYSPACES TO {{username}};",
  ]
}

resource "vault_database_secret_backend_role" "role" {
  backend = vault_mount.db.path

  name        = "cassandra-access-role"
  db_name     = vault_database_secret_backend_connection.cassandra.name
  default_ttl = "3600"
  max_ttl     = "86400"

  creation_statements = local.creation_statements
}
