
resource "avi_cloud" "avi_cloud_connector" {
  name            = var.avi_cloud_name
  vtype           = "CLOUD_NSXT"
  obj_name_prefix = var.avi_cloud.obj_name_prefix
  nsxt_configuration {
    nsxt_credentials_ref = avi_cloudconnectoruser.nsxt_user.id
    nsxt_url             = var.avi_cloud.nsxt_url
    data_network_config {
      tier1_segment_config {
        manual {
          tier1_lrs {
            segment_id  = var.data_network_config.segment_id
            tier1_lr_id = var.data_network_config.tier1_lr_id
          }
        }
        segment_config_mode = "TIER1_SEGMENT_MANUAL"
      }
      transport_zone = "/infra/sites/default/enforcement-points/default/transport-zones/1b3a2f36-bfd1-443e-a0f6-4de01abc963e"
      tz_type        = var.data_network_config.tz_type
    }
    management_network_config {
      overlay_segment {
        segment_id  = var.mgmt_network_config.segment_id
        tier1_lr_id = var.mgmt_network_config.tier1_lr_id
      }
      transport_zone = "/infra/sites/default/enforcement-points/default/transport-zones/1b3a2f36-bfd1-443e-a0f6-4de01abc963e"
      tz_type        = var.data_network_config.tz_type
    }
  }
  license_tier = var.avi_license.avi_license
  license_type = var.avi_license.avi_license_type
  tenant_ref   = var.avi_tenant
}
