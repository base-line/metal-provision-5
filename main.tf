// ssh-key
module "key" {
  source     = "git::github.com/andrewpopa/terraform-metal-project-ssh-key"
  project_id = var.project_id
}

// request elastic ip
module "ip" {
  source      = "git::git@github.com:andrewpopa/terraform-metal-reserved-ip-block.git"
  project_id  = var.project_id
  quantity    = var.quantity
  type        = var.type
  description = var.description
}

data "template_file" "this" {
  template = file("bootstrap/pkg.sh")
  vars = {
    ip      = module.ip.cidr_notation
    netmask = module.ip.netmask
  }
}

module "device" {
  source = "git::github.com/andrewpopa/terraform-metal-device.git"

  for_each         = var.cluster
  hostname         = each.value.hostname
  plan             = each.value.plan
  facilities       = each.value.facilities
  operating_system = each.value.operating_system
  billing_cycle    = each.value.billing_cycle

  project_id          = var.project_id
  project_ssh_key_ids = [module.key.id]
  user_data           = data.template_file.this.rendered
}

resource "metal_bgp_session" "this" {
  count = length(var.facilities)
  device_id      = module.device["${var.facilities[count.index]}"].id
  address_family = "ipv4"
}