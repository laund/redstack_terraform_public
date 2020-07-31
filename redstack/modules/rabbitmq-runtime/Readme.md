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
| rabbitmq | v1.4.0 |
| random | v2.3.0 |

## Inputs

No input.

## Outputs

| Name | Description |
|------|-------------|
| password | Admin Password |