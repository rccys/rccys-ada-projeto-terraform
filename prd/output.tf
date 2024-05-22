output "ecs_cluster_id" {
  value       = aws_ecs_cluster.ada_ecs_cluster.id
  description = "O ID do cluster ECS"
}
