
// segments for Avi SE 
resource "nsxt_policy_segment" "avi_mgmt" {
  display_name      = var.nsxt_seg_avi_mgmt.display_name
  nsx_id            = var.nsxt_seg_avi_mgmt.display_name
  connectivity_path = nsxt_policy_tier1_gateway.t1_avi.path
  transport_zone_path = data.nsxt_policy_transport_zone.overlay_transport_zone.path
  subnet {
    cidr = var.nsxt_seg_avi_mgmt.cidr
  }
  advanced_config {
    connectivity = "ON"
  }
}

resource "nsxt_policy_segment" "avi_data" {
  display_name      = var.nsxt_seg_avi_data.display_name
  nsx_id            = var.nsxt_seg_avi_data.display_name
  connectivity_path = nsxt_policy_tier1_gateway.t1_avi.path
  transport_zone_path = data.nsxt_policy_transport_zone.overlay_transport_zone.path
  subnet {
    cidr = var.nsxt_seg_avi_data.cidr
  }
  advanced_config {
    connectivity = "ON"
  }
}


# T1 Avi gateway definition
resource "nsxt_policy_tier1_gateway" "t1_avi" {
  display_name = var.nsxt_t1_avi.display_name
  nsx_id       = var.nsxt_t1_avi.display_name
  tier0_path   = data.nsxt_policy_tier0_gateway.t0_gw.path
  route_advertisement_types = [var.nsxt_t1_avi.route_advertisement_types]
}
/* 
##########################
# DFW policy configuration
##########################

resource "nsxt_policy_security_policy" "Avi-infra" {
  display_name = "Avi-infra"
  category     = "Infrastructure"
  rule {
    display_name       = "Avi se to Controller"
    source_groups      = [data.nsxt_policy_group.avi-ServiceEngines.path]
    destination_groups = [data.nsxt_policy_group.avi-ControllerCluster.path]
    services           = [data.nsxt_policy_service.avi-ControllerCluster.path]
    scope              = [data.nsxt_policy_group.avi-ServiceEngines.path]
    action             = "ALLOW"
  }
  rule {
    display_name       = "Avi Controller out"
    source_groups      = [data.nsxt_policy_group.avi-ControllerCluster.path]
    services           = [data.nsxt_policy_service.avi-ControllerCluster.path]
    action             = "ALLOW"
  }
}


resource "nsxt_policy_security_policy" "Avi-Policy" {
  display_name = "Avi-Policy"
  category     = "Application"
  sequence_number = 10
  rule {
    display_name       = "Access to VIP"
    source_groups      = [data.nsxt_policy_group.mgmt_ip.path]
    destination_groups = ["172.16.12.6","172.16.12.7"]
    services           = [data.nsxt_policy_service.service_http.path,data.nsxt_policy_service.service_https.path]
    action             = "ALLOW"
  }
  rule {
    display_name       = "VIP to App"
    source_groups      = [data.nsxt_policy_group.avi-ServiceEngines.path]
    destination_groups = [nsxt_policy_group.web_vm_group.path]
    services           = [data.nsxt_policy_service.service_http.path,data.nsxt_policy_service.service_https.path]
    scope              = [nsxt_policy_group.web_vm_group.path,data.nsxt_policy_group.avi-ServiceEngines.path]
    action             = "ALLOW"
  }
}
 */
