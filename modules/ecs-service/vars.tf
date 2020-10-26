variable "CLUSTER_ID" {}

variable "IAM_ROLE_ECS_SERVICE_ROLE_ARN" {}

variable "TASK_DEFINITION_ARN" {}

variable "IAM_POLICY_ATTACH_ECS_SERVICE_ATTACH" {}

variable "ELB_NAME" {}

variable "LB_CONTAINER_NAME" {
  default = "nginx"
}
variable "LB_CONTAINER_PORT" {
  default = 80
}