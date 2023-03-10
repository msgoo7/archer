resource "aws_elasticache_subnet_group" "dev-cache-subnet-group" {
  name       = "${var.environment}-${var.region}-${var.application}-subnet-group"
#  subnet_ids = [var.subnet1, var.subnet2, var.subnet3, var.subnet4, var.subnet5, var.subnet6]
#  count = length(var.subnet_ids)
  subnet_ids = var.subnet_ids[0]

  tags = merge(
    var.tags,
    tomap({
      project = var.project,
      environment = var.environment
    })
  )
}


resource "aws_elasticache_replication_group" "dev_cluster_replication_group" {
  replication_group_id          = "${var.environment}-${var.region}-${var.application}-cluster"
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
    replicas_per_node_group = "${var.replicas_per_node_group}"
    num_node_groups         = "${var.nodes}"
  }

  log_delivery_configuration {
      destination      = aws_cloudwatch_log_group.cacle_logs.name
      destination_type = "cloudwatch-logs"
      log_format       = "json"
      log_type         = "engine-log"
    }

  log_delivery_configuration {
      destination      = aws_cloudwatch_log_group.cacle_logs_slow.name
      destination_type = "cloudwatch-logs"
      log_format       = "json"
      log_type         = "slow-log"
    }

  tags = merge(
    var.tags,
    tomap({
      project = var.project,
      environment = var.environment
    })
  )

}

resource "aws_cloudwatch_log_group" "cacle_logs" {
  name              = "/aws/${var.application}-${var.environment}"
  retention_in_days = var.logs_retention_in_days
}

resource "aws_cloudwatch_log_group" "cacle_logs_slow" {
  name              = "/aws/${var.application}-${var.environment}-slow"
  retention_in_days = var.logs_retention_in_days
}
