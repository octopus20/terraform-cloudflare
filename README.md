# This repository created to manage CloudFlare DNS resources via Terraform. 

## Modules:
The repo consistes of one module to create DNS Zone and add DNS records to Cloudflare. 

* Terraform docs are very helpful: https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs/resources/zone 

### Adding new DNS Zone:

As we are using a free Cloudflare plan .. we only need the zone name to add a new zone.
To add new zone copy below lines to `dns_records.tf` file.

```
locals {

  zones = {
    "example_sa" = {
      name    = "example.sa"
      plan    = "free"
      records = []
    }
  }
}

```

### Adding new DNS Records:

To add new DNS record , copy below lines to dns_records.tf file under `records = []` for the desired zone. 

-  name: The name of the record.
-  value: The (string) value of the record.
-  type: The type of the record.
-  ttl: The TTL of the record (automatic: '1')
-  proxied: To show a Cloudflare IP if you look up the record.


```
locals {

  zones = {
    "example_sa" = {
      name    = "example.sa"
      plan    = "free"
      records = [
         {
           name    = "*"
           value   = "92.68.68.0"
           type    = "A"
           ttl     = 1
           proxied = false
         },

         {
           name    = "test"
           value   = "92.68.68.1"
           type    = "A"
           ttl     = 1
           proxied = false
         }
      ] 
    }
  }
}

```

