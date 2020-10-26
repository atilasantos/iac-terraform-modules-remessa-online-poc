output "elb_dns_name" {
  value = "${aws_elb.nginx-elb.dns_name}"
}

output "elb_name" {
  value = "${aws_elb.nginx-elb.name}"
}
