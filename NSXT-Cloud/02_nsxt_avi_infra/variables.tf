//provider nsxt variables
variable "nsx_user" {
  default = "admin"
}

variable "nsx_password" {
  default = "VMware1!VMware1!"
}

variable "nsx_manager" {
  type = string
  default = "nsxapp-01a.corp.local"
}

// avi segments
variable "nsxt_seg_avi_mgmt" {
  type = map
  default = {
    display_name = "avi-mgmt", 
    cidr = "172.16.11.1/24"
  }
}

variable "nsxt_seg_avi_data" {
  type = map
  default = {
    display_name = "avi-data", 
    cidr = "172.16.12.1/24"
  }
}

//avi T1
variable "nsxt_t1_avi" {
  type = map
  default = {
    display_name = "T1-Avi"
    route_advertisement_types = "TIER1_CONNECTED"
  } 
}

