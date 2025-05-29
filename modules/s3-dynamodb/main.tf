provider "aws" {
  region = var.region
}

resource "aws_s3_bucket" "terraform_state" {
  bucket = var.bucket

  tags = {
    Name        = "Terraform Backend Bucket"
    Environment = "prod"
  }
}

resource "aws_s3_bucket_versioning" "terraform_state" {
  bucket = aws_s3_bucket.terraform_state.id

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "terraform_state" {
  bucket = aws_s3_bucket.terraform_state.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

resource "aws_dynamodb_table" "terraform_locks" {
  name           = var.table
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = {
    Name        = "Terraform Lock Table"
    Environment = "prod"
  }
}



# Uncomment the following lines if you want to enable lifecycle rules for the S3 bucket
# resource "aws_s3_bucket_lifecycle_configuration" "terraform_state" {
#   bucket = aws_s3_bucket.terraform_state.id
#
#   rule {
#     id      = "log"
#     enabled = true
#
#     transition {
#       days          = 30
#       storage_class = "GLACIER"
#     }
#
#     expiration {
#       days = 365
#     }
#   }
# }


# resource "aws_s3_bucket" "terraform_state" {
#   bucket = var.bucket

#   versioning {
#     enabled = true
#   }

#   server_side_encryption_configuration {
#     rule {
#       apply_server_side_encryption_by_default {
#         sse_algorithm = "AES256"
#       }
#     }
#   }

#   lifecycle_rule {
#     id      = "log"
#     enabled = true

#     transition {
#       days          = 30
#       storage_class = "GLACIER"
#     }

#     expiration {
#       days = 365
#     }
#   }
# }

# resource "aws_dynamodb_table" "terraform_locks" {
#   name         = var.table
#   billing_mode = "PAY_PER_REQUEST"
#   hash_key     = "LockID"

#   attribute {
#     name = "LockID"
#     type = "S"
#   }
# }
