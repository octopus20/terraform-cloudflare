locals {

  zones = {
    "example_sa" = {
      name = "example.sa"
      plan = "free"
      records = [
        {
          name    = "test"
          value   = "92.68.68.0"
          type    = "A"
          ttl     = 1
          proxied = false
        },
        {
          name    = "@"
          value   = "This is an awesome domain! Definitely not spammy."
          type    = "TXT"
          ttl     = 1
          proxied = false
        }
      ]
    }

  }

}