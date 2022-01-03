provider "aws" {
    region = "ca-central-1"
    profile = "honey-terraform"
}

variable "ingressrules" {
    type = list(number)
    default = [80,443]
}

variable "egressrules" {
    type = list(number)
    default = [80,443]
  
}

resource "aws_instance" "webserver" {
    ami = "ami-0bae7412735610274"
    instance_type = "t2.micro"
    security_groups = [aws_security_group.terrasg.name]
    user_data = file("server-script.sh")

    tags = {
        Name = "web Server"
    }

}
resource "aws_eip" "elasticip" {
    instance = aws_instance.webserver.id
}

output "EIP" {
  value = aws_eip.elasticip.public_ip
}

resource "aws_instance" "dbserver" {
    ami = "ami-0bae7412735610274"
    instance_type = "t2.micro"
    security_groups = [aws_security_group.terrasg.name]
    
    tags =  {
        Name = "DB Server"
    }

}

output "PrivateIP" {
  value = aws_instance.dbserver.private_ip
}


resource "aws_security_group" "terrasg" {
    name = "Allow webtraffic"

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

