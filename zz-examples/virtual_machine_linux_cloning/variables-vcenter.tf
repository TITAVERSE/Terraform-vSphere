variable "vsphere_vcenter" {
  type        = string
  description = "VMWare vCenter server FQDN / IP"
  nullable    = false
}

variable "vsphere_username" {
  type        = string
  description = "vSphere username"
  default     = "sa_terraform@vsphere.local"
  sensitive   = true
  nullable    = false
}

variable "vsphere_password" {
  description = "vsphere user password"
  type        = string
  sensitive   = true
  nullable    = false
}   