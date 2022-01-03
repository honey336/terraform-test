provider "aws" {
    region = "ca-central-1"
  
}
variable "ingressrules" {
    type = list(number)
    default = [80,443] 
}
variable "egressrules" {
    type = list(number)
    default = [80,443,25,8080,3306,53]
}
resource "aws_instance" "ec2" {
    ami = "ami-0bae7412735610274"
    instance_type = "t2.micro"
    security_groups = [aws_security_group.webtraffic.name]

    tags = {
      "Name" = "Terraform"
    }
  
}
resource "aws_security_group" "webtraffic" {
    name = "Allow HTTPS"

    dynamic "ingress"  {
      iterator = port
      for_each = var.ingressrules
      content {  
      cidr_blocks = [ "0.0.0.0/0" ]
      from_port = port.value
      to_port = port.value
      protocol = "TCP"
      }
    } 
  
  dynamic "egress"  {
      iterator = port
      for_each = var.egressrules
      content {  
      cidr_blocks = [ "0.0.0.0/0" ]
      from_port = port.value
      to_port = port.value
      protocol = "TCP"
      }
    }
}