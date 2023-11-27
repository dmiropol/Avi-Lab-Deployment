data "avi_sslprofile" "avi_sslprofile" {
  name = var.avi_pool.avi_sslprofile
}

data "avi_sslkeyandcertificate" "key" {
  name = var.avi_pool.avi_ssl_key
}

data "avi_healthmonitor" "https_monitor" {
  name = var.avi_pool.avi_healthmonitor 
}

data "avi_applicationprofile" "application_profile" {
  name = var.avi_vs.application_profile
}

data "avi_networkprofile" "network_profile" {
  name = var.avi_vs.network_profile 
}

data "avi_cloud" "avi_cloud" {
  name = var.avi_cloud_name
}

data "avi_serviceenginegroup" "avi_se_group" {
  name = var.segroup_name
  cloud_ref = var.avi_cloud_name
}
