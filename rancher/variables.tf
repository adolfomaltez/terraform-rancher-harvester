variable "namespace" {
  description = "Project namespace"
  type = string
  default = "default"
}

variable "api_url" {
  description = "rancher api url"
  default     = "https://rancher.192-168-31-81.sslip.io/v3"
}

variable "token_key" {
  description = "token for Rancher API rancher.192-168-31-81.sslip.io"
  default     = "token-aaaaa:aaaaaaaa"
}
