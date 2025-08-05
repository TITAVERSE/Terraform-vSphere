resource "vsphere_folder" "folder" {
  path = var.vsphere_folder_fullpath
  type = var.vsphere_folder_type
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}