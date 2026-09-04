terraform {
  required_version = "~> 1.15"

  cloud {
    organization = "seralyne-personal"

    workspaces {
      name = "personal-blog"
    }
  }

  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 5.22"
    }
  }
}

provider "cloudflare" {}