module "db" {
  source = "terraform-aws-modules/rds/aws"

  identifier = "mydb"
  db_name    = "firstdb"
  username = var.username

  create_db_subnet_group = true
  db_subnet_group_name = var.db_subnet_group_name
  subnet_ids = var.private_subnet_id

  engine = var.engine
  major_engine_version = var.engine_version
  allocated_storage = var.allocated_storage
  instance_class = var.instance_class
  family = var.family
  vpc_security_group_ids = [var.db_sec_id]
}