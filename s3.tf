resource "aws_s3_bucket" "www" {
  bucket = var.host
#  acl    = "public-read"
  force_destroy = true
  // We also need to create a policy that allows anyone to view the content.
  // This is basically duplicating what we did in the ACL but it's required by
  // AWS. This post: http://amzn.to/2Fa04ul explains why.
  policy = <<POLICY
{
  "Version":"2012-10-17",
  "Statement":[
    {
      "Sid":"AddPerm",
      "Effect":"Allow",
      "Principal": {
        "AWS": "${aws_cloudfront_origin_access_identity.origin_access_identity.iam_arn}"
      },
      "Action":["s3:GetObject"],
      "Resource":["arn:aws:s3:::${var.host}/*"]
    },
    {
      "Sid": "AllowSSLRequestsOnly",
      "Effect": "Deny",
      "Principal": "*",
      "Action": "s3:*",
      "Resource": [
          "arn:aws:s3:::${var.host}",
          "arn:aws:s3:::${var.host}/*"
      ],
      "Condition": {
          "Bool": {
              "aws:SecureTransport": "false"
          }
      }
    }
  ]
}
POLICY

  website {
    index_document = "index.html"
    error_document = "404.html"
  }

  dynamic "server_side_encryption_configuration" {
    for_each = var.enable_encryption == true ? [var.enable_encryption] : []
    content {
      rule {
        apply_server_side_encryption_by_default {
          sse_algorithm     = "AES256"
        }
      }
    }
  }

  logging {
    target_bucket = var.logs_bucket
    target_prefix = var.logs_path
  }

}
