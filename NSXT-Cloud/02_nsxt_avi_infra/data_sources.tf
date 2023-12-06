data "nsxt_policy_tier0_gateway" "t0_gw" {
  display_name = "T0-GW"
}

data "nsxt_policy_transport_zone" "overlay_transport_zone" {
   display_name = "nsx-overlay-transportzone"
}
/* 
# Avi controller services
data "nsxt_policy_service" "avi-ControllerCluster" {
  display_name = "nsxt-ControllerCluster"
}

# Avi controller and SE groups
data "nsxt_policy_group" "avi-ControllerCluster" {
  display_name = "nsxt-ControllerCluster"
}

data "nsxt_policy_group" "avi-ServiceEngines" {
  display_name = "nsxt-ServiceEngines"
}


# Management IP group 
data "nsxt_policy_group" "mgmt_ip" {
  display_name = "Mgmt-IP"
}
 */
