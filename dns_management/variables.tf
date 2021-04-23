variable "dns_records" {
  type = map(object({
    zone_id = string
    value   = string
    type    = string
    ttl     = number
    proxied = string

  }))
  description = "map of DNS records information"


}

# Need a better way to declare this var :)
variable "dns_zones" {
  type = map(object({
    plan = string
  }))
  description = "map of DNS zone information"
}
