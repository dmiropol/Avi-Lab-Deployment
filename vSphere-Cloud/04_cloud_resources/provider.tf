terraform {
  required_providers {
    avi = {
      source  = "vmware/avi"
    }
  }
}
provider "avi" {
  avi_username   = var.avi_username
  avi_password   = var.avi_password
  avi_controller  = var.avi_controller_ip
  avi_tenant     = var.avi_tenant
  avi_version    = var.avi_version
  avi_api_timeout = 50
}

provider "vsphere" {
  user           = var.vcenter_username
  password       = var.vcenter_password
  vsphere_server = var.vcenter_server
  allow_unverified_ssl = true
}
