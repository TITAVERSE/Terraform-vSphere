## Creating one (1) VM :
resource "vsphere_virtual_machine" "vm_linux" {
  name             = "${var.vm_name_prefix}${count.index}"
  resource_pool_id = "${data.vsphere_resource_pool.pool.id}"
  datastore_id     = "${data.vsphere_datastore.ds.id}"

  num_cpus  = var.vm_cpu_socket
  num_cores_per_socket = var.vm_cpu_core
  memory                     = var.vm_ram * 1024
  guest_id = "${data.vsphere_virtual_machine.template.guest_id}"
  cpu_hot_add_enabled        = true
  cpu_hot_remove_enabled     = true
  memory_hot_add_enabled     = true

  wait_for_guest_net_timeout = "${var.wait_for_guest_net_timeout}"
  network_interface {
    network_id = "${data.vsphere_network.network.id}"
    adapter_type = data.vsphere_virtual_machine.template.network_interface_types[0]
  }

  disk {
    label            = "disk0"
    size             = "${var.disk_size != "" ? var.disk_size : data.vsphere_virtual_machine.template.disks.0.size}"
    thin_provisioned = data.vsphere_virtual_machine.template.disks.0.thin_provisioned
    eagerly_scrub    = data.vsphere_virtual_machine.template.disks.0.eagerly_scrub
  }

  clone {
    template_uuid = "${data.vsphere_virtual_machine.template.id}"
    customize {
      linux_options {
        host_name = "${var.vm_name_prefix}${count.index}"
        domain    = "${var.domain_name}"
        time_zone = "${var.time_zone != "" ? var.time_zone : "UTC"}"
      }

      network_interface {
        ipv4_address = "${var.ipv4_network_address != "0.0.0.0/0" ? cidrhost(var.ipv4_network_address, var.ipv4_address_start + count.index) : ""}"
        ipv4_netmask = "${var.ipv4_network_address != "0.0.0.0/0" ? element(split("/", var.ipv4_network_address), 1) : 0}"
      }

      ipv4_gateway    = "${var.ipv4_gateway}"
      dns_server_list = ["${var.dns_servers}"]
      dns_suffix_list = ["${var.domain_name}"]
    }
  }
  lifecycle {
    ignore_changes = [
      annotation
    ]
  }
}