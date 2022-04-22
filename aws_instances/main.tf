terraform{
  backend "s3"{
    bucket = "sample-table3-aj"
    key = "terra/state/jenkins1"
    region = "us-west-2"
  }
}

data "aws_availability_zones" "available" {}

resource "aws_instance" "instance"{
  count = "${var.total_instances}"
  ami = "${var.amis[var.region]}"
  instance_type = "t2.micro"
  availability_zone = "${data.aws_availability_zones.available.names[count.index]}"
  provisioner "remote-exec" {
    connection {
      type = "ssh"
      user = "ubuntu"
      private_key = "${var.remote_private_key}"
    }
    inline =    ["[var.modules_to_install[var.fe_or_be]"]
  }
}
