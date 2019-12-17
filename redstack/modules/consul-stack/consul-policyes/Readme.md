## Agent Policy
consul acl policy create -name "agent-token" -description "Agent's Token Policy" -rules @agent-policy.hcl
consul acl token create -description "Agent Token" -policy-name "agent-token"
consul acl set-agent-token default ""

## Vault Policy
consul acl policy create -name "vault-token" -description "Vault Token Policy" -rules @vault-policy.hcl
consul acl token create -description "Vault Token" -policy-name "vault-token"

## Registrator Policy
consul acl policy create -name "registrator-token" -description "Registrator Token Policy" -rules @registrator-policy.hcl
consul acl token create -description "Registrator Token" -policy-name "registrator-token"
