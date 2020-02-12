provider "aws" {
  region = "us-east-2"
}

resource "aws_db_instance" "example" {
  identifier_prefix = "terraform-up-and-running"
  engine            = "mysql"
  allocated_storage = 10
  instance_class    = "db.t2.micro"
  name              = "example_database"
  username          = "admin"

  password          = var.db_password
}

terraform {
  backend "s3" {
    bucket  = "nazmi-s3-terraform"
    key     = "stage/data-stores/mysql/terraform.tfstate"
    region  = "us-east-2"

    dynamodb_table  = "terraform-locks"
    encrypt         = true
  }
}
