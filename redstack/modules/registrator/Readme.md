# Usage

```hcl
module "registrator" {
  source                   = "./modules/registrator"

  name                     = "registrator-server-1"
  count_registrator_server = "1"
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
| count\_registrator\_server | Number of container in cluster | `string` | n/a | yes |
| name | The name of the Docker container | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| ip | The IP addresses of the container on each network |
| network\_data | n/a |
