# data "cloudflare_zone" "zones" {
#     for_each = var.zones
#     filter {
#         name = each.value.zone_name
#         status = "active"
#     }
# }

