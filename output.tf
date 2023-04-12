output "vm_private_ip" {
  value = [
    for nic in data.vsphere_network.vm_nic :
    nic.ipv4_address
  ]
}