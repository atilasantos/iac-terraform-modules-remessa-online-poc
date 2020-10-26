output "nginx-task-definitio-arn" {
  value = "${aws_ecs_task_definition.nginx-task-definition.arn}"
}