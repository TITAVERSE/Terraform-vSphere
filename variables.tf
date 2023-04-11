### vCenter access ###
variable "vsphere_url" {
  description = ""
}

variable "vsphere_username" {
  description = ""
}

variable "vsphere_password" {
  description = ""
  sensitive   = true
}

### Datacenter ####
variable "vsphere_datacenter" {
  description = ""
  default     = ""
}

variable "vm_datastore" {
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
    condition     = var.vm_cpu_core >= 4 && var.vm_cpu_core <= 128
    error_message = "The value of vm_ram must be between 1 and 4."
  }
}

variable "vmcount" {
  type        = number
  description = "number of VM to create"
  default     = 1
  validation {
    condition     = var.vmcount >= 1 && var.vmcount <= 5
    error_message = "The value of vmcount must be between 1 and 5."
  }
}