variable "actions" {
  description = "List of actions what should be executed"
  type        = list(string)
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
    P4 = 80
    P5 = 75
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
    P4 = 1024 * 3.5
    P5 = 1024 * 4
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
    P4 = 1024 * 3.5
    P5 = 1024 * 4
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
    P4 = 150
    P5 = 100
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
    P4 = 400
    P5 = 300
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
    P4 = 50
    P5 = 10
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