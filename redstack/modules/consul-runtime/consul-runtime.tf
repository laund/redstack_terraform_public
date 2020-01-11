## Consul
resource "consul_acl_policy" "agent-consul-acl-policy" {
  description = "Built In Policy that grants unlimited access for Consul"
  name        = "agent-consul-acl-policy"

  rules = <<-RULE
    agent_prefix "" {
      policy = "read"
    }
    agent "" {
      policy = "write"
    }
    service_prefix "" {
      policy = "write"
    }
    node_prefix "" {
      policy = "write"
    }
    RULE
}

resource "consul_acl_token_policy_attachment" "attachment" {
  token_id = "${random_uuid.randon_id.result}"
  policy   = "${consul_acl_policy.agent-consul-acl-policy.name}"
}

resource "random_uuid" "randon_id" {}

resource "consul_acl_token" "agent-consul-acl-token" {
  accessor_id = "${random_uuid.randon_id.result}"

  description = "Agent Consul Token"

  local = false

  lifecycle {
    ignore_changes = ["policies"]
  }
}

## Vault
resource "consul_acl_policy" "agent-vault-acl-policy" {
  description = "Built In Policy that grants unlimited access for Vault"
  name        = "agent-vault-acl-policy"

  rules = <<-RULE
    agent_prefix "" {
      policy = "write"
    }
    key_prefix "vault/" {
      policy = "write"
    }
    node_prefix "" {
      policy = "write"
    }
    service "vault" {
      policy = "write"
    }
    session_prefix "" {
      policy = "write"
    }
    RULE
}

resource "consul_acl_token" "agent-vault-acl-token" {
  description = "Agent Vault Token"
  policies    = ["${consul_acl_policy.agent-vault-acl-policy.name}"]
  local       = false
}

## Registrator
resource "consul_acl_policy" "agent-registrator-acl-policy" {
  description = "Built In Policy that grants unlimited access for Registrator"
  name        = "agent-registrator-acl-policy"

  rules = <<-RULE
    service "" {
      policy = "write"
    }
    service_prefix "" {
      policy = "write"
    }
    node_prefix "" {
      policy = "read"
    }
    RULE
}

resource "consul_acl_token" "agent-registrator-acl-token" {
  description = "Agent Registrator Token"
  policies    = ["${consul_acl_policy.agent-registrator-acl-policy.name}"]
  local       = false
}

## Rabbitmq
resource "consul_acl_policy" "agent-rabbitmq-acl-policy" {
  description = "Built In Policy that grants unlimited access for Rabbitmq"
  name        = "agent-rabbitmq-acl-policy"

  rules = <<-RULE
    key_prefix "rabbitmq/" {
      policy = "write"
    }
    session "" {
      policy = "write"
    }
    session_prefix "" {
      policy = "write"
    }
    service "rabbitmq" {
      policy = "write"
    }
    service_prefix "" {
      policy = "read"
    }
    node_prefix "" {
      policy = "read"
    }
    node "" {
      policy = "write"
    }
    agent "" {
      policy = "write"
    }
    RULE
}

resource "consul_acl_token" "agent-rabbitmq-acl-token" {
  description = "Agent Rabbitmq Token"
  policies    = ["${consul_acl_policy.agent-rabbitmq-acl-policy.name}"]
  local       = false
}
