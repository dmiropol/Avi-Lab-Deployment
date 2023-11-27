
data "vsphere_datacenter" "dc" {
  name = var.vcenter_dc
}

data "vsphere_datastore" "datastore" {
  name = var.vcenter_datastore
  datacenter_id = data.vsphere_datacenter.dc.id
}
