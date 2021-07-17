variable "zones" {
  type = map(object({
    name = string
    plan = string
    records = list(object({
      name    = string
      type    = string
      ttl     = number
      value   = string
      proxied = bool
    }))
  }))
}
