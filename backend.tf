terraform {
  required_version = ">=0.12.0"
  backend "s3" {
    key            = "prod/terraform.state"
    bucket         = "class38-terraform-backend-01"
    region         = "us-east-1"
    dynamodb_table = "terraform-state-locking"
  }
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