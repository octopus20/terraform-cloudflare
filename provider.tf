terraform {
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "2.18.0"
    }

  }
}

provider "cloudflare" {
  email   = "cloudflare@email.com"
  api_key = "API_KEY"
}
