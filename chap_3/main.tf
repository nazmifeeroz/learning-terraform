provider "aws" {
  region = "us-east-2"
}

resource "aws_s3_bucket" "terraform_state" {
  bucket = "nazmi-terraform-up-and-running-state-2"

  # lifecycle {
  #   prevent_destroy = true
  # }

  versioning {
    enabled = true
  }
  
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
}

resource "aws_dynamodb_table" "terraform_locks" {
  name          = "terraform-up-and-running-locks"
  billing_mode  = "PAY_PER_REQUEST"
  hash_key      = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}

# resource "aws_instance" "example" {
#   ami       = "ami-0c55b159cbfafe1f0"
#   instance  = "t2.micro"
# }

terraform {
  backend "s3" {
    bucket  = "nazmi-terraform-up-and-running-state-2"
    key     = "global/s3/terraform-2.tfstate"
    region   = "us-east-2"

    dynamodb_table  = "terraform-up-and-running-locks"
    encrypt         = true
  }
}

output "s3_bucket_arn" {
  value       = aws_s3_bucket.terraform_state.arn
  description = "The ARN of the S3 bucket"
}

output "dynamodb_table_name" {
  value       = aws_dynamodb_table.terraform_locks.name
  description = "The name of the DynamoDB table"
}
