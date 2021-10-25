# metal-provision-5
BGP anycast in three different Datacenters

## Table of Contents
- [Pre-requirement](#pre-requirements)
- [Usage](#usage)
- [Inputs](#inputs)
- [Outputs](#outputs)

## Pre-requirements

↥ [back to top](#table-of-contents)

- [Terraform](https://www.terraform.io/downloads.html)
- [Vagrant](https://www.vagrantup.com/downloads)

## Usage

↥ [back to top](#table-of-contents)

create infrastructure

```bash
git clone git@github.com:base-line/metal-provision-5.git
cd metal-provision-5
terraform init
terraform apply
```

destroy infrastructure

```bash
terraform destroy
```

## Requirements
↥ [back to top](#table-of-contents)

| Name | Version |
|------|---------|
| <a name="requirement_metal"></a> [metal](#requirement\_metal) | ~> 3.0 |

## Providers

↥ [back to top](#table-of-contents)

| Name | Version |
|------|---------|
| <a name="provider_metal"></a> [metal](#provider\_metal) | ~> 3.0 |
| <a name="provider_template"></a> [template](#provider\_template) | n/a |

## Modules

↥ [back to top](#table-of-contents)

| Name | Source | Version |
|------|--------|---------|
| <a name="module_device"></a> [device](#module\_device) | git::github.com/andrewpopa/terraform-metal-device.git | n/a |
| <a name="module_ip"></a> [ip](#module\_ip) | git::git@github.com:andrewpopa/terraform-metal-reserved-ip-block.git | n/a |
| <a name="module_key"></a> [key](#module\_key) | git::github.com/andrewpopa/terraform-metal-project-ssh-key | n/a |

## Resources

↥ [back to top](#table-of-contents)

| Name | Type |
|------|------|
| [metal_bgp_session.this](https://registry.terraform.io/providers/equinix/metal/latest/docs/resources/bgp_session) | resource |
| [template_file.this](https://registry.terraform.io/providers/hashicorp/template/latest/docs/data-sources/file) | data source |

## Inputs

↥ [back to top](#table-of-contents)

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cluster"></a> [cluster](#input\_cluster) | n/a | `map` | <pre>{<br>  "amsterdam": {<br>    "billing_cycle": "hourly",<br>    "facilities": [<br>      "ams1"<br>    ],<br>    "hostname": "cluster-ams",<br>    "operating_system": "ubuntu_18_04",<br>    "plan": "t1.small.x86"<br>  },<br>  "dallas": {<br>    "billing_cycle": "hourly",<br>    "facilities": [<br>      "da11"<br>    ],<br>    "hostname": "cluster-dallas",<br>    "operating_system": "ubuntu_18_04",<br>    "plan": "c3.medium.x86"<br>  },<br>  "frankfurt": {<br>    "billing_cycle": "hourly",<br>    "facilities": [<br>      "fr2"<br>    ],<br>    "hostname": "cluster-frank",<br>    "operating_system": "ubuntu_18_04",<br>    "plan": "c3.medium.x86"<br>  }<br>}</pre> | no |
| <a name="input_description"></a> [description](#input\_description) | description | `string` | `""` | no |
| <a name="input_facilities"></a> [facilities](#input\_facilities) | n/a | `list(string)` | <pre>[<br>  "amsterdam",<br>  "dallas",<br>  "frankfurt"<br>]</pre> | no |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | project id | `string` | `""` | no |
| <a name="input_quantity"></a> [quantity](#input\_quantity) | quantity ip | `string` | `""` | no |
| <a name="input_type"></a> [type](#input\_type) | type | `string` | `""` | no |

## Outputs

No outputs.
