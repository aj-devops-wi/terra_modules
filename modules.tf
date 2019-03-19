variable "remote_private_key"{
}

module "frontend" {
  source = "./aws_instances"
  type = "frontend"
}

module "backend"{
  source = "./aws_instances"
  region = "ca-central-1"
  total_instances = 2
  type = "backend"
}

output "front_end_ips"{
  value = "${module.frontend.ips}"
}

output "back_end_ips" {
  value = "${module.backend.ips}"
}
