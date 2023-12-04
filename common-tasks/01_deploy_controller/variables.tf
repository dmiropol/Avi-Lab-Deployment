
variable "avi_controller_ip" {}
variable "avi_version" {}
variable "avi_password" {}
variable "avi_tenant" {}
variable "avi_username" {}

variable "vcenter_username" {}
variable "vcenter_password" {}
variable "vcenter_server" {}
variable "vsphere_host" {}
variable "vcenter_dc" {}
variable "vcenter_cluster" {}
variable "vcenter_datastore" {}
variable "vcenter_network" {}
variable "vcenter_folder" {}

variable "avi_controller_config" {
  type = map(string)
  default = {
    avi_controller_ova = "/home/ubuntu/nfs_share/Downloads/vmware/avi/controller-22.1.5-9093.ova"
    avi_controller_ip  = "192.168.110.91"
    network_mask       = "255.255.255.0"
    gateway4           = "192.168.110.1"
    controller_name    = "Avi-ctrl"
    avi_dns_server_ips = "192.168.110.1,8.8.8.8"
    avi_ntp_server_ips = "192.168.110.1"
  }
}

variable "controller_properties" {
  type = map(number)
  default = {
    cpu                        = 8
    memory                     = 24576
    disk                       = 128
    wait_for_guest_net_timeout = 4
  }
}
