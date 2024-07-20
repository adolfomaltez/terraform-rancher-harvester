variable "namespace" {
  description = "Project namespace"
  type = string
  default = "default"
}

variable "harbor_url" {
  description = "harbor URL"
  default     = "https://harbor.192-168-31-81.sslip.io/"
}

variable "harbor_admin_user" {
  description = "harbor admin username"
  default     = "admin"
}

variable "harbor_admin_password" {
  description = "harbor admin password"
  default     = "Harbor12345"
}
