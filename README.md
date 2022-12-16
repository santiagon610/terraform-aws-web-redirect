# AWS Web Redirect

Want to use AWS S3 to simply and (theoretically) cheaply redirect queries from one FQDN to another? Let S3, CloudFront, ACM, and Route 53 do the magic for you with this module.

Based on [this article](https://www.chrisjmendez.com/2018/11/15/creating-a-subdomain-forward-to-amazon-workmail/) by Chris Mendez.

## Features

- S3 bucket
  - Access control list (`public-read`)
  - Website configuration with redirect policy
- Route 53 record

## Terraform versions

I've tested this on 1.2, so I imagine anything from there on up should be fine. If you find an issue, feel free to raise an issue.

### Example Usage

```hcl
# Production Website
module "webmail_redirect" {
  # Pick the latest v0.0.x release from the registry
  source                    = "santiagon610/web-redirect/aws"
  version                   = "~> 0.0"

  # Redirect from http://mail.example.com
  redirect_hostname         = "mail"
  redirect_domain           = "example.com"
  redirect_route53_zone_id  = aws_route53_zone.example_com.zone_id

  # Redirect to https://example-com.awsapps.com/mail
  destination_protocol      = "https"
  destination_hostname      = "example-com.awsapps.com"
  destination_suffix        = "mail"
}
```

## Providers

- [AWS](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)

## Outputs

- This module does not generate any outputs

## Authors

- [Nicholas Santiago](https://github.com/santiagon610)

## License

[CC0 1.0 Universal](LICENSE)