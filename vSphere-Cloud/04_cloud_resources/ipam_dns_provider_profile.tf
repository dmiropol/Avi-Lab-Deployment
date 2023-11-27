resource "avi_ipamdnsproviderprofile" "avi_ipam" {
  type       = var.avi_ipam_profile.type
  name       = var.avi_ipam_profile.name
  tenant_ref = var.avi_tenant
  internal_profile {
    usable_networks {
      nw_ref = "https://${var.avi_controller_ip}/api/network/${data.vsphere_network.network.id}-${data.avi_cloud.avi_cloud.uuid}"
    }
  }
}



