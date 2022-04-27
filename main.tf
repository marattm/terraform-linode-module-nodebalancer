
resource "linode_nodebalancer" "nodebalancer" {
  label  = "mynodebalancer"
  region = var.region
  # client_conn_throttle = 20
  tags = ["demo"]
}

resource "linode_nodebalancer_config" "nodebalancer-config" {
  nodebalancer_id = linode_nodebalancer.nodebalancer.id
  port            = 80
  protocol        = "http"
  check           = "http_body"
  check_path      = "/healthcheck/"
  check_body      = "healthcheck"
  check_attempts  = 30
  check_timeout   = 25
  check_interval  = 30
  stickiness      = "http_cookie"
  algorithm       = "roundrobin"
}

resource "linode_nodebalancer_node" "webnode" {
  count           = var.node_count
  nodebalancer_id = linode_nodebalancer.nodebalancer.id
  config_id       = linode_nodebalancer_config.nodebalancer-config.id
  address         = "${element(var.web_servers_private_ips, count.index)}:80"
  label           = "nb-backnode-${count.index}"
  weight          = 100
  mode            = "accept"
}
