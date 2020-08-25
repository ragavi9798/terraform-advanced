terraform {
  backend "s3" {
    bucket = "20954-buckets"
    key = "terraform/terraform.tfstate"
    region = "us-east-1"
}   
}