resource "aws_db_subnet_group" "imroshan_rds_subnet_group" {
  name       = "imroshan_rds_subnet_group"
  subnet_ids = [var.PrivateSub_imroshan_i_id, var.PrivateSub_imroshan_ii_id]
}
resource "aws_db_instance" "imroshan_rds" {
  engine               = "mysql"
  identifier           = "ugra-instance"
  allocated_storage    = "5"
  engine_version       = "8.0.32"
  instance_class       = "db.t2.micro"
  username             = "imroshan_adex"
  password             = "ugra#3194"
  db_subnet_group_name = aws_db_subnet_group.imroshan_rds_subnet_group.name
  skip_final_snapshot  = true
  publicly_accessible  = false
  tags = {
    "Name"      = "8586_rds"
    "Purpose"   = "Exprimental"
    "CreatedBy" = "Roshan Poudel"
  }
  parameter_group_name = aws_db_parameter_group.imroshan-rds-parameter-group.name
}

resource "aws_db_parameter_group" "imroshan-rds-parameter-group" {
  name        = "imroshan-rds-parameter-group"
  family      = "mysql8.0"
  description = "Custom parameter group for RDS instance"

  parameter {
    name  = "sql_mode"
    value = "ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION"
  }
}
