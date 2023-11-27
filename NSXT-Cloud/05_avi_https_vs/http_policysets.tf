resource "avi_httppolicyset" "avi_httppolicyset" {
  name       = "phoenix_app_http_policy"
  tenant_ref = var.avi_tenant
  http_security_policy {
    rules {
      name   = "HTTP redirect to HTTPS"
      enable = true
      index  = 1
      action {
        action     = "HTTP_SECURITY_ACTION_REDIRECT_TO_HTTPS"
        https_port = "443"
      }
      match {
        protocol {
          match_criteria = "IS_IN"
          protocols      = "HTTP"
        }
      }
    }
  }

  http_request_policy {
    rules {
      name   = "URL rewrite rule"
      enable = true
      index  = 1
      match {
        path {
          match_case           = "INSENSITIVE"
          match_criteria       = "EQUALS"
          match_decoded_string = true
          match_str            = ["/"]
        }
      }
      rewrite_url_action {
        path {
          tokens {
            str_value = "cgi-bin/app.py"
            type      = "URI_TOKEN_TYPE_STRING"
          }
          type = "URI_PARAM_TYPE_TOKENIZED"
        }
        query {
          keep_query = false
        }
      }
    }
  } 
}
