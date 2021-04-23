module "dns_zones" {
  source = "./dns_management"

  # Add DNS Zones here.
  dns_zones = {
    "example.sa" = {
      plan = "free" //plan type
    }
  }


  # Add DNS records here
  dns_records = {
    "abeer" = {
      zone_id = local.zones_info.example.sa_id
      value   = "192.168.168.0"
      type    = "A"
      ttl     = 1
      proxied = false
    }
    "@" = {
      zone_id = local.zones_info.example.sa_id
      value   = "This is an awesome domain! Definitely not spammy."
      type    = "TXT"
      ttl     = 1
      proxied = false
    }
  }
}


# Add the Zone ID from cloudflare to use in record resource 'local.zones_info.example.sa_id'

locals {
  zones_info = {
    "example.sa_id" = "ex:es12u32083h21b857c4d028rd42"
  }
}
