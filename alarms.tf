locals {
  dimensions = {
    DBClusterIdentifier = var.cluster_identifier
  }
}

resource "aws_cloudwatch_metric_alarm" "cpu_utilization" {
  for_each            = var.cpu_utilization_checks
  alarm_name          = "${var.alarm_prefix}: ${each.key} CPU usage is high for ${var.cluster_identifier}"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = var.cpu_utilization_periods
  threshold           = each.value
  metric_name         = "CPUUtilization"
  namespace           = "AWS/RDS"
  period              = var.cpu_utilization_period
  statistic           = "Average"
  alarm_description   = "Priority: ${each.key} Alarm is above of threshold: ${each.value}. The percentage of CPU used by an Aurora DB instance. More: https://amzn.to/31wBNqC"
  treat_missing_data  = var.cpu_utilization_missing_data
  alarm_actions       = var.actions
  tags                = var.tags
  dimensions          = local.dimensions
}

resource "aws_cloudwatch_metric_alarm" "freeable_memory" {
  for_each            = var.freeable_memory_checks
  alarm_name          = "${var.alarm_prefix}: ${each.key} Approximate memory usage is high for ${var.cluster_identifier}"
  comparison_operator = "LessThanOrEqualToThreshold"
  evaluation_periods  = var.freeable_memory_periods
  threshold           = each.value * 1024 * 1024
  metric_name         = "FreeableMemory"
  namespace           = "AWS/RDS"
  period              = var.freeable_memory_period
  statistic           = "Average"
  alarm_description   = "Priority: ${each.key} Alarm is bellow of threshold: ${each.value}MB. The amount of available random access memory, in bytes. More: https://amzn.to/31wBNqC"
  treat_missing_data  = var.freeable_memory_missing_data
  alarm_actions       = var.actions
  tags                = var.tags
  dimensions          = local.dimensions
}

resource "aws_cloudwatch_metric_alarm" "free_storage_space" {
  for_each            = var.free_storage_space_checks
  alarm_name          = "${var.alarm_prefix}: ${each.key} Approximate free storage space is low for ${var.cluster_identifier}"
  comparison_operator = "LessThanOrEqualToThreshold"
  evaluation_periods  = var.free_storage_space_periods
  threshold           = each.value * 1024 * 1024
  metric_name         = "FreeLocalStorage"
  namespace           = "AWS/RDS"
  period              = var.free_storage_space_period
  statistic           = "Average"
  alarm_description   = "Priority: ${each.key} Alarm is bellow of threshold: ${each.value}MB. The amount of available storage space. More: https://amzn.to/31wBNqC"
  treat_missing_data  = var.free_storage_space_missing_data
  alarm_actions       = var.actions
  tags                = var.tags
  dimensions          = local.dimensions
}

resource "aws_cloudwatch_metric_alarm" "aurora_replica_lag" {
  for_each            = var.aurora_replica_lag_checks
  alarm_name          = "${var.alarm_prefix}: ${each.key} Approximate aurora replication lag is high for ${var.cluster_identifier}"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = var.aurora_replica_lag_periods
  threshold           = each.value
  metric_name         = "AuroraReplicaLag"
  namespace           = "AWS/RDS"
  period              = var.aurora_replica_lag_period
  statistic           = "Average"
  alarm_description   = "Priority: ${each.key} Alarm is above of threshold: ${each.value}ms. For an Aurora Replica, the amount of lag when replicating updates from the primary instance, in milliseconds. More: https://amzn.to/31wBNqC"
  treat_missing_data  = var.aurora_replica_lag_missing_data
  alarm_actions       = var.actions
  tags                = var.tags
  dimensions          = local.dimensions
}


resource "aws_cloudwatch_metric_alarm" "database_connections" {
  for_each            = var.database_connections_checks
  alarm_name          = "${var.alarm_prefix}: ${each.key} Approximate database connections is high for ${var.cluster_identifier}"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = var.database_connections_periods
  threshold           = each.value
  metric_name         = "DatabaseConnections"
  namespace           = "AWS/RDS"
  period              = var.database_connections_period
  statistic           = "Average"
  alarm_description   = "Priority: ${each.key} Alarm is above of threshold: ${each.value} connections. More: https://amzn.to/31wBNqC"
  treat_missing_data  = var.database_connections_missing_data
  alarm_actions       = var.actions
  tags                = var.tags
  dimensions          = local.dimensions
}


