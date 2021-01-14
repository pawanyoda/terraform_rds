resource "random_string" "password" {
  length = 4
  upper = false
  special = false
#  override_special = "/@\" "
}

resource "aws_rds_cluster" "client-rds-prod" {

  count      = length(data.terraform_remote_state.vpc.outputs.subnets_private_nat)
  depends_on = ["aws_security_group.clientt-prod-rds"]
  cluster_identifier           = "client-${var.environment_tag}"
  vpc_security_group_ids       = [
                           aws_security_group.clientt-prod-rds.id,
  ]

  db_subnet_group_name         = aws_db_subnet_group.db_subnet_group[count.index].id
  port                         = "3306"
  database_name                = var.db_name
  master_username              = var.db_username
  master_password              = var.db_password
  backup_retention_period      = var.db_backup_retention_period
  preferred_backup_window      = var.db_backup_window
  preferred_maintenance_window = var.db_maintenance_window
  apply_immediately            = var.db_apply_immediately
  db_cluster_parameter_group_name   = aws_rds_cluster_parameter_group.default.name
  final_snapshot_identifier    = "client-prod-mysql-final-snapshot-${random_string.password.result}"
  skip_final_snapshot          = var.db_skip_final_snapshot
  storage_encrypted            = var.db_storage_encrypted
  deletion_protection          = "false"
  
  tags = {
    Name          = "client-${var.environment_tag}"
    Environment   = var.environment_tag
    Inventory     = var.inventory_tag
    costcenter    = var.costceter_tag
  }

  lifecycle {
    create_before_destroy = true
  }

}


resource "aws_rds_cluster_instance" "default_instance" {
  count                        = "${var.db_count}"
  identifier                   = "${aws_rds_cluster.client-rds-prod[count.index].id}-${count.index}"
  cluster_identifier           = "${aws_rds_cluster.client-rds-prod[count.index].id}"
  instance_class               = "${var.db_instance_class}"
  db_subnet_group_name         = "${aws_db_subnet_group.db_subnet_group[count.index].id}"
  apply_immediately            = "${var.db_apply_immediately}"
  db_parameter_group_name      = "${aws_db_parameter_group.default.name}"
  monitoring_interval          = "${var.db_enhanced_monitoring_interval}"
  monitoring_role_arn          = "${aws_iam_role.rds_enhanced_monitoring.arn}"
  auto_minor_version_upgrade   = "${var.db_minor_version_upgrade}"
  promotion_tier               = "${var.db_promotion_tier}"

  tags = {
    Name          = "client-staging-db-instance"
    Environment   = "${var.environment_tag}"
    Inventory     = "${var.inventory_tag}"
    costcenter    = "${var.costceter_tag}"   
  }

  lifecycle {
    create_before_destroy = true
  }
}



