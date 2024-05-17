# Creation of 1 tag category
resource "vsphere_tag_category" "category" {
  name = var.cat_name
  description = var.cat_description
  cardinality = var.cat_cardinality
  associable_types = var.cat_associable_types
}