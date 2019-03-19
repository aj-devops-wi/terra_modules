variable "remote_private_key"{
  type = string
}

module "frontend" {
  source = "./aws_instances"
  provisioner "remote-exec" {
    connection {
      type = "ssh"
      user = "ubuntu"
      private_key = "${remote_private_key}"
    }
    inline =    ["sudo apt-get -y update",
                "sudo apt-get install -y nginx",
                "sudo service nginx start",
		"sudo apt-get install -y python"]
  }
}

module "backend"{
  source = "./aws_instances"
  region = "ca-central-1"
  total_instances = 2
  provisioner "remote-exec" {
    connection {
      type = "ssh"
      user = "ubuntu"
      private_key = "${remote_private_key}"
    }
    inline =    ["sudo apt-get install -y tomcat"]
  }
}

output "front_end_ips"{
  value = "${module.frontend.ips}"
}

output "back_end_ips" {
  value = "${module.backend.ips}"
}
