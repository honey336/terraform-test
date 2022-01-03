provider "aws" {
    region = "ca-central-1"
  
}
resource "aws_instance" "ec2" {
    ami = "ami-0bae7412735610274"
    instance_type = "t2.micro"
    security_groups = [aws_security_group.webtraffic.name]
  
}
resource "aws_security_group" "webtraffic" {
    name = "Allow HTTPS"

    ingress  {
      cidr_blocks = [ "0.0.0.0/0" ]
      from_port = 443
      to_port = 443
      protocol = "TCP"
      
    } 
  
  egress  {
    cidr_blocks = [ "0.0.0.0/0" ]
    from_port = 443
    to_port = 443
    protocol = "TCP"
    
  } 
}