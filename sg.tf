resource "aws_security_group" "clientt-prod-rds" {
  vpc_id = data.terraform_remote_state.vpc.outputs.vpc_id

  ingress {
    from_port   = "3306"
    to_port     = "3306"
    protocol    = "tcp"
    cidr_blocks = [data.terraform_remote_state.vpc.outputs.vpc_cidr]
  }

  tags = {
    Name          = "client-rds-ingress-${var.environment_tag}"
    Environment   = var.environment_tag
    Inventory     = var.inventory_tag
    costcenter    = var.costceter_tag
  }
}
