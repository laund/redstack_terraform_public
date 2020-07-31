# Usage

```hcl
module "cassandra_cluster" {
  source               = "./modules/cassandra"

  count-cassandra      = "3"
  name                 = "cassandra-server"
  src_volume_cassandra = "/opt/github/redstack_terraform_public/redstack/data/cassandra-server"
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
| count-cassandra | Number of container in cluster | `string` | n/a | yes |
| name | The name of the Docker container | `string` | n/a | yes |
| src\_volume\_cassandra | Source Docker Volume Cassandra Server | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| ip | The IP addresses of the container on each network |
| network\_data | n/a |
