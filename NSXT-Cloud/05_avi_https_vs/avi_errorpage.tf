/* 
data "avi_errorpagebody" "default_error_page" {
  name = "Custom-Error-Page"
}

resource "avi_errorpageprofile" "cop_errorpage" {
  name = "CoP-Error-Page"
 error_pages {
    enable              = true
    error_page_body_ref = data.avi_errorpagebody.default_error_page.id
    index               = 0

    match {
      match_criteria = "IS_IN"
      status_codes = [
        400,
        401,
        403,
        503,
      ]
    }
  }
}
 */