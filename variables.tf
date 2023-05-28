locals {
  redirect_fqdn = "${var.redirect_hostname}.${var.redirect_domain}"
}

variable "redirect_hostname" {
  type        = string
  description = "Hostname for redirect, used to generate S3 bucket name"
  default     = ""
}

variable "redirect_domain" {
  type        = string
  description = "Domain name for redirect, used to generate S3 bucket name"
  default     = ""
}

variable "redirect_route53_zone_id" {
  type        = string
  description = "Zone ID for redirect, used to generate CNAME record"
  default     = ""
}

variable "redirect_http_status_code" {
  type        = number
  description = "HTTP status code to use for redirect"
  default     = 301
}

variable "destination_protocol" {
  type        = string
  description = "Destination protocol, accepts http or https"
  default     = "http"
}

variable "destination_hostname" {
  type        = string
  description = "Destination hostname"
  default     = "example.com"

}

variable "destination_suffix" {
  type        = string
  description = "Destination suffix"
  default     = ""
}

variable "skip_acl" {
  type        = bool
  description = "Skips creation of the ACL for accounts in which this is disallowed"
  default     = false
}
