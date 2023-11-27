resource "vsphere_content_library" "library" {
  name            = var.content_library_name
  storage_backing = [ data.vsphere_datastore.datastore.id ]
}

resource "avi_vcenterserver" "vcenter" {
    name = var.vcenter_server
    tenant_ref = var.avi_tenant
    vcenter_url = var.vcenter_server
    vcenter_credentials_ref = avi_cloudconnectoruser.vcenter_user.id
    cloud_ref = avi_cloud.avi_cloud_connector.id
    content_lib {
      id = vsphere_content_library.library.id
    }
}

resource "avi_cloudconnectoruser" "vcenter_user" {
    name = "vcenter_creds"
    tenant_ref = var.avi_tenant
    vcenter_credentials {
        username = var.vcenter_username
        password = var.vcenter_password
    }
}

resource "avi_cloudconnectoruser" "nsxt_user" {
    name = "nsxt_creds"
    tenant_ref = var.avi_tenant
    nsxt_credentials {
        username = var.avi_cloud.nsxt_user
        password = var.avi_cloud.nsxt_password
    }
}
