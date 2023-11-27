
resource "vsphere_content_library" "library" {
#  count = var.content_library_name == null ? 0 : 1
  name            = var.content_library_name
  storage_backing = [data.vsphere_datastore.datastore.id]
}

resource "avi_cloud" "vmware_cloud_connector" {
  name         = var.avi_cloud.cloud_name
  vtype        = "CLOUD_VCENTER"
  dhcp_enabled = false
  vcenter_configuration {
    use_content_lib = "true"
    username        = var.vcenter_username
    datacenter         = var.vcenter_dc
    management_network = var.vcenter_network
    privilege          = var.vcenter_privilege
    vcenter_url        = var.vcenter_server
    password           = var.vcenter_password
    content_lib {
      id = vsphere_content_library.library.id
    }
    # setting management_ip_subnet here doesn't make any effect. need to setup management network with the range separately
    management_ip_subnet {
      ip_addr {
        addr = var.avi_cloud.management_ip_subnet
        type = "V4"
      }
      mask = var.avi_cloud.management_mask
    }
  }

  license_tier = var.avi_license.avi_license
  license_type = var.avi_license.avi_license_type
  tenant_ref   = var.avi_tenant
  #ipam_provider_ref = avi_ipamdnsproviderprofile.avi_ipam.id
}
