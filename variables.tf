variable "region" {}
variable "node_count" {}
variable "web_servers_private_ips" {}


variable "port" {
  type    = number
  default = 80
}
variable "protocol" {
  type    = string
  default = "http"
}
variable "check" {
  type    = string
  default = "http_body"
}
variable "check_path" {
  type    = string
  default = "/healthcheck/"
}
variable "check_body" {
  type    = string
  default = "healthcheck"
}
variable "check_attempts" {
  type    = number
  default = 30
}
variable "check_timeout" {
  type    = number
  default = 25
}
variable "check_interval" {
  type    = number
  default = 30
}
variable "stickiness" {
  type    = string
  default = "http_cookie"
}
variable "algorithm" {
  type    = string
  default = "leastconn"
  #   default = "roundrobin"
  #   default = "source"
}

variable "tags" {
  type    = list(string)
  default = ["example"]
}

variable "ENV" {
  description = "Environment var."
  type        = string
  default     = ""
}

variable "SITE" {
  description = "Site name of the project/app."
  default     = ""
}
