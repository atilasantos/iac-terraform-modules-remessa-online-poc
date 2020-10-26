data "template_file" "nginx-task-definition-template" {
  template = file("./templates/app.json.tpl")
  vars = {
    REPOSITORY_URL = "${var.REGISTRY}"
    CONTAINER_NAME = "${var.CONTAINER_NAME}"
    CONTAINER_PORT = "${var.CONTAINER_PORT}"
    HOST_PORT = "${var.HOST_PORT}"
  }
}

resource "aws_ecs_task_definition" "nginx-task-definition" {
  family                = "nginx"
  container_definitions = "${data.template_file.nginx-task-definition-template.rendered}"
}