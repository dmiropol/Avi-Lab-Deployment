
resource "avi_network" "management_network" {
  name = var.management_network_config.network_name
  tenant_ref = var.avi_tenant
  cloud_ref = data.avi_cloud.avi_cloud.id
  dhcp_enabled = false
  ip6_autocfg_enabled = false
  attrs {
    key = "segmentid"
    value = "/infra/segments/${var.management_network_config.network_name}"
  }
  configured_subnets {
    prefix {
      ip_addr {
        addr = var.management_network_config.prefix
        type = "V4"
      }
      mask = 24
    }
    static_ip_ranges {
      range {
        begin {
          addr = var.management_network_config.range_begin
          type = "V4"
        }
        end {
          addr = var.management_network_config.range_end
          type = "V4"
        }
      }
    }
  }
}

resource "avi_network" "data_network" {
  name = var.data_network_config.network_name
  tenant_ref = var.avi_tenant
  cloud_ref = data.avi_cloud.avi_cloud.id
  vrf_context_ref = data.avi_vrfcontext.avi_data.id
  dhcp_enabled = false
  ip6_autocfg_enabled = false
  attrs {
    key = "segmentid"
    value = "/infra/segments/${var.data_network_config.network_name}"
  }
  configured_subnets {
    prefix {
      ip_addr {
        addr = var.data_network_config.prefix
        type = "V4"
      }
      mask = 24
    }
    static_ip_ranges {
      range {
        begin {
          addr = var.data_network_config.range_begin
          type = "V4"
        }
        end {
          addr = var.data_network_config.range_end
          type = "V4"
        }
      }
      type = "STATIC_IPS_FOR_VIP_AND_SE"
    }
  }
}

resource "avi_vrfcontext" "avi_vrf" {
  name = var.tier1_lr
  tenant_ref = var.avi_tenant
  cloud_ref = data.avi_cloud.avi_cloud.id
  static_routes {
    route_id = 1
    next_hop {
      addr = var.vrf_context_config.next_hop
      type = "V4"
    }
    prefix {
      ip_addr {
        addr = var.vrf_context_config.prefix
        type = "V4"
      }
      mask = var.vrf_context_config.mask
    }
  }
}