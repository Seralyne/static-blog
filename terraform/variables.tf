variable "cloudflare_account_id" {
  description = "Cloudflare account ID"
  type        = string


  validation {
    condition     = length(trimspace(var.cloudflare_account_id)) > 0
    error_message = "cloudflare_account_id must be non-empty. Set TF_VAR_cloudflare_account_id (or CLOUDFLARE_ACCOUNT_ID in workflow vars/secrets)."
  }

}

variable "cloudflare_zone_id" {
  description = "Cloudflare zone ID for seralyne.net"
  type        = string


  validation {
    condition     = length(trimspace(var.cloudflare_zone_id)) > 0
    error_message = "cloudflare_zone_id must be non-empty. Set TF_VAR_cloudflare_zone_id (or CLOUDFLARE_ZONE_ID in workflow vars/secrets)."
  }

}