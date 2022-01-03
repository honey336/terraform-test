provider "aws" {
    region = "ca-central-1"
  
}
resource "aws_instance" "ec2" {
    ami = "ami-0bae7412735610274"
    instance_type = "t2.micro"
  
}

resource "aws_eip" "elasticip" {
    instance = aws_instance.ec2.id
  
}
output "EIP" {
    value = aws_eip.elasticip.public_ip
  
}