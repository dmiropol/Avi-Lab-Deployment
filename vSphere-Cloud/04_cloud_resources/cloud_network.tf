
resource "avi_network" "management_network" {
  name = var.management_network_config.network_name
  tenant_ref = var.avi_tenant
  cloud_ref = data.avi_cloud.avi_cloud.id
  vcenter_dvs = true
  dhcp_enabled = false
  ip6_autocfg_enabled = false
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
      type = "STATIC_IPS_FOR_VIP_AND_SE"
    }
  }
}

resource "avi_network" "data_network" {
  name = var.data_network_config.network_name
  tenant_ref = var.avi_tenant
  cloud_ref = data.avi_cloud.avi_cloud.id
  vcenter_dvs = true
  dhcp_enabled = false
  ip6_autocfg_enabled = false
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
    }
  }
}

resource "avi_vrfcontext" "vrf_global" {
  name = "global"
  tenant_ref = var.avi_tenant
  cloud_ref = data.avi_cloud.avi_cloud.id
  system_default = true
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