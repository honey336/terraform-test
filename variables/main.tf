variable "vpcname" {
    type = string
    default = "myvpc"
}

variable "sshport" {
  type = number
  default = 22
}

variable "enabled" {
    default = true
}

variable "mylist" {
    type = string
    description = "[oyin, eyinju]"
}

variable "mymap" {
    type = map
    default = {
        key1 = "value1"
        key2 = "value2"
    }
  
}
variable "inputname" {
    type = string
    description = "set the name of vpc"
  
}
resource "aws_vpc" "myvpc" {
    cidr_block = "10.0.0.0/16"

    tags = {
      Name = var.inputname
    }
  
}
