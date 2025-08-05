terraform {
  backend "s3" {
    endpoints = {
      s3 = "https://s3.amazon.aws" #need to add s3.stx.int.corp to DNS
    }
    bucket           = "s3-bucket-terraform-01"
    encrypt          = true
    key              = "myproject/terraform.tfstate"
    max_retries      = 3
    skip_s3_checksum = true
    region           = "myRegion"
    # The following setting allow to interact with S3 compatible API such as Flashblade/Wasabi
    insecure                    = true
    skip_credentials_validation = true
    skip_requesting_account_id  = true
    skip_region_validation      = true
  }
  required_providers {
    vsphere = {
      source  = "vmware/vsphere"
      version = "2.3.1"
    }
  }
}
provider "vsphere" {
  vsphere_server       = var.vsphere_vcenter
  user                 = var.vsphere_username
  password             = var.vsphere_password
  allow_unverified_ssl = true
}