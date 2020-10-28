# Internet VPC
resource "aws_vpc" "nginx-vpc" {
  cidr_block           = "${var.VPC_CIDR}"
  instance_tenancy     = "${var.TENANCY}"
  enable_dns_support   = "${var.DNS_SUPPORT}"
  enable_dns_hostnames = "${var.DNS_HOSTNAMES}"
  tags = {
    Name = "nginx-vpc"
  }
}

# Subnets
resource "aws_subnet" "nginx-public-subnet" {
  vpc_id                  = "${aws_vpc.nginx-vpc.id}"
  cidr_block              = "${var.SUBNET_CIDR}"
  map_public_ip_on_launch = "${var.MAP_PUBLIC_IP_ONLNCH}"
  availability_zone       = "${var.SUBNET_AZ}"

  tags = {
    Name = "nginx-subnet"
  }
}

# Internet GW
resource "aws_internet_gateway" "nginx-gw" {
  vpc_id = "${aws_vpc.nginx-vpc.id}"

  tags = {
    Name = "nginx-gw"
  }
}

# route tables
resource "aws_route_table" "nginx-route-tb" {
  vpc_id = "${aws_vpc.nginx-vpc.id}"
  route {
    cidr_block = "${var.ROUTE_CIDR}"
    gateway_id = "${aws_internet_gateway.nginx-gw.id}"
  }

  tags = {
    Name = "nginx-route-tb"
  }
}

# route associations public
resource "aws_route_table_association" "nginx-public-subnet-a" {
  subnet_id      = "${aws_subnet.nginx-public-subnet.id}"
  route_table_id = "${aws_route_table.nginx-route-tb.id}"
}

# security groups
resource "aws_security_group" "nginx-ecs-securitygroup" {
  vpc_id      = "${aws_vpc.nginx-vpc.id}"
  name        = "nginx-ecs-sg"
  description = "security group for ecs"
  egress {
    from_port   = "${var.EGRESS.FROM}"
    to_port     = "${var.EGRESS.TO}"
    protocol    = "${var.EGRESS.PROTOCOL}"
    cidr_blocks = ["${var.EGRESS.CIDR}"]
  }

  dynamic "ingress" {
    for_each = [22, 80]
    content {
      from_port       = ingress.value
      to_port         = ingress.value
      protocol        = "${var.INGRESS.PROTOCOL}"
      security_groups = ["${aws_security_group.nginx-elb-securitygroup.id}"]
      tags = {
        Name = "nginx-ecs"
      }
    }
  }
}

resource "aws_security_group" "nginx-elb-securitygroup" {
  vpc_id      = "${aws_vpc.nginx-vpc.id}"
  name        = "nginx-elb"
  description = "security group for ecs"
  egress {
    from_port   = "${var.EGRESS.FROM}"
    to_port     = "${var.EGRESS.TO}"
    protocol    = "${var.EGRESS.PROTOCOL}"
    cidr_blocks = ["${var.EGRESS.CIDR}"]
  }

  ingress {
    from_port   = "${var.INGRESS.FROM}"
    to_port     = "${var.INGRESS.TO}"
    protocol    = "${var.INGRESS.PROTOCOL}"
    cidr_blocks = ["${var.INGRESS.CIDR}"]
  }
  tags = {
    Name = "nginx-elb"
  }
}