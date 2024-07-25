locals {
  virtual_machines = {
    ###########################" CUST ########################################
    "MYVM1" = {
      ## Datacenter
      vsphere_dc            = "MyDC"
      vsphere_cls_host      = "hostclusterName" #CLUSTER 3 or CLUSTER 2 
      vsphere_resource_pool = "RPName"
      vsphere_ds            = "DSName"    #Datastore
      network_name          = "N-DVS-DVSName" #Segment/vlan
      ## Skeleton
      host_name            = "MYVM1"
      vm_name              = "MYVM1"
      vm_firmware          = "efi"
      num_cpus             = 4
      num_cores_per_socket = 2
      memory               = 8
      disks = {
        vm_disk_1 = {
          size        = 250
          unit_number = 0
        }
      }
      template_folder = "VM-Templates-Folder"
      vsphere_folder  = "VM-Folder" #Need to be created first
      vm_tags = { # each tag needs to be available before creation
        vm_tag_1 = {
          category_name = "status"
          tag_name = "prod"
        }
        vm_tag_2 = {
          category_name = "customer"
          tag_name = "customer_tag"
        }
      }

      ## OS Setting
      vm_template = "MyTemplate"
      ### System
      time_zone = "Europe/Moscow"
      ### Networking
    }
  }
}