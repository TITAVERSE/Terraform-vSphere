resource "vsphere_tag_category" "VM Tag" {
  name        = "Terraform"
  cardinality = "SINGLE"
  description = "Managed by Terraform"

  associable_types = [
    "VirtualMachine",
    "Datastore",
  ]
}

resource "vsphere_tag" "Terraform" {
  name        = "Terraform"
  category_id = "${vsphere_tag_category.category.id}"
  description = "Managed by Terraform"
}