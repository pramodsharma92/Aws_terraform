provider "aws" {
    region = "ap-southeast-2"  
}

resource "aws_instance" "tf-new-instance" {
  ami           = "ami-001f2488b35ca8aad" #ap-southeast-2
  instance_type = "t2.micro"
  tags = {
      Name = "TF-Instance"
  }
}
