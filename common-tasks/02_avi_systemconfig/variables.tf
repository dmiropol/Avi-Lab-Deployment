variable "avi_version" {}
variable "avi_controller_ip" {}
variable "avi_tenant" {}
variable "avi_username" {}
variable "avi_current_password" {
  sensitive = true
  default = "58NFaGDJm(PJH0G"
}

variable "avi_password" {
  sensitive = true
}

variable "avi_license" {
  default = "ENTERPRISE"
# default = "ENTERPRISE_WITH_CLOUD_SERVICES"
}

variable "avi_systemconfig" {
  type = map(string)
  default = {
    avi_dns_server_ips = "192.168.110.10"
    search_domain = "vsphere.local, corp.local"
    avi_ntp_server_ips = "192.168.110.1"
  }
}
