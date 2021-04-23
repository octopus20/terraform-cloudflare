# Remote Terraform state (Terraform Cloud)
terraform {
  backend "remote" {
    organization = "your_org_name"

    workspaces {
      name = "cloudflare-dns"
    }
  }
}