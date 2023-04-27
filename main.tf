##### Getting data from vsphere ####
data "vsphere_datacenter" "dc" {
  name = var.vsphere_datacenter
}
data "vsphere_datastore" "datastore" {
  name          = var.vsphere_datastore
  datacenter_id = data.vsphere_datacenter.dc.id
}
data "vsphere_compute_cluster" "cluster" {
  name          = var.vsphere_cluster
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

#### Create locals variables
locals {
  loc_ipv4_address = var.vm_ipv4_address
  loc_ipv4_ns      = var.vm_ipv4_ns
}

#### VM Creation ####
resource "vsphere_virtual_machine" "vm" {
  count                      = var.vmcount
  wait_for_guest_net_timeout = 0
  wait_for_guest_ip_timeout  = 0
  name                       = format("%s%03d", var.cust_trigramm, count.index + 1)
  num_cpus                   = var.vm_cpu_socket
  num_cores_per_socket       = var.vm_cpu_core
  memory                     = var.vm_ram * 1024
  cpu_hot_add_enabled        = true
  cpu_hot_remove_enabled     = true
  memory_hot_add_enabled     = true
  resource_pool_id           = data.vsphere_compute_cluster.cluster.resource_pool_id
  datastore_id               = data.vsphere_datastore.datastore.id
  guest_id                   = "ubuntu64Guest"
  /*  cdrom {
    datastore_id = data.vsphere_datastore.datastore.id
    path         = "/ISOs/ubuntu-22.04.2-live-server-amd64.iso"
  }
*/
  network_interface {
    network_id   = data.vsphere_network.network.id
    adapter_type = data.vsphere_virtual_machine.template.network_interface_types[0]
  }

  dynamic "disk" {
    for_each = var.vm_disk_config[count.index]
    content {
      label            = format("%s%03d$s", var.cust_trigramm, count.index + 1, "-disk")
      thin_provisioned = data.vsphere_virtual_machine.template.disks.0.thin_provisioned
      eagerly_scrub    = data.vsphere_virtual_machine.template.disks.0.eagerly_scrub
      size             = disk.value
    }
  }

  clone {
    template_uuid = data.vsphere_virtual_machine.template.id
    customize {
      linux_options {
        host_name = "${var.vmname}${count.index + 1}"
        domain    = var.customer_domain_name
      }
      network_interface {
        ipv4_address = local.loc_ipv4_address[count.index]
        ipv4_netmask = var.vm_ipv4_netmask
      }
      ipv4_gateway    = var.vm_ipv4_gateway
      dns_server_list = local.loc_ipv4_ns
    }
  }

  lifecycle {
    ignore_changes = [
      annotation
    ]
  }
}