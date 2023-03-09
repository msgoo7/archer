resource "aws_elasticache_subnet_group" "dev-cache-subnet-group" {
  name       = "dev-subnet-group"
  subnet_ids = [var.subnet1, var.subnet2, var.subnet3, var.subnet4, var.subnet5, var.subnet6]

  tags = merge(
    var.tags,
    tomap({
      project = var.project,
      environment = var.environment
    })
  )
}


resource "aws_elasticache_replication_group" "dev_cluster_replication_group" {
  replication_group_id          = "dev-cluster"
  replication_group_description = "Dev Cluster"
  engine               = var.engine
  engine_version       = var.engine_version
  node_type            = var.node_type
  port                 = var.port
  parameter_group_name = var.parameter_group_name
  security_group_ids = [var.sg_id]
  transit_encryption_enabled = var.transit_encryption
  at_rest_encryption_enabled = var.at_rest_encryption
  multi_az_enabled  = true

  subnet_group_name          = aws_elasticache_subnet_group.dev-cache-subnet-group.name
  automatic_failover_enabled = true

  cluster_mode {
    replicas_per_node_group = 1
    num_node_groups         = "${var.nodes}"
  }

  tags = merge(
    var.tags,
    tomap({
      project = var.project,
      environment = var.environment
    })
  )

}
