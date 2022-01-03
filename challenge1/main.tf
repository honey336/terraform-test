provider "aws" {
    region = "ca-central-1"
    profile = "honey-terraform"
  
}

resource "aws_vpc" "TerraformVPC" {
    cidr_block = "192.168.0.0/24"
  
  tags = {
    Name = "TerraformVPC"
  }
}