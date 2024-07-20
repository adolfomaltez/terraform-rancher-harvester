
#resource "harvester_image" "k3os" {
#  name      = "k3os"
#  namespace = "default"
#  display_name = "k3os"
#  source_type  = "download"
#  url          = "https://github.com/rancher/k3os/releases/download/v0.20.6-k3s1r0/k3os-amd64.iso"
#}

#resource "harvester_image" "opensuse-leap-15-5" {
#  name = "opensuse-leap-15-5"
#  namespace = "default"
#  display_name = "openSUSE Leap 15.5"
#  source_type = "download"
#  url = "https://download.opensuse.org/repositories/Cloud:/Images:/Leap_15.5/images/openSUSE-Leap-15.5.x86_64-NoCloud.qcow2"
#  tags = {"format"= "qcow2","qemu_gest_agent_enabled"="true"}
#}   

resource "harvester_image" "opensuse-leap-15-6" {
  name = "opensuse-leap-15-6"
  namespace = "default"
  display_name = "opensuse-leap-15-6"
  source_type = "download"
  url = "http://192.168.31.13:8088/Downloads/images/openSUSE-Leap-15.6.x86_64-NoCloud.qcow2"
  #url = "https://download.opensuse.org/repositories/Cloud:/Images:/Leap_15.5/images/openSUSE-Leap-15.5.x86_64-NoCloud.qcow2"
  tags = {"format"= "qcow2","qemu_gest_agent_enabled"="true"}
}

resource "harvester_image" "debian-12" {
  name = "debian-12"
  namespace = "default"
  display_name = "debian-12"
  source_type = "download"
  url = "http://192.168.31.13:8088/Downloads/images/debian-12-nocloud-amd64.qcow2"
  #url = "https://gemmei.ftp.acc.umu.se/images/cloud/bookworm/latest/debian-12-nocloud-amd64.qcow2"
  tags = {"format"= "qcow2","qemu_gest_agent_enabled"="true"}
}

resource "harvester_image" "almalinux-9-4" {
  name = "almalinux-9-4"
  namespace = "default"
  display_name = "almalinux-9-4"
  source_type = "download"
  #url = "https://repo.almalinux.org/almalinux/9/cloud/x86_64/images/AlmaLinux-9-GenericCloud-9.4-20240507.x86_64.qcow2"
  url = "http://192.168.31.13:8088/Downloads/images/AlmaLinux-9-GenericCloud-9.4-20240507.x86_64.qcow2"
  tags = {"format"= "qcow2","qemu_gest_agent_enabled"="true"}
}
