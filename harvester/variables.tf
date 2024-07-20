variable "harvester_kubeconfig_path" {
  description = "Harvester cluster Kubeconfig file name with full path"
  type        = string
  default     = "/home/vagrant/harvester-01.yaml"
}

variable "harvester_ssh_key" {
  description = "Harvester public key"
  type        = string
  default     = "ssh-rsa AAAAAAAA=="
}
