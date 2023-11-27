
variable "avi_controller_ip" {}
variable "avi_version" {}
variable "avi_tenant" {}
variable "avi_password" {}
variable "avi_username" {}
variable "avi_cloud_name" {}

variable "tier1_lr" {}

variable "avi_vsvip" {
  type = map(string)
  default = {
    vip_name = "https_webapp_vip"
    vip_ip = "172.16.12.211"
  }
}

variable "avi_pool" {
  type = map(string)
  default = {
    pool_name = "https_webapp_pool"
    default_port = "443"
    server1_ip = "172.16.10.11"
    server2_ip = "172.16.10.12"
    lb_algorithm = "LB_ALGORITHM_ROUND_ROBIN"
    avi_healthmonitor = "System-HTTPS"
    avi_sslprofile = "System-Standard"
    avi_ssl_key = "System-Default-Cert"
  }
}

variable "avi_vs" {
  type = map(string)
  default = {
    vs_name = "https_webapp_vs"
    vs_http_port = "80"
    vs_https_port = "443"
    application_profile = "System-Secure-HTTP"
    network_profile = "System-TCP-Proxy"
  }
}

variable "segroup_name" {
  default = "NSX-Group"
}
