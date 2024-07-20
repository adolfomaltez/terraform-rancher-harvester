data "harvester_clusternetwork" "mgmt" {
  name = "mgmt"
}
#resource "harvester_clusternetwork" "cluster-vlan" {
#  name = "cluster-vlan"
#}


#resource "harvester_vlanconfig" "cluster-vlan" {
#  name = "cluster-vlan"
#  cluster_network_name = harvester_clusternetwork.cluster-vlan.name
#  uplink {
#    nics = [
#      #"eth5",
#      "ens5"
#    ]
#    bond_mode = "active-backup"
#    mtu       = 1500
#  }

##  node_selector = {
##    "kubernetes.io/hostname" : "node1"
##  }
#}


resource "harvester_network" "mgmt-0011-management" {
  name      = "mgmt-0011-management"
  namespace = "default"
  vlan_id = 11
  route_mode = "manual"
  route_cidr = "192.168.11.0/24"
  route_gateway = "192.168.11.1"
  #route_dhcp_server_ip = ""
  #cluster_network_name = harvester_clusternetwork.cluster-vlan.name
  cluster_network_name = data.harvester_clusternetwork.mgmt.name
#  depends_on = [
#    harvester_vlanconfig.cluster-vlan
#  ]
}

resource "harvester_network" "mgmt-0101-worker01" {
  name      = "mgmt-0101-worker01"
  # k8s worker-01 nodes
  namespace = "default"
  vlan_id = 101
  route_mode = "manual"
  route_cidr = "192.168.101.0/24"
  route_gateway = "192.168.101.1"
  cluster_network_name = data.harvester_clusternetwork.mgmt.name
}

resource "harvester_network" "mgmt-0102-worker02" {
  name      = "mgmt-0102-worker02"
  # k8s worker-02 nodes
  namespace = "default"
  vlan_id = 102
  route_mode = "manual"
  route_cidr = "192.168.102.0/24"
  route_gateway = "192.168.102.1"
  cluster_network_name = data.harvester_clusternetwork.mgmt.name
}


resource "harvester_network" "mgmt-0103-worker03" {
  name      = "mgmt-0103-worker03"
  # k8s worker-03 nodes
  namespace = "default"
  vlan_id = 103
  route_mode = "manual"
  route_cidr = "192.168.103.0/24"
  route_gateway = "192.168.103.1"
  cluster_network_name = data.harvester_clusternetwork.mgmt.name
}


resource "harvester_network" "mgmt-0104-worker04" {
  name      = "mgmt-0104-worker04"
  # k8s worker-04 nodes
  namespace = "default"
  vlan_id = 104
  route_mode = "manual"
  route_cidr = "192.168.104.0/24"
  route_gateway = "192.168.104.1"
  cluster_network_name = data.harvester_clusternetwork.mgmt.name
}


resource "harvester_network" "mgmt-0105-worker05" {
  name      = "mgmt-0105-worker05"
  # k8s worker-05 nodes
  namespace = "default"
  vlan_id = 105
  route_mode = "manual"
  route_cidr = "192.168.105.0/24"
  route_gateway = "192.168.105.1"
  cluster_network_name = data.harvester_clusternetwork.mgmt.name
}


resource "harvester_network" "mgmt-0145-antrea-external" {
  name      = "mgmt-0145-antrea-external"
  # Antrea CNI external
  namespace = "default"
  vlan_id = 145
  route_mode = "manual"
  route_cidr = "192.168.145.0/24"
  route_gateway = "192.168.145.1"
  cluster_network_name = data.harvester_clusternetwork.mgmt.name
}
