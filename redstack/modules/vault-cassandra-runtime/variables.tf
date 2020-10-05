variable "vault_addr" {
  description = "Vault Address"
  default     = ""
}

variable "vault_token" {
  description = "Vault Token"
  default     = ""
}

variable "cassandra_hosts" {
  description = "Address Cassandra Cluster"
  type        = list(string)
  default     = [""]
}

