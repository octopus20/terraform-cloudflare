# This repository created to manage CloudFlare DNS resources via Terraform. 

## Modules:
The repo consistes of one module to create DNS Zone and add DNS records to Cloudflare. 

### Adding new DNS Zone:

As I'm using a free Cloudflare plan .. I only need the zone name to create a new zone. To add new zone copy below lines to your `mail.tf` file. (if you need more Zone configuration please edit the module to met your requirements. Terraform docs is very helpful: https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs/resources/zone )

```
dns_zones = {
    "example.com" = {
      plan = "free"
    }
```

After the DNS zone created , please add `zone_id` to zones_info locals, for example: 

```
locals {
  zones_info = {
    "example_sa_id" = "ex:es12u32083h21b857c4d028rd42"
  }
}
```
### Adding new DNS Records:

To add new DNS record , after initilailed terraform state and setup your Cloudflare account (email + api_key) .. copy below lines to your `main.tf` file. 

-  zone_id: The DNS zone ID to add the record to.
-  name: The name of the record.
-  type: The type of the record.
-  value: The (string) value of the record.
-  ttl: The TTL of the record (automatic: '1')
-  proxied: To show a Cloudflare IP if you look up the record.


```
  dns_records = {
    "record.zone.com" = {
      zone_id = local.zones_info.zone_id
      value   = "ip address"
      type    = "record type"
      ttl     = 1
      proxied = false
    }
```

