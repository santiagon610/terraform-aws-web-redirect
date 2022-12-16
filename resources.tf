resource "aws_s3_bucket" "this" {
  bucket = local.redirect_fqdn
}

resource "aws_s3_bucket_acl" "this" {
  bucket = aws_s3_bucket.this.bucket
  acl    = "public-read"
}

resource "aws_s3_bucket_website_configuration" "this" {
  bucket = aws_s3_bucket.this.bucket

  index_document {
    suffix = "index.html"
  }

  routing_rule {
    redirect {
      http_redirect_code = var.redirect_http_status_code
      host_name          = var.destination_hostname
      protocol           = var.destination_protocol
      replace_key_with   = var.destination_suffix
    }
  }
}

resource "aws_route53_record" "this" {
  zone_id = Var.redirect_route53_zone_id
  name    = local.redirect_fqdn
  type    = "CNAME"
  ttl     = 120
  records = [
    aws_s3_bucket_website_configuration.this.website_endpoint
  ]
}
