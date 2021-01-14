resource "aws_db_subnet_group" "db_subnet_group" {
  count      = length(data.terraform_remote_state.vpc.outputs.subnets_private_nat)
  name_prefix = "client-db-subnet-group-${var.environment_tag}"
  description = "Database subnet group for client rds db"
  subnet_ids  = element(data.terraform_remote_state.vpc.outputs.subnets_public, count.index)
  tags = {
    Name          = "clientent-db-subnet-group-${var.environment_tag}"
    Environment   = var.environment_tag
    Inventory     = var.inventory_tag
    costcenter    = var.costceter_tag
  }
}