output "aws_iam_role-ecs-service-role-arn" {
  value = "${aws_iam_role.ecs-service-role.arn}"
}

output "aws_iam_policy-attach-ecs-service-attach" {
  value = "${aws_iam_policy_attachment.ecs-service-attach1}"
}
output "aws_iam_instance_profile-ecs-ec2-role-id" {
  value = "${aws_iam_instance_profile.ecs-ec2-role.id}"
}
