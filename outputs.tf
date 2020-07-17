output "cf_domain_name" {
  description = "CloudFront Domain name (for use in DNS)"
  value = aws_cloudfront_distribution.www_distribution.domain_name
}
