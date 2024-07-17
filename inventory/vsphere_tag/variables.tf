### vCenter access ###
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

## vSphere tag

variable "tag_name" {
  description = "Name of the tag cateogry"
  type        = string
  nullable    = false
}

variable "tag_description" {
  type        = string
  description = "Description of the category"
  nullable    = true
}

# Category name is used by data
variable "cat_name" {
  description = "Name of the tag cateogry"
  nullable    = false
}