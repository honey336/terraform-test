provider "aws" {
    region = "ca-central-1"
    profile = "honey-terraform"
}

resource "aws_vpc" "honeywellvpc" {
    cidr_block = "10.0.0.0/16"
  
}