resource "aws_elb" "nginx-elb" {
  name = "nginx-elb"

  listener {
    instance_port     = "${var.ELB_LISTENER.INSTANCE_PORT}"
    instance_protocol = "${var.ELB_LISTENER.INSTANCE_PROTOCOL}"
    lb_port           = "${var.ELB_LISTENER.LB_PORT}"
    lb_protocol       = "${var.ELB_LISTENER.LB_PROTOCOL}"
  }

  health_check {
    healthy_threshold   = 2 // Will validate three times the healthcheck to make sure it is available to send traffic.
    unhealthy_threshold = 2 // Will validate two times if the instance is not ok so it will stop sending traffic to the checked instance. 
    timeout             = 4
    target              = "HTTP:80/"
    interval            = 20 // Each 20 seconds it'll check the target endpoint and apply the rules based on healthy and unhealthy.
  }

  subnets         = ["${var.PUBLIC_SUBNET_ID}"]
  security_groups = ["${var.ELB_SECURITY_GROUP_ID}"]

  tags = {
    Name = "nginx-elb"
  }
}