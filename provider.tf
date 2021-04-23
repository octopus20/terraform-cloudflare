terraform {
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "2.23.0"
    }

  }
}

provider "cloudflare" {
  email   = var.email
  api_key = var.api_key
}
