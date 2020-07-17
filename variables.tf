variable "host" {
  type = string
  description = "Host for the website"
}

variable "certificate_arn" {
  type = string
  description = "Certificate ARN from AWS Certificate Manager"
}

variable "logs_bucket" {
  type = string
  description = "S3 bucket for logging"
}

variable "logs_path" {
  type = string
  description = "Path for logs in S3 bucket"
}

variable "region" {
  type = string
  description = "Region for S3 bucket (for example: us-west-2)"
}
