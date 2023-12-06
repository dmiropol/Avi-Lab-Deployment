
terraform {
  required_providers {
    nsxt = {
      source = "vmware/nsxt"
    }
  }
}

provider "nsxt" {
  host                 = var.nsx_manager
  username             = var.nsx_user
  password             = var.nsx_password
  allow_unverified_ssl = true
}
