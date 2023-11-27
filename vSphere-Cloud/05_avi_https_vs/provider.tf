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
