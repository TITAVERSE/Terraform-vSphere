resource "vsphere_folder" "folder" {
  path = var.vsphere_folder_name
  type = var.vsphere_folder_type
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}