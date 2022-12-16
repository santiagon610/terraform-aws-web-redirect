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
  source                    = "santiagon610/web-redirect"
  version                   = "~> 0.0"
  
  # redirect from http://webmail.example.com
  redirect_hostname         = "webmail"
  redirect_domain           = "example.com"
  redirect_route53_zone_id  = data.route53_zone.example_com.zone_id
  
  # redirect to https://mail.example.com/webmail
  destination_protocol      = "https"
  destination_hostname      = "mail.example.com"
  destination_suffix        = "webmail"

}
```

## Providers

- [AWS](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)

## Outputs

- This module does not generate any outputs.

## Authors

- [Nicholas Santiago](https://github.com/santiagon610)

## License

[CC0 1.0 Universal](LICENSE)