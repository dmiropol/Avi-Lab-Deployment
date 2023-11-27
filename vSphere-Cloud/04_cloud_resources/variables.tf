
variable "avi_controller_ip" {}
variable "avi_version" {}
variable "avi_tenant" {}
variable "avi_password" {}
variable "avi_username" {}

variable vcenter_username {}
variable vcenter_password {}
variable vcenter_server {}
variable vcenter_dc {}
variable vcenter_cluster {}
variable vcenter_datastore {}
variable vcenter_network {}
variable vcenter_folder {}

variable "management_network_config" {
  type = map(string)
  default = {
    network_name = "LabNet"
    prefix = "192.168.110.0"
    range_begin = "192.168.110.111"
    range_end = "192.168.110.120"
  }
}

variable "data_network_config" {
  type = map(string)
  default = {
    network_name = "phoenix_vlan130"
    prefix = "192.168.130.0"
    range_begin = "192.168.130.111"
    range_end = "192.168.130.120"
  }
}

variable "vrf_context_config" {
  type = map(string)
  default = {
    next_hop = "192.168.130.1"
    prefix = "0.0.0.0"
    mask = "0"
  }
}

variable "avi_cloud" {
  type = map(string)
  default = {
    cloud_name = "vCenter"
  }
}

variable "avi_segroup" {
  type = map
  default = {
    segroup_name = "vCenter-Group"
    ha_mode = "HA_MODE_SHARED"
    se_name_prefix = "Avi_vSphere"
    mem_per_se = 2048
    max_vs_per_se = 10
    max_se = 1
    connection_mem_percentage = 50
    buffer_se = 0
    disk_per_se = 30
    vcpus_per_se = 2
    deprovision_delay = 5
  }
}

variable "avi_license" {
  type = map(string)
  default = {
    avi_license = "ENTERPRISE" # or "ENTERPRISE_WITH_CLOUD_SERVICES"
    avi_license_type = "LIC_CORES"
  }
}

variable "avi_ipam_profile" {
  type = map(string)
  default = {
    name = "Avi-ipam-vSphere"
    type = "IPAMDNS_TYPE_INTERNAL"
  }
}
