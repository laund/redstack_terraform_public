# Usage

```hcl
module "network" {
  source       = "./modules/network"

  network_name = "redstack_network"
  subnet       = "10.5.0.0/16"
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
| network\_name | The name of the Docker network | `string` | n/a | yes |
| subnet | Configuration of the custom IP scheme of the network type range Subnet | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| id | Docker network id |
| name | Docker network name |
| scope | DOcker network scope |