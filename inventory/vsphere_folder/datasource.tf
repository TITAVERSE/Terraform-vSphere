##### Getting data from vsphere ####
data "vsphere_datacenter" "dc" {
  name = var.vsphere_dc
}

data "vsphere_tag_category" "tag_categories" {
  count = length(var.vm_tags) #for each tag retreive its category
  name  = var.vm_tags[count.index].category_name
}

data "vsphere_tag" "tags" {
  count       = length(var.vm_tags) #match the data to the number of tag
  name        = var.vm_tags[count.index].tag_name
  category_id = data.vsphere_tag_category.tag_categories[count.index].id
}