module "dns_zones" {
  source = "./dns_management"
  zones  = local.zones
}