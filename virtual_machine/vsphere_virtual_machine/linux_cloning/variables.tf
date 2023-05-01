### Customer Information
variable "cust_trigramm" {
  description = "Trigramme du client"
  type        = string
  default     = "STX"
}

### Metadata
variable "tags" {
  nullable = true
}

variable "custom_attribute" {
  nullable = true
}

### Datacenter ####
variable "vsphere_datacenter" {
  type        = string
  description = "Datacenter name in vSphere"
  default     = ""
}

variable "vsphere_cluster_host" {
  type        = string
  description = "Cluster name in a Datacenter"
  default     = ""
}

variable "vsphere_host" {
  type        = string
  description = "ESXi host"
  default     = ""
}

variable "vsphere_cluster_datastore" {
  type        = string
  description = "Datastore cluster name"
  default     = "STXLABCLDVMFS001"
}

variable "vsphere_datastore" {
  type        = string
  description = "Datastore Name in vSphere"
  default     = ""
  /*validation {
    condition     = var.vsphere_cluster_datastore == "" && var.vsphere_datastore == ""
    error_message = "Please provide either 'Cluster Datastore' or 'Datastore' name"
  }*/
}

variable "vsphere_network" {
  type        = string
  description = "Network name in vCenter"
  default     = "VM Network"
}

### VM Specs ###

variable "vm_hostname" {
  type        = string
  description = "VM's hostname"
  default     = "localhost"
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
    condition     = var.vm_ram >= 2 && var.vm_ram <= 128
    error_message = "The value of vm_ram must be between 2 and 128."
  }
}
/*
variable "vm_disk_config" {
  description = "Configuration of One disk"
  type = object({
    size = number
    type = string
  })
}
*/

variable "vm_disks" {
  description = "Configuration of One disk"
  type = list(object({
    size        = number
    type        = string
    unit_number = number
  }))
  default = [
    {
      size        = 50
      type        = "HDD"
      unit_number = 0
    },
    {
      size        = 100
      type        = "SSD"
      unit_number = 1
    }
  ]
}


variable "vm_ipv4_ns" {
  description = "Liste des serveurs DNS"
  type        = list(string)
  default     = ["8.8.8.8", "8.8.4.4"]
}

variable "vm_dns_suffixes" {
  description = "DNS suffixes"
  type        = string
  default     = "stxlab.local"
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
  default   = "stxadmin"
}

variable "vm_template" {
  description = "Nom du template sur vSphere"
  type        = string
}

variable "template_folder" {
  description = "dossier contenant les templates de VM"
  type        = string
}

variable "customer_domain_name" {
  description = "Local domain AD/LDAP"
  type        = string
  default     = "stxlab.local"
}

variable "guest_OS" {
  description = "OS to install, Linux, Windows, MacOS"
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
  description = "timeout fo networking"
  default     = 0
}