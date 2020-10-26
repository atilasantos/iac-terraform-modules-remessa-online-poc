resource "aws_ecs_cluster" "nginx-cluster" {
  name = "nginx-cluster"
}

resource "aws_launch_configuration" "ecs-nginx-launchconfig" {
  name_prefix          = "ecs-launchconfig"
  image_id             = "${var.ECS_AMIS["${var.AWS_REGION}"]}"
  instance_type        = "${var.ECS_INSTANCE_TYPE}"
  key_name             = "${var.KEY_PAIR_NAME}"
  iam_instance_profile = "${var.IAM_INSTANCE_PROFILE_ID}"
  security_groups      = [var.ECS_SECURITY_GROUP_ID]
  user_data            = "#!/bin/bash\necho 'ECS_CLUSTER=nginx-cluster' > /etc/ecs/ecs.config\nstart ecs"
  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_group" "ecs-nginx-autoscaling" {
  name                 = "ecs-nginx-autoscaling"
  vpc_zone_identifier  = ["${var.VZI_SUBNET_ID}"]
  launch_configuration = "${aws_launch_configuration.ecs-nginx-launchconfig.name}"
  min_size             = 1
  max_size             = 1
  tag {
    key                 = "Name"
    value               = "ecs-ec2-container"
    propagate_at_launch = true
  }
}