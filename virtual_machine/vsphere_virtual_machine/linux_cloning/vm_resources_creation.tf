## Creating one (1) VM :
resource "vsphere_virtual_machine" "vm_linux" {
  name             = var.vm_hostname
  resource_pool_id = data.vsphere_resource_pool.pool.id
  datastore_id     = var.datastore_name != "" ? data.vsphere_datastore.datastores.id : data.vsphere_datastore_cluster.cls_datastore.datastore_ids[0]

  num_cpus               = var.vm_cpu_socket
  num_cores_per_socket   = var.vm_cpu_core
  memory                 = var.vm_ram * 1024
  guest_id               = data.vsphere_virtual_machine.template.guest_id
  cpu_hot_add_enabled    = var.cpu_hot_add_remove
  cpu_hot_remove_enabled = var.cpu_hot_add_remove
  memory_hot_add_enabled = var.ram_hot_add

  wait_for_guest_net_timeout = var.wait_for_guest_net_timeout
  network_interface {
    network_id   = data.vsphere_network.network.id
    adapter_type = data.vsphere_virtual_machine.template.network_interface_types[0]
  }

  dynamic "disk" {
    for_each = vm_disks
    content {
      label            = label            = format("%s-disk-%d", var.vm_hostname, disk.value.unit_number)
      size             = var.vm_disks["size"] != "" || var.vm_disks["size"] <= data.vsphere_virtual_machine.template.disks.0.size ? var.vm_disks["size"] : data.vsphere_virtual_machine.template.disks.0.size
      thin_provisioned = data.vsphere_virtual_machine.template.disks.0.thin_provisioned
      unit_number = var.vm_disks["unit_number"]
      eagerly_scrub    = data.vsphere_virtual_machine.template.disks.0.eagerly_scrub
      }
  }

  clone {
    template_uuid = data.vsphere_virtual_machine.template.id
    customize {
      linux_options {
        host_name = var.vm_name_prefix
        domain    = var.domain_name
        time_zone = var.vm_time_zone
      }

      network_interface {
        ipv4_address = var.vm_ipv4_address
        ipv4_netmask = var.vm_ipv4_netmask
      }

      ipv4_gateway    = var.ipv4_gateway
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