## Deployment of VM from Local OVF


resource "vsphere_virtual_machine" "controller_static_standalone" {
  name                 = "${var.avi_controller_config.controller_name}-${var.avi_version}"
  datacenter_id        = data.vsphere_datacenter.dc.id
  datastore_id         = data.vsphere_datastore.datastore.id
  resource_pool_id     = data.vsphere_resource_pool.pool.id
  host_system_id       = data.vsphere_host.host.id
  network_interface {
      network_id = data.vsphere_network.network.id
  }
  
  folder = vsphere_folder.folder.path
  
  num_cpus = var.controller_properties.cpu
  memory = var.controller_properties.memory
  wait_for_guest_net_timeout = var.controller_properties.wait_for_guest_net_timeout
  wait_for_guest_ip_timeout  = 0
  
  disk {
    size             = var.controller_properties.disk
    label            = "controller-1.lab_vmdk"
    thin_provisioned = true
  }

  ovf_deploy {
    allow_unverified_ssl_cert = false
    local_ovf_path            = var.avi_controller_config.avi_controller_ova
    disk_provisioning         = "thin"
    ip_protocol               = "IPV4"
    ip_allocation_policy      = "STATIC_MANUAL"
    ovf_network_map = {
      "Network 1" = data.vsphere_network.network.id
    }
  }
  vapp {
    properties = {
      "mgmt-ip"     = var.avi_controller_config.avi_controller_ip
      "mgmt-mask"   = var.avi_controller_config.network_mask
      "default-gw"  = var.avi_controller_config.gateway4
    }
  }
}

resource "null_resource" "wait_https_controller_static_standalone" {
  depends_on = [vsphere_virtual_machine.controller_static_standalone]

  provisioner "local-exec" {
    command = "until $(curl --output /dev/null --silent --head -k https://${vsphere_virtual_machine.controller_static_standalone.default_ip_address}); do echo 'Waiting for Avi Controller to be ready'; sleep 10 ; done"
  }
}

/* 
resource "local_file" "output_json_file_avi_config" {
  content     = "{\"avi_controller_ip\": ${jsonencode(vsphere_virtual_machine.controller_static_standalone.default_ip_address)},\"avi_version\": ${jsonencode(var.avi_version)}, \"avi_tenant\": ${jsonencode(var.avi_tenant)}, \"avi_password\": ${jsonencode(var.avi_password)}}"
  filename = "../avi_config.json"
}

 */