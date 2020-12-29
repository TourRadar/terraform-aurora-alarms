variable "actions" {
  description = "List of actions what should be executed"
  type        = list(string)
}

variable "ok_actions" {
  description = "List of actions what should be executed"
  type        = list(string)
  default     = []
}

variable "cluster_identifier" {
  type = string
}

variable "alarm_prefix" {
  type = string
}

variable "tags" {
  default = {}
}


variable "cpu_utilization_checks" {
  type = map(number)
  default = {
    P1 = 95
    P2 = 90
    P3 = 85
  }
}

variable "cpu_utilization_periods" {
  type    = number
  default = 3
}

variable "cpu_utilization_period" {
  type    = number
  default = 60
}

variable "cpu_utilization_missing_data" {
  type    = string
  default = "notBreaching"
}

variable "freeable_memory_checks" {
  type = map(number)
  default = {
    P1 = 1024
    P2 = 1024 * 2
    P3 = 1024 * 3
  }
  description = "The amount of available random access memory, in megabytes"
}

variable "freeable_memory_periods" {
  type    = number
  default = 3
}

variable "freeable_memory_period" {
  type    = number
  default = 60
}

variable "freeable_memory_missing_data" {
  type    = string
  default = "notBreaching"
}


variable "free_storage_space_checks" {
  type = map(number)
  default = {
    P1 = 1024
    P2 = 1024 * 2
    P3 = 1024 * 3
  }
  description = "The amount of storage available for temporary tables and logs, in megabytes"
}

variable "free_storage_space_periods" {
  type    = number
  default = 3
}

variable "free_storage_space_period" {
  type    = number
  default = 60
}

variable "free_storage_space_missing_data" {
  type    = string
  default = "notBreaching"
}

variable "aurora_replica_lag_checks" {
  type = map(number)
  default = {
    P1 = 300
    P2 = 250
    P3 = 200
  }
  description = "For an Aurora Replica, the amount of lag when replicating updates from the primary instance, in milliseconds."
}

variable "aurora_replica_lag_periods" {
  type    = number
  default = 2
}

variable "aurora_replica_lag_period" {
  type    = number
  default = 60
}

variable "aurora_replica_lag_missing_data" {
  type    = string
  default = "notBreaching"
}


variable "database_connections_checks" {
  type = map(number)
  default = {
    P1 = 700
    P2 = 600
    P3 = 500
  }
  description = "Count of connections. Values related to database size"
}

variable "database_connections_periods" {
  type    = number
  default = 2
}

variable "database_connections_period" {
  type    = number
  default = 60
}

variable "database_connections_missing_data" {
  type    = string
  default = "notBreaching"
}

variable "swap_usage_checks" {
  type = map(number)
  default = {
    P1 = 1000
    P2 = 600
    P3 = 500
  }
  description = "The amount of swap space used on the Aurora PostgreSQL DB instance. In MB"
}

variable "swap_usage_periods" {
  type    = number
  default = 2
}

variable "swap_usage_period" {
  type    = number
  default = 60
}

variable "swap_usage_missing_data" {
  type    = string
  default = "notBreaching"
}




variable "deadlocks_checks" {
  type = map(number)
  default = {
    P1 = 1
  }
  description = "The amount of deadlocks"
}

variable "deadlocks_periods" {
  type    = number
  default = 2
}

variable "deadlocks_period" {
  type    = number
  default = 60
}

variable "deadlocks_missing_data" {
  type    = string
  default = "notBreaching"
}


variable "volume_read_iops_checks" {
  type = map(number)
  default = {
    P1 = 600
    P2 = 400
    P3 = 300
  }
  description = "The number of IOPs in thousands"
}

variable "volume_read_iops_periods" {
  type    = number
  default = 3
}

variable "volume_read_iops_period" {
  type    = number
  default = 60 * 60
}

variable "volume_read_iops_missing_data" {
  type    = string
  default = "notBreaching"
}

variable "volume_read_iops_statistic" {
  type    = string
  default = "Average"
}


variable "volume_write_iops_checks" {
  type = map(number)
  default = {
    P1 = 600
    P2 = 400
    P3 = 300
  }
  description = "The number of IOPs in thousands"
}

variable "volume_write_iops_periods" {
  type    = number
  default = 3
}

variable "volume_write_iops_period" {
  type    = number
  default = 60 * 60
}

variable "volume_write_iops_missing_data" {
  type    = string
  default = "notBreaching"
}

variable "volume_write_iops_statistic" {
  type    = string
  default = "Average"
}




variable "transaction_logs_disk_usage_checks" {
  type = map(number)
  default = {
    P1 = 200
    P2 = 150
    P3 = 100
  }
  description = "The number of IOPs in gigabytes"
}

variable "transaction_logs_disk_usage_periods" {
  type    = number
  default = 3
}

variable "transaction_logs_disk_usage_period" {
  type    = number
  default = 60 * 60
}

variable "transaction_logs_disk_usage_missing_data" {
  type    = string
  default = "notBreaching"
}

variable "transaction_logs_disk_usage_statistic" {
  type    = string
  default = "Average"
}


variable "buffer_cache_hit_ratio_checks" {
  type = map(number)
  default = {
    P1 = 93
    P2 = 95
    P3 = 96
  }
  description = "%"
}

variable "buffer_cache_hit_ratio_periods" {
  type    = number
  default = 2
}

variable "buffer_cache_hit_ratio_period" {
  type    = number
  default = 60 * 16
}

variable "buffer_cache_hit_ratio_missing_data" {
  type    = string
  default = "notBreaching"
}

variable "buffer_cache_hit_ratio_statistic" {
  type    = string
  default = "Average"
}


variable "maximum_used_transaction_ids_checks" {
  type = map(number)
  default = {
    P1 = 1000 * 1000000
    P2 = 950 * 1000000
    P3 = 900 * 1000000
  }
}


variable "maximum_used_transaction_ids_periods" {
  type    = number
  default = 1
}
variable "maximum_used_transaction_ids_period" {
  type    = number
  default = 60 * 5
}

variable "maximum_used_transaction_ids_missing_data" {
  type    = string
  default = "notBreaching"
}