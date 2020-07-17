# terraform-s3-cf-website
Terraform module to create S3 static website, along with CloudFormation distribution for it to enable serving through SSL

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| host |  Host for the website | string | `""` | yes |
| certificate\_arn | Certificate ARN from AWS Certificate Manager | string | `""` | yes |

## Outputs

| Name | Description |
|------|-------------|
| sns\_topic\_arn | The ARN of the SNS topic |

## Examples

```hcl
module "sns-pagerduty" {
  source             = "https://github.com/SequoiaConsulting/terraform-pagerduty-sns.git?ref=v1.0"
  display_name       = "PagerDutySNSDemo"
  pagerduty_endpoint = "https://events.pagerduty.com/integration/EXAMPLE_KEY/enqueue"
  sns_topic_name     = "pagerduty-sns-demo"
}
```
