
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

variable "vcenter_privilege" {
  default = "WRITE_ACCESS"
}

variable "content_library_name" {
  default = "Avi-SE-vSphere"
}
  
variable "avi_cloud" {
  type = map
  default = {
    cloud_name = "vCenter"
    management_ip_subnet = "192.168.110.0"
    management_mask = 24
  }
}

variable "avi_license" {
  type = map(string)
  default = {
    avi_license = "ENTERPRISE" # or "ENTERPRISE_WITH_CLOUD_SERVICES"
    avi_license_type = "LIC_CORES"
  }
}

