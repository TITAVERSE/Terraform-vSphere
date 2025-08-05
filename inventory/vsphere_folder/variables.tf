## vCenter access ###
variable "vsphere_vcenter" {
  type        = string
  description = "VMWare vCenter server FQDN / IP"
  nullable    = false
}

variable "vsphere_username" {
  type        = string
  description = "vSphere username"
  sensitive   = true
  nullable    = false
}

variable "vsphere_password" {
  description = "vsphere user password"
  type        = string
  sensitive   = true
  nullable    = false
}

variable "vsphere_dc" {
  type        = string
  description = "Datacenter name in vSphere"
  default     = ""
}

variable "vsphere_folder_fullpath" {
  type = string
  description = "Folder name"
  nullable = false
}

variable "vsphere_folder_type" {
  type = string
  description = "Type of folder"
  default = "vm"
  nullable = false
  validation {
    condition = var.vsphere_folder_type == "datacenter" || var.vsphere_folder_type == "host" || var.vsphere_folder_type == "vm" || var.vsphere_folder_type == "datastore" || var.vsphere_folder_type == "network"
    error_message = "Only the following are supported : datacenter, host, vm, datastore, network."
  }
}