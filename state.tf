terraform {
  backend "s3" {
    bucket = "sonydevops.22"
    key    = "roboshop/dev/terraform.tfstate"
    region = "us-east-1"
  }
}
