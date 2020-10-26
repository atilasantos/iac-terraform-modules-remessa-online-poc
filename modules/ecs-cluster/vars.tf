variable "AWS_REGION" {
  default = "us-east-2"
}

variable "PATH_TO_PRIVATE_KEY" {
  default = "mykey"
}

variable "ECS_INSTANCE_TYPE" {
  default = "t2.micro"
}

variable "ECS_AMIS" {
  type = "map"
  default = {
    us-east-2 = "ami-09e6907b7bcde92d5"
    us-west-2 = "ami-56ed4936"
    eu-west-1 = "ami-c8337dbb"
  }
}

variable "IAM_INSTANCE_PROFILE_ID" {}

variable "ECS_SECURITY_GROUP_ID" {}

variable "KEY_PAIR_NAME" {}

variable "VZI_SUBNET_ID" {}



# Full List: http://docs.aws.amazon.com/AmazonECS/latest/developerguide/ecs-optimized_AMI.html
