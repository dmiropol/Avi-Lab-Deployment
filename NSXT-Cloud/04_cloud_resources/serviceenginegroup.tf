
resource "avi_serviceenginegroup" "avi_se_group" {
  name                         = var.avi_segroup.segroup_name
  archive_shm_limit            = 8
  algo                         = "PLACEMENT_ALGO_PACKED"
  buffer_se                    = var.avi_segroup.buffer_se
  cloud_ref                    = data.avi_cloud.avi_cloud.id
  connection_memory_percentage = var.avi_segroup.connection_mem_percentage #default 50
  disk_per_se                  = var.avi_segroup.disk_per_se               # default 10
  ha_mode                      = var.avi_segroup.ha_mode                   # default "HA_MODE_SHARED"
  license_tier                 = var.avi_license.avi_license
  license_type                 = var.avi_license.avi_license_type
  se_bandwidth_type            = "SE_BANDWIDTH_UNLIMITED"
  max_se                       = var.avi_segroup.max_se        #default 2
  max_vs_per_se                = var.avi_segroup.max_vs_per_se # default 20
  se_dp_max_hb_version         = 1
  memory_per_se                = var.avi_segroup.mem_per_se #default 2048
  min_scaleout_per_vs          = 1
  realtime_se_metrics {
    duration = 0
    enabled  = true
  }
  vcpus_per_se         = var.avi_segroup.vcpus_per_se      # default 2
  se_deprovision_delay = var.avi_segroup.deprovision_delay # default 5
  se_name_prefix       = var.avi_segroup.se_name_prefix
  tenant_ref           = var.avi_tenant
  vcenter_datastore_mode = "VCENTER_DATASTORE_SHARED" # or VCENTER_DATASTORE_LOCAL 
  vcenter_datastores_include = true

  vcenters {
    vcenter_ref = data.avi_vcenterserver.vcenter.id
    nsxt_clusters {
      cluster_ids = [ data.vsphere_compute_cluster.cluster.id ]
      include = true
    }
    nsxt_datastores {
      ds_ids = [ data.vsphere_datastore.datastore.id ]
      include = true
    }
  }
}
