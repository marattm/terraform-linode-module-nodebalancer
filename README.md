# terraform-module-linode-nodebalancer

## Module

Invoke this module from the root `main.tf` file.

```hcl
module "lb" {
  source                  = "./modules/nodebalancer"
  region                  = var.region
  node_count              = var.node_count
  web_servers_private_ips = module.webserver.web_servers_private_ips
}
```
