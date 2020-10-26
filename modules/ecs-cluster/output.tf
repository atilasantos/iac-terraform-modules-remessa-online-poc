output "nginx-cluster" {
  value = "${aws_ecs_cluster.nginx-cluster.id}"
}
