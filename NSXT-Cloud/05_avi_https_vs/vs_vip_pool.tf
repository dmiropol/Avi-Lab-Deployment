resource "avi_pool" "pool_vs" {
  cloud_ref           = data.avi_cloud.avi_cloud.id
  default_server_port = var.avi_pool.default_port
  pool_type    = "POOL_TYPE_GENERIC_APP"
  name = var.avi_pool.pool_name
  ssl_profile_ref = data.avi_sslprofile.avi_sslprofile.id
  ssl_key_and_certificate_ref = data.avi_sslkeyandcertificate.key.id
  health_monitor_refs = [ data.avi_healthmonitor.https_monitor.id ]
  lb_algorithm = var.avi_pool.lb_algorithm
  tier1_lr = var.tier1_lr
  servers {
    hostname              = var.avi_pool.server1_ip
    ratio                 = 1
    enabled               = true
    resolve_server_by_dns = false
    ip {
      addr = var.avi_pool.server1_ip
      type = "V4"
    }
  }
  servers {
    hostname              = var.avi_pool.server2_ip
    ratio                 = 1
    enabled               = true
    resolve_server_by_dns = false
    ip {
      addr = var.avi_pool.server2_ip
      type = "V4"
    }
  }
  analytics_policy {
    enable_realtime_metrics = true
  }
}

resource "avi_vsvip" "avi_vsvip" {
  name = var.avi_vsvip.vip_name
  vip {
    vip_id = "0"
    ip_address {
      type = "V4"
      addr = var.avi_vsvip.vip_ip
    }
  }
  cloud_ref    = data.avi_cloud.avi_cloud.id
  tenant_ref   = var.avi_tenant
  tier1_lr = var.tier1_lr
}

resource "avi_virtualservice" "https_vs" {
  name                           = var.avi_vs.vs_name
  pool_ref                       = avi_pool.pool_vs.id
  tenant_ref                     = var.avi_tenant
  vsvip_ref                      = avi_vsvip.avi_vsvip.id
  cloud_ref                      = data.avi_cloud.avi_cloud.id
  application_profile_ref        = data.avi_applicationprofile.application_profile.id
  network_profile_ref            = data.avi_networkprofile.network_profile.id
  se_group_ref = data.avi_serviceenginegroup.avi_se_group.id
  services {
    port           = var.avi_vs.vs_http_port
    port_range_end = var.avi_vs.vs_http_port
    enable_ssl     = false
  }
  services {
    port           = var.avi_vs.vs_https_port
    port_range_end = var.avi_vs.vs_https_port
    enable_ssl     = true
  }
  analytics_policy {
    metrics_realtime_update {
      enabled  = true
      duration = 0
    }
    full_client_logs {
      enabled = true
      duration = 0
    }
  }
  http_policies {
    index = 11
    http_policy_set_ref = avi_httppolicyset.avi_httppolicyset.id
  }
}

