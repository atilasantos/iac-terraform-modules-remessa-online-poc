resource "aws_ecs_service" "nginx-service" {
  name            = "nginx-service"
  cluster         = "${var.CLUSTER_ID}"
  task_definition = "${var.TASK_DEFINITION_ARN}"
  desired_count   = 1
  iam_role        = "${var.IAM_ROLE_ECS_SERVICE_ROLE_ARN}"
  depends_on      = [var.IAM_POLICY_ATTACH_ECS_SERVICE_ATTACH]

  load_balancer {
    elb_name       = "${var.ELB_NAME}"
    container_name = "${var.LB_CONTAINER_NAME}"
    container_port = "${var.LB_CONTAINER_PORT}"
  }
  lifecycle {
    ignore_changes = [task_definition] // caso de erro, validar de deixar somente task_definition
  }
}