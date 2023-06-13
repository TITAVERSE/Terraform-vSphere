##### Getting data from vsphere ####
data "vsphere_datacenter" "dc" {
  name = var.vsphere_datacenter
}

data "vsphere_compute_cluster" "cls_hosts" {
  name          = var.vsphere_cluster_host
  datacenter_id = data.vsphere_datacenter.dc.id
}

/*data "vsphere_datastore_cluster" "cls_datastore" {
  name          = var.vsphere_cluster_datastore
  datacenter_id = data.vsphere_datacenter.dc.id
}
*/

data "vsphere_datastore" "datastore" {
  name = var.vsphere_datastore
  datacenter_id = data.vsphere_datacenter.dc.id
}

/*data "vsphere_datastore" "datastores" {
  count = length(data.vsphere_datastore_cluster.cls_datastore.datastore)
  id    = data.vsphere_datastore_cluster.cls_datastore.datastore[count.index].id
}
*/
/*
# The datastore with the most free space
data "vsphere_datastore" "datastore_with_most_free_space" {
  count = var.datastore_name == "" && var.datastore_cluster_name != "" ? length(data.vsphere_datastore.datastores) : 0

  depends_on = [data.vsphere_datastore.datastores]

  filter {
    name                 = data.vsphere_datastore.datastores[count.index].name
    datastore_cluster_id = data.vsphere_datastore.datastores[count.index].datastore_cluster_id
  }

  sort_by {
    path  = "free_space"
    order = "DESC"
  }

  limit = 1
}
*/

data "vsphere_network" "network" {
  name          = var.vsphere_network
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_virtual_machine" "template" {
  name          = "/${var.vsphere_datacenter}/${var.template_folder}/${var.vm_template}"
  datacenter_id = data.vsphere_datacenter.dc.id
}