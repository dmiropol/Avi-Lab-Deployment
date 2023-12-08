
data "avi_cloud" "avi_cloud" {
  name = var.avi_cloud_name
}

data "vsphere_datacenter" "dc" {
  name = var.vcenter_dc
}

data "vsphere_compute_cluster" "cluster" {
   name          = var.vcenter_cluster
   datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_datastore" "datastore" {
  name = var.vcenter_datastore
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "avi_network" "data_network" {
  name = var.data_network_config.network_name
  cloud_ref = var.avi_cloud_name
}

data "avi_vrfcontext" "avi_data" {
  name = var.tier1_lr
}

data "avi_vcenterserver" "vcenter" {
  name = var.vcenter_server
}