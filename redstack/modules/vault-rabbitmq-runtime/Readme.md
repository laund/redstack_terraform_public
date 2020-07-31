# Usage

```hcl
module "vault_rabbitmq_runtime" {
  source        = "./modules/vault-rabbitmq-runtime"

  rabbitmq_admin_login    = "admin"
  rabbitmq_admin_password = module.rabbitmq_runtime.password
  rabbitmq_addr           = var.rabbitmq_addr
}
```

## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.12 |

## Providers

| Name | Version |
|------|---------|
| vault | >= 2.7.1 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| rabbitmq\_addr | Specifies the RabbitMQ connection URI | `string` | n/a | yes |
| rabbitmq\_admin\_login | Specifies the RabbitMQ management administrator username | `string` | n/a | yes |
| rabbitmq\_admin\_password | Specifies the RabbitMQ management administrator password | `string` | n/a | yes |

## Outputs

No output.
