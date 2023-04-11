##### Getting data from vsphere ####
data "vsphere_datacenter" "dc" {
  name = var.vsphere_datacenter
}
data "vsphere_datastore" "datastore" {
  name          = var.vm_datastore
  datacenter_id = data.vsphere_datacenter.dc.id
}
data "vsphere_compute_cluster" "cluster" {
  name          = var.vsphere-cluster
  datacenter_id = data.vsphere_datacenter.dc.id
}
/*
data "vsphere_network" "network" {
  name          = var.vm_network
  datacenter_id = data.vsphere_datacenter.dc.id
}
data "vsphere_virtual_machine" "template" {
  name          = "/${var.vsphere_datacenter}/vm/${var.vsphere-template-folder}/${var.vm-template-name}"
  datacenter_id = data.vsphere_datacenter.dc.id
}

*/

#### VM Creation ####
resource "vsphere_virtual_machine" "vm" {
  count = var.vmcount

  name                   = "var.vmname${count.index}"
  num_cpus               = var.vm_cpu_socket
  num_cores_per_socket   = var.vm_cpu_core
  memory                 = var.vm_ram
  cpu_hot_add_enabled    = false
  cpu_hot_remove_enabled = false



  /*network_interface {
    network_id   = data.vsphere_network.network.id
    adapter_type = data.vsphere_virtual_machine.template.network_interface_types[0]
  }

  disk {
    label            = "${var.vmname}-disk"
    thin_provisioned = data.vsphere_virtual_machine.template.disks.0.thin_provisioned
    eagerly_scrub    = data.vsphere_virtual_machine.template.disks.0.eagerly_scrub
    size             = var.disksize == "" ? data.vsphere_virtual_machine.template.disks.0.size : var.disksize
  }*/



  lifecycle {
    create_before_destroy = true
    ignore_changes = [
      annotation
    ]
  }
}