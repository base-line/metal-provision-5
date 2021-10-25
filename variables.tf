variable "project_id" {
  description = "project id"
  type        = string
  default     = ""
}

variable "quantity" {
  description = "quantity ip"
  type        = string
  default     = ""
}

variable "description" {
  description = "description"
  type        = string
  default     = ""
}

variable "type" {
  description = "type"
  type        = string
  default     = ""
}

variable "facilities" {
  type        = list(string)
  default     = ["amsterdam", "dallas", "frankfurt"]
}

variable "cluster" {
  default = {
    "amsterdam" = {
      hostname         = "cluster-ams"
      plan             = "t1.small.x86"
      facilities       = ["ams1"]
      operating_system = "ubuntu_18_04"
      billing_cycle    = "hourly"
    },
    "dallas" = {
      hostname         = "cluster-dallas"
      plan             = "c3.medium.x86"
      facilities       = ["da11"]
      operating_system = "ubuntu_18_04"
      billing_cycle    = "hourly"
    },
    "frankfurt" = {
      hostname         = "cluster-frank"
      plan             = "c3.medium.x86"
      facilities       = ["fr2"]
      operating_system = "ubuntu_18_04"
      billing_cycle    = "hourly"
    }
  }
}