output "cf_domain_name" {
  description = "CloudFront Domain name (for use in DNS)"
  value = aws_cloudfront_distribution.www_distribution.domain_name
}

output "s3_bucket_name" {
  description = "S3 Bucket name"
  value = aws_s3_bucket.www.id
}
