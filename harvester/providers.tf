terraform {
  required_providers {
    harvester = {
      source = "harvester/harvester"
      version = "0.6.4"
    }
  }
}

provider "harvester" {
  # Needs full path (local) to kubeconfig file provided by Harvester
  kubeconfig = var.harvester_kubeconfig_path
}
