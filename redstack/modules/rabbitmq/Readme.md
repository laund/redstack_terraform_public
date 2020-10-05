# Usage

```hcl
module "rabbitmq_cluster" {
  source                     = "./modules/rabbitmq"

  count-rabbitmq             = "3"
  name                       = "rabbitmq-server"
  src_volume_mnesia_rabbitmq = "/opt/github/redstack_terraform_public/redstack/data/rabbitmq-server"
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
| count-rabbitmq | Number of container in cluster | `string` | n/a | yes |
| name | The name of the Docker container | `string` | n/a | yes |
| src\_volume\_mnesia\_rabbitmq | Docker volume mount point Mnesia | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| ip | The IP addresses of the container on each network |
| network\_data | n/a |