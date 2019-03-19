variable "remote_private_key"{
}

module "frontend" {
  source = "./aws_instances"
  fe_or_be = "frontend"
}

module "backend"{
  source = "./aws_instances"
  region = "ca-central-1"
  total_instances = 2
  fe_or_be = "backend"
}

output "front_end_ips"{
  value = "${module.frontend.ips}"
}

output "back_end_ips" {
  value = "${module.backend.ips}"
}
