output "nginx-elb-securitygroup-id" {
  value = "${aws_security_group.nginx-elb-securitygroup.id}"
}

output "nginx-ecs-securitygroup-id" {
  value = "${aws_security_group.nginx-ecs-securitygroup.id}"
}

output "nginx-public-subnet-id" {
  value = "${aws_subnet.nginx-public-subnet.id}"
}
