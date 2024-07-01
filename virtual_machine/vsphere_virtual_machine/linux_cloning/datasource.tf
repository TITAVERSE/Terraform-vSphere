##### Getting data from vsphere ####
data "vsphere_datacenter" "dc" {
  name = var.vsphere_dc
}

data "vsphere_compute_cluster" "cls_hosts" {
  name          = var.vsphere_cls_host
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_datastore" "datastore" {
  name          = var.vsphere_ds
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_network" "network" {
  name          = var.vsphere_network
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_virtual_machine" "template" {
  name          = var.vm_template
  datacenter_id = data.vsphere_datacenter.dc.id
}

#data "vsphere_tag_category" "category" {
#  name = var.tag_category
#}

#data "vsphere_tag" "tag" {
#  name        = var.vm_tags
#  category_id = data.vsphere_tag_category.category.id
#}