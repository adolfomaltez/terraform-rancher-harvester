# Proxy cache Registry
resource "harbor_project" "docker" {
  name        = "docker"
  public      = true
  registry_id = harbor_registry.docker.registry_id
}

resource "harbor_registry" "docker" {
  provider_name = "docker-hub"
  name          = "dockerhub"
  endpoint_url  = "https://hub.docker.com"
}
