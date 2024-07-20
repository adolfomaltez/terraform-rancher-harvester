# Terraform management for Rancher/Harvester/Harbor infrastructure

Creating kubernetes clusters using Rancher, Harvester and Harbor.


## Rancher
Create the API token and replace the URL and token on variables.tf
```sh
cd rancher
terraform init
terraform apply
```

## Harbor
Replace the URL, user and password on variables.tf
```sh
cd harbor
terraform init
terraform apply
```
## Harvester
Get the kubeconfig file from the GUI and put (or change) on file /home/vagrant/harvester-01.yaml
```sh
cd harvester
terraform init
terraform apply
```
