output "node_balancer_ip_hostname" {
  value = linode_nodebalancer.nodebalancer.hostname
}

output "node_balancer_ip" {
  value = linode_nodebalancer.nodebalancer.ipv4
}
