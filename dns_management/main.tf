resource "cloudflare_zone" "dns_zones" {
  for_each = var.dns_zones

  zone = each.key
  plan = each.value.plan
}


resource "cloudflare_record" "dns_records" {
  for_each = var.dns_records

  zone_id = each.value.zone_id
  name    = each.key
  value   = each.value.value
  type    = each.value.type
  ttl     = each.value.ttl
  proxied = each.value.proxied

}
