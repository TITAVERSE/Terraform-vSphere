##### Getting data from vsphere ####
data "vsphere_datacenter" "dc" {
  name = var.vsphere_dc
}

data "vsphere_compute_cluster" "cls_hosts" {
  name          = var.vsphere_cls_host
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_resource_pool" "resource_pool" {
  count = length(var.vsphere_resource_pool) > 0 ? 1 : 0 
  name = var.vsphere_resource_pool
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

data "vsphere_tag_category" "tag_categories" {
  count = length(var.vm_tags) #for each tag retreive its category
  name = var.vm_tags[count.index].category_name
}

data "vsphere_tag" "tags" {
  count = length(var.vm_tags) #match the data to the number of tag
  name = var.vm_tags[count.index].tag_name
  category_id = data.vsphere_tag_category.tag_categories[count.index].id
}