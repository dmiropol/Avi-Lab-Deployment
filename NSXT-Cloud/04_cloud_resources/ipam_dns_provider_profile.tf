resource "avi_ipamdnsproviderprofile" "avi_ipam" {
  type       = var.avi_ipam_profile.type
  name       = var.avi_ipam_profile.name
  tenant_ref = var.avi_tenant
  internal_profile {
    usable_networks {
      nw_ref = data.avi_network.data_network.id
    }
  }
}



