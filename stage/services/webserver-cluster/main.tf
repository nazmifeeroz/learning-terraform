provider "aws" {
  region = "us-east-2"
}

resource "aws_instance" "example" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"
}

terraform {
  backend "s3" {
    bucket  = "nazmi-s3-terraform"
    key     = "global/s3/terraform.tfstate"
    region  = "us-east-2"

    dynamodb_table  = "terraform-locks"
    encrypt         = true
  }
}
