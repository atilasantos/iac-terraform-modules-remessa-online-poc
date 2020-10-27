variable "VPC_CIDR" {
  default = "10.0.0.0/16"
}

variable "TENANCY" {
  default = "default"
}

variable "DNS_SUPPORT" {
  default = true
}

variable "DNS_HOSTNAMES" {
  default = true
}

variable "VPC_NAME" {
  default = "vpc-nginx"

}

variable "SUBNET_CIDR" {
  default = "10.0.1.0/24"
}

variable "MAP_PUBLIC_IP_ONLNCH" {
  default = true
}

variable "SUBNET_AZ" {
  default = "us-east-2a"
}

variable "ROUTE_CIDR" {
  default = "0.0.0.0/0"
}


variable "EGRESS" {
  type = "map"
  default = {
    "FROM"     = 0
    "TO"       = 0
    "PROTOCOL" = "-1"
    "CIDR"     = "0.0.0.0/0"
  }
}

variable "INGRESS" {
  type = "map"
  default = {
    "FROM"     = 80
    "TO"       = 80
    "PROTOCOL" = "TCP"
    "CIDR"     = "0.0.0.0/0"
  }

}

