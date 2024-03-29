# Terraform-vSphere

Thanks to TekanAid
https://tekanaid.com/posts/terraform-create-ubuntu22-04-vm-vmware-vsphere#code
<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_vsphere"></a> [vsphere](#requirement\_vsphere) | 2.3.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_vsphere"></a> [vsphere](#provider\_vsphere) | 2.3.1 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [vsphere_virtual_machine.vm](https://registry.terraform.io/providers/hashicorp/vsphere/2.3.1/docs/resources/virtual_machine) | resource |
| [vsphere_compute_cluster.cluster](https://registry.terraform.io/providers/hashicorp/vsphere/2.3.1/docs/data-sources/compute_cluster) | data source |
| [vsphere_datacenter.dc](https://registry.terraform.io/providers/hashicorp/vsphere/2.3.1/docs/data-sources/datacenter) | data source |
| [vsphere_datastore.datastore](https://registry.terraform.io/providers/hashicorp/vsphere/2.3.1/docs/data-sources/datastore) | data source |
| [vsphere_network.network](https://registry.terraform.io/providers/hashicorp/vsphere/2.3.1/docs/data-sources/network) | data source |
| [vsphere_virtual_machine.template](https://registry.terraform.io/providers/hashicorp/vsphere/2.3.1/docs/data-sources/virtual_machine) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cust_trigramm"></a> [cust\_trigramm](#input\_cust\_trigramm) | Trigramme du client | `string` | `"STX"` | no |
| <a name="input_customer_domain_name"></a> [customer\_domain\_name](#input\_customer\_domain\_name) | Local domain AD/LDAP | `string` | `"stxlab.local"` | no |
| <a name="input_template_folder"></a> [template\_folder](#input\_template\_folder) | dossier contenant les templates de VM | `string` | n/a | yes |
| <a name="input_vm_cpu_core"></a> [vm\_cpu\_core](#input\_vm\_cpu\_core) | Number of core per cpu | `number` | `1` | no |
| <a name="input_vm_cpu_socket"></a> [vm\_cpu\_socket](#input\_vm\_cpu\_socket) | Number of socket cpu | `number` | `1` | no |
| <a name="input_vm_disk_config"></a> [vm\_disk\_config](#input\_vm\_disk\_config) | n/a | `list(map(list(map(number))))` | <pre>[<br>  {<br>    "disks": [<br>      {<br>        "size": 16<br>      }<br>    ]<br>  }<br>]</pre> | no |
| <a name="input_vm_dns_servers"></a> [vm\_dns\_servers](#input\_vm\_dns\_servers) | List of DNS servers | `list(string)` | <pre>[<br>  "8.8.8.8",<br>  "8.8.4.4",<br>  "1.1.1.1"<br>]</pre> | no |
| <a name="input_vm_hostname"></a> [vm\_hostname](#input\_vm\_hostname) | Name of the VM | `string` | `"localhost"` | no |
| <a name="input_vm_ipv4_address"></a> [vm\_ipv4\_address](#input\_vm\_ipv4\_address) | IPv4 addresses for a vm | `list(string)` | n/a | yes |
| <a name="input_vm_ipv4_gateway"></a> [vm\_ipv4\_gateway](#input\_vm\_ipv4\_gateway) | IPv4 address of the Gateway | `string` | n/a | yes |
| <a name="input_vm_ipv4_netmask"></a> [vm\_ipv4\_netmask](#input\_vm\_ipv4\_netmask) | Netmask | `string` | n/a | yes |
| <a name="input_vm_ipv4_ns"></a> [vm\_ipv4\_ns](#input\_vm\_ipv4\_ns) | Liste des serveurs DNS | `list(any)` | <pre>[<br>  "8.8.8.8",<br>  "8.8.4.4"<br>]</pre> | no |
| <a name="input_vm_lin_ssh_username"></a> [vm\_lin\_ssh\_username](#input\_vm\_lin\_ssh\_username) | n/a | `string` | `"sam"` | no |
| <a name="input_vm_public_key"></a> [vm\_public\_key](#input\_vm\_public\_key) | Public key to be used to ssh into a machine | `string` | `"ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDR5IBKXMaxdiOt/p0lKX/cl4li5sEfCGoNZ2IrsPojUsM8szWii+4A9ZiOmwYPBgdd6HF5bXFH5nDUMexMpFVjIRR6wpQ1Mvh4lnOmFz3v0bHDmovxpnk1cYHkDGaIo1zWzLwSR3/DLeNDv5pmHUUz5ZF7M3NkpgILWYjus2y8Vuwxwn6uXHpzFuxc2J+KA0HlKKGfgCb026AejEtwf4J/NVOpEndwck1DkBw3jNQtaqVUEReAvCVJnehQzAfnQmbg7VTvWPxftwX+Ml64O04hmbui2Qgv6CePYB91GtzKgDubzAHfWduD3E9ju1/9h9aVFgLJRS9AGlS6j7l2xekZ2qVivkeGwzcNg9neA1DGDssVYszWfOABNV18VLLWIko8HolETAr+/YImTXTVXRaRbjkaGMdiNssOVbBzaNf+42HqA/DmrNO8UV8VWvirb1ai3yeHTU6DYHsnS85rC846KCyQcC1McBQpRcIHCNXqS7rG3TTTofyiMfHNHuJbwj4lPBx2ZhyiWtLxwVQQEWft4GKaCQmPzKR8Qt6Aj5rYwq+pilF3T2du7y5Iz6Q/1y3y0xH/7hA4iKpj82nRBGuwIagfDivzqmx3vzaDBaBOLQoLLvnWunkkuqSxuK+4jAWJrPOQjR6KRbKsUHL7FqeCu0CMW1mj7QBsEO10+E4WIw== stxtra@IX0035-PC"` | no |
| <a name="input_vm_ram"></a> [vm\_ram](#input\_vm\_ram) | Quantity of RAM in GB | `number` | `4` | no |
| <a name="input_vm_template"></a> [vm\_template](#input\_vm\_template) | Nom du template sur vSphere | `string` | n/a | yes |
| <a name="input_vmcount"></a> [vmcount](#input\_vmcount) | number of VM to create | `number` | `1` | no |
| <a name="input_vsphere_cluster"></a> [vsphere\_cluster](#input\_vsphere\_cluster) | n/a | `string` | `""` | no |
| <a name="input_vsphere_datacenter"></a> [vsphere\_datacenter](#input\_vsphere\_datacenter) | Datacenter name in vSphere | `string` | `""` | no |
| <a name="input_vsphere_datastore"></a> [vsphere\_datastore](#input\_vsphere\_datastore) | Datastore Name in vSphere | `string` | `""` | no |
| <a name="input_vsphere_network"></a> [vsphere\_network](#input\_vsphere\_network) | n/a | `string` | `""` | no |
| <a name="input_vsphere_password"></a> [vsphere\_password](#input\_vsphere\_password) | vsphere user password | `string` | n/a | yes |
| <a name="input_vsphere_username"></a> [vsphere\_username](#input\_vsphere\_username) | vSphere username | `string` | n/a | yes |
| <a name="input_vsphere_vcenter"></a> [vsphere\_vcenter](#input\_vsphere\_vcenter) | VMWare vCenter server FQDN / IP | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->