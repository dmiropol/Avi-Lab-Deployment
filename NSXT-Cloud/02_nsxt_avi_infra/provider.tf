
terraform {
  required_providers {
    nsxt = {
      source = "vmware/nsxt"
      version = "~>3.2.1"
    }
  }
}

provider "nsxt" {
  host                 = var.nsx_manager
  username             = var.nsx_user
  password             = var.nsx_password
  allow_unverified_ssl = true
}