resource "aws_cloudwatch_metric_alarm" "swap_usage" {
  for_each            = var.swap_usage_checks
  alarm_name          = "${var.alarm_prefix}: ${each.key} Approximate swap usage is high for ${var.cluster_identifier}"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = var.swap_usage_periods
  threshold           = each.value
  metric_name         = "SwapUsage"
  namespace           = "AWS/RDS"
  period              = var.swap_usage_period
  statistic           = "Average"
  alarm_description   = "Priority: ${each.key} Alarm is above of threshold: ${each.value}mb. The amount of swap space used on the Aurora DB instance. More: https://amzn.to/31wBNqC"
  treat_missing_data  = var.swap_usage_missing_data
  alarm_actions       = var.actions
  tags                = var.tags
  dimensions          = local.dimensions
}

resource "aws_cloudwatch_metric_alarm" "deadlocks" {
  for_each            = var.deadlocks_checks
  alarm_name          = "${var.alarm_prefix}: ${each.key} Approximate count of deadlocks are above ${each.value} for ${var.cluster_identifier}"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = var.deadlocks_periods
  threshold           = each.value
  metric_name         = "Deadlocks"
  namespace           = "AWS/RDS"
  period              = var.deadlocks_period
  statistic           = "Sum"
  alarm_description   = "Priority: ${each.key} Alarm is above of threshold: ${each.value} deadlocks. The amount of deadlocks are high. It can block some critical queries on database. More: https://amzn.to/31wBNqC"
  treat_missing_data  = var.deadlocks_missing_data
  alarm_actions       = var.actions
  tags                = var.tags
  dimensions          = local.dimensions
}


resource "aws_cloudwatch_metric_alarm" "volume_read_iops" {
  for_each            = var.volume_read_iops_checks
  alarm_name          = "${var.alarm_prefix}: ${each.key} Volume read IOPS is too high for ${var.cluster_identifier}"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = var.volume_read_iops_periods
  threshold           = each.value * 1000
  metric_name         = "VolumeReadIOPs"
  namespace           = "AWS/RDS"
  period              = var.volume_read_iops_period
  statistic           = var.volume_read_iops_statistic
  alarm_description   = "Priority: ${each.key} The number of billed read I/O operations from a cluster volume, reported at 5-minute intervals. High value = high price for database. More: https://amzn.to/31wBNqC"
  treat_missing_data  = var.volume_read_iops_missing_data
  alarm_actions       = var.actions
  tags                = var.tags
  dimensions          = local.dimensions
}


resource "aws_cloudwatch_metric_alarm" "volume_write_iops" {
  for_each            = var.volume_write_iops_checks
  alarm_name          = "${var.alarm_prefix}: ${each.key} Volume write IOPS is too high for ${var.cluster_identifier}"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = var.volume_write_iops_periods
  threshold           = each.value * 1000
  metric_name         = "VolumeWriteIOPs"
  namespace           = "AWS/RDS"
  period              = var.volume_write_iops_period
  statistic           = var.volume_write_iops_statistic
  alarm_description   = "Priority: ${each.key} The number of write disk I/O operations to the cluster volume, reported at 5-minute intervals. See the description of VolumeReadIOPS above for a detailed description of how billed write operations are calculated. High value = high price for database. More: https://amzn.to/31wBNqC"
  treat_missing_data  = var.volume_write_iops_missing_data
  alarm_actions       = var.actions
  tags                = var.tags
  dimensions          = local.dimensions
}

resource "aws_cloudwatch_metric_alarm" "transaction_logs_disk_usage" {
  for_each            = var.transaction_logs_disk_usage_checks
  alarm_name          = "${var.alarm_prefix}: ${each.key} Transaction logs disck usage is too high for ${var.cluster_identifier}"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = var.transaction_logs_disk_usage_periods
  threshold           = each.value * 1024
  metric_name         = "TransactionLogsDiskUsage"
  namespace           = "AWS/RDS"
  period              = var.transaction_logs_disk_usage_period
  statistic           = var.transaction_logs_disk_usage_statistic
  alarm_description   = "Priority: ${each.key} The disk space used by transaction logs. Applies to PostgreSQL. More: https://amzn.to/31wBNqC"
  treat_missing_data  = var.transaction_logs_disk_usage_missing_data
  alarm_actions       = var.actions
  tags                = var.tags
  dimensions          = local.dimensions
}