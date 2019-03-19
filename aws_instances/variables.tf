variable "amis" {
  type = "map"
  default = {
    us-west-2 = "ami-08692d171e3cf02d6"
    ca-central-1 = "ami-03d12de7d0e87fbf3"
  }
}

variable "region" {
  default = "us-west-2"
}

variable "total_instances" {
  default = 1
}

variable "modules_to_install" {
  type = "map"
  default = {
    frontend = ["sudo apt-get install -y python"]
    backend = ["sudo apt-get install -y tomcat"]
  }
}
variable "fe_or_be"{
}
