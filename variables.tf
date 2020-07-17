variable "host" {
  type = string
  description = "Host for the website"
  default = "example.sequoia.com"
}

variable "certificate_arn" {
  type = string
  description = "Certificate ARN from AWS Certificate Manager"
}

variable "enable_s3_encryption" {
  type = bool
  default = true
}
