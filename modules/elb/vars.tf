variable "PUBLIC_SUBNET_ID" {}
variable "ELB_SECURITY_GROUP_ID" {}

variable "ELB_LISTENER" {
  type = "map"
  default = {
    "INSTANCE_PORT"     = 80
    "INSTANCE_PROTOCOL" = "http"
    "LB_PORT"           = 80
    "LB_PROTOCOL"       = "http"
  }
}
