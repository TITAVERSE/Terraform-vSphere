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

### Metadata
variable "vm_tags" {
  type = list(object({
    category_name = string
    tag_name      = string
  }))
  default = [{
    category_name = "provisioner"
    tag_name      = "terraform"

    },
    {
      category_name = "status"
      tag_name      = "prod"
    },
    {
      category_name = "customer"
      tag_name      = "ttv"
    }
  ]
}

variable "custom_attribute" {
  default     = true
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

variable "vsphere_resource_pool" {
  type        = string
  description = "Ressource pool for VM"
  default     = ""
  nullable    = true
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
  description = "Number of core per cpu"
  default     = 1
  validation {
    condition     = var.vm_cpu_socket >= 1
    error_message = "The value of vmcount must be superior to 1"
  }
}

variable "vm_cpu_core" {
  type        = number
  description = "Number of socket"
  default     = 2
  validation {
    condition     = var.vm_cpu_core >= 1
    error_message = "The value of vmcount must be superior to 1"
  }
}

variable "vm_ram" {
  type        = number
  description = "Quantity of RAM in GB"
  default     = 4
  validation {
    condition     = var.vm_ram > 0
    error_message = "The value of vm_ram must be between 0"
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

variable "vm_networks" {
  description = "Network interfaces to attach to the VM"
  type = list(object(
    {
      network         = string
      vm_ipv4_address = string
      vm_ipv4_netmask = number

    }
  ))
  default = [
    {
      network         = "VM Network"
      vm_ipv4_address = "10.0.0.1"
      vm_ipv4_netmask = 24
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

variable "vm_ipv4_gateway" {
  type        = string
  description = "IPv4 address of the Gateway"
  default     = "10.0.0.253"
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
  default     = "Africa/Nairobi"
}

variable "wait_for_guest_net_timeout" {
  type        = number
  description = "timeout for networking"
  default     = 0
}