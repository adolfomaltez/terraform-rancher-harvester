terraform {
  required_providers {
    harbor = {
      source = "goharbor/harbor"
      version = "3.10.13"
    }
  }
}

provider "harbor" {
  url      = var.harbor_url
  username = var.harbor_admin_user
  password = var.harbor_admin_password
}
