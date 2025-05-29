variable "bucket" {
  description = "The name of the S3 bucket"
  type        = string
  default     = "class38-terraform-backend-001"
}

variable "table" {
  description = "The name of the DynamoDB table"
  type        = string
  default     = "terraform-state-locking"
}

variable "region" {
  description = "The AWS region"
  type        = string
  default     = "us-west-1"
}


# terraform {
#   required_version = ">=0.12.0"
#   backend "s3" {
#     key            = "prod/terraform.state"
#     bucket         = "class38-terraform-backend-01"
#     region         = "us-east-1"
#     dynamodb_table = "terraform-state-locking"
#   }
# }