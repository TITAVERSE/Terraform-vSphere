# Terraform-vSphere

This module is an unversal module to create and manipulate one and only one resource in VMWare vSphere environment.

We can iterate through local variable to create multiple ressources

The idea is to be able manage each instance created separately by iterating some variable and make them independant from each other ; ideal for bring existing environment and non-uniform resource under the managemnet of Terraform

# Prerequisites
## To operate
- Terraform version : >= 1.7.2
- vCenter version : 7.X o r8.X
- Terraform vSphere version : 2.3.1
- Git
## Optional
- Remote s3/object backend for collaborative/remote option

# Operate with module

The following command will install the universal module inside the folder provisionning/Terraform-vSphere
```
git submodule add -b main https://github.com/TITAVERSE/Terraform-vSphere  provisionning/Terraform-vSphere
```

```
terraform init
```

```
terraform apply
```

# Virtual Machine
## Cloning Linux VM Template
- Change the content of the file zz-examples/virtualvariables-workload.tf

# Sources
The official documentation from Terraform : https://registry.terraform.io/providers/hashicorp/vsphere/latest/docs
Thanks to TekanAid https://tekanaid.com/posts/terraform-create-ubuntu22-04-vm-vmware-vsphere#code