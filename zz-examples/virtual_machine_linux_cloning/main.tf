module "virtual_machines" {
  source = "../virtual_machine/vsphere_virtual_machine/linux_cloning" #adjust to the path of the repo

  ## vCenter Access
  vsphere_vcenter  = var.vsphere_vcenter
  vsphere_username = var.vsphere_username
  vsphere_password = var.vsphere_password

  for_each = local.virtual_machines

  ### Datacenter
  vsphere_dc            = each.value.vsphere_dc
  vsphere_cls_host      = each.value.vsphere_cls_host
  vsphere_resource_pool = each.value.vsphere_resource_pool
  vsphere_ds            = each.value.vsphere_ds
  vsphere_network       = each.value.network_name

  ### Enveloppe
  vm_hostname   = each.value.host_name
  vm_name       = each.value.vm_name
  vm_firmware   = each.value.vm_firmware
  vm_cpu_socket = each.value.num_cpus
  vm_cpu_core   = each.value.num_cores_per_socket
  vm_ram        = each.value.memory
  vm_tags = [
    for tag in each.value.vm_tags :
    {
      category_name =tag["category_name"]
      tag_name = tag["tag_name"]
    }
  ]
  vm_disks = [
    for disk in each.value.disks : {
      size        = disk["size"]
      unit_number = disk["unit_number"]
    }
  ]
  vsphere_folder = each.value.vsphere_folder

  ### OS
  template_folder = each.value.template_folder
  vm_template     = each.value.vm_template
  vm_time_zone    = each.value.time_zone
  vm_ipv4_address = each.value.ipv4_address
  vm_ipv4_netmask = each.value.ipv4_netmask
  vm_ipv4_gateway = each.value.ipv4_gateway
  vm_ipv4_ns      = each.value.dns_server_list
}

output "ipv4_addresses" {
  value     = [for vm in module.virtual_machines : vm.vm_linux_information.guest_ip_addresses[0]]
  sensitive = false
}