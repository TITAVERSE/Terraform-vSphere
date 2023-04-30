##### Getting data from vsphere ####
data "vsphere_datacenter" "dc" {
  name = var.vsphere_datacenter
}

data "vsphere_datastore_cluster" "cls_datastore" {
  name          = var.vsphere_cluster_datastore
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_compute_cluster" "cls_hosts" {
  name          = var.vsphere_cluster_host
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_network" "network" {
  name          = var.vsphere_network
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_virtual_machine" "template" {
  name          = "/${var.vsphere_datacenter}/vm/${var.template_folder}/${var.vm_template}"
  datacenter_id = data.vsphere_datacenter.dc.id
}