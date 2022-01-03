provider "aws" {
    region = ca-central-1
  
}
resource "aws_instance" "ec2" {
    ami = "ami-0bae7412735610274"
    instance_type = "t2_micro"
  
}