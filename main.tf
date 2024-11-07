# Define the backend configuration
terraform {
  backend "local" {}
}

variable "aws_access_key" {
  description = "AWS access key"
  type        = string
}

variable "aws_secret_key" {
  description = "AWS secret key"
  type        = string
}

provider "aws" {
    access_key = var.aws_access_key
    secret_key = var.aws_secret_key
    region = "ap-southeast-2"  
}

resource "aws_instance" "tf-new-instance" {
  ami           = "ami-001f2488b35ca8aad" #ap-southeast-2
  instance_type = "t2.micro"
  tags = {
      Name = "TF-Instance"
  }
}
