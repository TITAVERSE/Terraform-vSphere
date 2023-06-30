##### Getting data from vsphere ####
data "vsphere_datacenter" "dc" {
  name = var.vsphere_dc
}