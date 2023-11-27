
variable "avi_controller_ip" {}
variable "avi_version" {}
variable "avi_tenant" {}
variable "avi_password" {}
variable "avi_username" {}

variable "avi_vsvip" {
  type = map(string)
  default = {
    vip_name = "phoenix_app_vip"
    vip_ip = "192.168.130.211"
  }
}

variable "avi_pool" {
  type = map(string)
  default = {
    pool_name = "phoenix_app_pool"
    default_port = "443"
    server1_ip = "192.168.130.11"
    server2_ip = "192.168.130.12"
    lb_algorithm = "LB_ALGORITHM_ROUND_ROBIN"
    avi_healthmonitor = "System-HTTPS"
    avi_sslprofile = "System-Standard"
    avi_ssl_key = "System-Default-Cert"
  }
}

variable "avi_vs" {
  type = map(string)
  default = {
    vs_name = "phoenix_app"
    vs_http_port = "80"
    vs_https_port = "443"
    application_profile = "System-Secure-HTTP"
    network_profile = "System-TCP-Proxy"
  }
}

variable "avi_cloud" {
  type = map(string)
  default = {
    cloud_name = "vCenter"
  }
}

variable "segroup_name" {
  default = "vCenter-Group"
}
