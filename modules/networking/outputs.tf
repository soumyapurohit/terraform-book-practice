output "vpc_id" {
  value = module.vpc.vpc_id
}
output "db_sec_id" {
  value = aws_security_group.db_sg.id
}
output "ec2_sg_id" {
  value = aws_security_group.ec2_sg.id
}
output "vpc_public_subnet_ids" {
  value = module.vpc.public_subnets
}
output "vpc_private_subnet" {
  value = module.vpc.private_subnets
}