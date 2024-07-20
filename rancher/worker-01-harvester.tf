# Get imported harvester cluster info
data "rancher2_cluster_v2" "harvester-01" {
  name = "harvester-01"
}

# Create a new Cloud Credential for an imported Harvester cluster
resource "rancher2_cloud_credential" "harvester-01-terraform-credential" {
  name = "harvester-01-terraform-credential"
  harvester_credential_config {
    cluster_id = data.rancher2_cluster_v2.harvester-01.cluster_v1_id
    cluster_type = "imported"
    kubeconfig_content = data.rancher2_cluster_v2.harvester-01.kube_config
  }
}

# Create a new rancher2 machine config v2 using harvester node_driver
resource "rancher2_machine_config_v2" "pool" {
  generate_name = "pool"
  fleet_namespace = "fleet-default"
  harvester_config {
    vm_namespace = "default"
    cpu_count = "4"
    memory_size = "8"
    disk_info = <<EOF
    {
        "disks": [{
            "imageName": "default/image-p6flp",
            "size": 40,
            "bootOrder": 1
        }]
    }
    EOF
    network_info = <<EOF
    {
        "interfaces": [{
            "networkName": "default/mgmt-0103-worker03"
            },
            {
            "networkName": "default/mgmt-0104-worker04"
        }]
    }
    EOF
    ssh_user = "opensuse"
    user_data = <<EOF
    #cloud-config
    package_update: true
    packages:
      - qemu-guest-agent
    runcmd:
      - - systemctl
        - enable
        - '--now'
        - qemu-guest-agent.service
    password: password
    chpasswd: { expire: False }
    ssh_pwauth: True
    ssh_authorized_keys:
      - >-
        ssh-rsa AAAAAAA=
    ca_certs:
      trusted:
      - |
       -----BEGIN CERTIFICATE-----
       AAAAAAAAAAAAAA==
       -----END CERTIFICATE-----
       -----BEGIN CERTIFICATE-----
       AAAAAAAAAAAAAA==
       -----END CERTIFICATE-----
       -----BEGIN CERTIFICATE-----
       AAAAAAAAAAAAAA==
       -----END CERTIFICATE-----
    write_files:
    - content: |
        -----BEGIN CERTIFICATE-----
        AAAAAAAAAAAAAAAAAA==
        -----END CERTIFICATE-----
      path: /etc/docker/certs.d/harbor.192-168-31-81.sslip.io/ca.crt
    EOF
    network_data = <<EOF
    network:
      version: 1
      config:
        - type: physical
          name: eth0
          subnets:
              - type: dhcp
        - type: physical
          name: eth1
          subnets:
              - type: dhcp
        - type: nameserver
          address:
            - 8.8.8.8
    EOF
  }
}

resource "rancher2_cluster_v2" "worker-01" {
  name = "worker-01"
  annotations = {
    "field.cattle.io/description" = "worker-01"
  }
  kubernetes_version = "v1.28.10+rke2r1"
  #fleet_namespace = "fleet-default"
  rke_config {
    machine_pools {
      name = "pool"
      cloud_credential_secret_name = rancher2_cloud_credential.harvester-01-terraform-credential.id
      control_plane_role = true
      etcd_role = true
      worker_role = true
      quantity = 3
      machine_config {
        kind = rancher2_machine_config_v2.pool.kind
        name = rancher2_machine_config_v2.pool.name
      }
    }
    
    machine_selector_config {
      config = <<EOF
      system-default-registry: harbor.192-168-31-81.sslip.io
      cloud-provider-name: harvester
      EOF
    }
    
    registries {
      configs {
        hostname = "harbor.192-168-31-81.sslip.io"
        #auth_config_secret_name = "auth-config-secret-name"
        insecure = true
        #tls_secret_name = ""
        #ca_bundle = ""
      }
      mirrors {
          hostname = "*"
          endpoints = [
            "https://harbor.192-168-31-81.sslip.io/v2"
          ]            
          rewrites = {
            "(.*)" = "docker/$1"
          }
      }
    }
    machine_global_config = <<EOF
cni: "none"
disable-kube-proxy: false
etcd-expose-metrics: false
EOF
    upgrade_strategy {
      control_plane_concurrency = "10%"
      worker_concurrency = "10%"
    }
    etcd {
      snapshot_schedule_cron = "0 */5 * * *"
      snapshot_retention = 5
    }
    chart_values = <<EOF
harvester-cloud-provider:
  cloudConfigPath: /var/lib/rancher/rke2/etc/config-files/cloud-provider-config
  global:
    cattle:
      clusterName: worker-01
EOF
  }
}
