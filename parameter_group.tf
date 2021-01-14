
# default database cluster parameters for master cluster
resource "aws_rds_cluster_parameter_group" "default" {
  name            = "client-cluster-param-${var.environment_tag}"
  family          = var.db_family
  description     = "parameter group for generate-name database"

  parameter {
    name          = "character_set_database"
    value         = var.param_character_set_db
    apply_method  = "immediate"
  }

  parameter {
    name          = "character_set_server"
    value         = var.param_character_set_db
    apply_method  = "immediate"
  }

  parameter {
    name  = "character_set_client"
    value = "utf8"
  }
  
  parameter {
    name          = "collation_connection"
    value         = var.param_collation_set
    apply_method  = "immediate"
  }

  parameter {
    name          = "collation_server"
    value         = var.param_collation_set
    apply_method  = "immediate"
  }

  parameter {
    name          = "binlog_format"
    value         = var.param_bin_log_format
    apply_method  = "pending-reboot"
  }

  parameter {
    name          = "binlog_checksum"
    value         = var.param_binlog_checksum
    apply_method  = "immediate"
  }

  parameter {
    name          = "time_zone"
    value         = var.param_timezone
    apply_method  = "immediate"
  }

  parameter {
    name          = "auto_increment_increment"
    value         = var.param_auto_increment_increment
    apply_method  = "immediate"
  }

  parameter {
    name          = "auto_increment_offset"
    value         = var.param_auto_increment_offset
    apply_method  = "immediate"
  }

  parameter {
    name          = "server_audit_logging"
    value         = var.param_server_audit_logging
    apply_method  = "immediate"
  }


  tags = {
    Name          = "client-prod-cluster-param"
    Environment   = var.environment_tag
    Inventory     = var.inventory_tag
    costcenter    = var.costceter_tag
  }
}

# Parameter groups for instance for master clusters
# There is high recommandation to keep all parameter setting identical cross multiple instances.

resource "aws_db_parameter_group" "default"{
  name            = "clientent-db-param-${var.environment_tag}"
  family          = var.db_family
  description     = "parameter group for generate-name database"

  parameter {
    name          = "innodb_buffer_pool_size"
    value         = "{DBInstanceClassMemory*${var.param_innodb_buffer_pool_size_percentage}/4}"
    apply_method  = "pending-reboot"
  }

  parameter {
    name          = "query_cache_type"
    value         = var.param_query_cache_type
    apply_method  = "pending-reboot"
  }

  parameter {
    name          = "log_output"
    value         = "FILE"
    apply_method  = "immediate"
  }

  parameter {
    name          = "general_log"
    value         = var.param_general_log
    apply_method  = "immediate"
  }

  parameter {
    name          = "max_connect_errors"
    value         = var.param_max_connect_errors
    apply_method  = "immediate"
  }


  parameter {
    name          = "tx_isolation"
    value         = var.param_tx_isolation
    apply_method  = "immediate"
  }

  parameter {
    name          = "slow_query_log"
    value         = var.param_slow_query_log
    apply_method  = "immediate"
  }

  parameter {
    name          = "long_query_time"
    value         = var.param_long_query_time
    apply_method  = "immediate"
  }

  parameter {
    name          = "innodb_adaptive_hash_index"
    value         = var.param_innodb_adaptive_hash_index
    apply_method = "immediate"
  }

  parameter {
    name          = "log_bin_trust_function_creators"
    value         = var.param_log_bin_trust_function_creators
    apply_method = "immediate"
  }

  parameter {
    name          = "interactive_timeout"
    value         = var.param_interactive_timeout
    apply_method  = "immediate"
  }

  parameter {
    name          = "wait_timeout"
    value         = var.param_wait_timeout
    apply_method  = "immediate"
  }

  parameter {
    name          = "max_allowed_packet"
    value         = var.param_max_allowed_packet
    apply_method  = "immediate"
  }

  parameter {
    name          = "innodb_lock_wait_timeout"
    value         = var.param_innodb_lock_wait_timeout
    apply_method  = "immediate"
  }

  parameter {
    name          = "performance_schema"
    value         = var.param_performance_schema
    apply_method  = "pending-reboot"
  }


  tags = {
    Name          = "clientent-param-${var.environment_tag}"
    Environment   = var.environment_tag
    Inventory     = var.inventory_tag
    costcenter    = var.costceter_tag
  }
}

