# 1. Attach your custom domain directly to your Wrangler service
# (Cloudflare will automatically manage the root DNS tracking for this!)
resource "cloudflare_workers_custom_domain" "site" {
  account_id = var.cloudflare_account_id
  zone_id    = var.cloudflare_zone_id

  hostname   = "seralyne.net"
  service    = "personal-blog"
}

# 2. Keep the www subdomain record to make sure www.seralyne.net routes to your root site
resource "cloudflare_dns_record" "www_dns" {
  zone_id = var.cloudflare_zone_id
  name    = "www"
  type    = "CNAME"
  content = "seralyne.net"   
  proxied = true             
  ttl     = 1                
}

# 3. Create a separate network routing rule for the apex domain
resource "cloudflare_workers_route" "apex_route" {
  zone_id = var.cloudflare_zone_id
  pattern = "seralyne.net/*"
  script  = "personal-blog"
}

# 4. Create a separate network routing rule for the www subdomain
resource "cloudflare_workers_route" "www_route" {
  zone_id = var.cloudflare_zone_id
  pattern = "www.seralyne.net/*"
  script  = "personal-blog"
}
