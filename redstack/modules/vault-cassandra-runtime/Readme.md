# Usage

```hcl
module "vault_cassandra_runtime" {
  source          = "./modules/vault-cassandra-runtime"

}
```

## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.12 |

## Providers

| Name | Version |
|------|---------|
| vault | v2.12.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| cassandra\_hosts | The hosts to connect to. | `list(string)` | <pre>[<br>  ""<br>]</pre> | no |
| cassandra\_password | The password to authenticate with | `string` | n/a | yes |
| cassandra\_tls | Whether to use TLS when connecting to Cassandra | `bool` | n/a | yes |
| cassandra\_username | The username to authenticate with | `string` | n/a | yes |

## Outputs

No output.
