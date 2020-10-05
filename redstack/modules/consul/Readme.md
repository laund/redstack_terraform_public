# Usage

```hcl
module "consul_cluster" {
  source              = "./modules/consul"

  name                = "consul-server"
  count_consul_server = "3"
  src_volume_consul   = "/opt/github/redstack_terraform_public/redstack/data/consul-server"
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
| count\_consul\_server | Number of container in cluster | `string` | n/a | yes |
| name | The name of the Docker container | `string` | n/a | yes |
| src\_volume\_consul | The path on the host where the volume is coming from | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| ip | The IP addresses of the container on each network |
| network\_data | n/a |
