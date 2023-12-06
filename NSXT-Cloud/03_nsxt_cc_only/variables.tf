
variable "avi_controller_ip" {}
variable "avi_version" {}
variable "avi_tenant" {}
variable "avi_password" {}
variable "avi_username" {}
variable "avi_cloud_name" {}
variable "tier1_lr" {}

variable vcenter_dc {}
variable vcenter_cluster {}
variable vcenter_datastore {}
variable vcenter_network {}
variable vcenter_username {}
variable vcenter_password {}
variable vcenter_server {}
variable vcenter_folder {}

variable "content_library_name" {
  default = "Avi-SE-NSX"
}

variable "avi_license" {
  type = map(string)
  default = {
    avi_license      = "ENTERPRISE" # or "ENTERPRISE_WITH_CLOUD_SERVICES"
    avi_license_type = "LIC_CORES"
  }
}

variable "avi_cloud" {
  type = map(string)
  default = {
    cloud_type = "CLOUD_NSXT"
    obj_name_prefix = "nsxt-a"
    nsxt_url        = "192.168.110.201"
    nsxt_user = "admin"
    nsxt_password = "VMware1!VMware1!"
  }
}

variable "data_network_config" {
  type = map(string)
  default = {
    segment_id  = "/infra/segments/avi-data"
    tier1_lr_id = "/infra/tier-1s/T1-Avi"
    tz_type     = "OVERLAY"
  }
}

variable "mgmt_network_config" {
  type = map(string)
  default = {
    segment_id  = "/infra/segments/avi-mgmt"
    tier1_lr_id = "/infra/tier-1s/T1-Avi"
    tz_type     = "OVERLAY"
  }
}
