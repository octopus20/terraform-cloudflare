locals {
  /*
  from {
    "example_domain" = {
      name = "example.com"
      plan = "free"
      records = [
        {
          name = "www", type = "A", ttl = 10, value = "190.102.12.12", proxied = true
        },
        {
          name = "app1", type = "A", ttl = 10, value = "190.102.12.13", proxied = true
        }
      ]
    }
  }
  to : [ {
          zone_name = "example.com", name = "www", type = "A", ttl = 10, value = "190.102.12.12", proxied = true
        },
        {
          zone_name = "example.com", name = "app1", type = "A", ttl = 10, value = "190.102.12.13", proxied = true
        }
  ]
  */
  flattened_records = flatten([for zone_key, zone_details in var.zones : [
    for record in zone_details.records : {
      zone_name = zone_details.name
      name      = record.name
      type      = record.type
      ttl       = record.ttl
      value     = record.value
      proxied   = record.proxied
    }
    ]
  ])
}

resource "cloudflare_zone" "dns_zones" {
  for_each = { for zone in var.zones : zone.name => zone }

  zone = each.value.name
  plan = each.value.plan
}

resource "cloudflare_record" "dns_records" {
  for_each = { for r in local.flattened_records : "${r.type}:${r.name}.${r.zone_name}" => r }

  zone_id = cloudflare_zone.dns_zones[each.value.zone_name].id
  name    = each.value.name
  value   = each.value.value
  type    = each.value.type
  ttl     = each.value.ttl
  proxied = each.value.proxied
}
