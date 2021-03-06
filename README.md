# terraform-s3-cf-website
Terraform module to create S3 static website along with CloudFront distribution for it to enable serving through SSL (HTTPS). This module is meant to be used in **us-east-1 (N. Virginia) region only** as CloudFront distrubution only supports ACM certificate from us-east-1. If you try to use a different region, you may encounter a lot of issues with respect to region.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| host |  Host for the website | string | `""` | yes |
| certificate\_arn | Certificate ARN from AWS Certificate Manager | string | `""` | yes |
| logs\_bucket | S3 bucket to use for logging | string | `""` | yes |
| logs\_path | Path for logs in S3 bucket | string | `""` | yes |
| enable\_encryption | Enable or disable incryption for S3 bucket | bool | true | no |

## Outputs

| Name | Description |
|------|-------------|
| cf\_domain\_name | CloudFront Domain name (for use in DNS) |
| s3\_bucket\_name | S3 Bucket name |


## Examples

```hcl
module "my-s3-cf-website" {
  source  = "sharath-sequoia/cf-website/s3"
  version = "1.3.0"
  host  = "thenextbigthingto.com"
  certificate_arn = "arn:aws:acm:us-east-1:111111111111:certificate/59b6cdef-5911-09e8-3i9d-ck0370p3e812"
  logs_bucket = "next-big-thing-logs"
  logs_path = "logs/"
}
```
## Credits
Most of the source code written in this module was referred from:
https://medium.com/runatlantis/hosting-our-static-site-over-ssl-with-s3-acm-cloudfront-and-terraform-513b799aec0f
