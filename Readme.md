## REDSTACK CLUSTER

# Create Network

```bash
terraform apply -target=module.network
```

# Deploy Traefik

```bash
terraform apply -target=module.traefik
```

# Deploy Consul Cluster

```bash
terraform apply -target=module.consul_cluster
```

# Create Acl's Consul

```bash
docker exec -it consul-server-1 /bin/sh  

consul acl bootstrap  

export CONSUL_HTTP_TOKEN=<SecretToken>  

consul acl set-agent-token default "<SecretToken>"  

```

```bash
terraform apply -target=module.vault_cluster
```

```bash
terraform apply -target=module.registrator
```

```bash
terraform apply -target=module.cassandra_cluster
```
### Under Construction :)
