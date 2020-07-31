# Usage

```hcl
module "vault_cluster" {
  source               = "./modules/vault"

  count-vault          = "2"
  name                = "vault-server"
  src_volume_vault     = "/opt/github/redstack_terraform_public/redstack/data/vault-server"
}
```

## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.12 |

## Providers

| Name | Version |
|------|---------|
| docker | >= 2.7.1 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| count-vault | Number of container in cluster | `string` | n/a | yes |
| name | The name of the Docker container | `string` | n/a | yes |
| src\_volume\_vault | The path on the host where the volume is coming from | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| ip | The IP addresses of the container on each network |
| network\_data | n/a |
