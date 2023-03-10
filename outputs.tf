output "Cluster_Name" {
  value = aws_elasticache_replication_group.dev_cluster_replication_group.replication_group_id
}

output "arn" {
  value       = join("", aws_elasticache_replication_group.dev_cluster_replication_group.*.arn)
  description = "Elasticache Replication Group ARN"
}

output "endpoint" {
  value       = join("", aws_elasticache_replication_group.dev_cluster_replication_group.*.configuration_endpoint_address)
  description = "Redis configuration endpoint"
}
