# profile parameter
variable "aws_region" {}


variable "aws_profile" {}

variable "inventory_tag" {}

variable "costceter_tag" {}
 
variable "environment_tag" {}

variable "commonName" {}

variable "writer" {
  default = "primary-writer"
}

variable "reader" {
  default = "primary-reader"
}

variable "secwriter" {
  default = "secondary-writer"
}

variable "secreader" {
  default = "secondary-reader"
}

variable "db_count" {
  default = "1"
}


# RDS Cluster Setting
variable "db_username" {
  default = "admin"
}

variable "db_password" {}

variable "db_name" {
  default = "client_prod"
}

variable "db_backup_retention_period" {
  default = "5"
}

variable "db_backup_window" {
  default = "07:30-08:00"
}

variable "db_maintenance_window" {
  default = "wed:09:00-wed:10:00"
}

variable "db_skip_final_snapshot" {
  default = "true"
}


variable "db_enhanced_monitoring_interval" {
  default = "60"
}

variable "db_monitoring_role_arn" {
  default = ""
}

variable "db_minor_version_upgrade" {
  default = "true"
}

variable "db_storage_encrypted" {
  default = "false"
}



variable "db_instance_class" {
  default = "db.r5.large"
}

variable "db_promotion_tier" {
  default = "1"
}


# Database cluster parameter
variable "db_family" {
  default = "aurora5.6"
}

variable "param_bin_log_format" {
  default = "ROW"
}

variable "param_character_set_db" {
  default = "utf8"
}

variable "param_collation_set" {
  default = "utf8_unicode_ci"
}

variable "param_general_log" {
  default = 0
}

variable "param_timezone" {
  default = "UTC"
}

variable "param_binlog_checksum" {
  default = "CRC32"
}

variable "param_log_bin_trust_function_creators" {
  default = "1"
}

variable "param_auto_increment_increment" {
  default = "2"
}

variable "param_auto_increment_offset" {
  default = "1"
}


# Database instance parameter
variable "param_max_connect_errors" {
  default = "100000"
}

#variable "param_max_connections" { }
variable "param_tx_isolation" {
  default = "READ-COMMITTED"
}

variable "param_slow_query_log" {
  default = "1"
}

variable "param_long_query_time" {
  default = "100"
}

variable "param_innodb_adaptive_hash_index" {
  default = "1"
}

variable "param_interactive_timeout" {
  default = "7200"
}

variable "param_wait_timeout" {
  default = "7200"
}

variable "param_max_allowed_packet" {
  default = "67108864"
} #64M

variable "param_innodb_lock_wait_timeout" {
  default = "120"
}

variable "param_query_cache_type" {
  default = "0"
}

variable "param_innodb_buffer_pool_size_percentage" {
  default = "3"
}

variable "param_server_audit_logging" {
  default = "OFF"
}

variable "param_server_audit_events" {
  default = "CONNECT,QUERY"
}

variable "param_performance_schema" {
  default = 0
}


# add modifier
variable "db_apply_immediately" {
  default = "true"
}

variable "remote_bucket" {}

variable "remote_bucket_key" {}