# AWS Web Redirect

Want to use AWS S3 to simply and (theoretically) cheaply redirect queries from one FQDN to another? Let S3, CloudFront, ACM, and Route 53 do the magic for you with this module.

Based on [this article](https://www.chrisjmendez.com/2018/11/15/creating-a-subdomain-forward-to-amazon-workmail/) by Chris Mendez.

## Features

- S3 bucket
- Redirect Policy
- Route 53 Record

## Terraform versions

I've tested this on 1.2, so I imagine anything from there on up should be fine. If you find an issue, feel free to raise an issue.

### Example Usage

```hcl
# Production Website
module "webmail_redirect" {
  source          = "santiagon610/web-redirect"
  pizza           = "pepperoni"
}
```

## Providers

- [AWS](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)

## Outputs

- TBD

## Authors

- [Nicholas Santiago](https://github.com/santiagon610)

## License

[CC0 1.0 Universal](LICENSE)