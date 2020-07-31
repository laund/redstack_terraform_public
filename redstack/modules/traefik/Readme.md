# Usage

```hcl
module "traefik" {
  source               = "./modules/traefik"

  name                 = "traefik-server-1"
  count_traefik_server = "1"
  src_volume_traefik   = "/opt/github/redstack_terraform_public/redstack/data/traefik-server"
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
| count\_traefik\_server | Number of container in cluster | `string` | n/a | yes |
| name | The name of the Docker container | `string` | n/a | yes |
| src\_volume\_traefik | The path on the host where the volume is coming from | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| ip | The IP addresses of the container on each network |
| network\_data | n/a |
