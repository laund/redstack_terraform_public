acl = {
  enabled = true
  default_policy = "deny"
  enable_token_persistence = true
}

telemetry {
  disable_hostname = true
  prometheus_retention_time = "1h"
}

addresses = {
  http = "0.0.0.0"
  https = "0.0.0.0"
  grpc = "0.0.0.0"
}

encrypt = "n4WMEbisM5Jx9jQWvgyciw=="
data_dir = "/consul/data"
bind_addr = "0.0.0.0"
domain = "redstack.local"
node_name = "consul-server-3"
datacenter = "dc1"
acl_datacenter = "dc1"
acl_enforce_version_8 = true
acl_down_policy = "extend-cache"
acl_ttl = "3600s"
disable_update_check = true
disable_host_node_id = true
server = true
skip_leave_on_interrupt = true
verify_incoming = false
verify_outgoing = false
ui = true
log_level = "debug"
leave_on_terminate = true
performance = {
  raft_multiplier = 5
}
rejoin_after_leave = true
retry_join = [
  "consul-server-1", "consul-server-2", "consul-server-3"
]
