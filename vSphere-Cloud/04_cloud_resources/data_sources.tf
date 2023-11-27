
data "avi_cloud" "avi_cloud" {
  name = var.avi_cloud.cloud_name
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

data "vsphere_network" "network" {
  name = var.data_network_config.network_name
  datacenter_id = data.vsphere_datacenter.dc.id
}