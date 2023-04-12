### vCenter access ###
variable "vsphere_vcenter" {
  description = "VMWare vCenter server FQDN / IP"
}

variable "vsphere_username" {
  description = "vSphere username"
  sensitive   = true
}

variable "vsphere_password" {
  description = "vsphere user password"
  sensitive   = true
}

### Datacenter ####
variable "vsphere_datacenter" {
  description = ""
  default     = ""
}

variable "vm_datastore" {
  type        = string
  description = ""
  default     = ""
}

variable "vm_network" {
  description = ""
  default     = ""
}

### VM Specs ###

variable "vmname" {
  type        = string
  description = "Name of the VM"
  default     = "STX-VM-POC-TRF"
}

variable "vm_cpu_socket" {
  type        = number
  description = "Number of socket cpu"
  default     = 1
  validation {
    condition     = var.vm_cpu_socket >= 1 && var.vm_cpu_socket <= 4
    error_message = "The value of vmcount must be between 1 and 5."
  }
}

variable "vm_cpu_core" {
  type        = number
  description = "Number of core per cpu"
  default     = 1
  validation {
    condition     = var.vm_cpu_core >= 1 && var.vm_cpu_core <= 4
    error_message = "The value of vm_cpu_core must be between 1 and 4."
  }
}

variable "vm_ram" {
  type        = number
  description = "Quantity of RAM in GB"
  default     = 4
  validation {
    condition     = var.vm_ram >= 4 && var.vm_ram <= 128
    error_message = "The value of vm_ram must be between 1 and 4."
  }
}

variable "vm_dns_servers" {
  type        = list(string)
  description = "List of DNS servers"
  default     = ["8.8.8.8", "8.8.4.4", "1.1.1.1"]
}

variable "vm_ipv4_address" {
  type        = string
  description = "IPv4 addresses for a vm"
}

variable "vm_ipv4_gateway" {
  type        = string
  description = "IPv4 address of the Gateway"
}

variable "vm_ipv4_netmask" {
  type        = string
  description = "Netmask"
}

variable "vm_public_key" {
  type        = string
  description = "Public key to be used to ssh into a machine"
  default     = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDR5IBKXMaxdiOt/p0lKX/cl4li5sEfCGoNZ2IrsPojUsM8szWii+4A9ZiOmwYPBgdd6HF5bXFH5nDUMexMpFVjIRR6wpQ1Mvh4lnOmFz3v0bHDmovxpnk1cYHkDGaIo1zWzLwSR3/DLeNDv5pmHUUz5ZF7M3NkpgILWYjus2y8Vuwxwn6uXHpzFuxc2J+KA0HlKKGfgCb026AejEtwf4J/NVOpEndwck1DkBw3jNQtaqVUEReAvCVJnehQzAfnQmbg7VTvWPxftwX+Ml64O04hmbui2Qgv6CePYB91GtzKgDubzAHfWduD3E9ju1/9h9aVFgLJRS9AGlS6j7l2xekZ2qVivkeGwzcNg9neA1DGDssVYszWfOABNV18VLLWIko8HolETAr+/YImTXTVXRaRbjkaGMdiNssOVbBzaNf+42HqA/DmrNO8UV8VWvirb1ai3yeHTU6DYHsnS85rC846KCyQcC1McBQpRcIHCNXqS7rG3TTTofyiMfHNHuJbwj4lPBx2ZhyiWtLxwVQQEWft4GKaCQmPzKR8Qt6Aj5rYwq+pilF3T2du7y5Iz6Q/1y3y0xH/7hA4iKpj82nRBGuwIagfDivzqmx3vzaDBaBOLQoLLvnWunkkuqSxuK+4jAWJrPOQjR6KRbKsUHL7FqeCu0CMW1mj7QBsEO10+E4WIw== stxtra@IX0035-PC"
}

variable "vm_lin_ssh_username" {
  type      = string
  sensitive = true
  default   = "sam"
}

variable "vsphere_cluster" {
  type        = string
  description = ""
}

variable "vmcount" {
  type        = number
  description = "number of VM to create"
  default     = 1
  validation {
    condition     = var.vmcount >= 1 && var.vmcount <= 4
    error_message = "The value of vmcount must be between 1 and 4."
  }
}