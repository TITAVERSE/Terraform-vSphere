### vCenter access ###
variable "vsphere_vcenter" {
  type        = string
  description = "VMWare vCenter server FQDN / IP"
  nullable = false
}

variable "vsphere_username" {
  type        = string
  description = "vSphere username"
  sensitive   = true
  nullable = false
}

variable "vsphere_password" {
  description = "vsphere user password"
  type        = string
  sensitive   = true
  nullable = false
}

## vSphere tag category

variable "cat_name" {
  description = "Name of the tag cateogry"
  nullable = false
}

variable "cat_cardinality" {
  nullable = false
  type = string
  description = "Can an object have multiple tag from this category ?"
  validation {
    condition     = var.cat_cardinality == "SINGLE" || var.cat_cardinality == "MULTIPLE"
    error_message = "The cardinalty needs to be SINGLE or MULTIPLE"
  }

}

variable "cat_description" {
  type = string
  description = "Description of the category"
  nullable = true
}

variable "cat_associable_types" {
  nullable = false
  type = list(string)
  description = "Associable object to this category"
}