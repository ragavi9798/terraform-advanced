terraform {
  backend "s3" {
    bucket = "12345-bucket"
    key = "terraform/terraform.tfstate"
    region = "us-east-1"
  }   
}