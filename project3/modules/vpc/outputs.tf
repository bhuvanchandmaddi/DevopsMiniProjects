output "vpc_id" {
  description = "VPC ID Information"
  value       = "${aws_vpc.default.id}"
}

output "region" {
  description = "VPC ID Information"
  value       = "${var.aws_region}"
}

output "sg_id" {
  description = "List of IDs of Security Groups"
  value       = "${aws_security_group.allow_all.id}"
}


output "public_subnets" {
  description = "List of IDs of Public_Subnets"
  value       = "${aws_subnet.public-subnets.*.id}"
}

output "private_subnets" {
  description = "List of IDs of Private_Subnets"
  value       = "${aws_subnet.private-subnets.*.id}"
}

output "environment" {
  description = "List of IDs of Private_Subnets"
  value       = "${var.environment}"
}



