### vCenter access ###
variable "vsphere_vcenter" {
  type        = string
  description = "VMWare vCenter server FQDN / IP"
}

variable "vsphere_username" {
  type        = string
  description = "vSphere username"
  sensitive   = true
}

variable "vsphere_password" {
  description = "vsphere user password"
  type        = string
  sensitive   = true
}

### Customer Information
variable "cust_trigramm" {
  description = "Trigramme du client"
  type        = string
  default     = "TTV"
}

### Metadata
variable "tag_name" {
  type = string
  default = true
  description = "vSphere tag for this VM"
  nullable = true
}

variable "tag_category" {
  type = string
  default = ""
  description = "vSphere tag category"
  nullable = true
}

variable "custom_attribute" {
  default = true
  description = "custom attributes to pu on VM"
  nullable    = true
}

### Datacenter ####
variable "vsphere_dc" {
  type        = string
  description = "Datacenter name in vSphere"
  default     = ""
}

variable "vsphere_cls_host" {
  type        = string
  description = "Cluster name in a Datacenter"
  default     = ""
}

variable "vsphere_host" {
  type        = string
  description = "ESXi host"
  default     = ""
}

variable "vsphere_ds" {
  type        = string
  description = "Datastore name"
  default     = ""
}

variable "vsphere_network" {
  type        = string
  description = "Network name in vCenter"
  default     = "VM Network"
}

variable "vsphere_folder" {
  type    = string
  default = "Discovered virtual machines"
}

### VM Specs ###

variable "vm_name" {
  type        = string
  description = "VM Name"
  default     = "STXVM"
}

variable "vm_hostname" {
  type        = string
  description = "VM's hostname"
  default     = "localhost"
}

variable "vm_firmware" {
  type        = string
  description = "efi or bios"
  default     = "efi"
}

variable "vm_cpu_socket" {
  type        = number
  description = "Number of socket cpu"
  default     = 1
  validation {
    condition     = var.vm_cpu_socket >= 1 && var.vm_cpu_socket <= 64
    error_message = "The value of vmcount must be between 1 and 32."
  }
}

variable "vm_cpu_core" {
  type        = number
  description = "Number of core per cpu"
  default     = 2
  validation {
    condition     = var.vm_cpu_core >= 1 && var.vm_cpu_core <= 16
    error_message = "The value of vm_cpu_core must be between 1 and 32."
  }
}

variable "vm_ram" {
  type        = number
  description = "Quantity of RAM in GB"
  default     = 4
  validation {
    condition     = var.vm_ram >= 4 && var.vm_ram <= 128
    error_message = "The value of vm_ram must be between 2 and 128."
  }
}


variable "vm_disks" {
  description = "Configuration of one (1) disk"
  type = list(object({
    size        = number
    unit_number = number
  }))
  default = [
    {
      size        = 50
      unit_number = 0
    },
    {
      size        = 100
      unit_number = 1
    }
  ]
}


variable "vm_ipv4_ns" {
  description = "Name servers IP"
  type        = list(string)
  default     = ["8.8.8.8", "8.8.4.4"]
}

variable "vm_dns_suffixes" {
  description = "DNS suffixes"
  type        = string
  default     = ""
  nullable    = true
}

variable "vm_ipv4_address" {
  type        = string
  description = "IPv4 addresses for a vm"
  default     = "192.168.1.1"
}

variable "vm_ipv4_gateway" {
  type        = string
  description = "IPv4 address of the Gateway"
  default     = "192.168.1.254"
}

variable "vm_ipv4_netmask" {
  type        = string
  description = "Netmask"
  default     = 24
}

variable "vm_public_key" {
  type        = string
  description = "Public key to be used to ssh into a machine"
  default     = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDR5IBKXMaxdiOt/p0lKX/cl4li5sEfCGoNZ2IrsPojUsM8szWii+4A9ZiOmwYPBgdd6HF5bXFH5nDUMexMpFVjIRR6wpQ1Mvh4lnOmFz3v0bHDmovxpnk1cYHkDGaIo1zWzLwSR3/DLeNDv5pmHUUz5ZF7M3NkpgILWYjus2y8Vuwxwn6uXHpzFuxc2J+KA0HlKKGfgCb026AejEtwf4J/NVOpEndwck1DkBw3jNQtaqVUEReAvCVJnehQzAfnQmbg7VTvWPxftwX+Ml64O04hmbui2Qgv6CePYB91GtzKgDubzAHfWduD3E9ju1/9h9aVFgLJRS9AGlS6j7l2xekZ2qVivkeGwzcNg9neA1DGDssVYszWfOABNV18VLLWIko8HolETAr+/YImTXTVXRaRbjkaGMdiNssOVbBzaNf+42HqA/DmrNO8UV8VWvirb1ai3yeHTU6DYHsnS85rC846KCyQcC1McBQpRcIHCNXqS7rG3TTTofyiMfHNHuJbwj4lPBx2ZhyiWtLxwVQQEWft4GKaCQmPzKR8Qt6Aj5rYwq+pilF3T2du7y5Iz6Q/1y3y0xH/7hA4iKpj82nRBGuwIagfDivzqmx3vzaDBaBOLQoLLvnWunkkuqSxuK+4jAWJrPOQjR6KRbKsUHL7FqeCu0CMW1mj7QBsEO10+E4WIw== stxtra@IX0035-PC"
}

variable "vm_lin_ssh_username" {
  type      = string
  sensitive = true
  default   = "admin-stx"
}

variable "vm_template" {
  description = "VM Template name in vSphere"
  type        = string
}

variable "template_folder" {
  description = "vSphere folder containing Templates"
  type        = string
}

variable "customer_domain_name" {
  description = "Local domain AD/LDAP"
  type        = string
  default     = ""
}

variable "guest_OS" {
  description = "OS to install, Linux, Windows, FreeBSD"
  nullable    = true
  default     = ""
}

variable "cpu_hot_add_remove" {
  type        = bool
  description = "Enable adding/removing CPU while Powered on. Enabling/disabling this setup requires reboot."
  default     = true
}

variable "ram_hot_add" {
  type        = bool
  description = "Enable adding RAM while Powered on. Enabling/disabling this setup requires reboot."
  default     = true
}

variable "vm_time_zone" {
  type        = string
  description = "Timezone of the VM"
  default     = "Europe/Moscow"
}

variable "wait_for_guest_net_timeout" {
  type        = number
  description = "timeout for networking"
  default     = 0
}