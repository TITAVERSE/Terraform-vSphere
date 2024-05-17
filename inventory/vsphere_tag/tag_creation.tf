## Creation of 1 tag
resource "vsphere_tag" "tag" {
  name = var.tag_name
  category_id = "${data.vsphere_tag_category.category.id}"
  description = var.tag_description
}