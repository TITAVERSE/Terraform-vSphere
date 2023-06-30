## Creating one (1) VM :
resource "vsphere_virtual_machine" "vm_linux" {
  resource_pool_id     = data.vsphere_compute_cluster.cls_hosts.resource_pool_id
  datastore_id = data.vsphere_datastore.datastore.id
  folder = '${var.vsphere_dc}'/'${var.vsphere_folder}'

  name                 = var.vm_name
  firmware = var.vm_firmware
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
    for_each = var.vm_disks
    content {
      label            = format("%s-disk-%d", var.vm_hostname, disk.value.unit_number)
      size             = disk.value.size != "" || disk.value.size <= data.vsphere_virtual_machine.template.disks.0.size ? disk.value.size : data.vsphere_virtual_machine.template.disks.0.size
      unit_number      = disk.value.unit_number
      thin_provisioned = data.vsphere_virtual_machine.template.disks.0.thin_provisioned
      eagerly_scrub    = data.vsphere_virtual_machine.template.disks.0.eagerly_scrub
    }
  }

  clone {
    template_uuid = data.vsphere_virtual_machine.template.id
    customize {
      linux_options {
        host_name = var.vm_hostname
        domain    = var.customer_domain_name
        time_zone = var.vm_time_zone
      }

      network_interface {
        ipv4_address = var.vm_ipv4_address
        ipv4_netmask = var.vm_ipv4_netmask
      }

      ipv4_gateway    = var.vm_ipv4_gateway
      dns_server_list = var.vm_ipv4_ns
    }
  }
  lifecycle {
    ignore_changes = [
      annotation
    ]
  }
}